function qin = iterative_learning(G, qi, qd, n, alpha, t)

% iterative learning control to reduce the tracking error
% G is the system
% qi is the initial input
% qd is the desired trajectory for tracking
% n is the number of iterations
% alpha is the learning rate
% t is the time field

qin = qi;

for i = 1:n
    
    qsim_1 = lsim(G,qin,t);
    qsim_1 = qsim_1';
    if i == n 
        figure(i)
        %%%%%%%%%%%%%%%%%
        plot(t,qd,'-',t, qin, '-.', t,qsim_1,'--');
        xlabel('sec');ylabel('angle (deg)');
        legend('desired output', 'input', 'simulated output');
    end
    
    norm(qd - qsim_1)
    
    error = qsim_1 - qd;
    
    error_flip = flip(error);
    qsim_1_2 = lsim(G,error_flip,t);
    qsim_1_2 = qsim_1_2';
    sim_flip = flip(qsim_1_2);
    
    qin = qin - alpha*sim_flip;
end

%%%%%%