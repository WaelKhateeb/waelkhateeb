# Congestion Control Model with DDE-Biftool

This folder contains MATLAB code for symbolic generation and bifurcation analysis of a delayed congestion-control model using DDE-Biftool.

## What the code does

The project defines a two-variable delayed dynamical system with state variables `w` and `q`, parameters `k`, `tau`, and `delay`, and delayed variables `wtau` and `qtau`. The symbolic setup file generates the right-hand side and its derivatives for DDE-Biftool. The main script then initializes the model, corrects an equilibrium, computes stability, continues the steady-state branch with respect to the delay parameter, detects Hopf bifurcation points, branches into periodic orbits, and evaluates Floquet multipliers along the periodic-orbit branch.

## Files

- `Function_def6.m`: Symbolically defines the delayed congestion-control model and generates the DDE-Biftool function file.
- `sym_congestionControlModel.m`: Automatically generated MATLAB function containing the model right-hand side and derivatives used by DDE-Biftool.
- `Main_code6.m`: Runs the continuation, stability, Hopf bifurcation, periodic-orbit, and Floquet multiplier analysis.

## Tools

- MATLAB
- Symbolic Math Toolbox
- DDE-Biftool

