local composer = require("composer")

local scene = composer.newScene()

local phisics = require("physics")

local widget = require("widget")

local fachada = require("Fachada")

local frogger = require("frogger") 

local cenario = require("Cenario")

local sceneCars1, sceneObj

local tempo1, tempo2, tempo3, tempo4
local bonus = 5000
local vida = 2
local pontos = 0

function scene:create()
    physics.start(true)

    local sceneGroup = self.view
    sceneCars1 = display.newGroup()
    sceneObj = display.newGroup()
    cenario:criar()
    
    local carsRua1 = fachada:criar_carros(1)
    local carsRua2 = fachada:criar_carros(2)
    local carsRua3 = fachada:criar_carros(3)
    local carsRua4 = fachada:criar_carros(4)

    
    local obj1 = fachada:criar_obj()
    frogger:criar_sapo()

    local direita = widget.newButton({label = ">",  x = display.contentWidth/7 * 6.3, y = display.contentHeight/ 7 * 5.7, shape = "circle", radius = 26, fillColor = { default={ 1, 1, 0, 0.2 }, over={0.8, 0.8, 0.8, 0.1} } })
    local esquerda = widget.newButton({label = "<", x = display.contentWidth/7 * 4.7, y = display.contentHeight/ 7 * 5.7, shape = "circle", radius = 26, fillColor = { default={ 1, 1, 0, 0.2 }, over={0.8, 0.8, 0.8, 0.1} }})
    local cima = widget.newButton({label = "^", x = display.contentWidth/ 7 * 5.5, y = display.contentHeight / 7 * 5.15,  shape = "circle", radius = 26, fillColor = { default={1, 1, 0, 0.2}, over={0.8, 0.8, 0.8, 0.1} }})
    local baixo = widget.newButton({label = "v", x = display.contentWidth/ 7 * 5.5, y = display.contentHeight / 7 * 6.25,  shape = "circle", radius = 26, fillColor = { default={ 1, 1, 0, 0.2 }, over={0.8, 0.8, 0.8, 0.1} }})
    
    direita:addEventListener("touch", moverDireita)
    esquerda:addEventListener("touch", moverEsquerda)
    cima:addEventListener("touch", moverCima)
    baixo:addEventListener("touch", moverBaixo)

    life = display.newText({text = "Vidas: " .. vida, x = display.contentWidth/5, y = display.contentHeight/12 * 11.75})
    p = display.newText({text = "Pontos: " .. pontos, x = display.contentWidth/5 * 4, y = display.contentHeight/12 * 11.75})
    
    
    for i = 1, #carsRua1, 1 do
        sceneCars1:insert(carsRua1[i].carro)
    end

    for j = 3, 5, 1 do
        sceneCars1:insert(carsRua2[j].carro)
    end

    sceneCars1:insert(carsRua3[6].carro)
    sceneCars1:insert(carsRua3[7].carro)

    for f = 8, 10, 1 do
        sceneCars1:insert(carsRua4[f].carro)
    end 
    
   
    sceneGroup:insert(cenario.rua)
    sceneGroup:insert(cenario.rio)
    sceneGroup:insert(cenario.acostamento)
    sceneGroup:insert(cenario.iniciocena)
    sceneGroup:insert(cenario.finalcena)
    sceneGroup:insert(frogger.sapo)
    sceneGroup:insert(life)
    sceneGroup:insert(p)
    sceneGroup:insert(direita)
    sceneGroup:insert(esquerda)
    sceneGroup:insert(cima)
    sceneGroup:insert(baixo)

    sceneObj:insert(obj1[1].obj)

    tempo1 =  timer.performWithDelay(1000,moverCarroRua1, 0)
    tempo2 =  timer.performWithDelay(500,moverCarroRua2, 0)
    tempo3 =  timer.performWithDelay(900,moverCarroRua3, 0)
    tempo4 =  timer.performWithDelay(1000,moverCarroRua4, 0)

    physics.setGravity(0,0)
	--phisics.setDrawMode("hybrid")
end

function moverCarroRua1()
    
    sceneCars1[1]:translate(10, 0)
    sceneCars1[2]:translate(10, 0)

    if sceneCars1[2].x > display.contentWidth then
        sceneCars1[1].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
        sceneCars1[2].x = sceneCars1[1].x  - ((display.contentWidth / 8) * 4)
    end
end

function moverCarroRua2()
    
    sceneCars1[3]:translate(-10, 0)
    sceneCars1[4]:translate(-10, 0)
    sceneCars1[5]:translate(-10, 0)

    if sceneCars1[5].x < 0 then
        sceneCars1[3].x = (display.contentWidth / 8) * 8
        sceneCars1[4].x = sceneCars1[3].x + ((display.contentWidth / 8) * 4)
        sceneCars1[5].x = sceneCars1[4].x + ((display.contentWidth / 8) * 4)
    end
end

function moverCarroRua3()
    
    sceneCars1[6]:translate(10, 0)
    sceneCars1[7]:translate(10, 0)

    if sceneCars1[7].x > display.contentWidth then
        sceneCars1[6].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
        sceneCars1[7].x = sceneCars1[6].x  - ((display.contentWidth / 8) * 4)
    end
end

function moverCarroRua4()
    
    sceneCars1[8]:translate(-10, 0)
    sceneCars1[9]:translate(-10, 0)
    sceneCars1[10]:translate(-10, 0)

    if sceneCars1[10].x < 0 then
        sceneCars1[8].x = (display.contentWidth / 8) * 8
        sceneCars1[9].x = sceneCars1[8].x + ((display.contentWidth / 8) * 4)
        sceneCars1[10].x = sceneCars1[9].x + ((display.contentWidth / 8) * 4)
    end
end
function moverDireita(event)
    if event.phase == "began" then
        if frogger.sapo.x < display.contentWidth then
            pontos = pontos + 10
            p.text = "Pontos: " .. pontos
            bonusVida(pontos)
        end
        
        frogger:mover_direita()
    end
end


function moverEsquerda(event)
    if event.phase == "began" then
       
        
        if frogger.sapo.x > 0 then
            pontos = pontos + 10
            p.text = "Pontos: " .. pontos
            bonusVida(pontos)
        end
    
        frogger:mover_esquerda()
    end
end

function moverCima(event)
    if event.phase == "began" then
        frogger:mover_cima()
        pontos = pontos + 10
        p.text = "Pontos: " .. pontos
        bonusVida(pontos)
    end
end

function moverBaixo(event)
    if event.phase == "began" then
        if frogger.sapo.y < ((display.contentHeight/12) * 11) then
            pontos = pontos + 10
            p.text = "Pontos: " .. pontos
            bonusVida(pontos)
        end
        
        frogger:mover_baixo()
    end
end

function bonusVida(pontos)
    
    if pontos == bonus then
        vida = vida + 1
        life.text = "Vidas: " .. vida
        bonus = bonus + pontos
    end
end

function criarNovoSapo()
    frogger:criar_sapo()
end

function colisao(self, event)
    if event.phase == "began" then
        frogger.sapo:removeSelf()   
        
        if vida ~= 0 then
            timer.performWithDelay(100, criarNovoSapo)
            vida = vida - 1
            life.text = "Vidas: " .. vida
        elseif vida == 0 then 
            print("Game Over")
        end

    end
end


scene:addEventListener("create", scene)

return scene
