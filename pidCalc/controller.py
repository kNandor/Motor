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


Hd_F=sympy.collect(sympy.cancel(kd/(Tf+DF_F)),z)
print("Hd_F")
print(Hd_F)

Hd_B=sympy.collect(sympy.cancel(kd/(Tf+DF_B)),z)
print("Hd_B")
print(Hd_B)

Hd_T=sympy.collect(sympy.cancel(kd/(Tf+DF_T)),z)
print("Hd_T")
print(Hd_T)


Hi_F=sympy.collect(sympy.cancel(ki*IF_F),z)
print("Hi_F")
print(Hi_F)

Hi_B=sympy.collect(sympy.cancel(ki*IF_B),z)
print("Hi_B")
print(Hi_B)

Hi_T=sympy.collect(sympy.cancel(ki*IF_T),z)
print("Hi_T")
print(Hi_T)


print('Forward-Euler')
print(CPID_F)
print('Backward-Euler')
print(CPID_B)
print('Trapezoidal-Euler')
print(CPID_T)