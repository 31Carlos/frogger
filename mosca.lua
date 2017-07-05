local phisics = require("physics")

mosca = {
    centrox, 
    centroy, 
    mosca
}



function mosca:criar_mosca()
        
    widthM =  math.random(2, 7)

    mosca.centrox = (display.contentWidth / 8) * widthM
    mosca.centroy = (display.contentHeight / 12) 
    --mosca.mosca  = display.newImage("imagens/frogger.png")
    
    mosca.mosca = display.newCircle(mosca.centrox, mosca.centroy, 10)
    mosca.mosca:setFillColor(0,0,0)
    
    mosca.mosca.name = "mosca"
    
    physics.addBody(mosca.mosca, "dynamic",{ friction = 1, bounce = 0})    

    mosca.mosca.isFixedRotation = true
    
    return mosca
end

function mosca:mata_mosca()
    mosca.mosca:removeSelf()

    return mosca
end
return mosca