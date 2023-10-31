###############################################################################
## Copyright (C) 2021-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# adaq42xx_fmc SPI interface
set_property -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS25 IOB TRUE} [get_ports ad463x_adaq42xx_spi_sdo]   ; ## C11  FMC-LA06_N
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS25 IOB TRUE} [get_ports ad463x_adaq42xx_spi_sclk]  ; ## G06  FMC-LA00_CC_P
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS25}          [get_ports ad463x_adaq42xx_spi_cs]    ; ## G07  FMC-LA00_CC_N

set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS25} [get_ports ad463x_adaq42xx_echo_sclk]          ; ## D20  FMC-LA17_CC_P
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS25} [get_ports ad463x_adaq42xx_resetn]             ; ## D09  FMC-LA01_CC_N
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS25} [get_ports ad463x_adaq42xx_busy]               ; ## C22  FMC-LA18_CC_P
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS25} [get_ports ad463x_adaq42xx_cnv]                ; ## D08  FMC-LA01_CC_P
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS25} [get_ports ad463x_adaq42xx_ext_clk]            ; ## H04  FMC-CLK0_P

set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS25} [get_ports adaq42xx_pgia_mux[0]]               ; ## G12  FMC-LA08_P
set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS25} [get_ports adaq42xx_pgia_mux[1]]               ; ## G13  FMC-LA08_N

# external clock, that drives the CNV generator, must have a maximum 100 MHz frequency
create_clock -period 10.000 -name cnv_ext_clk [get_ports ad463x_adaq42xx_ext_clk]

# SCLK echod clock, tuned to 80 MHz //, phase shifted with 30% (aprox. 4ns)
create_clock -period 12.500 -name ECHOSCLK_clk [get_ports ad463x_adaq42xx_echo_sclk]

# rename auto-generated clock for SPIEngine to spi_clk - 160MHz
# NOTE: clk_fpga_0 is the first PL fabric clock, also called $sys_cpu_clk
create_generated_clock -name spi_clk -source [get_pins -filter name=~*CLKIN1 -of [get_cells -hier -filter name=~*spi_clkgen*i_mmcm]] -master_clock clk_fpga_0 [get_pins -filter name=~*CLKOUT0 -of [get_cells -hier -filter name=~*spi_clkgen*i_mmcm]]

# create a generated clock for SCLK - fSCLK=spi_clk/2 - 80MHz
create_generated_clock -name SCLK_clk -source [get_pins -hier -filter name=~*sclk_reg/C] -edges {1 3 5} [get_ports ad463x_adaq42xx_spi_sclk]

# output delay for MOSI line (SDI for the device)
#
# tHSDI and tSSDI is 1.5ns
set_output_delay -clock [get_clocks SCLK_clk] -max 1.500 [get_ports ad463x_adaq42xx_spi_sdo]
set_output_delay -clock [get_clocks SCLK_clk] -min 1.500 [get_ports ad463x_adaq42xx_spi_sdo]

# relax the SDO path to help closing timing at high frequencies
set_multicycle_path -setup -from [get_clocks spi_clk] -to [get_cells -hierarchical -filter {NAME=~*/data_sdo_shift_reg[*]}] 8
set_multicycle_path -hold  -from [get_clocks spi_clk] -to [get_cells -hierarchical -filter {NAME=~*/data_sdo_shift_reg[*]}] 7

set_multicycle_path -setup -from [get_clocks spi_clk] -to [get_cells -hierarchical -filter NAME=~*/spi_ad463x_adaq42xx_execution/inst/left_aligned_reg*] 8
set_multicycle_path -hold  -from [get_clocks spi_clk] -to [get_cells -hierarchical -filter NAME=~*/spi_ad463x_adaq42xx_execution/inst/left_aligned_reg*] 7
