
frogger = {
    centrox, 
    centroy, 
    sapo
}

local phisics = require("physics")

function frogger:criar_sapo()

        
    frogger.centrox = (display.contentWidth / 8) * 4
    frogger.centroy = (display.contentHeight / 12) * 11
    frogger.sapo = display.newCircle(frogger.centrox, frogger.centroy, 20)
    frogger.sapo:setFillColor(0,1,0)

    physics.start(true)
	physics.setGravity(0,0)
	physics.addBody(frogger.sapo, "dynamic",{friction = 1, bounce = 0})
	
end

function frogger:mover_direita()
    if frogger.sapo.x < display.contentWidth then
        frogger.sapo.x = frogger.sapo.x + (display.contentWidth / 8)
    end
end

function frogger:mover_esquerda()
    if frogger.sapo.x > 0 then
        frogger.sapo.x = frogger.sapo.x - (display.contentWidth/ 8)
    end
end

function frogger:mover_cima()
    if frogger.sapo.y > 0 then
        frogger.sapo.y = frogger.sapo.y - (display.contentHeight / 12)
    end
end


function frogger:mover_baixo()
    if frogger.sapo.y < display.contentHeight/12 *11 then
        frogger.sapo.y = frogger.sapo.y + (display.contentHeight / 12)
    end
end

return frogger