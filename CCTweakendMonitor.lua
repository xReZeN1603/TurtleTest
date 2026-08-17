-- Download: wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/CCTweakendMonitor.lua m1

local m = peripheral.find("monitor")

m.setTextScale(1)

m.clear()

local w, h = m.getSize()

-- Obere Zeile
m.setCursorPos(1, 1)
m.write("+-------------------------+")

-- Mittlere Zeile
m.setCursorPos(1, math.floor(h / 2) + 1)

m.setTextColor(colors.white)
m.write("|        ")

m.setTextColor(colors.green)
m.write("Lagerraum")

m.setTextColor(colors.white)
m.write("        |")

-- Untere Zeile
m.setCursorPos(1, h)
m.write("+-------------------------+")
