# Vehicle Control + CAN Simulation + Fault Injection (MATLAB/Simulink)

This project builds an ECU-style Simulink simulation:
- Controller ECU computes drive/brake/steer commands
- Commands + sensor feedback are exchanged over a simulated CAN network
- Fault injection supported: sensor stuck/dropout, actuator delay, CAN drop
- Safety supervisor triggers safe-stop behavior when faults are detected

## Structure
- `model/` Simulink models (top model + subsystems)
- `scripts/` setup/run/plot scripts
- `data/` params + (optional) DBC files
- `results/` logs + plots
- `docs/` diagrams + test plan
