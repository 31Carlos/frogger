local composer = require("composer")

local scene = composer.newScene()

local widget = require("widget")

local frogger = require("frogger")

function scene:create()
    
    frogger:criar_sapo()
    local direita = widget.newButton({label = ">",  x = display.contentWidth/7 * 6, y = display.contentHeight/ 7 * 2, shape = "circle"})
    local esquerda = widget.newButton({label = "<", x = display.contentWidth/7 * 3, y = display.contentHeight/ 7 * 2, shape = "circle"})
    local cima = widget.newButton({label = "^", x = display.contentWidth/ 7 * 4.5, y = display.contentHeight / 7 ,  shape = "circle"})
    local baixo = widget.newButton({label = "v", x = display.contentWidth/ 7 * 4.5, y = display.contentHeight / 7 * 3,  shape = "circle"})
    
    direita:addEventListener("touch", moverDireita)
    esquerda:addEventListener("touch", moverEsquerda)
    cima:addEventListener("touch", moverCima)
    baixo:addEventListener("touch", moverBaixo)

    local colunaE = display.newLine(0,0, 0, display.contentHeight )
    local colunaD = display.newLine(display.contentWidth +1 , 0, display.contentWidth + 1 , display.contentHeight)
    
    local sceneGroup = self.view
    
    sceneGroup:insert(frogger.sapo)
    sceneGroup:insert(direita)
    sceneGroup:insert(esquerda)
    sceneGroup:insert(cima)
    sceneGroup:insert(baixo)
    sceneGroup:insert(colunaE)
    sceneGroup:insert(colunaD)
end

function moverDireita(event)
    if event.phase == "began" then
        frogger:mover_direita()
    end
end


function moverEsquerda(event)
    if event.phase == "began" then
        frogger:mover_esquerda()
    end
end

function moverCima(event)
    if event.phase == "began" then
        frogger:mover_cima()
    end
end

function moverBaixo(event)
    if event.phase == "began" then
        frogger:mover_baixo()
    end
end
scene:addEventListener("create", scene)
return scene
