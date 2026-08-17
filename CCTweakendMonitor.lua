-- Download: wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/CCTweakendMonitor.lua m1

local m = peripheral.find("monitor")

m.setTextScale(1)

m.clear()

local w, h = m.getSize()

-- Obere Zeile
m.setCursorPos(1, 1)
m.write("+---------------+")

-- Mittlere Zeile
m.setCursorPos(1, math.floor(h / 2))
m.write("         Lagerraum")

-- Untere Zeile
m.setCursorPos(1, h)
m.write("+---------------+")
