set_property PACKAGE_PIN W5 [get_ports masterClock]
set_property IOSTANDARD LVCMOS33 [get_ports masterClock]

create_clock -period 10.000 [get_ports masterClock]