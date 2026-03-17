%% Run Vehicle Control CAN Fault Injection Simulation
clc
clear
close all

disp("Starting Vehicle Control CAN Fault Injection Simulation...")

run("setup_project.m")

model = "model/top_model";
open_system(model)

simOut = sim(model);

disp("Simulation completed.")

try
    logs = simOut.logsout;

    v_ref = logs.get("v_ref").Values;
    v_meas = logs.get("v_meas").Values;

    delta_ref = logs.get("delta_ref").Values;
    delta_meas = logs.get("delta_meas").Values;

    fault_enable = logs.get("fault_enable").Values;
    fault_type = logs.get("fault_type").Values;
    can_drop_enable = logs.get("can_drop_enable").Values;

    figure
    plot(v_ref.Time, v_ref.Data, 'LineWidth', 2)
    hold on
    plot(v_meas.Time, v_meas.Data, 'LineWidth', 2)
    grid on
    xlabel("Time (s)")
    ylabel("Speed (m/s)")
    legend("v_{ref}", "v_{meas}")
    title("Vehicle Speed Tracking")

    figure
    plot(delta_ref.Time, delta_ref.Data, 'LineWidth', 2)
    hold on
    plot(delta_meas.Time, delta_meas.Data, 'LineWidth', 2)
    grid on
    xlabel("Time (s)")
    ylabel("Steering")
    legend("delta_{ref}", "delta_{meas}")
    title("Steering Tracking")

    figure
    plot(fault_enable.Time, fault_enable.Data, 'LineWidth', 2)
    hold on
    plot(fault_type.Time, fault_type.Data, 'LineWidth', 2)
    plot(can_drop_enable.Time, can_drop_enable.Data, 'LineWidth', 2)
    grid on
    xlabel("Time (s)")
    ylabel("Fault Signals")
    legend("fault\_enable", "fault\_type", "can\_drop\_enable")
    title("Fault Injection Timeline")

catch
    disp("Signal logging not enabled yet or signal names do not match.")
end