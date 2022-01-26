
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
    control = value & 1
    time = value >> 16
    resultValue = value >> 8 & 0b11111111
    return control, resultValue, time

def update(handle, index, value):
    send(bytearray([0b11, 0b0, handle, value, index]))
    control, new_value, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Update operation duration : ")
    print(time)
    if (control):
        return True
    else:
        return False

def lookUp(array_code, index):
    send(bytearray([0b11, 0b1, array_code, 0b0, index]))
    control, elementValue, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Lookup operation duration : ")
    print(time)
    if (control):
        return elementValue
    else:
        return None

def encode(handle):
    send(bytearray([0b11, 0b10, handle, 0b0, 0b0]))
    control, code, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Encode operation duration : ")
    print(time)
    if (control):
        return code
    else:
        return None

def congrueUp(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    send(bytearray([0b11, 0b11, codeOfUpdatedEntry, rankOfUpdatedEntry, handleOfNewEntry]))
    control, code, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("CongrueUp operation duration : ")
    print(time)
    if (control):
        return True
    else:
        return False

def congrueDown(codeOfEntryToBeDeleted, handleOfEntryToBeDeleted):
    send(bytearray([0b11, 0b100, codeOfEntryToBeDeleted, 0b0, handleOfEntryToBeDeleted]))
    control, code, time  = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Update operation duration : ")
    print(time)
    if (control):
        return True
    else:
        return False

def markAvailableCell():
    send(bytearray([0b1, 0b101, 0b0, 0b0, 0b0]))
    control, handle, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Markavailable operation duration : ")
    print(time)
    if (control):
        return handle
    else:
        return None

def enrank(handle):
    send(bytearray([0b11, 0b110, handle, 0b0, 0b0]))
    control, rank, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("Enrank operation duration : ")
    print(time)
    if (control):
        return rank
    else:
        return None

def debug(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    send(bytearray([0b11, 0b111, codeOfUpdatedEntry, rankOfUpdatedEntry, handleOfNewEntry]))
    control, debug, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("debugging")
    print(control)
    print(debug)
    print("Debug operation duration : ")
    print(time)
    if (control):
        return debug
    else:
        return None

#Macro functions

def m_update(handle, index, value):
    new_handle = markAvailableCell()
    if (new_handle is None):
        return None
    if (handle is None):
        update(new_handle, index, value)
    else:
        code = encode(handle)
        rank = enrank(handle)
        if ((code is not None) and (rank is not None)):
            update(new_handle, index, value)
            congrueUp(rank, code, new_handle)
        else:
            return None
    return new_handle

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

def m_debug(handle):
    return debug(handle)