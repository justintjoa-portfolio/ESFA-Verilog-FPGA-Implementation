#make sure you change out SandboxProcessUARTAPI to SandboxProcessUARTBenchmark
import serial  
import sys  
import time


PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(port=PORT, baudrate=BAUD, 
bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, 
stopbits=serial.STOPBITS_ONE)
s.flush()

def send(byteArray):
    if (s.is_open == False):
        s.open()
    s.write(byteArray)
    output = (s.read(5))
    s.close()
    value = int.from_bytes(output, byteorder=sys.byteorder)
    isRunning = value & 1
    isSuccessful = (value >> 1) & 1
    return isRunning, isSuccessful 

send(bytearray([0b1, 0b0, 0b0, 0b0, 0b0]))
time.sleep(5)
isRunning, isSuccessful  = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
assert(isRunning == 0)
assert(isSuccessful == 1)


