-- ModuleScript: Generator.lua
local Generator = {}

-- Função principal: recebe o significado e retorna resposta
function Generator.Generate(meaning)
    if not meaning then return "I don't understand." end

    local response = ""

    if meaning.type == "emotion" then
        -- resposta baseada no atributo/emotion
        response = "I see that you are " .. (meaning.attribute or "feeling something") .. "."
    elseif meaning.type == "event" then
        -- resposta baseada no objeto/verbo
        if meaning.object then
            response = "Oh, something happened with " .. meaning.object .. "."
        else
            response = "I see an event happened."
        end
    elseif meaning.type == "cause_event" then
        -- evento com causa
        local causeText = meaning.cause or "something"
        local subjectText = meaning.subject or "it"
        response = "I understand that " .. subjectText .. " " .. (meaning.verb or "") .. " because " .. causeText .. "."
    elseif meaning.type == "statement" then
        response = "Okay, I see."
    else
        response = "I don't understand."
    end

    return response
end

return Generator
