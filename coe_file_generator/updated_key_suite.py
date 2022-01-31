from esfa_tools import *

m_update(None, 0, 5)
m_update(0, 0, 10)
value = m_lookUp(0, 0)
assert(value == 5)
value = m_lookUp(1,0)
assert(value == 10)

