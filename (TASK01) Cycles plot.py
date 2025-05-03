#Cycles plotter
#Mohammad Hossein Lellahi 40026085

import numpy as np
import matplotlib.pyplot as plt

gamma = 1.4
r = 14
P1 = 100
T1 = 300
cv = 0.718
cp = 1.005
rp_dual = 1.7

V1 = 1.0
V2 = V1 / r
T2 = T1 * (r ** (gamma - 1))
P2 = P1 * (r ** gamma)

V_comp = np.linspace(V1, V2, 100)
P_comp = P1 * (V1 / V_comp) ** gamma
#Otto cycle
Q_in_otto = 1171.8
T3_otto = T2 + Q_in_otto / cv
P3_otto = P2 * (T3_otto / T2)
V_otto_heat = np.array([V2, V2])
P_otto_heat = np.array([P2, P3_otto])
V_otto_exp = np.linspace(V2, V1, 100)
P_otto_exp = P3_otto * (V2 / V_otto_exp) ** gamma
P4_otto = P3_otto * (V2 / V1) ** gamma
#Diesel cycle
Q_in_diesel = 1316.8
T3_diesel = T2 + Q_in_diesel / cp
rc_diesel = T3_diesel / T2
V3_diesel = V2 * rc_diesel
P4_diesel = P2 * (V3_diesel / V1) ** gamma
V_diesel_heat = np.linspace(V2, V3_diesel, 100)
P_diesel_heat = np.ones_like(V_diesel_heat) * P2
V_diesel_exp = np.linspace(V3_diesel, V1, 100)
P_diesel_exp = P2 * (V3_diesel / V_diesel_exp) ** gamma
#Dual Cycle
T3_dual = T2 * rp_dual
P3_dual = P2 * rp_dual
rc_dual = 1 + 0.05 * (r - 1)
Q_in_dual_cv = cv * (T3_dual - T2)
Q_in_dual_cp = cp * (T3_dual * rc_dual - T3_dual)
V4_dual = V2 * rc_dual
P5_dual = P3_dual * (V4_dual / V1) ** gamma
V_dual_heat1 = np.array([V2, V2])
P_dual_heat1 = np.array([P2, P3_dual])
V_dual_heat2 = np.linspace(V2, V4_dual, 100)
P_dual_heat2 = np.ones_like(V_dual_heat2) * P3_dual
V_dual_exp = np.linspace(V4_dual, V1, 100)
P_dual_exp = P3_dual * (V4_dual / V_dual_exp) ** gamma

plt.figure(figsize=(12, 8))
plt.plot(V_comp, P_comp, 'r-', label='Otto Cycle')
plt.plot([V1, V1], [P1, P4_otto], 'r-')
plt.plot(V_comp, P_comp, 'b--', label='Diesel Cycle')
plt.plot([V1, V1], [P1, P4_diesel], 'b--')
plt.plot(V_comp, P_comp, 'g-.', label='Dual Cycle')
plt.plot([V1, V1], [P1, P5_dual], 'g-.')
plt.xlabel('Volume (V)', fontsize=12)
plt.ylabel('Pressure (P) [kPa]', fontsize=12)
plt.title('P-V Diagram: Otto, Diesel, and Dual Cycles (r=14)', fontsize=14)
plt.legend(loc='upper right')
plt.grid(True, linestyle='--', alpha=0.7)
plt.xlim(0, 1.1 * V1)
plt.ylim(0, 1.2 * max(P3_otto, P3_dual, P2))
plt.tight_layout()
plt.show()
