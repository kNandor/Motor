import sympy 


z=sympy.symbols('z')
kp,ki,kd=sympy.symbols('kp ki kd')
Ts,Tf=sympy.symbols('Ts Tf')
IF=sympy.symbols('IF')
DF=sympy.symbols('DF')

IF_F=Ts/(z-1)
DF_F=Ts/(z-1)
CPID_F=sympy.collect(sympy.cancel(kp+ki*IF_F+kd/(Tf+DF_F)),z)

IF_B=Ts*z/(z-1)
DF_B=Ts*z/(z-1)
CPID_B=sympy.collect(sympy.cancel(kp+ki*IF_B+kd/(Tf+DF_B)),z)

IF_T=Ts*(z+1)/2/(z-1)
DF_T=Ts*(z+1)/2/(z-1)
CPID_T=sympy.collect(sympy.cancel(kp+ki*IF_T+kd/(Tf+DF_T)),z)

print('Forward-Euler')
print(CPID_F)
print('Backward-Euler')
print(CPID_B)
print('Trapezoidal-Euler')
print(CPID_T)