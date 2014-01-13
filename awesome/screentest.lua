function newCounter ()
  local i = 0
  return function ()   -- anonymous function
    i = i + 1
    return i
  end
end

c1 = newCounter()
print( c1() )
print( c1() )

--for s = 1, 3 do
  --for v = 1, 4 do
    --awful.screen.focus( s )
    --print( "F" .. (s+v) )
  --end
--end

