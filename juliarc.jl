push!(LOAD_PATH, pwd())

atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        @warn "Could not load Revise."
    end

    if isfile("init.jl")
      @warn "Loading ./init.jl"
      @async include(joinpath(pwd(),"init.jl"))
    end
end

try
    @eval using OhMyREPL
    enable_autocomplete_brackets(false)
catch err
    @warn "Could not load OhMyREPL."
end


ENV["PYTHON"]="/usr/local/bin/python3"
