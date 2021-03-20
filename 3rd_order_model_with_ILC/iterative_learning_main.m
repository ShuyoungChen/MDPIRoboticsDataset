clear;
clc;

%M_1=csvread('joint1_0.2radian.csv');

%% for plot result
M_1=csvread('sin_magnitude_6deg_omega0.5_final.csv');

M1_1=M_1(1:size(M_1,1),:);
t_1=M1_1(:,9);
t_1(find(isnan(t_1))) = [];
q_1=M1_1(:,6);
q_1(find(isnan(q_1))) = [];
qd_1=M1_1(:,4);
qd_1(find(isnan(qd_1))) = [];
qin_1=M1_1(:,5);
qin_1(find(isnan(qin_1))) = [];
%qerr_1=M1_1(:,7);
%qerr_1(find(isnan(qerr_1))) = [];

t1_1=(0:0.004:t_1(length(t_1)));
qd1_1=interp1(t_1,qd_1,t1_1);
q1_1=interp1(t_1,q_1,t1_1);
qin1_1=interp1(t_1,qin_1,t1_1);
%qerr1_1=interp1(t_1,qerr_1,t1_1);

plot(t1_1(1:50:end), qd1_1(1:50:end), '-.r*', t1_1(1:50:end), qin1_1(1:50:end), '--mo', t1_1(1:50:end), q1_1(1:50:end));
xlabel('sec');ylabel('angle (deg)');
legend('desired output', 'input', 'real output from RobotStudio');

%% for iterative update
% M_1=csvread('sin_path_mag_6deg_omega15.csv');
% %              
% M1_1=M_1(1:size(M_1,1),:);
% t_1=M1_1(:,9);
% t_1(find(isnan(t_1))) = [];
% q_1=M1_1(:,5);
% q_1(find(isnan(q_1))) = [];
% qd_1=M1_1(:,4);
% qd_1(find(isnan(qd_1))) = [];
% 
% t1_1=(0:0.004:t_1(length(t_1)));
% qd1_1=interp1(t_1,qd_1,t1_1);
% q1_1=interp1(t_1,q_1,t1_1);
% 
% %load model
model = load('final_parameter.mat');
x = model.x_mincon_3_18;
% 
z = x(1);
% w = x(2);
% a = x(3);
% 
% G2=tf(w^2,[1 2*z*w w^2]);
% G1=tf(a,[1 a]);
% 
% G = G2*G1;
% %bode(G)
% G = c2d(G, 0.004, 'zoh');
% 
% qsim_1 = lsim(G, qd1_1, t1_1);
% 
% plot(t1_1(1:50:end), qd1_1(1:50:end), '-.r*', t1_1(1:50:end), qsim_1(1:50:end), '--mo', t1_1(1:50:end), q1_1(1:50:end));
% %plot(t1_1, qd1_1, '-.r*', t1_1, qsim_1, '--mo', t1_1, q1_1);
% xlabel('sec');ylabel('angle (deg)');
% legend('desired output (input)', 'simulated output of linear model', 'real output from RobotStudio');
%         
% alpha = 0.3;
% 
% qin = iterative_learning(G, qd1_1, qd1_1, 5000, alpha, t1_1);
% qin(1:40) = 0;
% 
% arr = 1:15;
% qin = [arr qin];
% qin(3752:3766) = [];
% qin(1:100) = 0;
% 

% data_o = qin(1:2000);
% data_i = qd1_1(1:2000);
% 
% data_in = zeros(20, 100);
% data_out = zeros(20, 100);
%  
% for i = 1:20
%     data_in(i, :) = data_i(100*i-99:100*i);
%     data_out(i, :) = data_o(100*i-99:100*i);
% end
% 
% 
% % data_in = zeros(6450, 100);
% % data_out = zeros(6450, 100);
% % 
% % for i = 1:6450
% %     data_in(i, :) = qd1_1(i:i+99);
% %     data_out(i, :) = qin(i:i+99);
% % end
