local frogger = require("frogger")

local cars = require("cars")

local phisics = require("physics")

fachada = {
    frogger,
    cars = {}
}

function fachada:criar()
    self.frogger = frogger:criar_sapo()
end

function fachada:criar_carros()
    local x = (display.contentWidth / 8)
    local y =  (display.contentHeight/ 12) * 9

    for i = 1, 2, 1 do
        local newCar = cars:new()

        newCar.centrox = x 
        newCar.centroy = y 

        newCar.carro = display.newRect(newCar.centrox, newCar.centroy, 65, 30)
        newCar.carro:setFillColor(1,1,1)

        physics.start(true)
	    physics.setGravity(0,0)
	    physics.addBody(newCar.carro, "static",{friction = 1, bounce = 0})

        table.insert(fachada.cars, newCar)

        x = x - ((display.contentWidth / 8) * 4)
    end

    return fachada.cars
end

return fachada