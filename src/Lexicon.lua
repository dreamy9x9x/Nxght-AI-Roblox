-- ModuleScript: Lexicon.lua
local Lexicon = {}

-- 120+ pronouns
Lexicon.pronouns = {
    "I","you","he","she","it","we","they","me","him","her","us","them",
    "my","your","his","her","its","our","their","mine","yours","hers",
    "ours","theirs","myself","yourself","himself","herself","itself",
    "ourselves","yourselves","themselves","who","whom","whose","which",
    "that","this","these","those","anyone","anybody","anything","someone",
    "somebody","something","everyone","everybody","everything","noone",
    "nobody","nothing","each","few","many","several","all","any","some",
    "both","half","either","neither","one","another","other","others",
    "such","what","whatever","whichsoever","whichever","whosoever","whomever",
    "each other","one another","none","anyone else","somebody else","everyone else",
    "anybody else","no one else","someone else","whoever","whomever","oneself",
    "any","every","each","each one","every one","all of them","all of us",
    "most","least","much","many","more","less","most of","none of","some of",
    "any of","all of","both of","half of","either of","neither of","one of",
    "another of","other of","others of","such of","whatsoever","whichever of",
    "whoever else","whomever else","the same","the other","the others"
}

-- 120+ verbs
Lexicon.verbs = {
    "am","is","are","was","were","be","been","being","have","has","had","do",
    "does","did","say","says","said","go","goes","went","make","makes","made",
    "know","knows","knew","think","thinks","thought","take","takes","took",
    "see","sees","saw","come","comes","came","want","wants","wanted","look",
    "looks","looked","use","uses","used","find","finds","found","give","gives",
    "gave","tell","tells","told","work","works","worked","call","calls","called",
    "try","tries","tried","ask","asks","asked","need","needs","needed","feel",
    "feels","felt","become","becomes","became","leave","leaves","left","put",
    "puts","putted","mean","means","meant","keep","keeps","kept","let","lets",
    "let","begin","begins","began","seem","seems","seemed","help","helps","helped",
    "talk","talks","talked","turn","turns","turned","start","starts","started",
    "show","shows","showed","hear","hears","heard","play","plays","played",
    "run","runs","ran","move","moves","moved","live","lives","lived","believe",
    "believes","believed","hold","holds","held","bring","brings","brought",
    "happen","happens","happened","write","writes","wrote","provide","provides",
    "provided","sit","sits","sat","stand","stands","stood","lose","loses","lost",
    "pay","pays","paid","meet","meets","met","include","includes","included",
    "continue","continues","continued","set","sets","setting","learn","learns","learned",
    "change","changes","changed","lead","leads","led","understand","understands",
    "understood","watch","watches","watched","follow","follows","followed","stop",
    "stops","stopped","create","creates","created","speak","speaks","spoke",
    "read","reads","readed","allow","allows","allowed","add","adds","added"
}

-- 120+ adjectives
Lexicon.adjectives = {
    "happy","sad","angry","excited","tired","bored","hungry","full","heavy",
    "light","broken","fast","slow","good","bad","awesome","terrible","fun",
    "interesting","boring","beautiful","ugly","strong","weak","hot","cold",
    "warm","cool","big","small","huge","tiny","short","long","wide","narrow",
    "easy","difficult","hard","soft","rough","smooth","bright","dark","loud",
    "quiet","rich","poor","clean","dirty","expensive","cheap","famous","unknown",
    "safe","dangerous","early","late","new","old","young","ancient","fresh",
    "stale","healthy","sick","friendly","unfriendly","kind","mean","polite",
    "rude","smart","stupid","funny","serious","lazy","active","quick","slow",
    "stronger","weaker","better","worse","happier","sadder","more excited",
    "less excited","angrier","calm","nervous","confident","shy","brave","afraid",
    "hungry","full","thirsty","thirstless","sleepy","awake","lightweight","heavyweight",
    "comfortable","uncomfortable","soft","hard","warm","cold","hot","cool","pleasant",
    "unpleasant","friendly","hostile","fun","dull","beautiful","ugly","bright","dim",
    "noisy","silent","clean","dirty","organized","messy","cheap","expensive"
}

-- 120+ connectives
Lexicon.connectives = {
    "because","so","but","and","or","if","then","although","while","however",
    "therefore","also","as","since","though","even though","unless","until",
    "when","whenever","where","wherever","before","after","once","as soon as",
    "as long as","as well as","in order to","in case","provided that","even if",
    "rather than","instead of","besides","moreover","furthermore","accordingly",
    "meanwhile","otherwise","consequently","nevertheless","nonetheless","thus",
    "hence","thereupon","whereas","yet","similarly","likewise","on the other hand",
    "on the contrary","in addition","in fact","for example","for instance",
    "in spite of","despite","regardless","alternatively","subsequently","prior to",
    "following","among","between","both","either","neither","nor","as well","than",
    "though","although","whereby","wherein","whereupon","whereafter","whence",
    "whither","henceforth","hereby","therein","thereafter","therefore","thereupon",
    "whereas","lest","so that","in order that","inasmuch as","as if","as though",
    "assuming that","given that","on condition that","supposing that","provided",
    "consequently","accordingly","ultimately","additionally","meanwhile","otherwise"
}

-- 120+ nouns
Lexicon.nouns = {
    "Roblox","game","computer","network","server","player","level","item",
    "chat","room","world","friend","team","score","mission","object","problem",
    "error","feature","account","avatar","inventory","quest","map","challenge",
    "event","task","reward","point","coin","badge","tool","weapon","armor",
    "monster","enemy","boss","character","npc","dialogue","story","mission",
    "platform","controller","keyboard","mouse","screen","button","menu","settings",
    "profile","clan","guild","rank","rankings","league","season","match","round",
    "timer","scoreboard","achievement","leveling","upgrade","skill","ability",
    "class","race","teamwork","strategy","plan","goal","objective","checkpoint",
    "zone","area","region","city","building","house","shop","market","item shop",
    "inventory","storage","chest","box","container","package","crate","bundle",
    "resource","material","currency","gem","token","badge","reward","bonus","gift",
    "treasure","key","door","gate","bridge","path","road","trail","forest","mountain",
    "river","lake","sea","ocean","desert","cave","dungeon","castle","temple","tower"
}

-- função Tag() como antes
function Lexicon.Tag(tokens)
    local tagged = {}
    for _, word in ipairs(tokens) do
        local tag = "unknown"
        for type, list in pairs({
            pronouns = Lexicon.pronouns,
            verbs = Lexicon.verbs,
            adjectives = Lexicon.adjectives,
            connectives = Lexicon.connectives,
            nouns = Lexicon.nouns
        }) do
            for _, w in ipairs(list) do
                if w:lower() == word:lower() then
                    tag = type
                    break
                end
            end
        end
        table.insert(tagged, {word = word, tag = tag})
    end
    return tagged
end

return Lexicon
