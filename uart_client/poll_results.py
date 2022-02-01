from uart_tools import *

control, instructionOfError = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
isDone = control & 1
isSuccessful = (control >> 1) & 1
print("last instruction was")
print(instructionOfError)
if (isDone):
    if (isSuccessful):
        print("Trial was successful!")
    else: 
        print("Trial failed!")
        print("Instruction of error was : ")
        print(instructionOfError)
else:
    print("Trial isn't finished yet!")