# isinteractive() test not working?
ENV["DISPLAY"]=":0.2"

if isinteractive()
  println("INteractive!")
  ENV["DISPLAY"]=":0.2"
  if isfile("init.jl")
    require("init.jl")
  end
end

