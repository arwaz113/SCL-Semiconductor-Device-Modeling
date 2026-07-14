# SCL Internship: Semiconductor Device Simulation & Characterization

This repository contains my simulation scripts, analytical models, and the final technical report from my summer industrial training at the Semi-Conductor Laboratory (SCL), Mohali. The work was conducted within the Semiconductor Process Technology Development Group (SPTDG).

## Repository Contents

### 1. LGAD Simulation & Modeling
* Silvaco TCAD (ATHENA/ATLAS) scripts used to optimize double boron implant layers (150keV and 180keV) for Low-Gain Avalanche Detectors. The simulated design achieved a gain of 25.45 and a 700V breakdown.
* MATLAB scripts for calculating optical multiplication gains by processing impact ionization coefficients using the Poisson equation and Chynoweth's Law.

### 2. Microbolometer Electro-Thermal Models
* LTspice `.asc` files for predicting dynamic electro-thermal behavior.
* Includes the Wheatstone bridge transient pulse-response setups used to extract thermal conductance, heat capacity, and thermal time constants.

### 3. PIN Diode Analysis
* MATLAB scripts that process Open Circuit Voltage Decay (OCVD) transient waveforms to estimate minority carrier lifetimes for fast-switching plasma antenna arrays.

## Tools & Equipment
* **Software:** Silvaco TCAD, LTspice, MATLAB
* **Hardware:** Vacuum Cryoscope Chambers, Digital Storage Oscilloscopes

## Full Technical Report
For the complete device physics methodology, experimental setup details, and data plots, please see the `SCL_Internship_report_Arwaz (1).pdf` file in the root directory.
