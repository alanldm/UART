## Clock de 100 MHz - exemplo com sinal simples (não diferencial)
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]

## UART TX
set_property PACKAGE_PIN AA14 [get_ports TXD]
set_property IOSTANDARD LVCMOS33 [get_ports TXD]

## Botão ou sinal de enable
set_property PACKAGE_PIN T16 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports enable]