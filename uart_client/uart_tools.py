
# setup serial port
import serial  
import sys  

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
    print(value)
    control = value & 0b11111111
    resultValue = value >> 8 
    return control, resultValue

