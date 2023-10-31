### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try
            Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value
        catch
            b -> missing
        end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 2cabd8c0-dd60-11ea-20ba-0b257a3f3851
begin
    import Pkg
    Pkg.add([
        Pkg.PackageSpec(
            url="https://github.com/mmikhasenko/ThreeBodyDecay.jl")])
    using Plots
    using ThreeBodyDecay
end

# ╔═╡ 7ee92c62-dd64-11ea-1f2f-7f318841e883
theme(:wong, bottom_margin=3 * Plots.PlotMeasures.mm)

# ╔═╡ 31ebc880-dd66-11ea-1f06-57c94a4ef327
md"""
The momenta in the decay particle rest frame can be calculated from the kinematic invariants ``\{\sigma_i\}``
"""

# ╔═╡ 1a320280-dd62-11ea-1711-aff81641c932
begin
    p1mod(σs, ms) = sqrt(Kallen(ms.m0^2, ms.m1^2, σs.σ1)) / (2 * ms.m0)
    p2mod(σs, ms) = sqrt(Kallen(ms.m0^2, ms.m2^2, σs.σ1)) / (2 * ms.m0)
    p3mod(σs, ms) = sqrt(Kallen(ms.m0^2, ms.m3^2, σs.σ1)) / (2 * ms.m0)
end;

# ╔═╡ 4a366860-dd60-11ea-029e-cd5fd8e34fa3
ms = ThreeBodyMasses(m0=1.3, m1=0.3, m2=0.3, m3=0.3)

# ╔═╡ 9fb1774e-dd63-11ea-0331-e500fc6137c2
md"""

``\sigma_1``: $(@bind r1 html"<input type='range' min=0 max=1 step=0.01>")
``\sigma_3``: $(@bind r2 html"<input type='range' min=0 max=1 step=0.01>")
"""

# ╔═╡ 1c1a18e0-dd61-11ea-1c9b-c3c67fb6e5fd
begin
    σ1 = lims1(ms)[1] + r1 * (lims1(ms)[2] - lims1(ms)[1])
    σ3 = lims3(ms)[1] + r2 * (lims3(ms)[2] - lims3(ms)[1])
    Invariants(ms, σ1=σ1, σ3=σ3)
end

# ╔═╡ 138ebfee-dd61-11ea-3e0a-a92ab7d39d64
let
    # if masses unphysical, set the point to the middle
    σs = Invariants(ms, σ1=σ1, σ3=σ3)
    (σs, α) = Kibble(σs, ms) < 0 ? (σs, 1.0) : (randomPoint(ms), 0.0)
    # two pane in the plot
    plot(layout=grid(1, 2), size=(700, 250))
    plot!(sp=2, xaxis=false, yaxis=false, aspect_ratio=1)
    #
    # plot vec p1
    _p1mod = p1mod(σs, ms)
    plot!(sp=2, [0, -_p1mod], [0, 0], lab="", arrow=true, lw=2, α=α)
    # plot vec p2
    _p2mod = p2mod(σs, ms)
    _cosθh12 = cosθhat12(σs, ms^2)
    _sinθh12 = sqrt(1 - _cosθh12^2)
    plot!(sp=2, [0, -_p2mod * _cosθh12], [0, _p2mod * _sinθh12], lab="", arrow=true, lw=2, α=α, seriescolor=2)
    # plot vec p3
    _p3mod = p3mod(σs, ms)
    _cosθh31 = cosθhat31(σs, ms^2)
    _sinθh31 = sqrt(1 - _cosθh31^2)
    plot!(sp=2, [0, -_p3mod * _cosθh31], [0, -_p3mod * _sinθh31], lab="", arrow=true, lw=2, α=α, seriescolor=3)
    # add a marker in the dalitz
    scatter!(sp=1, [σ1], [σ3], lab="", ms=10,
        xlim=lims1(ms),
        ylim=lims2(ms))
    # draw the border
    σ1v = range(lims1(ms)..., length=100)
    σ3v⁺ = [σ3of1(1, σ1, ms^2) for σ1 in σ1v]
    σ3v⁻ = [σ3of1(-1, σ1, ms^2) for σ1 in σ1v]
    plot!(sp=1, σ1v, [σ3v⁺ σ3v⁻], lab="", l=(:gray), xlab="σ₁", ylab="σ₃")
end

# ╔═╡ Cell order:
# ╠═2cabd8c0-dd60-11ea-20ba-0b257a3f3851
# ╠═7ee92c62-dd64-11ea-1f2f-7f318841e883
# ╟─31ebc880-dd66-11ea-1f06-57c94a4ef327
# ╠═1a320280-dd62-11ea-1711-aff81641c932
# ╠═4a366860-dd60-11ea-029e-cd5fd8e34fa3
# ╟─9fb1774e-dd63-11ea-0331-e500fc6137c2
# ╟─1c1a18e0-dd61-11ea-1c9b-c3c67fb6e5fd
# ╟─138ebfee-dd61-11ea-3e0a-a92ab7d39d64
