from coe_file_tools import *

m_update(None, 0, 5)
m_update(0, 0, 10)
m_lookUp(0, 0)
m_assert(True, 5)
m_lookUp(1,0)
m_assert(True, 10)

