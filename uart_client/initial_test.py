
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

#markAvailableCell

print("Marking available cell\n")
if (s.is_open == False):
    s.open()
values = bytearray([0b1, 0b101, 0b0, 0b101, 0b0])
s.write(values)
print("receive\n")
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)

s.close()
s.open()
#s.reset_input_buffer
#s.reset_output_buffer

s.write(values)
print("receive\n")
    
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)





