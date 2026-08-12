wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/QuarryTurtle.lua qturtle
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

local x = 0
local y = 0
local z = 0

-- Richtung:
-- 0 = Vorne
-- 1 = Rechts
-- 2 = Hinten
-- 3 = Links
local direction = 0

local rows = 0


--------------------------------------------------
-- HILFSFUNKTIONEN
--------------------------------------------------

local function turnRight()
    turtle.turnRight()
    sleep(0.3)
    direction = (direction + 1) % 4
end

local function turnLeft()
    turtle.turnLeft()
    sleep(0.3)
    direction = (direction + 3) % 4
end


local function face(target)
    while direction ~= target do

        local rightDistance = (target - direction) % 4
        local leftDistance = (direction - target) % 4

        if rightDistance <= leftDistance then
            turnRight()
        else
            turnLeft()
        end

    end
end


--------------------------------------------------
-- VORWÄRTS ABBauen
--------------------------------------------------

local function digMove()

    turtle.dig()
    sleep(0.3)

    while not turtle.forward() do

        turtle.dig()
        turtle.attack()

        sleep(0.3)

    end

    -- Koordinaten aktualisieren

    if direction == 0 then
        z = z + 1

    elseif direction == 1 then
        x = x + 1

    elseif direction == 2 then
        z = z - 1

    elseif direction == 3 then
        x = x - 1
    end

end


--------------------------------------------------
-- FREI VORWÄRTS
-- Für bereits bekannte freie Wege
--------------------------------------------------

local function moveForward()

    while not turtle.forward() do
        turtle.dig()
        turtle.attack()
        sleep(0.3)
    end

    if direction == 0 then
        z = z + 1

    elseif direction == 1 then
        x = x + 1

    elseif direction == 2 then
        z = z - 1

    elseif direction == 3 then
        x = x - 1
    end

    sleep(0.3)
end


--------------------------------------------------
-- NACH UNTEN
--------------------------------------------------

local function moveDown()

    while not turtle.down() do
        turtle.digDown()
        turtle.attackDown()
        sleep(0.3)
    end

    y = y - 1

    sleep(0.3)
end


--------------------------------------------------
-- NACH OBEN
--------------------------------------------------

local function moveUp()

    while not turtle.up() do
        turtle.digUp()
        turtle.attackUp()
        sleep(0.3)
    end

    y = y + 1

    sleep(0.3)
end


--------------------------------------------------
-- ZU EINER POSITION FAHREN
--------------------------------------------------

local function goTo(targetX, targetY, targetZ)

    -- X korrigieren

    if x < targetX then

        face(1)

        while x < targetX do
            moveForward()
        end

    elseif x > targetX then

        face(3)

        while x > targetX do
            moveForward()
        end

    end


    -- Z korrigieren

    if z < targetZ then

        face(0)

        while z < targetZ do
            moveForward()
        end

    elseif z > targetZ then

        face(2)

        while z > targetZ do
            moveForward()
        end

    end


    -- Y korrigieren

    while y < targetY do
        moveUp()
    end

    while y > targetY do
        moveDown()
    end

end


--------------------------------------------------
-- CHEST
--------------------------------------------------

