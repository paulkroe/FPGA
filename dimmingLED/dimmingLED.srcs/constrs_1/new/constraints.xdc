# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# LEDs
set_property PACKAGE_PIN U16 [get_ports signal[0]]
set_property PACKAGE_PIN E19 [get_ports signal[1]]
set_property PACKAGE_PIN U19 [get_ports signal[2]]
set_property PACKAGE_PIN V19 [get_ports signal[3]]
set_property IOSTANDARD LVCMOS33 [get_ports signal]
