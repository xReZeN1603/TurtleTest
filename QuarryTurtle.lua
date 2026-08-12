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

