include("config.lua")

local function replaceBadWords(text)
    for _, word in ipairs(censored_words) do
        local pattern = "%f[%a]%s?" .. word .. "%f[%A]"
        local replacement = string.rep("*", #word)
        text = text:gsub(pattern, replacement)
    end
    return text
end

hook.Add("PlayerSay", "CensorChat", function(ply, text, teamchat)
    local censoredText = replaceBadWords(text)
        return censoredText
end)
