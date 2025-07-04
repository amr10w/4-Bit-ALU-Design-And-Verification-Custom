
# 4 Bit ALU Design & Verification throw Semi Custom & Full Custom

A comprehensive digital design project implementing a 4-bit Arithmetic Logic Unit (ALU) using both **semi-custom (RTL + FPGA)** and **full-custom (transistor-level)** design flows. This project includes design, simulation, verification, C++ reference modeling, and FPGA deployment, along with detailed documentation and layout files.

The design includes:

- Verilog RTL code and testbenches

- Schematic designs at the logic gate and transistor level

- Simulation waveforms for functional verification

The ALU is explored through multiple design methodologies:

- Full-custom design using 130 nm technology

- Semi-custom design 

- FPGA implementation (for real-time hardware deployment)

All modules have been verified through simulation, making this a comprehensive ALU design and verification project.

---

## ⚙️ Semi-Custom Flow

### 🔧 Verilog RTL Design

- Located in `Semi Custom/RTL & Tb/`
- Modular Verilog code for the ALU architecture

### 🧪 Testbench & Verification

- Located in `Semi Custom/RTL & Tb/`
- Uses both directed and random test vectors

### 💻 C++ Modeling

- Located in `Semi Custom/C++ Modeling/`
- Provides a golden reference 

### 🔌 FPGA Implementation

- Files in `Semi Custom/FPGA/` for synthesis and programming
- Compatible with tools like Xilinx Vivado and Quartus

#### ✅ Simulation Example

```bash
# Compile C++ model
g++ cpp_model/alu_model.cpp -o alu_model

# Compile Verilog code and testbench
iverilog -o alu_tb.vvp rtl/*.v tb/alu_tb.v

# Run simulation
vvp alu_tb.vvp

# View waveform
gtkwave dump.vcd
```
---

## 🏗️ Full-Custom Flow

- Located in `Full Custom/`
- Designed and simulated using **Cadence Virtuoso**
- Includes:
  - Schematic design
  - Post-layout simulation

---

## 📄 Report

Full documentation of both flows can be found in the Documents folder. It includes:

- Block diagrams
- Schematics and layout screenshots
- Test results and waveform snapshots
- Design trade-offs and methodology

---


**Enjoy exploring and verifying your own digital logic using this 4-bit ALU design!**
