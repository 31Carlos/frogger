local composer = require("composer")

local scene = composer.newScene()

local phisics = require("physics")

local widget = require("widget")

local frogger = require("frogger") 

local fachada = require("Fachada")

local cenario = require("Cenario")

local sceneCars1, sceneRio

local vivo = true
local onTronco = true
local onRio = false
local bonus = 5000
local vida = 2
local pontos = 0
local inicioTrue = false

function scene:create()
    physics.start(true)

    sceneCars1 = display.newGroup()
    sceneRio = display.newGroup()
    
    local sceneGroup = self.view
    
    cenario:criar()
    
    local carsRua1 = fachada:criar_carros(1)
    local carsRua2 = fachada:criar_carros(2)
    local carsRua3 = fachada:criar_carros(3)
    local carsRua4 = fachada:criar_carros(4)

    local obj1 = fachada:criar_obj(1)
    local obj2 = fachada:criar_obj(2)
    local obj3 = fachada:criar_obj(3)
    local obj4 = fachada:criar_obj(4)

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
    
    sceneRio:insert(obj1[1].obj)
    sceneRio:insert(obj1[2].obj)
    
    for i = 1, #obj1, 1 do
        sceneRio:insert(obj1[i].obj)
    end

    for j = 3, 5, 1 do
        sceneRio:insert(obj2[j].obj)
    end

    sceneRio:insert(obj3[6].obj)
    sceneRio:insert(obj3[7].obj)

    for f = 8, 10, 1 do
        sceneRio:insert(obj4[f].obj)
    end

    sceneGroup:insert(cenario.rua)
    sceneGroup:insert(cenario.rio)
    sceneGroup:insert(cenario.acostamento)
    sceneGroup:insert(cenario.iniciocena)
    sceneGroup:insert(cenario.finalcena)
    sceneGroup:insert(life)
    sceneGroup:insert(p)
    sceneGroup:insert(sceneCars1)
    sceneGroup:insert(sceneRio)
    sceneGroup:insert(frogger.sapo)
    sceneGroup:insert(direita)
    sceneGroup:insert(esquerda)
    sceneGroup:insert(cima)
    sceneGroup:insert(baixo)
    
    timer.performWithDelay(1000,moverCarroRua1, 0)
    timer.performWithDelay(500,moverCarroRua2, 0)
    timer.performWithDelay(900,moverCarroRua3, 0)
    timer.performWithDelay(1000,moverCarroRua4, 0)

    timer.performWithDelay(500,moverObjRio1, 0)
    timer.performWithDelay(500,moverObjRio2, 0)
    timer.performWithDelay(300,moverObjRio3, 0)
     timer.performWithDelay(300,moverObjRio4, 0)
    physics.setGravity(0,0)
	--phisics.setDrawMode("hybrid")
end

function movimentoDuplo(x1, x2, y1, indice)

        if frogger.sapo.x > x1 and frogger.sapo.x < x2 and frogger.sapo.y == y1  then
           onTronco = true
           if indice == 1 or indice  == 3 then
                frogger.sapo:translate(10, 0)
                
            
            elseif indice == 2 or indice == 4 then
                frogger.sapo:translate(-10, 0)
                
            end
        else
            --onTronco = false
        end 
    
        
        
end

function colisaoRio()
        
        local rioY1 = display.contentHeight/12
        local rioY2 = (display.contentHeight/12 * 6) - (display.contentHeight/12 * 0.5)
        
    if frogger.sapo.y > rioY1 and frogger.sapo.y < rioY2 then
            vivo = false
            frogger.sapo:removeSelf()   
            vida = vida - 1
            life.text = "Vidas: " .. vida
            criarNovoSapo()
    end 
end
function moverObjRio1()
    
    sceneRio[1]:translate(10, 0)
    sceneRio[2]:translate(10, 0)

    if sceneRio[1].x > display.contentWidth then
        sceneRio[1].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end
    
    if sceneRio[2].x > display.contentWidth then
        sceneRio[2].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end
    for i = 1, 2, 1 do
        
        x1 = sceneRio[i].x - 70
        x2 = sceneRio[i].x + 60
        y = sceneRio[i].y
        if vivo then
            movimentoDuplo(x1, x2, y, 1) 
           -- timer.performWithDelay(1000, colisaoRio)
            
        end
    end
     

end


