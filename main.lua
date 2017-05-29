-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local widget = require('widget')

--local googleAnalytics = require( "plugin.googleAnalytics" )
local flurryAnalytics = require("plugin.flurry.analytics")

local function flurryListener(event)

    if (event.phase == "init") then -- Successful initialization
    print(event.provider)
    end
end

-- Initialize the Flurry plugin
flurryAnalytics.init(flurryListener, { apiKey = "8PRB6FZCTR6YVY93CG9S" })

-- Log an event
flurryAnalytics.logEvent("Menu selection", { location = "Main Menu", selection = "Multiplayer mode" })
--[[
-- Initialize Google Analytics
googleAnalytics.init( "ABC", "UA-85065633-1" )

-- Log event with Google Analytics
googleAnalytics.logEvent( "userAction", "button press", "menuItem", 2 )

googleAnalytics.logScreenName( "ABC menu" )
]]

print("flurry analytics are working...")


display.setStatusBar(display.HiddenStatusBar)
local _W, _H = display.actualContentWidth, display.actualContentHeight
local _CX, _CY = _W / 2, _H / 2

local rectLeft = display.newRect(_CX, 0, _W, _CY)
rectLeft.anchorY = 0
rectLeft:setFillColor(0.5, 0.1, 0.2, 1)

local pic = display.newImageRect("abc.png", _W, _CY)
pic.xScale, pic.yScale = 0.8, 0.8
pic.x, pic.y = _CX, _CY / 2
pic.anchorX, pic.anchorY = 0.5, 0.5

local pictureTable = { "apple.png", "ball.png", "cat.png", "dog.png", "elephant.png", "fish.png", "goat.png", "horse.png", "iron.png", "jungle.png", "kite.png", "lion.png", "monkey.png", "nest.png", "onion.png", "pen.png", "queen.png", "rose.png", "sun.png", "tree.png", "umbrella.png", "van.png", "watch.png", "xylophone.png", "yolk.png", "zebra.png" }

local rectLeft1 = display.newRect(_CX, _CY, _W, _CY)
rectLeft1.anchorY = 0
rectLeft1:setFillColor(0.8, 0.4, 0.2, 1)

--[[
local A =  display.newImageRect("letter_A.png",_W/4,_CY/4)
A.x,A.y=0,_CY
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_B.png",_W/4,_CY/4)
A.x,A.y=0+_W/4,_CY
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_C.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*2,_CY
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_D.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*3,_CY
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_E.png",_W/4,_CY/4)
A.x,A.y=0,_CY+_CY/4
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_F.png",_W/4,_CY/4)
A.x,A.y=0+_W/4,_CY+_CY/4
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_G.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*2,_CY+_CY/4
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_H.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*3,_CY+_CY/4
A.anchorX,A.anchorY=0,0


local A =  display.newImageRect("letter_I.png",_W/4,_CY/4)
A.x,A.y=0,_CY+_CY/4*2
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_J.png",_W/4,_CY/4)
A.x,A.y=0+_W/4,_CY+_CY/4*2
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_K.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*2,_CY+_CY/4*2
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_L.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*3,_CY+_CY/4*2
A.anchorX,A.anchorY=0,0


local A =  display.newImageRect("letter_M.png",_W/4,_CY/4)
A.x,A.y=0,_CY+_CY/4*3
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_N.png",_W/4,_CY/4)
A.x,A.y=0+_W/4,_CY+_CY/4*3
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_O.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*2,_CY+_CY/4*3
A.anchorX,A.anchorY=0,0

local A =  display.newImageRect("letter_P.png",_W/4,_CY/4)
A.x,A.y=0+_W/4*3,_CY+_CY/4*3
A.anchorX,A.anchorY=0,0]]

local function onClick(event)
    pic:removeSelf()
    pic = display.newImageRect(pictureTable[event.target.id + 1], _W, _CY)
    --pic.xScale, pic.yScale = 0.8, 0.5
    pic.x, pic.y = _CX, _CY / 2
    pic.anchorX, pic.anchorY = 0.5, 0.5
end

local x, y = 0, 0

local nX = 5
local nY = 5

local spacing = _W / nX
local ySpacing = 0

for i = 0, 25 do
    if (i == 24) then
        nY = nY * 2
    end
    if (i == 25) then
        x = nX - 1
    end
    local button = widget.newButton({
        id = i,
        --label = i,
        defaultFile = (i + 1) .. '.png',
        overFile = 'over' .. i + 1 .. '.png',
        width = _W / nX,
        height = _CY / nY,
        x = x * spacing,
        y = _CY + ySpacing,
        onRelease = onClick
    })
    button.anchorX, button.anchorY = 0, 0
    x = x + 1
    if (x == nX and i ~= 25) then
        x = 0
        ySpacing = ySpacing + _CY / nY
    end
end

