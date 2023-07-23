Project for implementation of Extensible Sparse Functional Array in an FPGA, under the mentorship of Dr. Balkind of UCSB. I am also being advised and assisted by Elmar Grom, a colleague of mine who is an Electrical Engineer. As of January 19, 2022, the hardware design using live UART data has passed all extended suites of the Scala implementation. 

As of February 20, 2022, this design using an optimized Block ROM/UART hybrid design has passed all extended suites originally from the Scala implementation. This version (recommended version to run) belongs under git tag esfa_block_rom. It uses coe files/Block ROM for instruction feeding, and UART for requesting starts of trials and polling results from trials. These coe files are made via python/bash scripts found in coe_file_generator directory. 

Link to presentation and demo: https://www.youtube.com/watch?v=LlO6cbbh-jw

Slides from presentation: https://docs.google.com/presentation/d/1jR87Q2DpsxXWf343KrH_nuamsPu-g76T5hq_UZVlayg/edit#slide=id.p

If you intend on running the purely live UART data version (which I no longer support), please check the git tag esfa_uart_api.

Keynote - please remember to add a value for the blockROM IP for what should fill remaining places!

The High level API of this simulation design can be found here: https://github.com/justintjoa-portfolio/ESFA_Scala_implementation

Original Paper: https://www.sciencedirect.com/science/article/pii/S0167642314005747

Testbed for data structure simulation is the Digilent Arty S7-S25 Spartan 7 board:

https://digilent.com/shop/arty-s7-spartan-7-fpga-development-board/

You can learn how to acquire the s7-25 board file, as well as how to add it to Vivado, here:

https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk

Documentation Links:

Technical Documentation - Deep Dive (Includes Contextual Information and Upcoming Videos): https://docs.google.com/document/d/1gDUGZgg1yh5PnSdxoq2PBPG117_z70DcbdQ9y01g18M

Release Diary: https://docs.google.com/document/d/1Onwxkocl2f0QuUEM0k3As0nP1BEz1VMA278FjJfo7kY

Notes on Running:

### Generating COE Files ###

The coe_file_generator folder holds scripts for generating a sample COE file to test the ESFA. At the time of this writing these scripts include:

- dup_key_value_suite.py (tests that creating duplicate keys and values does not interfere with the immutable array logic)
- faulty_suite.py (a sample of a test that fails and reports an instructionOfError)
- update_suite_rapid.py (tests rapid updates to an array)
- update_suite.py 
- updated_key_suite.py 

You may choose to write your own tests as well. Init the script with init_header function and end it with writeCOE().

The ESFATop module iterates through the values in the BROM and feeds the values into the ESFADesign. These values
contain data to mutate the ESFA Arrays as well as assert that certain test conditions are true. 

### Setting up the BROM IP ####

After running a script you will generate a COE file. Move it via 'bash move_script.bash'

Open the project in Vivado,rightclick the BROM and set the following settings:

Port A Width - 64 bits
Port A Depth - 256 bits
Check yes to Primitives Output Register 
Check yes to RSTA Pin
Set Output Reset Value to 800000001 (Hex)

Pick ESFA.srcs/sources_1/ip/trial.coe for coe file for init file.
Fill remaining locations of BROM with 800000004 (Hex)

Check yes to Enable Safety Circuit

### Running the Test ### 

Generate the bitstream and program the device. Go into the uart_client folder.

The request_trial_start.py script requests the start of the running of the test. Running that
sends the command over UART to start the test. Running the poll_results.py script gets the output
from the ESFA to see if the test passed and if it failed, what instructionID failed. When you do
need to reset, as you can see in the constraints file (esfa_constraint.xdc) that button 0 (BTN0)
is the reset button for this design. 

If there are concerns, contact me at justintjoa@ucsb.edu

Thanks!
