# 4-Bit Synchronous Counter with Self-Checking Testbench

## 📌 Project Overview
This repository contains a **4-bit Synchronous Up-Counter** designed in Verilog (RTL) along with an automated, **self-checking testbench**. The counter increments on every rising edge of the clock when the system is enabled, and features an active-low reset.

This project demonstrates core sequential design concepts, precise clock-edge alignment in verification, and basic automated log checking.

---

## ⚙️ Hardware Specifications (RTL Design)
The module `sync_counter` uses the following interface:

| Port Name | Direction | Width | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1-bit | System Clock |
| `rst_n` | Input | 1-bit | Active-Low Reset (Asynchronous) |
| `enable` | Input | 1-bit | Count Enable switch |
| `count` | Output | 4-bit | Current value of the counter |

### Design Logic
- **Reset Condition:** When `rst_n` goes low (`0`), the output `count` immediately forces to `4'b0000`.
- **Counting Condition:** On a rising clock edge (`posedge clk`), if `rst_n` is high and `enable` is high (`1`), the counter increments by 1 (`count <= count + 1'b1`).
- **Hold Condition:** If `enable` is low, the register retains its previous value.

---

## 🛠️ Verification Strategy & Testbench
Instead of manually inspecting waveforms, the verification framework is fully **self-checking**. It samples the outputs right after the active clock edge to eliminate simulation setup/hold race conditions.

### Test Scenarios Covered:
1. **Reset Verification:** Asserts `rst_n = 0` and verifies that the counter defaults cleanly to `4'b0000`.
2. **Enable & Increment Verification:** De-asserts reset, enables the counter (`test_enable = 1`), and validates that the output increments exactly to `4'b0001` on the next active clock edge.

### Simulation Outputs
When simulated in a tool like Icarus Verilog or EDA Playground, the console prints real-time status notifications:
* `PASS: test_count (0000) is suuper perfecto`
* `PASS: test_count (0001) is suuper perfecto`
