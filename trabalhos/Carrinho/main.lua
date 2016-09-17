local LARGURA_JANELA = 1000
local ALTURA_JANELA = 500

local X_INICIAL_ADVERSARIO = 902
local X_PLAYER = 27

local ALTURA_1 = 177
local ALTURA_2 = 252

local ALTURA_CARRINHO = 73
local LARGURA_CARRINHO = 98

local VELOCIDADE_INICIAL = 7

local gameOver = false

local recorde = 0


function gerarAlturaInicial()
	-- Funciona como operador ternário: (posicao == 1) ? ALTURA_2 : ALTURA 1	
	return math.random(0,1) == 1 and ALTURA_2 or ALTURA_1
end


function gerarCarrinhoAdversario()
	
	local velocidade = VELOCIDADE_INICIAL
    local x = X_INICIAL_ADVERSARIO
    local y = gerarAlturaInicial()
    
    return
        function ()
            x = x - velocidade
            if x < 0 then 
			    x = X_INICIAL_ADVERSARIO
			    y = gerarAlturaInicial()
			    velocidade = velocidade + 0.5
            end

            return x, y
        end
end


function verificarColisao(meuCar, carAdv)
  return meuCar.x < carAdv.x + LARGURA_CARRINHO and --27 < x+98  
         carAdv.x < meuCar.x + LARGURA_CARRINHO and -- x < 100
         meuCar.y == carAdv.y
end

function love.load()

	--- Define o tamanho da fonte usada
	love.graphics.setFont(love.graphics.newFont(50))

	-- Carrega imagens
	carrinhoPlayerImg = love.graphics.newImage("/Imagens/CarrinhoFundoTransparenteDir98x73.png")
	carrinhoAdversarioImg = love.graphics.newImage("/Imagens/CarrinhoFundoTransparenteEsq98x73.png")
	explosaoImg = love.graphics.newImage("/Imagens/ExplosaoPequena.png")
	pistaImg = love.graphics.newImage("/Imagens/Pista1000x500.png")

	-- Ajusta a janela
	love.window.setMode(LARGURA_JANELA, ALTURA_JANELA)
	love.window.setTitle("Carrinho - 9999 Games")
	love.window.setIcon(love.image.newImageData("/Imagens/QuadradoPreto1x1.png"))

	--- Inicia o contador de tempo
	tempoInicio = os.clock()

	-- Cria o carrinho do jogador
	carrinhoPlayer = {}
	carrinhoPlayer.x = X_PLAYER
	carrinhoPlayer.y = ALTURA_1

	-- Cria o carrinho do adversário
	carrinhoAdversario = {}
	carrinhoAdversario.x = 0
	carrinhoAdversario.y = 0
	carrinhoAdversario.gerar = gerarCarrinhoAdversario()

end


function love.update()

	if not gameOver then
		-- Controla a posição do carrinho do jogador
		if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
			carrinhoPlayer.y = ALTURA_1
		elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
			carrinhoPlayer.y = ALTURA_2			
		end

		-- Verifica se o jogo acabou
		colidiu = verificarColisao(carrinhoPlayer, carrinhoAdversario)

		if colidiu then
			gameOver = true
			tempoFim = os.clock() - tempoInicio
			if tempoFim > recorde then
				recorde = tempoFim
			end
		end

	else
		-- Possibilita reiniciar o jogo
		if love.keyboard.isDown("return") then -- return == enter
			tempoInicio = os.clock()
			gameOver = false
			carrinhoAdversario.gerar = gerarCarrinhoAdversario()
		end
	end

end


function love.draw()
	-- Desenha a pista
	love.graphics.draw(pistaImg)

	-- Calcula tempo decorrido e mensagem com recorde
	tempoDecorrido = os.clock() - tempoInicio

	love.graphics.print(string.format("Recorde: %.2f\n", (recorde == 0) and tempoDecorrido or recorde), 600, 30)

	-- Mostra o tempo decorrido, atualiza a posição do player e do adversário
	if not gameOver then
		
		love.graphics.print(string.format("Tempo: %.2f\n", tempoDecorrido), 50, 30)

		love.graphics.draw(carrinhoPlayerImg, X_PLAYER, carrinhoPlayer.y)
		carrinhoAdversario.x, carrinhoAdversario.y = carrinhoAdversario.gerar()
		love.graphics.draw(carrinhoAdversarioImg, carrinhoAdversario.x, carrinhoAdversario.y)

	-- Exibe explosao, tempo total de jogo e mensagem de reinício
	else
		love.graphics.draw(explosaoImg, 0, 57)
		love.graphics.print(string.format("Game Over! Tempo: %.2f", tempoFim), 300, 210)
		love.graphics.print("Pressione ENTER para reiniciar", 100, 410)
	end
end