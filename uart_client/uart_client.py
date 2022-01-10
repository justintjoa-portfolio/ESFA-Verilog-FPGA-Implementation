
# setup serial port
import serial  
import sys  
import array 
import time;

PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(port=PORT, baudrate=BAUD, 
bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, 
stopbits=serial.STOPBITS_ONE)
s.flush()

def update(handle, index, value):
    if (s.is_open == False):
        s.open()
    values = bytearray([0b11, 0b0, bin(handle), bin(value), bin(index)])
    s.write(values)
    s.read(5)
    s.close()
    s.open()
    values = bytearray([0b101, 0b0, 0b0, 0b0, 0b0])
    output = (s.read(5))
    s.close()
    result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
    control = result[7:0]
    if (control[0:0]):
        return True
    else:
        return False
    




    



