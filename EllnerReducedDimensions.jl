using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")

using DifferentialEquations, Plots

# constants
# rate amp kill
c = 0.2
# carrying capaticy
K = 6
# amp degradation (should be close to 0)
δ = 0.05
# max amp production
Q = 5.8
# protease production
g = 0.45
# protease degradation
x = 1

function bacteriaThingIdkLol(du, u, p, t)
    du[1] = u[1]*(1-u[1]/K)-c*u[2]*u[1]
    du[2] = (Q*u[1])/(1 + u[1]) - δ*u[2] - (c + g/x)*u[2]*u[1]
end
# formulas
# dB = B*(1-B/K)-c*A*B
# dA = (Q*B)/(1 + B) - δ*A - (c+m)*A*B     m = g/x

u0 = [3.8; 4]
tspan = (0.0, 20)
prob = ODEProblem(bacteriaThingIdkLol, u0, tspan)
sol = solve(prob)

plot(sol, show = true)
readline()