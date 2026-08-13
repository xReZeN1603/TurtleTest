-- wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/QuarryTurtle.lua qturtle
-- START:
-- xmine TIEFE LÄNGE BREITE
--
-- Beispiel:
-- qturtle TIEFE x LAENGE x BREITE
--
-- Chest steht direkt hinter der Turtle.

local Y = 0
local count = 0

local trashItems = {
    ["minecraft:dirt"] = true,
    ["minecraft:grass_block"] = true,
    ["minecraft:cobblestone"] = true,
    ["minecraft:netherrack"] = true,
    ["minecraft:gravel"] = true,
    ["minecraft:sand"] = true,
    ["minecraft:granite"] = true,
    ["minecraft:diorite"] = true,
    ["minecraft:andesite"] = true,
    ["minecraft:tuff"] = true,
    ["minecraft:deepslate"] = true,
    ["minecraft:cobbled_deepslate"] = true,
}

local function emptyTrash()
    
    print("Pruefe Inventar")

    for slot = 1, 16 do

        local item = turtle.getItemDetail(slot)

        if item and trashItems[item.name] then

            print("Entferne " ..item.name)

            turtle.select(slot)
            turtle.dropDown()
            sleep(0.1)

        end

    end

    turtle.select(1)
    print("Muell entfernt")

end


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
print("QuarryTurtle: TIEFE x LAENGE x BREITE")
write("> ")

local input = read()

local depth, length, width = input:match("(%d+)%s+(%d+)%s+(%d+)")

depth = tonumber(depth)
length = tonumber(length)
width = tonumber(width)

if not depth or not length or not width then
    print("Fehlerhafte Eingabe!")
    print("Beispiel 100 10 10")
    return
end

print("")
print("Tiefe: " .. depth)
print("Laenge: " .. length)
print("Breite: " .. width)
sleep(0.5)


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

    --Trash Items wegschmeissen
    if count % 5 == 0 then

       emptyTrash()

    end
        
    
-- FLÄCHE WEG, TURTLE STEHT VOR KISTE und lagert Items
    if count % 20 == 0 or count == depth then

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























