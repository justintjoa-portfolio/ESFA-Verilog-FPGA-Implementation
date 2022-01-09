
# setup serial port
import serial  
import sys  
import array 


PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(PORT, BAUD)
s.flush()

#markAvailableCell

print("Marking available cell\n")

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

#write Cell (0, 5)

print("Writing cell 0,5\n")

values = bytearray([0b111, 0b0, 0b0, 0b101, 0b0])
s.write(values)
print("receive\n")
    
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)

values = bytearray([0b0, 0b0, 0b0, 0b0, 0b0])
s.write(values)
print("receive\n")
    
output = (s.read(5))
result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
print(result)
