-- ModuleScript: SemanticRules.lua
local SemanticRules = {}

-- Função principal: interpreta a estrutura do Parser
function SemanticRules.Interpret(structure)
    local meaning = {
        type = "unknown",
        subject = structure.subject,
        verb = structure.verb,
        object = structure.object,
        attribute = structure.attribute,
        cause = structure.cause
    }

    -- Se houver atributo (adjetivo) relacionado a sujeito, consideramos "emotion"
    if structure.attribute then
        meaning.type = "emotion"
    -- Se houver objeto/noun sem connectives, consideramos "event"
    elseif structure.object and not structure.connective then
        meaning.type = "event"
    -- Se houver connectives e causa, consideramos "cause_event"
    elseif structure.connective and structure.cause then
        meaning.type = "cause_event"
    else
        meaning.type = "statement"
    end

    return meaning
end

return SemanticRules
