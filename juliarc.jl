push!(LOAD_PATH, pwd())

atreplinit() do repl
    try
        @eval using OhMyREPL
        @eval enable_autocomplete_brackets(false)
    catch err
        @warn "Could not load OhMyREPL." err
    end

    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        @warn "Could not load Revise."
    end

    if isfile("init.jl")
      @eval initfile = joinpath(pwd(),"init.jl")
      @warn "Loading " * initfile
      @async include(initfile)
    end
end


ENV["PYTHON"]="/usr/local/bin/python3"
