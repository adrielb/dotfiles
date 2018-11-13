# ENV["DISPLAY"]=":0.1"

atreplinit() do repl
    try
        @eval push!(LOAD_PATH, pwd())
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
        @eval using OhMyREPL
    catch
    end
    if isfile("init.jl")
      include(joinpath(pwd(),"init.jl"))
    end
end


ENV["PYTHON"]="/usr/local/bin/python3"
