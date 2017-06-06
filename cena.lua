local composer = require("composer")

local scene = composer.newScene()

local widget = require("widget")

local frogger = require("frogger")

local car = require("cars")

local tempo

function scene:create()
    
    frogger:criar_sapo()
    car:criar()

    
    local direita = widget.newButton({label = ">",  x = display.contentWidth/7 * 6.1, y = display.contentHeight/ 7 * 5.25, shape = "circle", radius = 35, fillColor = { default={ 0.7, 0.7, 0.7, 0.1 }, over={0.8, 0.8, 0.8, 0.1} } })
    local esquerda = widget.newButton({label = "<", x = display.contentWidth/7 * 3.9, y = display.contentHeight/ 7 * 5.25, shape = "circle", radius = 35, fillColor = { default={ 0.7, 0.7, 0.7, 0.1 }, over={0.8, 0.8, 0.8, 0.1} }})
    local cima = widget.newButton({label = "^", x = display.contentWidth/ 7 * 5, y = display.contentHeight / 7 * 4.5,  shape = "circle", radius = 35, fillColor = { default={ 0.7, 0.7, 0.7, 0.1 }, over={0.8, 0.8, 0.8, 0.1} }})
    local baixo = widget.newButton({label = "v", x = display.contentWidth/ 7 * 5, y = display.contentHeight / 7 * 6,  shape = "circle", radius = 35, fillColor = { default={ 0.7, 0.7, 0.7, 0.1 }, over={0.8, 0.8, 0.8, 0.1} }})
    
    direita:addEventListener("touch", moverDireita)
    esquerda:addEventListener("touch", moverEsquerda)
    cima:addEventListener("touch", moverCima)
    baixo:addEventListener("touch", moverBaixo)

    tempo =  timer.performWithDelay(1000,moverCarroDireita, 0)
    
    Runtime:addEventListener("collision", colisao)
    
    local sceneGroup = self.view
   
    sceneGroup:insert(frogger.sapo)
    sceneGroup:insert(direita)
    sceneGroup:insert(esquerda)
    sceneGroup:insert(cima)
    sceneGroup:insert(baixo)
end

function moverCarroDireita()
    car.carro:translate(10, 0)
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

function colisao(event)
    if event.phase == "began" then
        frogger.sapo:removeSelf()
    end
end


scene:addEventListener("create", scene)

return scene
