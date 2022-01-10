
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
    value = value >> 8 & 0b11111111
    return control, value

def update(handle, index, value):
    send(bytearray([0b11, 0b0, handle, value, index]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    control, new_value = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return True
    else:
        return False

def lookUp(array_code, index):
    send(bytearray([0b11, 0b1, array_code, 0b0, index]))
    control, elementValue = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return elementValue
    else:
        return None

def encode(handle):
    send(bytearray([0b11, 0b10, handle, 0b0, 0b0]))
    control, code = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return code
    else:
        return None

def congrueUp(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    print("am congrueing up on ")
    print(handleOfNewEntry)
    print(rankOfUpdatedEntry)
    print(codeOfUpdatedEntry)
    send(bytearray([0b11, 0b11, codeOfUpdatedEntry, rankOfUpdatedEntry, handleOfNewEntry]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    control, code = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return True
    else:
        return False

def congrueDown(codeOfEntryToBeDeleted, handleOfEntryToBeDeleted):
    send(bytearray([0b11, 0b100, codeOfEntryToBeDeleted, 0b0, handleOfEntryToBeDeleted]))
    send(bytearray([0b101, 0b0, 0b0, 0b0, 0b0]))
    control, code = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return True
    else:
        return False

def markAvailableCell():
    send(bytearray([0b1, 0b101, 0b0, 0b0, 0b0]))
    control, handle = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return handle
    else:
        return None

def enrank(handle):
    send(bytearray([0b11, 0b110, handle, 0b0, 0b0]))
    control, rank = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return rank
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
    print(code)
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

value = m_update(None, 0, 5)
assert(value == 0)
value = m_update(0, 2, 10)
assert(value == 1)
value = m_update(None, 4, 10)
assert(value == 2)
value = m_update(2, 10, 21)
assert(value == 3)
value = m_update(1, 9, 5)
assert(value == 4)
value = m_update(1, 11, 14)
assert(value == 5)
value = m_lookUp(0, 0)
assert(value == 5)
value = m_lookUp(1, 0)
assert(value == 5)
value = m_lookUp(1, 2)
assert(value == 10)
value = m_lookUp(3, 4)
assert(value == 10)
value = m_lookUp(5, 2)
assert(value == 10)
value = m_lookUp(5, 1)
assert(value == None)
value = m_delete(1)
assert(value == True)
value = m_delete(4)
assert(value == True)
value = m_delete(5)
assert(value == True)
value = m_lookUp(0, 0)
assert(value == 5)



    



