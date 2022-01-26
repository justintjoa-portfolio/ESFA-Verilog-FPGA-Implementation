
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
    if (control):
        return time, True
    else:
        return time, False

def lookUp(array_code, index):
    send(bytearray([0b11, 0b1, array_code, 0b0, index]))
    control, elementValue, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, elementValue
    else:
        return time, None

def encode(handle):
    send(bytearray([0b11, 0b10, handle, 0b0, 0b0]))
    control, code, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, code
    else:
        return time, None

def congrueUp(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    send(bytearray([0b11, 0b11, codeOfUpdatedEntry, rankOfUpdatedEntry, handleOfNewEntry]))
    control, code, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, True
    else:
        return time, False

def congrueDown(codeOfEntryToBeDeleted, handleOfEntryToBeDeleted):
    send(bytearray([0b11, 0b100, codeOfEntryToBeDeleted, 0b0, handleOfEntryToBeDeleted]))
    control, code, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, True
    else:
        return time, False

def markAvailableCell():
    send(bytearray([0b1, 0b101, 0b0, 0b0, 0b0]))
    control, handle, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, handle
    else:
        return time, None

def enrank(handle):
    send(bytearray([0b11, 0b110, handle, 0b0, 0b0]))
    control, rank, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    if (control):
        return time, rank
    else:
        return time, None

def debug(rankOfUpdatedEntry, codeOfUpdatedEntry, handleOfNewEntry):
    send(bytearray([0b11, 0b111, codeOfUpdatedEntry, rankOfUpdatedEntry, handleOfNewEntry]))
    control, debug, time = send(bytearray([0b0, 0b0, 0b0, 0b0, 0b0]))
    print("debugging")
    print(control)
    print(debug)
    if (control):
        return time, debug
    else:
        return time, None

#Macro functions

def m_update(handle, index, value):
    print("Update Operation")
    runningTime = 0
    time, new_handle = markAvailableCell()
    runningTime = runningTime + time
    if (new_handle is None):
        print("Update operation duration : ")
        print(runningTime)
        return None
    if (handle is None):
        time, _ = update(new_handle, index, value)
        runningTime = runningTime + time
    else:
        time, code = encode(handle)
        runningTime = runningTime + time
        time, rank = enrank(handle)
        runningTime = runningTime + time
        if ((code is not None) and (rank is not None)):
            time, _ = update(new_handle, index, value)
            runningTime = runningTime + time
            time, _ = congrueUp(rank, code, new_handle)
            runningTime = runningTime + time
        else:
            print("Update operation duration : ")
            print(runningTime)
            return None
    print("Update operation duration : ")
    print(runningTime)
    return new_handle

def m_lookUp(handle, index):
    runningTime = 0
    print("Lookup Operation")
    time, code = encode(handle)
    runningTime = runningTime + time
    if (code is None):
        print("Lookup operation duration : ")
        print(runningTime)
        return None
    else:
        time, value = lookUp(code, index)
        runningTime = runningTime + time
        print("Lookup operation duration : ")
        print(runningTime)
        return value

def m_delete(handle):
    runningTime = 0
    print("Delete Operation")
    time, code = encode(handle)
    runningTime = runningTime + time
    if (code is None):
        print("Delete operation duration : ")
        print(runningTime)
        return False  
    else:
        time, value = congrueDown(code, handle)
        runningTime = runningTime + time  
        print("Delete operation duration : ")
        print(runningTime)
        return value

def m_debug(handle):
    time, value = debug(handle)
    print("Debug operation duration : ")
    print(time)
    return value