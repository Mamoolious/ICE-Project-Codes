#dual cycle calculator
#Mohammad Hossein Lellahi 40026085

gamma = 1.4
cv = 0.718
cp = 1.005
P1 = 100
T1 = 300
rp = 1.7

while True:
    try:
        r = float(input("Enter a compression ratio (r): "))
        if r <= 1:
            print("Compression ratio must be greater than 1. Please try again.")
            continue
        break
    except ValueError:
        print("Invalid input. Please enter a number.")

rc = 1 + 0.05 * (r - 1)
T2 = T1 * (r ** (gamma - 1))
P2 = P1 * (r ** gamma)
T3 = T2 * rp
P3 = P2 * rp
T4 = T3 * rc
Q_in = cv * (T3 - T2) + cp * (T4 - T3)
eta = 1 - (1 / (r ** (gamma - 1))) * ((rc ** gamma - 1) / (gamma * (rc - 1) + (rp - 1)))

print("\nDual Cycle Results:")
print(f"Compression ratio (r): {r:.2f}")
print(f"Cut-off ratio (rc): {rc:.3f}")
print(f"Max temperature (T4): {T4:.1f} K")
print(f"Heat input (Q_in): {Q_in:.1f} kJ/kg")
print(f"Thermal efficiency (η): {eta*100:.2f}%")

if T4 > 2500:
    print("\nWarning: Maximum temperature (T4) exceeds 2500 K!")
else:
    print("\nAll constraints satisfied.")