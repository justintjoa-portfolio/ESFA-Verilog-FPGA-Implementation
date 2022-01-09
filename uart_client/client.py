
# setup serial port
import serial  
import sys  
import array 


PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(PORT, BAUD)
s.flush()

# tmp = array.array('B', [0b1, 0b101, 0b0, 0b101, 0b0]).tostring()
# s.write(tmp.encode())
values = bytearray([0b1, 0b101, 0b0, 0b101, 0b0])
s.write(values)
print("receive\n")
    
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)

values = bytearray([0b0, 0b101, 0b0, 0b101, 0b0])
s.write(values)
print("receive\n")
    
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)
