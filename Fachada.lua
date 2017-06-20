local cars = require("cars")

local phisics = require("physics")

fachada = {
    cars = {}
}


function fachada:criar_carros(rua)
    

    local x 
    local y 
    if rua == 1 then
        x = (display.contentWidth / 8)
        y =  (display.contentHeight/ 12) * 7

    elseif rua == 2 then
        x = (display.contentWidth / 8) * 8
        y =  (display.contentHeight/ 12) * 8
    elseif rua == 3 then
        x = (display.contentWidth / 8)
        y =  (display.contentHeight/ 12) * 9
    elseif rua == 4 then
        x = (display.contentWidth / 8) * 8
        y =  (display.contentHeight/ 12) * 10
    end
    

    if rua == 1 or rua == 3 then

        for i = 1, 2, 1 do
            local newCar = cars:new()

            newCar.centrox = x 
            newCar.centroy = y 

            newCar.carro = display.newRect(newCar.centrox, newCar.centroy, 65, 30)
            newCar.carro:setFillColor(1,0,0)

            
	        physics.addBody(newCar.carro, "static",{friction = 1, bounce = 0})

            table.insert(fachada.cars, newCar)

            x = x - ((display.contentWidth / 8) * 4)
        
        end
    elseif rua == 2 or rua == 4 then
        for i = 1, 3, 1 do
            local newCar = cars:new()

            newCar.centrox = x 
            newCar.centroy = y 

            newCar.carro = display.newRect(newCar.centrox, newCar.centroy, 65, 30)
            newCar.carro:setFillColor(0,0,1)

           
	        physics.addBody(newCar.carro, "static",{friction = 1, bounce = 0})

            table.insert(fachada.cars, newCar)

            x = x + ((display.contentWidth / 8) * 5)
        
        end
    end
    return fachada.cars
end


return fachada