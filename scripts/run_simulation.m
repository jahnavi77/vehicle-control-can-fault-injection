%% Run Vehicle Control Simulation
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
    v_ref = simOut.logsout.get("v_ref").Values;
    v_meas = simOut.logsout.get("v_meas").Values;

    figure
    plot(v_ref.Time, v_ref.Data, 'LineWidth', 2)
    hold on
    plot(v_meas.Time, v_meas.Data, 'LineWidth', 2)
    grid on
    xlabel("Time (s)")
    ylabel("Speed (m/s)")
    legend("v_{ref}", "v_{meas}")
    title("Vehicle Speed Tracking")
catch
    disp("Signal logging not enabled yet.")
end