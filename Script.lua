-- Variáveis básicas
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local target -- vai guardar o alvo do aimbot
local autoFarmWeapon = "Sword" -- nome da arma pra auto farm, você muda aqui

-- Função Aimbot que mira e ataca automaticamente o alvo
function aimbot(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then return end

    -- Atacar na direção do alvo (exemplo genérico)
    local function attack()
        -- Aqui vc chamaria o ataque do seu personagem apontando para o HumanoidRootPart do inimigo
        -- Exemplo fictício, adapte ao seu jogo:
        game:GetService("ReplicatedStorage").Remotes.Attack:FireServer(targetHumanoidRootPart.Position)
    end

    attack()
end

-- Auto Farm simples: clicar com a arma automaticamente
function autoFarm()
    while wait(0.5) do
        -- Usar arma (exemplo)
        local tool = player.Backpack:FindFirstChild(autoFarmWeapon) or player.Character:FindFirstChild(autoFarmWeapon)
        if tool then
            tool:Activate() -- tenta usar a arma
        end
    end
end

-- Auto Farm Raids (gemas) - função fictícia, precisa ajustar com eventos do jogo
function autoFarmRaids()
    while wait(1) do
        -- Suponha que tenha um evento para pegar gemas
        game:GetService("ReplicatedStorage").Remotes.CollectGem:FireServer()
    end
end

-- Auto Meme Best (boss)
function autoMemeBest()
    while wait(5) do
        -- Verifica se o boss está spawnado e ataca
        local boss = workspace:FindFirstChild("MemeBestBoss")
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            aimbot({Character = boss})
        end
    end
end

-- Auto girar frutas e armazenar sem animação/interface
function autoSpinAndStore()
    while wait(2) do
        -- Chamar função de girar e guardar (exemplo genérico)
        game:GetService("ReplicatedStorage").Remotes.SpinFruit:FireServer()
        game:GetService("ReplicatedStorage").Remotes.StoreFruit:FireServer()
    end
end

-- Iniciar funções paralelamente
spawn(autoFarm)
spawn(autoFarmRaids)
spawn(autoMemeBest)
spawn(autoSpinAndStore)

-- Exemplo básico de usar o aimbot no jogador alvo (substituir pelo alvo correto)
mouse.Button1Down:Connect(function()
    local targetPlayer = mouse.Target and game.Players:GetPlayerFromCharacter(mouse.Target.Parent)
    if targetPlayer and targetPlayer ~= player then
        aimbot(targetPlayer)
    end
end)
