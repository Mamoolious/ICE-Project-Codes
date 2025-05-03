#Diesel Cycle Calculator
#Mohammad Hossein Lellahi 40026085

r = 14
P1 = 100
T1 = 300
Q_in = 1316.8
gamma = 1.4
cp = 1.005

T2 = T1 * (r ** (gamma - 1))
P2 = P1 * (r ** gamma)
T3 = T2 + (Q_in / cp)
rc = T3 / T2
V3 = rc
T4 = T3 * (rc ** (1 - gamma))
P4 = P2 * (rc ** -gamma)
W_net = Q_in - (cp * (T4 - T1))
eta = W_net / Q_in

print("Diesel Cycle Results:")
print(f"Point 2: P2 = {P2:.1f} kPa, T2 = {T2:.1f} K")
print(f"Point 3: P3 = {P2:.1f} kPa, T3 = {T3:.1f} K, Cut-off ratio = {rc:.2f}")
print(f"Point 4: P4 = {P4:.1f} kPa, T4 = {T4:.1f} K")
print(f"Thermal efficiency = {eta*100:.1f}%")