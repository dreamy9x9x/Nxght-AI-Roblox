-- LocalScript: AIClient_Loadstring.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Links dos módulos no GitHub
local modulesUrls = {
    Tokenizer = "https://raw.githubusercontent.com/dreamy9x9x/Nxght-AI-Roblox/refs/heads/main/src/Tokenizer.lua",
    Lexicon = "https://raw.githubusercontent.com/dreamy9x9x/Nxght-AI-Roblox/refs/heads/main/src/Lexicon.lua",
    Parser = "https://raw.githubusercontent.com/dreamy9x9x/Nxght-AI-Roblox/refs/heads/main/src/Parser.lua",
    SemanticRules = "https://raw.githubusercontent.com/dreamy9x9x/Nxght-AI-Roblox/refs/heads/main/src/SemanticRules.lua",
    Generator = "https://raw.githubusercontent.com/dreamy9x9x/Nxght-AI-Roblox/refs/heads/main/src/Generator.lua"
}

-- Tabela que vai armazenar os módulos carregados
local AI = {}

-- Função para baixar e carregar módulo via loadstring
local function LoadModule(name, url)
    local code = game:HttpGet(url)
    local ok, module = pcall(function()
        return loadstring(code)()
    end)
    if not ok then
        warn("Failed to load module:", name, module)
        return nil
    end
    AI[name] = module
    print("Module loaded:", name)
end

-- Carrega todos os módulos
for name, url in pairs(modulesUrls) do
    LoadModule(name, url)
end

-- =============================
-- Função para processar input
-- =============================
local function ProcessInput(userInput)
    print("========================================")
    print("User input: " .. userInput)
    
    local Tokenizer = AI.Tokenizer
    local Lexicon = AI.Lexicon
    local Parser = AI.Parser
    local Semantic = AI.SemanticRules
    local Generator = AI.Generator

    -- 1️⃣ Tokenize + Tag
    local tokens = Lexicon.Tag(Tokenizer.Tokenize(userInput))
    print("Tokens and tags:")
    for _, t in ipairs(tokens) do
        print(t.word, "-", t.tag)
    end

    -- 2️⃣ Parser
    local structure = Parser.Parse(tokens)
    print("Parsed structure:")
    for k, v in pairs(structure) do
        print(k, "=", v)
    end

    -- 3️⃣ SemanticRules
    local meaning = Semantic.Interpret(structure)
    print("Semantic meaning:")
    for k, v in pairs(meaning) do
        print(k, "=", v)
    end

    -- 4️⃣ Generator
    local response = Generator.Generate(meaning)
    print("AI response: " .. response)
end

-- =============================
-- Teste com inputs
-- =============================
local testInputs = {
    "I am sad because Roblox crashed",
    "The server is slow",
    "I am happy",
    "Roblox froze"
}

for _, input in ipairs(testInputs) do
    ProcessInput(input)
end
