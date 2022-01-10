
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

def send(byteArray):
    if (s.is_open == False):
        s.open()
    s.write(byteArray)
    output = (s.read(5))
    s.close()
    result = bin(int.from_bytes(output, byteorder=sys.byteorder))  # => '0b10001'
    return result

def update(handle, index, value):
    send(bytearray([0b11, 0b0, bin(handle), bin(value), bin(index)]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    if (control[0:0]):
        return True
    else:
        return False

def lookUp(array_code, index):
    send(bytearray([0b11, 0b1, bin(array_code), 0b0, bin(index)]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    elementValue = result[15:8]
    if (control[0:0]):
        return elementValue
    else:
        return None

def encode(handle):
    send(bytearray([0b11, 0b10, bin(handle), 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    code = result[15:8]
    if (control[0:0]):
        return code
    else:
        return None

def congrueUp(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    send(bytearray([0b11, 0b11, bin(codeOfUpdatedEntry), bin(rankOfUpdatedEntry), bin(handleOfNewEntry)]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    code = result[15:8]
    if (control[0:0]):
        return True
    else:
        return False

def congrueDown(codeOfEntryToBeDeleted, handleOfEntryToBeDeleted):
    send(bytearray([0b11, 0b100, bin(codeOfEntryToBeDeleted), 0b0, bin(handleOfEntryToBeDeleted)]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    code = result[15:8]
    if (control[0:0]):
        return True
    else:
        return False

def markAvailableCell():
    send(bytearray([0b1, 0b101, 0b0, 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    handle = result[15:8]
    if (control[0:0]):
        return handle
    else:
        return None

def enrank(handle):
    send(bytearray([0b11, 0b110, bin(handle), 0b0, 0b0]))
    result = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    control = result[7:0]
    rank = result[15:8]
    if (control[0:0]):
        return rank
    else:
        return None

#Macro functions

def m_update(handle, index, value):
    new_handle = markAvailableCell
    if (new_handle is None):
        return False 
    if (handle is None):
        update(new_handle, index, value)
    else:
        code = encode(handle)
        rank = enrank(handle)
        if ((code is not None) and (rank is not None)):
            update(new_handle, index, value)
            congrueUp(rank, code, new_handle)

def m_lookUp(handle, index):
    code = encode(handle)
    if (code is None):
        return None
    else:
        value = lookUp(code, index)
        return value

def m_delete(handle):
    code = encode(handle)
    if (code is None):
        return False  
    else:
        return congrueDown(code, handle)

    




    



