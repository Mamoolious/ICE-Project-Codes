%40026085 Mohammad Hossein Lellahi
radius = 0.38;
fdr = 4.11;  
rpms = 2000:1000:6000;
ratios = struct('Gear1',3.45,'Gear2',1.94,'Gear3',1.37,'Gear4',1.03,'Gear5',0.78);

figure;
hold on;
colors = lines(length(fieldnames(ratios)));
gear_names = fieldnames(ratios);

for g = 1:length(gear_names)
    gear = gear_names{g};
    GR = ratios.(gear);
    speeds_kph = zeros(size(rpms));
    for j = 1:length(rpms)
        rpm = rpms(j);
        speed_mps = (pi * radius * rpm) / (GR * fdr * 60);
        speeds_kph(j) = speed_mps * 3.6;
    end
    plot(rpms,speeds_kph,'-o','LineWidth',2, ...
        'DisplayName',[gear],'Color',colors(g,:));
end
xlabel('Engine RPM');
ylabel('Vehicle Speed (km/h)');
title('Vehicle Speed vs Engine RPM by Gear');
grid on;
legend('Location', 'northwest');
hold off;
