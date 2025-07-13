# 🚦 FPGA Traffic Light Controller

This project implements a **Traffic Light Controller** using **Verilog HDL** on an **FPGA** board. It simulates a standard Red–Green–Yellow light sequence, using an FSM (Finite State Machine) and a clock divider to manage time-based transitions.

---

## 📋 Overview

Traffic light systems are widely used in real-life road intersections to control traffic flow. This project aims to replicate a simplified version of that logic using Verilog and deploy it on an FPGA board (like the **Basys 3**, **Spartan-6**, or **Artix-7**).

The controller cycles through:

* **Red** → **Green** → **Yellow** → back to **Red**,
  with each light active for a specific duration.

---

## 🎯 Objectives

* Design a time-controlled traffic light system
* Learn and implement Finite State Machines (FSM)
* Use clock division to work with human-scale time delays
* Interface with onboard LEDs to show outputs

---

## ⚙️ Features

* 3 states: Red, Green, Yellow
* Configurable time delays for each light
* Clock divider to generate 1 Hz signal from high-frequency system clock
* Easily extendable to 4-way or pedestrian systems

---

## 🧠 System Architecture

### 1. **Clock Divider**

Divides the system clock (e.g., 100 MHz) into a 1 Hz signal to slow down light changes for observation.

### 2. **FSM Controller**

Implements the logic of traffic lights using states:

* `S0`: Red ON
* `S1`: Green ON
* `S2`: Yellow ON

### 3. **Top Module**

Integrates all modules and maps outputs to physical LEDs on the FPGA board.

---

## 📁 File Structure

```
├── clock_divider.v         # Slows down input clock
├── traffic_fsm.v           # Finite State Machine for traffic logic
├── top_module.v            # Main file combining all components
├── traffic_tb.v            # Testbench to simulate functionality
├── README.md               # Project documentation
```

---

## 🧪 Simulation

The design is simulated using Vivado/ModelSim. The testbench checks:

* Correct state transitions
* Duration of each light
* Proper reset behavior

---

## 🖥️ Hardware Requirements

* FPGA board (tested on Basys 3 / Spartan-6)
* Vivado Design Suite or equivalent
* 3 LEDs to represent Red, Green, Yellow
* Optionally: push buttons for reset or manual control

---

## 🚀 How to Run

1. Clone this repository
2. Open the project in **Vivado**
3. Add all `.v` files
4. Run synthesis, implementation, and generate bitstream
5. Program your FPGA board
6. Observe LED changes for Red → Green → Yellow

---

## 📈 Timing (Default Values)

| Light  | Duration (Seconds) |
| ------ | ------------------ |
| Red    | 10                 |
| Green  |10                  |
| Yellow | 3                  |



## 🌟 Possible Extensions

* 4-way intersection control
* Pedestrian crossing signal
* Countdown timer with 7-segment display
* Emergency override button
