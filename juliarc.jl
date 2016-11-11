# isinteractive() test not working?
# ENV["DISPLAY"]=":0.1"
if isfile("init.jl")
  include(joinpath(pwd(),"init.jl"))
end

if isinteractive()
  println("Interactive!")
  # ENV["DISPLAY"]=":0.1"
  if isfile("init.jl")
    require("init.jl")
  end
end


