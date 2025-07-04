
# 4 Bit ALU Design & Verification throw Semi Custom & Full Custom

This is the final project for **ECE 212s – Digital Circuits – Spring 2025** at Ain Shams University, focused on designing, verifying, and implementing a **4-bit Arithmetic and Logic Unit (ALU)** using both **semi-custom** (RTL & FPGA) and **full-custom** (transistor-level with Cadence Virtuoso) methodologies design flows. This project includes design, simulation, verification, C++ reference modeling, and FPGA deployment, along with detailed documentation and layout files.

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

## 🧠 Project Objective

To design an ALU capable of executing both arithmetic and logical operations as specified by a 4-bit selection line. The ALU uses flip-flops at both inputs and outputs, and its behavior is described as follows:

### ✨ Supported Operations

| Sel (4-bit) | Operation                       | Type      |
|-------------|----------------------------------|-----------|
| 0000        | Increment a                      | Arithmetic |
| 0001        | Increment b                      | Arithmetic |
| 0010        | Transfer a                       | Arithmetic |
| 0011        | Transfer b                       | Arithmetic |
| 0100        | Decrement a                      | Arithmetic |
| 0101        | Multiply a and b                 | Arithmetic |
| 0110        | Add a and b                      | Arithmetic |
| 0111        | Subtract a from b (a > b)        | Arithmetic |
| 1000        | Complement a (1’s complement)    | Logic     |
| 1001        | Complement b (1’s complement)    | Logic     |
| 1010        | AND                              | Logic     |
| 1011        | OR                               | Logic     |
| 1100        | XOR                              | Logic     |
| 1101        | XNOR                             | Logic     |
| 1110        | NAND                             | Logic     |
| 1111        | NOR                              | Logic     |

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
