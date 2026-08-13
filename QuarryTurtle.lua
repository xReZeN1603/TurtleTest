-- wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/QuarryTurtle.lua qturtle
-- START:
-- xmine TIEFE LÄNGE BREITE
--
-- Beispiel:
-- xmine 20 50 9
--
-- Chest steht direkt hinter der Turtle.

local args = {...}

local depth = tonumber(args[1])
local length = tonumber(args[2])
local width = tonumber(args[3])

--Wartet bis abgebaut ist, faehrt 1 vor
local function digMove()
    turtle.dig()
    sleep(0.3)
    turtle.digDown()
    sleep(0.3)

    while not turtle.forward() do
        turtle.dig()
        sleep(0.3)
        turtle.digDown()
        sleep(0.3)
    end

end



-- VORBEREITUNG

for k = 1, depth do

  turtle.digDown()
  sleep(0.3)
  turtle.down()
  sleep(0.3)


  for i = 1, length do

    digMove()

  end

----<<<<<Breite
  for j = 1, width / 2 do

    turtle.turnRight()
    digMove()
    turtle.turnRight()

    for i = 1, length do 

      digMove()
      sleep(0.3)

    end


    turtle.turnLeft()
    sleep(0.3)
    digMove()
    sleep(0.3)
    turtle.turnLeft()
    sleep(0.3)

    for i = 1, length do

      digMove()
      sleep(0.3)

    end
  
  end

  turtle.turnLeft()
  sleep(0.3)

  for j = 1, width * 2 do

    turtle.forward()
    sleep(0.3)

  end

  turtle.turnLeft()

  for i = 1, length do

    turtle.forward()
    sleep(0.3)

  end


-- FLÄCHE WEG, STEHT VOR KISTE

  turtle.turnLeft()
  sleep(0.3)
  turtle.turnLeft()

end























