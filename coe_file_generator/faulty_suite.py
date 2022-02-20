# this test will fail on instruction 0f
# check that the instructionOfError is in fact
# 15

from coe_file_tools import *

init_header("update suite")
m_update(None, 0, 5)
m_update(0, 0, 10)
m_lookUp(0, 0)
m_assert(True, 5)
m_lookUp(1,0)
m_assert(True, 5)
writeCOE()