function moverObjRio2() 
    sceneRio[3]:translate(-10, 0)
    sceneRio[4]:translate(-10, 0)
    sceneRio[5]:translate(-10, 0)

    if sceneRio[5].x < 0 then
        sceneRio[3].x = (display.contentWidth / 8) * 8
        sceneRio[4].x = sceneRio[3].x + ((display.contentWidth / 8) * 4)
        sceneRio[5].x = sceneRio[4].x + ((display.contentWidth / 8) * 4)
    end
    
    for i = 3, 5, 1 do
        x1 = sceneRio[i].x - 30
        x2 = sceneRio[i].x + 50
        y = sceneRio[i].y
        if vivo then
            movimentoDuplo(x1, x2, y, 2)
            --timer.performWithDelay(1000, colisaoRio)
        end
    end

   
end

function moverObjRio3()
    sceneRio[6]:translate(10, 0)
    sceneRio[7]:translate(10, 0)

      if sceneRio[6].x > display.contentWidth then
        sceneRio[6].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end

    if sceneRio[7].x > display.contentWidth then
        sceneRio[7].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end

    for i = 6, 7, 1 do
        x1 = sceneRio[i].x - 70
        x2 = sceneRio[i].x + 60
        y = sceneRio[i].y 

        if vivo then
            movimentoDuplo(x1, x2, y, 3)
            --timer.performWithDelay(1000, colisaoRio)
        end
    end
end

function moverObjRio4()
    sceneRio[8]:translate(-10, 0)
    sceneRio[9]:translate(-10, 0)
    sceneRio[10]:translate(-10, 0)

    if sceneRio[10].x < 0 then
        sceneRio[8].x = (display.contentWidth / 8) * 8
        sceneRio[9].x = sceneRio[8].x + ((display.contentWidth / 8) * 4)
        sceneRio[10].x = sceneRio[9].x + ((display.contentWidth / 8) * 4)
    end

      for i = 8, 10, 1 do
        x1 = sceneRio[i].x - 40
        x2 = sceneRio[i].x + 50
        y = sceneRio[i].y 

        if vivo then
            movimentoDuplo(x1, x2, y, 4)
            --timer.performWithDelay(1000, colisaoRio)
        end
    end
end

function moverCarroRua1()
    
    sceneCars1[1]:translate(10, 0)
    sceneCars1[2]:translate(10, 0)

    if sceneCars1[1].x > display.contentWidth then
        sceneCars1[1].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end

    if sceneCars1[2].x > display.contentWidth then
        sceneCars1[2].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
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

      if sceneCars1[6].x > display.contentWidth then
        sceneCars1[6].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
    end

    if sceneCars1[7].x > display.contentWidth then
        sceneCars1[7].x = (display.contentWidth/8) - (display.contentWidth/8 * 2)
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
    if event.phase == "began" and vivo then
        if frogger.sapo.x < display.contentWidth then
            pontos = pontos + 10
            p.text = "Pontos: " .. pontos
            bonusVida(pontos)
        end
        
        frogger:mover_direita()
    end
end

function moverEsquerda(event)
    if event.phase == "began" and vivo then
       
        
        if frogger.sapo.x > 0 then
            pontos = pontos + 10
            p.text = "Pontos: " .. pontos
            bonusVida(pontos)
        end
    
        frogger:mover_esquerda()
    end
end

function moverCima(event)
    if event.phase == "began" and vivo then
        pontos = pontos + 10
        p.text = "Pontos: " .. pontos
        bonusVida(pontos)
        frogger:mover_cima()
    end
end

function moverBaixo(event)
    if event.phase == "began" and vivo then
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
    vivo = true
end

function colisao(self, event)
    if event.phase == "began" then
        
        
       print(event.other.name)
       
       if event.other.name == "carro" then
            vivo = false
            frogger.sapo:removeSelf()   
            
            if vida > 0 then
                timer.performWithDelay(100, criarNovoSapo)
                vida = vida - 1
                life.text = "Vidas: " .. vida
            elseif vida < 1 then 
               
                gameOver = display.newText({text = "Game Over", x = display.contentWidth/2, y = display.contentHeight/12 * 6})
                inicio = widget.newButton({label = "Reiniciar",  x = display.contentWidth/2, y = display.contentHeight/ 12 * 11 , shape = "rect",  fillColor = { default={ 1, 1, 1}, over={0.8, 0.8, 0.8, 0.1} } })
                inicioTrue = true
                vida = vida - 1
                inicio:addEventListener("touch", reiniciar)
            end
        end

    end
end

function reiniciar()
    
    inicio:removeSelf()
    gameOver:removeSelf()
    
    frogger:criar_sapo()
    vida = 2
    life.text = "Vidas: " .. vida
    pontos = 0
    vivo = true
    p.text = "Pontos: " .. pontos
end

scene:addEventListener("create", scene)

return scene
