local cars = require("cars")

local objetos = require("Objeto")

local phisics = require("physics")

fachada = {
    cars = {},
    objetos = {}
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

            --newCar.carro = display.newImage("imagens/car2.png")
            --newCar.carro:translate( newCar.centrox, newCar.centroy )
            newCar.carro = display.newRect(newCar.centrox, newCar.centroy, 65, 30)
            newCar.carro:setFillColor(1,0,0)

            --newCar.carro:scale(2.5,2.5)
            newCar.carro.name = "carro"
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
           -- newCar.carro = display.newImage("imagens/car1.png")
            --newCar.carro:translate( newCar.centrox, newCar.centroy )

            --newCar.carro:scale(2.5,2.5)
            newCar.carro.name = "carro"
	        physics.addBody(newCar.carro, "static",{friction = 1, bounce = 0})

            table.insert(fachada.cars, newCar)

            x = x + ((display.contentWidth / 8) * 5)
        
        end
    end
    return fachada.cars
end

function fachada:criar_obj()
    
    
    local x 
    local y 
        x = (display.contentWidth / 8)
        y =  (display.contentHeight/ 12) * 5

    for i = 1, 2, 1 do
        local newObj = objetos:new()

        newObj.centrox = x 
        newObj.centroy = y 

        newObj.obj = display.newRect(newObj.centrox, newObj.centroy, 65, 30)
        newObj.obj:setFillColor(0.5,0,0)
        
        --newObj.obj = display.newImage("imagens/tronco.png")
        --newObj.obj:translate( newObj.centrox, newObj.centroy )

        --newObj.obj:scale(3,3)
    
	    --physics.addBody(newObj.obj, "static",{density = 0 ,friction = 0, bounce = 0})

        table.insert(fachada.objetos, newObj)

        x = x - ((display.contentWidth / 8) * 3)
        
    end

    return fachada.objetos
end

return fachada