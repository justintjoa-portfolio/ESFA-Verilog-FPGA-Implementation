from coe_file_tools import *

init_header("update suite")
m_update(None, 0, 5)
m_assert(True, 0)
writeCOE()