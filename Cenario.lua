local phisics = require("physics")

cenario = {
    rua, 
    rio,
    acostamento,
    iniciocena,
    finalcena
}

function cenario:criar()
    cenario.rua = display.newRect(display.contentWidth/2, display.contentHeight/12 * 8.5, display.contentWidth, display.contentHeight/12*4)
    cenario.rua:setFillColor(0.3, 0.3, 0.3)

    cenario.rio = display.newRect(display.contentWidth/2, display.contentHeight/12 * 3.5, display.contentWidth, display.contentHeight/12* 3.95)
    cenario.rio:setFillColor(0, 0.3, 1)

    physics.addBody(cenario.rio, "static",{friction = 1, bounce = 0})    

    cenario.acostamento = display.newRect(display.contentWidth/2, display.contentHeight/12 * 6, display.contentWidth, display.contentHeight/12* 1.1)
    cenario.acostamento:setFillColor(0.3,0, 0 )
    
    cenario.iniciocena = display.newRect(display.contentWidth/2, display.contentHeight/12 * 11, display.contentWidth, display.contentHeight/12)
    cenario.iniciocena:setFillColor(0.3,0, 0 )

    cenario.finalcena = display.newRect(display.contentWidth/2,  display.contentHeight/12, display.contentWidth, display.contentHeight/12)
    cenario.finalcena:setFillColor(0.3, 1, 0.3)
end

return cenario