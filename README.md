Project for implementation of Extensible Sparse Functional Array in an FPGA.

The High level API of this simulation design can be found here: https://github.com/justintjoa-portfolio/ESFA_Scala_implementation

Original Paper: https://www.sciencedirect.com/science/article/pii/S0167642314005747

Testbed for data structure simulation is the Digilent Arty S7-S25 Spartan 7 board:

https://digilent.com/shop/arty-s7-spartan-7-fpga-development-board/

You can learn how to acquire the s7-25 board file, as well as how to add it to Vivado, here:

https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk

Documentation Links:

Technical Documentation - Deep Dive (Includes Contextual Information and Upcoming Videos): https://docs.google.com/document/d/1gDUGZgg1yh5PnSdxoq2PBPG117_z70DcbdQ9y01g18M

Release Diary: https://docs.google.com/document/d/1Onwxkocl2f0QuUEM0k3As0nP1BEz1VMA278FjJfo7kY

Release Notes - November 29, 2021

- This first release has a testbench for the ESFADesign module. Included within the testbench is the first long test-case from my Scala implementation (https://github.com/justintjoa-portfolio/ESFA_Scala_implementation) simulated.

    + The testbench validates reg/output values via an assert module tied to the same clock to verify that r_true, a reg representing whether the last test case was correct, was in fact true.

- With the testbench comes the ESFADesign, which has been validated in the testbench.

    + The algorithm had to be changed slightly - timing delay was not taken into account in the Scala implementation (which was written exceptionally imperatively), so refactors to the algorithm had to be made to handle synchronous writes in a way that corresponded to the algorithm well.

- A basic implementation of ESFATop (the module that does the heavy lifting of communicating over UART of FPGA with PC's Serial Port) was implemented and tested functionally, however after discussions with Dr. Balkind, I have decided to scope the trials on imperative instructions fed via a Block RAM IP. Down the road, I may consider adding UART functionality to make an open API, however I believe that testing over it introduces more points of failure in benchmarking performance/correctness. 

Instructions on Using ESFADesign in your simulations (view Scala implementation test cases for the compared functions):

Our ESFADesign is hooked as follows:

ESFADesign l1(

        .clk(clk),

        // inputs

        .in_willWrite(willWrite),

        .new_index(new_index),

        .new_value(new_value),

        .metadata(metadata),

        .isMetadata(isMetadata),

        // outputs

        .resultBool(resultBool),

        .resultValue(resultValue),

        .selector(selector)  

    );

1) Update Op

In this example, we attempt an update on arary with handle 0, and in the new array insert the pair (2, 10)

// Analogous to ESFAArrayOp().update(state_and_handle._1, Some(0), 2, 10)

// first, encode the array we're interested in updating. If we are updating None, we can skip this step

// we will also need to enrank it (to get its rank)

isMetadata = 1'b1;

metadata = 0; // handle of array we wish to encode

selector = 2; // Encode's corresponding selector code

#28; // wait for a cycle for output to settle

code = resultValue;

// Let's run enrank. Set selector == 6. Save the value of rank.

selector = 6;

#28;

rank = resultValue;

// Next, assuming encode/enrank is successful, we need to find if there is an available cell for our new array, and if so, what is it's handle.

selector = 5;

#28;

// ResultBool will tell us if there does in fact exist a cell, and if so the handle will be in resultValue;

// We do in fact have a cell available, so let's go write a new array!

metadata = resultValue; // set metadata to the resultValue which is handle of handle we wish to write new array to. In this case, this equals 1.

isMetadata = 1'b1; // we are not updating None, so set isMetadata to 1

new_index = 2; // index of inserted element

new_value = 8'b1010; // value of inserted element

selector = 0; // 0 is selector value for update

willWrite = 0; // Set willWrite to 0 to prevent mutations as outputs settle

#28 // allow a clock cycle for outputs to settle

willWrite = 1;

#28 // write the new array!

willWrite = 0; // we are done writing! Set willWrite to 0 to prevent further mutations

#28

We will also need to update the codes/low/high of all cells. We will need to run congrueUp.

new_index = 1; //we know from previous markAvailable that handle 1 was open, and we wrote to it. Set new_index to handle of array we wrote, which is 1.

metadata = code; // code of the entry we updated

new_value = rank; // rank of the entry we updated

selector = 3; // selector for congrueUp

willWrite = 0; // this is very critical - set willWrite to 0 initially

#28; // allow a cycle for outputs to stabilize, then write

willWrite = 1; // do the op!

#28;

willWrite = 0;

// We are done! Set willWrite to 0 to prevent further mutations

2) LookUp Op

// Example is analogous to ESFAArrayOp().lookUp(state_and_handle._1, 0, 0), which searches array of handle 0 for element defined at index == 0

// We should never have willWrite set to 1 here, because there's no mutation in a lookup!

isMetadata = 1;

metadata = 0; // handle of array we are searching, in this case 0

selector = 2; // Encode's selector value

#28

// now that we have the code of the array, feed it into lookUpScan

code = resultValue;

metadata = code;

isMetadata = 1;

new_index = 0; // index we are searching for

selector = 1; // selector for lookUp

#28

If element exists, resultBool == 1, and value will be in ResultValue

3) Delete Op

// Let's get destructive!

// Example: ESFAArrayOp().delete(state_and_handle._1, 1)

// In other words, delete the array with handle 1

// first, encode the array at handle 1.

isMetadata = 1;

metadata = 1;

selector = 2;

#28;

code = resultValue;

selector = 4; // selector code for congrueDown

new_index = 1; // the handle of the array we want to delete

metadata = code; // said array's code

willWrite = 0;

#28; // Critical - allow a cycle with willWrite = 0 for combinator outputs to settle, or unexpected inputs may be written to regs

willWrite = 1;

#28; // Remove our old array, and changes code/high/low of other cells accordingly to take into account the cell's change. 

willWrite = 0;

// Demolition complete!

If there are concerns, contact me at justintjoa@ucsb.edu

Thanks!