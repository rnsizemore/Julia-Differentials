using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("Plots")

using DifferentialEquations, Plots

a = 0.05
c = 5

function fluSpread(du, u, p, t)
    du[1] = u[1]+a*c*u[1]*u[2]
    du[2] = u[2]-a*c*u[1]*u[2]
end

u0 = [5/9; 4/9]
tspan = (0, 10)

prob = DiscreteProblem(fluSpread, u0, tspan)
sol = solve(prob)

plot(sol, show = true)
readline()