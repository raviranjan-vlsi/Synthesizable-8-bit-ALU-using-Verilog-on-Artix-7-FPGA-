## ============================================================
##  Basys 3 Master XDC — 8-bit ALU Project
##  Board: Basys 3 (Artix-7 XC7A35T-1CPG236C)
##  All pins verified against Basys 3 Reference Manual Rev. E
## ============================================================

## ── Clock ──────────────────────────────────────────────────
## 100 MHz on-board oscillator (not strictly needed for
## combinational ALU, but always constrain the clock pin)
set_property PACKAGE_PIN W5      [get_ports clk]
set_property IOSTANDARD  LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 \
             -waveform {0 5} [get_ports clk]

## ── Slide Switches SW[0]–SW[15] ────────────────────────────
## SW[7:0]  = Operand A  (rightmost block)
set_property PACKAGE_PIN V17  [get_ports {sw[0]}]
set_property PACKAGE_PIN V16  [get_ports {sw[1]}]
set_property PACKAGE_PIN W16  [get_ports {sw[2]}]
set_property PACKAGE_PIN W17  [get_ports {sw[3]}]
set_property PACKAGE_PIN W15  [get_ports {sw[4]}]
set_property PACKAGE_PIN V15  [get_ports {sw[5]}]
set_property PACKAGE_PIN W14  [get_ports {sw[6]}]
set_property PACKAGE_PIN W13  [get_ports {sw[7]}]
## SW[15:8] = Operand B  (leftmost block)
set_property PACKAGE_PIN V2   [get_ports {sw[8]}]
set_property PACKAGE_PIN T3   [get_ports {sw[9]}]
set_property PACKAGE_PIN T2   [get_ports {sw[10]}]
set_property PACKAGE_PIN R3   [get_ports {sw[11]}]
set_property PACKAGE_PIN W2   [get_ports {sw[12]}]
set_property PACKAGE_PIN U1   [get_ports {sw[13]}]
set_property PACKAGE_PIN T1   [get_ports {sw[14]}]
set_property PACKAGE_PIN R2   [get_ports {sw[15]}]
## IOSTANDARD for all switches
set_property IOSTANDARD LVCMOS33 [get_ports {sw[*]}]

## ── LEDs LED[0]–LED[15] ─────────────────────────────────────
## LED[7:0]  = Result
## LED[8]    = Carry | LED[9] = Zero | LED[10] = Negative
set_property PACKAGE_PIN U16  [get_ports {led[0]}]
set_property PACKAGE_PIN E19  [get_ports {led[1]}]
set_property PACKAGE_PIN U19  [get_ports {led[2]}]
set_property PACKAGE_PIN V19  [get_ports {led[3]}]
set_property PACKAGE_PIN W18  [get_ports {led[4]}]
set_property PACKAGE_PIN U15  [get_ports {led[5]}]
set_property PACKAGE_PIN U14  [get_ports {led[6]}]
set_property PACKAGE_PIN V14  [get_ports {led[7]}]
set_property PACKAGE_PIN V13  [get_ports {led[8]}]
set_property PACKAGE_PIN V3   [get_ports {led[9]}]
set_property PACKAGE_PIN W3   [get_ports {led[10]}]
set_property PACKAGE_PIN U3   [get_ports {led[11]}]
set_property PACKAGE_PIN P3   [get_ports {led[12]}]
set_property PACKAGE_PIN N3   [get_ports {led[13]}]
set_property PACKAGE_PIN P1   [get_ports {led[14]}]
set_property PACKAGE_PIN L1   [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]

## ── Push Buttons ─────────────────────────────────────────────
## btnC = centre, btnU = up, btnL = left, btnR = right
set_property PACKAGE_PIN U18  [get_ports btnC]
set_property PACKAGE_PIN T18  [get_ports btnU]
set_property PACKAGE_PIN W19  [get_ports btnL]
set_property PACKAGE_PIN T17  [get_ports btnR]
set_property IOSTANDARD LVCMOS33 [get_ports btnC]
set_property IOSTANDARD LVCMOS33 [get_ports btnU]
set_property IOSTANDARD LVCMOS33 [get_ports btnL]
set_property IOSTANDARD LVCMOS33 [get_ports btnR]

## ── 7-Segment Display ────────────────────────────────────────
## Segments (active low, common anode Basys3)
set_property PACKAGE_PIN W7   [get_ports {seg[0]}]  ;# CA
set_property PACKAGE_PIN W6   [get_ports {seg[1]}]  ;# CB
set_property PACKAGE_PIN U8   [get_ports {seg[2]}]  ;# CC
set_property PACKAGE_PIN V8   [get_ports {seg[3]}]  ;# CD
set_property PACKAGE_PIN U5   [get_ports {seg[4]}]  ;# CE
set_property PACKAGE_PIN V5   [get_ports {seg[5]}]  ;# CF
set_property PACKAGE_PIN U7   [get_ports {seg[6]}]  ;# CG
set_property PACKAGE_PIN V7   [get_ports dp]         ;# DP
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports dp]

## Anodes (active low)
set_property PACKAGE_PIN U2   [get_ports {an[0]}]
set_property PACKAGE_PIN U4   [get_ports {an[1]}]
set_property PACKAGE_PIN V4   [get_ports {an[2]}]
set_property PACKAGE_PIN W4   [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]

## ── Configuration ─────────────────────────────────────────────
set_property CFGBVS VCCO       [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
