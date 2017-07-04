local phisics = require("physics")

frogger = {
    centrox, 
    centroy, 
    sapo
}



function frogger:criar_sapo()
        
        
    frogger.centrox = (display.contentWidth / 8) * 4
    frogger.centroy = (display.contentHeight / 12) * 11
    frogger.sapo  = display.newImage("imagens/frogger.png")
    frogger.sapo:translate( frogger.centrox, frogger.centroy )
    --frogger.sapo:setFillColor(0,1,0)
    frogger.sapo.name = "sapo"
    

    physics.addBody(frogger.sapo, "dynamic",{ friction = 1, bounce = 0})    

    frogger.sapo.isFixedRotation = true
    
    frogger.sapo.collision = colisao
    frogger.sapo:addEventListener("collision") 
    

    return frogger
end

function frogger:mover_direita()
    if (frogger.sapo.x  + (display.contentWidth / 8) ) <= display.contentWidth then
        frogger.sapo.x = frogger.sapo.x + (display.contentWidth / 8)
    end
end

function frogger:mover_esquerda()
    if (frogger.sapo.x - (display.contentWidth/ 8) ) >= 0 then
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