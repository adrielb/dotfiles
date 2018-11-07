push!(LOAD_PATH, pwd())
try
    @eval using Revise
catch
end
