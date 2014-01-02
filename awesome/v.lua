
  local fd = io.popen("amixer sget Master")
  local status = fd:read("*all")
  fd:close()

  print(status) 
  print("#########")
  print(string.match(status, "(%d?%d?%d)%%"))

  local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
  -- volume = string.format("% 3d", volume)

  status = string.match(status, "%[(o[^%]]*)%]")


  print (volume)
