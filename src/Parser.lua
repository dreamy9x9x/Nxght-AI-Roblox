-- ModuleScript: Parser.lua
local Parser = {}

-- Função principal: recebe tokens taggeados e devolve estrutura
function Parser.Parse(taggedTokens)
    local structure = {
        subject = nil,
        verb = nil,
        object = nil,
        attribute = nil,
        connective = nil,
        cause = nil
    }

    local i = 1
    local n = #taggedTokens

    -- 1️⃣ Encontrar sujeito
    while i <= n do
        if taggedTokens[i].tag == "pronouns" or taggedTokens[i].tag == "nouns" then
            structure.subject = taggedTokens[i].word
            i = i + 1
            break
        end
        i = i + 1
    end

    -- 2️⃣ Encontrar verbo
    while i <= n do
        if taggedTokens[i].tag == "verbs" then
            structure.verb = taggedTokens[i].word
            i = i + 1
            break
        end
        i = i + 1
    end

    -- 3️⃣ Encontrar objeto ou atributo
    local objects = {}
    local attributes = {}
    local connectiveFound = nil
    local causeTokens = {}

    while i <= n do
        local token = taggedTokens[i]
        if token.tag == "connectives" then
            connectiveFound = token.word
            i = i + 1
            break
        elseif token.tag == "nouns" then
            table.insert(objects, token.word)
        elseif token.tag == "adjectives" then
            table.insert(attributes, token.word)
        end
        i = i + 1
    end

    if #objects > 0 then
        structure.object = table.concat(objects, " ")
    end
    if #attributes > 0 then
        structure.attribute = table.concat(attributes, " ")
    end
    structure.connective = connectiveFound

    -- 4️⃣ Se houver conective, captura causa
    if connectiveFound then
        while i <= n do
            local token = taggedTokens[i]
            table.insert(causeTokens, token.word)
            i = i + 1
        end
        if #causeTokens > 0 then
            structure.cause = table.concat(causeTokens, " ")
        end
    end

    return structure
end

return Parser
