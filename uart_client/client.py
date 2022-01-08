
# setup serial port
import serial    
n = 1

PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(PORT, BAUD)
s.flush()

values = bytearray([0, 0, 0, 0, 0, 0, 0, 0])
s.write(values.encode())
print("receive\n")
    

for i in range(n):
    (s.read(1)).decode()
print(output)
