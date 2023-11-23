###############################################################################
## Copyright (C) 2021-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

set_property -dict {PACKAGE_PIN Y32  IOSTANDARD LVCMOS18} [get_ports ad463x_spi_sdi[0]]     ; ## D23  FMC_LA23_P           IO_L1P_T0L_N0_DBC_45
set_property -dict {PACKAGE_PIN W32  IOSTANDARD LVCMOS18} [get_ports ad463x_spi_sdi[1]]     ; ## D24  FMC_LA23_N           IO_L1N_T0L_N1_DBC_45

# input delays for MISO lines (SDO for the device)
# data is latched on negative edge

set tsetup 5.6
set thold 1.4

set_input_delay -clock [get_clocks ECHOSCLK_clk] -clock_fall -max  $tsetup [get_ports ad463x_spi_sdi[0]]
set_input_delay -clock [get_clocks ECHOSCLK_clk] -clock_fall -min  $thold  [get_ports ad463x_spi_sdi[0]]
set_input_delay -clock [get_clocks ECHOSCLK_clk] -clock_fall -max  $tsetup [get_ports ad463x_spi_sdi[1]]
set_input_delay -clock [get_clocks ECHOSCLK_clk] -clock_fall -min  $thold  [get_ports ad463x_spi_sdi[1]]