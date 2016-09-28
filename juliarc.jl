# isinteractive() test not working?
ENV["DISPLAY"]=":0.1"

if isinteractive()
  println("Interactive!")
  ENV["DISPLAY"]=":0.1"
  if isfile("init.jl")
    require("init.jl")
  end
end

