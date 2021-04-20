push!(LOAD_PATH, pwd())

try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end

atreplinit() do repl
    try
        @eval using OhMyREPL
        @eval enable_autocomplete_brackets(false)
    catch err
        @warn "Could not load OhMyREPL." err
    end


    try
        @eval begin
            import REPL
            REPL.GlobalOptions.auto_indent = false
            REPL.LineEdit.options(s::REPL.LineEdit.PromptState) = REPL.GlobalOptions
        end
    catch err
        @warn "Disabling auto_indent: " err
    end

    if isfile("init.jl")
        @eval initfile = joinpath(pwd(),"init.jl")
        @warn "Loading " * initfile
        @eval include(initfile)
    end
end


ENV["PYTHON"]="/usr/local/bin/python3"
