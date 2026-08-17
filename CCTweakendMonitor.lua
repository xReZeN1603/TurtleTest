Download: wget https://raw.githubusercontent.com/xReZeN1603/TurtleTest/main/CCTweakendMonitor.lua m1

m=peripheral.find("monitor")
m.setTextScale(2)
m.clear()

local w,h=m.getSize()
local text="Lagerraum"
local x=math.floor((w-#text)/2)+1
local y=math.floor(h/2)

m.setTextColor(colors.white)

m.setCursorPos(x-1,y-1)
m.write("───────────")

m.setCursorPos(x-1,y)
m.write("│")

m.setCursorPos(x+ #text,y)
m.write("│")

m.setCursorPos(x-1,y+1)
m.write("───────────")

m.setTextColor(colors.lime)
m.setCursorPos(x,y)
m.write(text)
