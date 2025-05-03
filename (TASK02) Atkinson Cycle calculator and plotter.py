#Atkinson Cycle Calculations
#Mohammad Hossein Lellahi 40026085

import numpy as np
import matplotlib.pyplot as plt

# Parameters
r = 14
e = 17
T1 = 300
P1 = 100
gamma = 1.4
cv = 0.718

V1 = 1.0
V2 = V1 / r
T2 = T1 * r ** (gamma - 1)
P2 = P1 * r ** gamma
V_comp = np.linspace(V1, V2, 100)
P_comp = P1 * (V1 / V_comp) ** gamma
T3 = T2 * (e / r) ** gamma
P3 = P2 * (T3 / T2)
V_heat = np.array([V2, V2])
P_heat = np.array([P2, P3])
V4 = V1 * e / r 
T4 = T3 * (V2 / V4) ** (gamma - 1)
P4 = P3 * (V2 / V4) ** gamma
V_exp = np.linspace(V2, V4, 100)
P_exp = P3 * (V2 / V_exp) ** gamma
P_reject = np.array([P4, P1])
V_reject = np.array([V4, V1])

plt.figure(figsize=(10, 6))
plt.plot(V_comp, P_comp, 'b-', label='1→2: Compression')
plt.plot(V_heat, P_heat, 'r-', label='2→3: Heat Addition')
plt.plot(V_exp, P_exp, 'g-', label='3→4: Expansion')
plt.plot(V_reject, P_reject, 'k-', label='4→1: Heat Rejection')
plt.xlabel('Volume (V)')
plt.ylabel('Pressure (P) [kPa]')
plt.title('Atkinson Cycle P-V Diagram (r=14, e=17)')
plt.legend()
plt.grid()
plt.show()

Q_in = cv * (T3 - T2)
eta = 1 - (T4 - T1) / (T3 - T2)
W_net = eta * Q_in

print(f"Atkinson Cycle Results:")
print(f"Q_in = {Q_in:.1f} kJ/kg")
print(f"Work Output = {W_net:.1f} kJ/kg")
print(f"Efficiency = {eta * 100:.1f}%")