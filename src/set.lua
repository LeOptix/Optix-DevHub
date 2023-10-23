print(translate("settingsLabel"))
print("")

-- Exact same as in config file
local function changeLangFunction()
    local languageToUse = ReadInput(TerminalTextColorYellow .. "SELECT LANGUAGE\nES - ESPAÑOL\nEN - ENGLISH\n(USE LOWERCASE // USE MINÚSCULAS)\n" .. TerminalTextColorReset)

    local langFileContent = JSON.encode(languageToUse)
    local file = io.open(LangFilePath, "w")
    if file then
        file:write(langFileContent)
        file:close()
    else
        print(translate("ERR_SavingLangDataToJSON"))
    end
end

local UserGaveASetPrompt = false

while not UserGaveASetPrompt do
    print(translate("whatSettingsTheUserHas"))
    local userSetPrompt = ReadInput("")
    if userSetPrompt == "lang" then
        UserGaveASetPrompt = true
        os.execute(ClearCLIcmd)
        changeLangFunction()
    elseif userSetPrompt == "sex" then
        print("Message received. Sex.")
    else
        print(translate("ERR_WhatToDoAtSet"))
    end
end

dofile("main.lua")