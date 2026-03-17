%% Vehicle + Control Parameters (Beginner)

m           = 30000;     
c_rr        = 200;       
c_d         = 30;        

F_drive_max = 120000;    
F_brake_max = 200000;    

L           = 4;         
tau_steer   = 0.3;       

Ts_can      = 0.01;      
Ts_ctrl     = 0.01;      
Ts_plant    = 0.001;     
t_stop      = 20;        

drive_cmd_max = 1;
brake_cmd_max = 1;
steer_cmd_max = 1;

Kp_speed = 0.05;
Kp_steer = 0.05;
Kp_brake = 0.05;