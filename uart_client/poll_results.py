from uart_tools import *

control, returnValue = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
isDone = control & 1
isSuccessful = (control >> 1) & 1
instructionOfError = returnValue & 0b1111111111111111
expectedValue = returnValue >> 16
if (isDone):
    if (isSuccessful):
        print("Trial was successful!")
    else: 
        print("Trial failed!")
        print("Instruction of error was : ")
        print(instructionOfError)
        print("Expected value was :")
        print(expectedValue)
else:
    print("Trial isn't finished yet!")