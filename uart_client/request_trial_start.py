from uart_tools import *

control, returnValue = send(bytearray([0b1, 0b0, 0b0, 0b0, 0b0]))
if (control):
    print("Trial successfully started!")
else:
    print("Failed to start trial - something went wrong!")