transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+system_clock  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.system_clock xil_defaultlib.glbl

do {system_clock.udo}

run 1000ns

endsim

quit -force
