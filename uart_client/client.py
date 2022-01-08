
# setup serial port
import serial    
n = 1

PORT = 'COM4' 
BAUD = 115200
s = serial.Serial(PORT, BAUD)
s.flush()

input = "h"
output = ""
s.write(input.encode())
print("receive\n")
    

for i in range(n):
     output += (s.read(1)).decode()
print(output)
