-- ModuleScript: Tokenizer.lua
local Tokenizer = {}

-- função principal
function Tokenizer.Tokenize(text)
    local tokens = {}
    for word in string.gmatch(text:lower(), "%S+") do
        table.insert(tokens, word)
    end
    return tokens
end

return Tokenizer