local function unloadChest()

    print("Zurueck zur Chest.")

    -- Aktuelle Arbeitsposition merken

    local workX = x
    local workY = y
    local workZ = z
    local workDirection = direction


    --------------------------------------------------
    -- Zur Schachtposition
    --------------------------------------------------

    goTo(0, y, 0)


    --------------------------------------------------
    -- Zur Oberfläche
    --------------------------------------------------

    while y < 0 do
        moveUp()
    end


    --------------------------------------------------
    -- Einen Block hinter die Startposition
    --------------------------------------------------

    face(2)
    moveForward()


    --------------------------------------------------
    -- Items abladen
    --------------------------------------------------

    print("Inventar wird geleert.")

    for slot = 1, 16 do

        turtle.select(slot)
        turtle.drop()

        sleep(0.3)

    end

    turtle.select(1)

    print("Inventar geleert.")


    --------------------------------------------------
    -- Wenn noch Arbeit übrig ist:
    -- zurück zur Arbeitsposition
    --------------------------------------------------

    if rows < width * depth then

        print("Zurueck zur Arbeitsposition.")

        -- Wieder zum Startpunkt

        goTo(0, 0, 0)


        -- Zur alten Tiefe

        goTo(0, workY, 0)


        -- Zur alten Position

        goTo(workX, workY, workZ)


        -- Ursprüngliche Blickrichtung wiederherstellen

        face(workDirection)

        print("Arbeitsposition erreicht.")

    else

        print("Alle Arbeiten abgeschlossen.")
        print("Turtle bleibt bei der Chest.")

    end

end


--------------------------------------------------
-- ARGUMENTE PRÜFEN
--------------------------------------------------

if not depth or not length or not width then

    print("Benutzung:")
    print("xmine TIEFE LAENGE BREITE")
    print("")
    print("Beispiel:")
    print("xmine 20 50 9")

    return

end


if depth < 1 or length < 1 or width < 1 then

    print("Alle Werte muessen mindestens 1 sein.")

    return

end


--------------------------------------------------
-- START
--------------------------------------------------

print("================================")
print("3D Mining Turtle")
print("================================")

print("Tiefe:  " .. depth)
print("Laenge: " .. length)
print("Breite: " .. width)

sleep(1)


--------------------------------------------------
-- VORBEREITUNG:
-- Vertikalen Rueckweg zur Chest freimachen
--------------------------------------------------

print("Bereite Rueckweg vor.")

for i = 1, depth do

    turtle.digDown()
    sleep(0.3)

    moveDown()

end


-- Wieder nach oben

while y < 0 do
    moveUp()
end


-- Wieder Startposition

print("Vorbereitung abgeschlossen.")


--------------------------------------------------
-- HAUPTSCHLEIFE
--------------------------------------------------

for layer = 1, depth do

    print("")
    print("================================")
    print("Ebene " .. layer .. " / " .. depth)
    print("================================")


    --------------------------------------------------
    -- Jede Reihe
    --------------------------------------------------

    for row = 1, width do

        print("Reihe " .. row .. " / " .. width)


        --------------------------------------------------
        -- Gerade Reihe:
        -- nach vorne
        --------------------------------------------------

        if row % 2 == 1 then

            face(0)

            for block = 1, length do

                digMove()

            end


        --------------------------------------------------
        -- Ungerade Reihe:
        -- nach hinten
        --------------------------------------------------

        else

            face(2)

            for block = 1, length do

                digMove()

            end

        end


        rows = rows + 1

        print("Reihen insgesamt: " .. rows)


        --------------------------------------------------
        -- Alle 10 Reihen zur Chest
        --------------------------------------------------

        if rows % 10 == 0 then

            print("")
            print("10 Reihen erreicht.")
            unloadChest()

        end


        --------------------------------------------------
        -- Nächste Reihe
        --------------------------------------------------

        if row < width then

            -- Immer eine Reihe nach rechts

            face(1)
            moveForward()

        end

    end


    --------------------------------------------------
    -- Nächste Tiefenebene
    --------------------------------------------------

    if layer < depth then

        print("Wechsle auf naechste Tiefenebene.")

        moveDown()


        --------------------------------------------------
        -- Zurueck zur linken Seite
        --------------------------------------------------

        goTo(0, y, 0)

    end

end


--------------------------------------------------
-- LETZTE INVENTARLADUNG
--------------------------------------------------

print("")
print("Abbau abgeschlossen.")

if rows % 10 ~= 0 then

    print("Letzte Items werden abgeladen.")

    unloadChest()

else

    print("Inventar wurde bereits bei der letzten 10er-Reihe geleert.")

end


print("")
print("================================")
print("FERTIG!")
print("================================")
