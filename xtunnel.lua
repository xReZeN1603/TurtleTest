--DOWNLOAD IN TURTLE: wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/xtunnel.lua xtunnel
--START WITH: xtunnel LENGTH

local args = {...}
local length = tonumber(args[1])


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
digMove()
digUpDown()

turtle.turnRight()
sleep(0.3)
for j = 1, 4 do
    digMove()
    digUpDown()
end

turtle.turnLeft()
sleep(0.3)
digMove()
digUpDown()
turtle.turnLeft()

for j = 1, 8 do
    digMove()
    digUpDown()
end

print("Länge erkannt: " .. length)

--Wiederholungen im Schlangenmuster LENGTH
for i = 1, length do

print("Durchlauf: " .. i .. " / " .. length)

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

end

print("Fertig!")
