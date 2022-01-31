
# setup serial port

f = open("trial.coe", "w")

outputString = ""

def int_to_string(value):
    return bin(value)[2:].zfill(8)

def add_to_output_string(expectedValue, selector, new_value, new_index, queried_handle, control_byte):
    global outputString
    addition = int_to_string(expectedValue) + int_to_string(selector) + int_to_string(new_value) + int_to_string(new_index) + int_to_string(queried_handle) + int_to_string(control_byte) + ",\n"
    outputString = outputString + addition

def endProgram():
    add_to_output_string(0, 0, 0, 0, 0, 4)

def writeCOE():
    endProgram()
    global outputString  
    if (outputString[-2:] == ",\n"):
        outputString = outputString[:-2] + ";" 
    f.write(outputString)
    f.close()

def init_header(title):
    global outputString
    outputString = outputString + "memory_initialization_radix=2;" + " " + title + "\n"
    outputString = outputString + "memory_initialization_vector=\n\n"

def clearMutation():
    add_to_output_string(0, 8, 0, 0, 0, 1)

def update(index, value):
    add_to_output_string(0, 0, value, index, 0, 1)
    clearMutation()

def lookUp(index):
    add_to_output_string(0, 1, 0, index, 0, 1)

def encode(handle):
    add_to_output_string(0, 2, 0, 0, handle, 1)

def congrueUp():
    add_to_output_string(0, 3, 0, 0, 0, 1)
    clearMutation()

def congrueDown(handleOfEntryToBeDeleted):
    add_to_output_string(0, 4, 0, 0, handleOfEntryToBeDeleted, 1)
    clearMutation()

def markAvailableCell():
    add_to_output_string(0, 5, 0, 0, 0, 1)

def enrank(handle):
    add_to_output_string(0, 6, 0, 0, handle, 1)

def debug(handleOfNewEntry):
    add_to_output_string(0, 7, 0, 0, handleOfNewEntry, 1)
    
#Macro functions

def m_update(handle, index, value):
    markAvailableCell()
    if (handle is None):
        update(index, value)
    else:
        encode(handle)
        enrank(handle)
        update(index, value)
        congrueUp()

def m_lookUp(handle, index):
    encode(handle)
    lookUp(index)

def m_delete(handle):
    encode(handle)
    congrueDown(handle)

def m_debug(handle):
    return debug(handle)

def m_assert(expected_bool, expected_value):
    control = 0
    if (expected_bool):
        control = 2
    add_to_output_string(expected_value, 8, 0, 0, 0, control)
