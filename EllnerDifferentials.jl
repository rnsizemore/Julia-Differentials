using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("OrdinaryDiffEq")
Pkg.add("Plots")

using DifferentialEquations, Plots

# constants
# rate amp kill
c = 0.1
# carrying capaticy
K = 1000
# rate protease kill
h = 0.05
# max growth rate
r = 0.5
# portion of amp dying (should be close to 0)
δ = 0.02
# f(B) things
Q = 10
S = 500
# protease production
g = 0.05
# protease degradation
x = 0.1

function bacteriaThingIdkLol(du, u, p, t)
    du[1] = r*u[1]*(1-u[1]/K)-c*u[2]*u[1]
    du[2] = (Q*u[1])/(S + u[1]) - δ*u[2] - h*u[2]*u[3] - c*u[2]*u[1]
    du[3] = g * u[1] - x * u[3]
end
# formulas
# dB = r*B*(1-B/K)-c*A*B
# dA = (Q*B)/(S + B) - δ*A - h*A*R - c*A*B
# dR = gB - xR

u0 = [1.0; 10.0; 1.0]
tspan = (0.0, 20)
prob = ODEProblem(bacteriaThingIdkLol, u0, tspan)
sol = solve(prob)

plot(sol, show = true)
readline()