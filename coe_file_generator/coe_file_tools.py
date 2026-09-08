COE_FILE = "trial.coe"
LISTING_FILE = "trial.lst"

outputString = ""
listing = []
counter = 0

# Tracks the high-level macro operation that caused primitive
# instructions to be emitted.
current_source_operation = None

def int_to_string(value):
    return bin(value)[2:].zfill(8)

def add_to_output_string(
    expectedValue,
    selector,
    new_value,
    new_index,
    queried_handle,
    control_byte,
    primitive
):
    global outputString
    global counter
    global listing
    global current_source_operation

    addition = (
        int_to_string(counter)
        + int_to_string(expectedValue)
        + int_to_string(selector)
        + int_to_string(new_value)
        + int_to_string(new_index)
        + int_to_string(queried_handle)
        + int_to_string(control_byte)
        + ",\n"
    )

    outputString += addition

    listing.append({
        "id": counter,
        "primitive": primitive,
        "source": current_source_operation or primitive,
    })

    counter += 1

def endProgram():
    add_to_output_string(
        0, 8, 0, 0, 0, 4, "END_PROGRAM"
    )

def writeCOE():
    global outputString
    global listing

    endProgram()

    if outputString[-2:] == ",\n":
        outputString = outputString[:-2] + ";"

    with open(COE_FILE, "w") as coe_file:
        coe_file.write(outputString)

    with open(LISTING_FILE, "w") as listing_file:
        listing_file.write(
            "ID   PRIMITIVE              SOURCE OPERATION\n"
        )
        listing_file.write(
            "------------------------------------------------------------\n"
        )

        for entry in listing:
            listing_file.write(
                f"{entry['id']:02d}   "
                f"{entry['primitive']:<22} "
                f"{entry['source']}\n"
            )

def init_header(title):
    global outputString

    outputString += f"; {title}\n"
    outputString += "memory_initialization_radix=2;\n"
    outputString += "memory_initialization_vector=\n\n"

def update(index, value):
    add_to_output_string(0, 0, value, index, 0, 1, "UPDATE")

def lookUp(index):
    add_to_output_string(0, 1, 0, index, 0, 1, "LOOKUP_SCAN")

def encode(handle):
    add_to_output_string(0, 2, 0, 0, handle, 1, "ENCODE")

def congrueUp():
    add_to_output_string(0, 3, 0, 0, 0, 1, "CONGRUE_UP")

def congrueDown(handleOfEntryToBeDeleted):
    add_to_output_string(
        0, 4, 0, 0, handleOfEntryToBeDeleted, 1, "CONGRUE_DOWN"
    )

def markAvailableCell():
    add_to_output_string(
        0, 5, 0, 0, 0, 1, "FIND_AVAILABLE_CELL"
    )

def enrank(handle):
    add_to_output_string(0, 6, 0, 0, handle, 1, "ENRANK")

def debug(handleOfNewEntry):
    add_to_output_string(
        0, 7, 0, 0, handleOfNewEntry, 1, "DEBUG"
    )
    
# Macro functions

def m_update(handle, index, value):
    global current_source_operation

    current_source_operation = (
        f"m_update(handle={handle}, index={index}, value={value})"
    )

    if handle is not None:
        encode(handle)
        enrank(handle)

    markAvailableCell()
    update(index, value)

    if handle is not None:
        congrueUp()

    current_source_operation = None

def m_lookUp(handle, index):
    global current_source_operation

    current_source_operation = (
        f"m_lookUp(handle={handle}, index={index})"
    )

    encode(handle)
    lookUp(index)

    current_source_operation = None

def m_delete(handle):
    global current_source_operation

    current_source_operation = f"m_delete(handle={handle})"

    encode(handle)
    congrueDown(handle)

    current_source_operation = None

def m_debug(handle):
    global current_source_operation

    current_source_operation = f"m_debug(handle={handle})"

    debug(handle)

    current_source_operation = None

def m_assert(expected_bool, expected_value):
    global current_source_operation

    current_source_operation = (
        f"m_assert(expected_bool={expected_bool}, "
        f"expected_value={expected_value})"
    )

    control = 0

    if expected_bool:
        control = 2

    add_to_output_string(
        expected_value,
        8,
        0,
        0,
        0,
        control,
        "ASSERT"
    )

    current_source_operation = None
