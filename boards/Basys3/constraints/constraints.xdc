# ============================================================
# Basys 3 clock: 100 MHz oscillator
# ============================================================

set_property PACKAGE_PIN W5 [get_ports masterClock]
set_property IOSTANDARD LVCMOS33 [get_ports masterClock]

create_clock -add -name sys_clk_pin \
    -period 10.000 \
    -waveform {0 5.000} \
    [get_ports masterClock]


# ============================================================
# USB UART
#
# rx = data coming FROM PC INTO FPGA
# tx = data going FROM FPGA TO PC
# ============================================================

set_property PACKAGE_PIN B18 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

set_property PACKAGE_PIN A18 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]


# ============================================================
# Push buttons
#
# resetButton -> center button
# btn3        -> up button for now
# ============================================================

set_property PACKAGE_PIN U18 [get_ports resetButton]
set_property IOSTANDARD LVCMOS33 [get_ports resetButton]

set_property PACKAGE_PIN T18 [get_ports btn3]
set_property IOSTANDARD LVCMOS33 [get_ports btn3]


# ============================================================
# LEDs
#
# Preserve Elmar's logical numbering:
# led2 -> physical LED 2
# led3 -> physical LED 3
# led4 -> physical LED 4
# led5 -> physical LED 5
# ============================================================

set_property PACKAGE_PIN U19 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports led2]

set_property PACKAGE_PIN V19 [get_ports led3]
set_property IOSTANDARD LVCMOS33 [get_ports led3]

set_property PACKAGE_PIN W18 [get_ports led4]
set_property IOSTANDARD LVCMOS33 [get_ports led4]

set_property PACKAGE_PIN U15 [get_ports led5]
set_property IOSTANDARD LVCMOS33 [get_ports led5]


# ============================================================
# FPGA configuration voltage
# ============================================================

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]