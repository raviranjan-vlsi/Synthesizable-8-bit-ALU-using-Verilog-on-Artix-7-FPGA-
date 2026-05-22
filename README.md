# Synthesizable 8-bit ALU using Verilog on Artix-7 FPGA

## 📖 Overview

This project presents the design, simulation, synthesis, and FPGA implementation of a synthesizable 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL on the Xilinx Basys3 FPGA Board featuring the Artix-7 FPGA.

The ALU is one of the fundamental building blocks of modern processors and digital systems. This implementation demonstrates RTL design methodology, combinational datapath design, FPGA prototyping, timing-aware synthesis, and hardware validation.

The project was developed using Xilinx Vivado and verified both through simulation and real-time FPGA hardware testing.

---

# 🎯 Project Objectives

- Design a synthesizable RTL-based 8-bit ALU in Verilog
- Implement arithmetic, logical, and shift operations
- Generate carry and zero status flags
- Perform functional verification using Verilog testbench
- Deploy and validate the design on Basys3 FPGA hardware
- Understand FPGA synthesis, implementation, and timing flow

---

# 🧠 ALU Functionalities

The ALU performs multiple operations selected through a 3-bit opcode control signal.

## Supported Operations

| Opcode | Operation | Description |
|--------|------------|-------------|
| 000 | Addition | A + B |
| 001 | Subtraction | A - B |
| 010 | AND | Bitwise AND |
| 011 | OR | Bitwise OR |
| 100 | XOR | Bitwise XOR |
| 101 | NOT | Bitwise Complement of A |
| 110 | Shift Left | A << 1 |
| 111 | Shift Right | A >> 1 |

---

# 🏗️ RTL Architecture

The design uses:
- RTL Verilog modeling
- Case-based opcode selection
- Combinational datapath operations
- Registered synchronous outputs
- Carry and zero flag generation

## Internal Design Features

- 8-bit operand width
- 9-bit internal result register for carry handling
- Clocked output registers for stable FPGA operation
- Synthesizable coding style
- FPGA-compatible synchronous design

---

# ⚙️ FPGA Hardware Platform

## FPGA Board Used

- Xilinx Basys3 FPGA Development Board
- Artix-7 FPGA
- 100 MHz onboard clock

## Hardware Resources Utilized

| Resource | Usage |
|----------|------|
| Switches | Operand Input |
| Push Buttons | ALU Operation Selection |
| LEDs | Result and Flag Display |
| FPGA Clock | Synchronous Operation |

---

# 🔌 FPGA Pin Mapping

## Input Mapping

| FPGA Component | Signal |
|---------------|--------|
| SW0–SW7 | Operand A |
| SW8–SW15 | Operand B |
| BTN0–BTN2 | ALU Select Opcode |

## Output Mapping

| FPGA Component | Signal |
|---------------|--------|
| LED0–LED7 | ALU Result |
| LED8 | Carry Flag |
| LED9 | Zero Flag |

---

# 🛠️ Tools & Technologies

## Software Tools

- Xilinx Vivado Design Suite
- Vivado Simulator
- GTKWave (optional)

## Hardware Description Language

- Verilog HDL

## FPGA Platform

- Basys3 FPGA Board
- Artix-7 FPGA

---

# 📂 Project Directory Structure

```bash
├── src/
│   ├── top_alu.v
│   ├── alu.v
│   └── control_logic.v
│
├── tb/
│   └── tb_top_alu.v
│
├── constraints/
│   └── basys3.xdc
│
├── screenshots/
│   ├── simulation_waveform.png
│   ├── rtl_schematic.png
│   └── hardware_validation.jpg
││
└── README.md
