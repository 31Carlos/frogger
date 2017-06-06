car = {
    carro,
    centrox,
    centroy
}

local phisics = require("physics")

function car:criar()
    car.centrox = (display.contentWidth / 8) * 1
    car.centroy = (display.contentHeight/ 12) * 9

    car.carro = display.newRect(car.centrox, car.centroy, 65, 30)
    car.carro:setFillColor(1,1,1)

    physics.start(true)
	physics.setGravity(0,0)
	physics.addBody(car.carro, "static",{friction = 1, bounce = 0})
	
end



return car;
