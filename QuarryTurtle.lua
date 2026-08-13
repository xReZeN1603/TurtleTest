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

local Y = 0
local count = 0

--Wartet bis abgebaut ist, faehrt 1 vor
local function digMove()
    turtle.dig()
    sleep(0.1)
    turtle.digDown()
    sleep(0.1)

    while not turtle.forward() do
        turtle.dig()
        sleep(0.1)
        turtle.digDown()
        sleep(0.1)
    end

end

local function digMoveDown()
    turtle.digDown()
    sleep(0.1)

    while not turtle.down() do
        turtle.digDown()
        sleep(0.1)
    end
    
end

local function digMoveUp()
    turtle.digUp()
    sleep(0.1)

    while not turtle.up() do
        turtle.digUp()
        sleep(0.1)
    end

end


--ANFANG PROGRAMM
--<<<<<<<<<<<<<<<<<<<<<<<<<Tiefe

for k = 1, depth do

  digMoveDown()
  Y = Y + 1

    if count >= 1 then

        digMoveDown()
        Y = Y + 1
        
    end
    

  for i = 1, length do

    digMove()

  end

----<<<<<<<<<<<<<<<<<<<<<<<<Breite
    
  for j = 1, width / 2 do

    turtle.turnRight()
    sleep(0.1)
    digMove()
    sleep(0.1)
    turtle.turnRight()
    sleep(0.1)

    for i = 1, length do 

      digMove()
      sleep(0.1)

    end


    turtle.turnLeft()
    sleep(0.1)
    digMove()
    sleep(0.1)
    turtle.turnLeft()
    sleep(0.1)

    for i = 1, length do

      digMove()
      sleep(0.1)

    end

        turtle.digDown()
        sleep(0.1)
  
  end
    
--<<<<<<<<<<<<<<<<<<<<<<<<<<

    
--<<<<<<<<<<<<<<<<<<<<<<<<<<RUECKWEG

  count = count + 1  
  turtle.turnLeft()
  sleep(0.1)

  for j = 1, width * 2 do

    turtle.forward()
    sleep(0.1)

  end

    turtle.turnLeft()
    sleep(0.1)

  for i = 1, length do

    turtle.forward()
    sleep(0.1)

  end
    
-- FLÄCHE WEG, TURTLE STEHT VOR KISTE
    if count % 2 == 0 or count == depth then

        --<<<<<<RÜCKWEG ZUR CHEST

        for u = 1, Y do
            digMoveUp()
            sleep(0.1)
        end

        
--<<<<<<<ITEMS ABLADEN
        for slot = 1, 16 do
            turtle.select(slot)
            turtle.drop()
            sleep(0.1)
        end

        turtle.select(1)
        print("Inventar geleert.")

        for u = 1, Y do
          digMoveDown()
          sleep(0.1)
        end
        
    else

        print("Durchlauf: " ..count .. " / " .. depth)
        
    end

        
  turtle.turnLeft()
  sleep(0.1)
  turtle.turnLeft()

        
end























