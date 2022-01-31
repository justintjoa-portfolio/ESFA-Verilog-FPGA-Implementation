from uart_tools import *

control, returnValue = send(bytearray([0b1, 0b0, 0b0, 0b0, 0b0]))
didStart = control & 1
alreadyRan = (control >> 1) & 1
if (didStart):
    print("Trial successfully started!")
else:
    if (alreadyRan):
        print("Trial already ran, please reset")
    else:
        print("Trial is already running!")