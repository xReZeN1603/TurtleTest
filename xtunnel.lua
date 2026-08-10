--DOWNLOAD IN TURTLE: wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/xtunnel.lua xtunnel
--START WITH: xtunnel LENGTH

local args = {...}
local length = tonumber(args[1])
local count = 1

--Wartet bis abgebaut ist, faehrt 1 vor
local function digMove()
    turtle.dig()
    sleep(0.3)

    while not turtle.forward() do
        turtle.dig()
        sleep(0.3)
    end

    sleep(0.3)
end

--Oben/Unten abbauen
local function digUpDown()
    turtle.digUp()
    sleep(0.3)
    turtle.digDown()
    sleep(0.3)
end



if not length then
    print("Benutzung: " .. shell.getRunningProgram() .. " <Länge>")
    return
end

--Einleitung, faehrt vor und zerstoert 4 Bloecke nach rechts und 4 Bloecke nach links
print("Beginne Tunnel")
print("Durchlauf: 1" " / " .. length)
sleep(0.3)

digMove()
turtle.digUp()
sleep(0.3)
turtle.up()
sleep(0.3)
turtle.digUp()
sleep(0.3)

turtle.turnRight()
sleep(0.3)
for j = 1, 4 do
    digMove()
    digUpDown()
end

turtle.turnLeft()
sleep(0.3)
turtle.turnLeft()
sleep(0.3)

for j = 1, 4 do
    turtle.forward()
    sleep(0.3)
end

for j = 1, 4 do
    digMove()
    digUpDown()
end

print("Vorbereitung abgeschlossen, beginne Tunnel")

--Wiederholungen im Schlangenmuster LENGTH
for i = 1, (length -1) / 2 do --LAENGE CHECKEN!!

    count = count + 1
    print("Durchlauf: " .. count .. " / " .. length)

    turtle.turnRight()
    sleep(0.3)
    digMove()
    digUpDown()
    turtle.turnRight()
    sleep(0.3)

    for j = 1, 8 do
        digMove()
        digUpDown()
    end

    count = count + 1
    print("Durchlauf: " .. count .. " / " .. length)

    turtle.turnLeft()
    sleep(0.3)
    digMove()
    digUpDown()
    turtle.turnLeft()
    sleep(0.3)

    for j = 1, 8 do
        digMove()
        digUpDown()
    end

--Alle 10 Durchlaeufe Inventar leeren
    if count % 2 == 0 or count == length then
        
        print(" " .. count .. " Durchlaeufe erreicht!")
        print("Inventar wird geleert.")
        
--!!!!Rueckweg zur Chest!!!!
        turtle.turnRight()
        sleep(0.3)
        turtle.turnRight()
        sleep(0.3)

        for j = 1, 4 do
            turtle.forward()
            sleep(0.3)
        end

        turtle.turnRight()
        sleep(0.3)

        for j = 1, i * 2 do
            turtle.forward()
            sleep(0.3)
        end

        turtle.down()
        sleep(0.3)
        turtle.forward()
        sleep(0.3)
--
    --Items abladen
        for slot = 1, 16 do 
            turtle.select(slot)
            turtle.drop()
            sleep(0.3)
        end

        turtle.select(1)
        print("Inventar geleert.")

    --Zurueck, wenn durchlaeufe uebrig
        if count < length then

            turtle.turnLeft()
            sleep(0.3)
            turtle.turnLeft()
            sleep(0.3)
            turtle.up()
            sleep(0.3)
            turtle.forward()
            sleep(0.3)

            for j = 1, i * 2 do
                turtle.forward()
                sleep(0.3)
            end

            turtle.turnLeft()
            sleep(0.3)

            for j = 1, 4 do
                turtle.forward()
                sleep(0.3)
            end
        --Bei Chest bleiben, wenn keine durchlaeufe mehr
        else
            
            print("Tunnel fertig!")
            
        end

        print("Rueckweg abgeschlossen.")
        
    end
    
end

print("Fertig!")
