-- namesynth
--
-- faked names for fake places



function namesynth()


-- Letters and dipgraphs
    local vowels = {"a", "e", "i", "o", "u"}
    local consonants = {"b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"}
    local consonant_clusters = {"bh", "bl", "br", "cc", "ch", "cl", "cr", "ck", "dg", "dr", "dj", "fl", "fr", "gh", "gl", "gn", "gr", "hk", "kl", "kn", "ll", "lm", "ln", "lv", "mm", "mn", "nc", "nd", "ng", "nk", "nt", "nv", "ph", "pl", "pr", "qu", "rh", "rr", "rth", "sc", "sh", "sl", "sm", "sn", "sp", "spr", "st", "str", "sw", "th", "tr", "tw", "wh", "wr", "zh", "zz"}
    local vowel_clusters = {"aa", "ae", "ai", "ao", "au", "ee", "ea", "ei", "eo", "eu", "ia", "ie", "io", "iu", "uu", "ua", "ue", "ui", "uo", "yy"}


-- Create empty name with a random length
    local name = ""
    local length = math.random(4, 6)
    local prev_letter_type


-- Pick the first letter
    if math.random(2) == 1 then
        name = name .. consonants[math.random(#consonants)]
        prev_letter_type = "consonant"
    else
        name = name .. vowels[math.random(#vowels)]
        prev_letter_type = "vowel"
    end


-- Alternate letter types for the rest of "length"
    for i = 1, length - 1 do
        local letter
        if prev_letter_type == "vowel" then
            if math.random() < 0.25 then
                letter = consonant_clusters[math.random(#consonant_clusters)]
            else
                letter = consonants[math.random(#consonants)]
            end
            prev_letter_type = "consonant"
        else
            if math.random() < 0.15 then
                letter = vowel_clusters[math.random(#vowel_clusters)]
            else
                letter = vowels[math.random(#vowels)]
            end
            prev_letter_type = "vowel"
        end
        name = name .. letter
    end


-- Capitalize the name
    return name:gsub("^%l", string.upper)
end


-- Write the namelist to a file
local file = io.open("names.txt", "w")
if file then
    for i = 1, 16 do
        local output = namesynth()
        file:write(output .. "\n")
    end
file:close()
end
