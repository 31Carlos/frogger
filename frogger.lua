
frogger = {
    centrox, 
    centroy, 
    sapo
}

function frogger:criar_sapo()

        
    frogger.centrox = (display.contentWidth / 8) * 4
    frogger.centroy = (display.contentHeight / 12) * 11
    frogger.sapo = display.newCircle(frogger.centrox, frogger.centroy, 20)
    frogger.sapo:setFillColor(0,1,0)
end

function frogger:mover_direita()
    frogger.sapo.x = frogger.sapo.x + (display.contentWidth / 8)
end

function frogger:mover_esquerda()
    
    frogger.sapo.x = frogger.sapo.x - (display.contentWidth/ 8)
end

function frogger:mover_cima()
    frogger.sapo.y = frogger.sapo.y - (display.contentHeight / 12)
end


function frogger:mover_baixo()
    frogger.sapo.y = frogger.sapo.y + (display.contentHeight / 12)
end

return frogger