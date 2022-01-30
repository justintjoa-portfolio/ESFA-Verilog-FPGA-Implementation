Project for implementation of Extensible Sparse Functional Array in an FPGA, under the mentorship of Dr. Balkind of UCSB. I am also being advised and assisted by Elmar Grom, a colleague of mine who is an Electrical Engineer. As of January 19, 2022, this hardware design has passed all extended suites of the Scala implementation. 

If you intend on running that version, please check the git tag esfa_uart_api. That tags uses UART to send instructions to the FPGA.

The current build aims to run the trials previously communicated via UART over BROM instead, and only using UART to communicate results of the trial. Again, if you intend to run the UART version, do not look at the repo's current code and instead take a look at the tag. 

The High level API of this simulation design can be found here: https://github.com/justintjoa-portfolio/ESFA_Scala_implementation

Original Paper: https://www.sciencedirect.com/science/article/pii/S0167642314005747

Testbed for data structure simulation is the Digilent Arty S7-S25 Spartan 7 board:

https://digilent.com/shop/arty-s7-spartan-7-fpga-development-board/

You can learn how to acquire the s7-25 board file, as well as how to add it to Vivado, here:

https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk

Documentation Links:

Technical Documentation - Deep Dive (Includes Contextual Information and Upcoming Videos): https://docs.google.com/document/d/1gDUGZgg1yh5PnSdxoq2PBPG117_z70DcbdQ9y01g18M

Release Diary: https://docs.google.com/document/d/1Onwxkocl2f0QuUEM0k3As0nP1BEz1VMA278FjJfo7kY

Release Notes - January 25, 2022 

- This release implements the following: 

    + UART communication system to communicate between host PC and FPGA. The word is defined to have a width of 4 bytes, and uses control/receiving byte to control and correctly interpret results from FPGA.  

    + Python script that uses the first Scala extensive test to test the correctness of the hardware design (tested to be correct in this case). 

    + Aligns the implementation of MemoryCell to better leverage the features of modern Verilog for performance and general readability. 



Instructions on Using ESFADesign in your simulations (view Scala implementation test cases for the compared functions):

Our ESFADesign is hooked as follows:

ESFADesign l1(

        .clk(clk),

        // inputs

        .new_index(new_index),

        .new_value(new_value),

        .metadata(metadata),

        .isMetadata(isMetadata),

        // outputs

        .resultBool(resultBool),

        .resultValue(resultValue),

        .selector(selector)  

    );

The following examples assume a 28 ns clock. 

1) Update Op

In this example, we attempt an update on array with handle 0, and in the new array insert the pair (2, 10)

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

metadata = resultValue; // set metadata to the resultValue which is handle of cell we wish to write new array to. In this case, this equals 1.

isMetadata = 1'b1; // we are not updating None, so set isMetadata to 1

new_index = 2; // index of inserted element

new_value = 8'b1010; // value of inserted element

selector = 0; // 0 is selector value for update

#28 // write the new array!

// If the operation is correct, you should get resultBool as 1'b1

selector = 8; // 8 is selector value for getting ready for a next set of inputs after a write

#28;

We will also need to update the codes/low/high of all cells. We will need to run congrueUp.

new_index = 1; //we know from previous markAvailable that handle 1 was open, and we wrote to it. Set new_index to handle of array we wrote, which is 1.

metadata = code; // code of the entry we updated

new_value = rank; // rank of the entry we updated

selector = 3; // selector for congrueUp

#28; // execute congrueUp

selector = 8; // 8 is selector value for getting ready for a next set of inputs after a write

#28;

2) LookUp Op

// Example is analogous to ESFAArrayOp().lookUp(state_and_handle._1, 0, 0), which searches array of handle 0 for element defined at index == 0

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

#28; // Remove our old array, and changes code/high/low of other cells accordingly to take into account the cell's change. 

// Demolition complete!

selector = 8; // 8 is selector value for getting ready for a next set of inputs after a write

#28;

If there are concerns, contact me at justintjoa@ucsb.edu

Thanks!