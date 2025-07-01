%%40026085 Mohammad Hossein Lellahi
Pt = 105e3;    
Tt = 300;       
gamma = 1.4;    
R = 287;          
Av = 0.00113;   
P_ratio = (2/(gamma+1))^(gamma/(gamma-1)); 
P_critical = 105e3 * P_ratio; 

P_upstream = linspace(40e3, 105e3, 500);
Vt = zeros(size(P_upstream));
m_dot = zeros(size(P_upstream));
flow_regime = strings(size(P_upstream));
for i = 1:length(P_upstream)
    P = P_upstream(i);
    
    if P <= P_critical
        %%Sonic
        M = 1;
        Vt(i) = sqrt(gamma * R * Tt); 
        T = Tt * (2/(gamma+1));      
        rho = P_critical / (R * T); 
        m_dot(i) = rho * Av * Vt(i);
        flow_regime(i) = "Sonic";
    else
        %%Subsonic
        P_ratio = P / Pt;
        M = sqrt ((2/(gamma-1)) * ((P_ratio)^(-(gamma-1)/gamma) - 1));
        Vt(i) = M * sqrt(gamma * R * Tt);
        T = Tt / (1 + (gamma-1)/2 * M^2);
        rho = P / (R * T);
        m_dot(i) = rho * Av * Vt(i);
        flow_regime(i) = "Subsonic";
    end
end
figure;

subplot(2,1,1);
plot(P_upstream/1e3, Vt, 'b', 'LineWidth', 2);
hold on;
xline(P_critical/1e3, '--r', 'Critical Pressure (55.4 kPa)', 'LabelVerticalAlignment', 'middle');
xlabel('Upstream Pressure (kPa)');
ylabel('Flow Velocity V_t (m/s)');
title('Flow Velocity vs. Upstream Pressure');
grid on;
legend('Flow Velocity', 'Location', 'northeast');

subplot(2,1,2);
plot(P_upstream/1e3, m_dot, 'k', 'LineWidth', 2);
hold on;
xline(P_critical/1e3, '--r', 'Critical Pressure (55.4 kPa)', 'LabelVerticalAlignment', 'middle');
xlabel('Upstream Pressure (kPa)');
ylabel('Mass Flow Rate ṁ (kg/s)');
title('Mass Flow Rate vs. Upstream Pressure');
grid on;
legend('Mass Flow Rate', 'Location', 'northeast');
fprintf('Sonic flow region: P ≤ %.2f kPa\n', P_critical/1e3);
fprintf('Subsonic flow region: P > %.2f kPa\n', P_critical/1e3);