
# setup serial port
import serial    
n = 1

PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(PORT, BAUD)
s.flush()

values = bytearray([0, 0, 0, 0, 0])
s.write(values)
print("receive\n")
    
output = (s.read(5)).decode()
print(output)
