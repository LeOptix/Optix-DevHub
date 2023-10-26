print(translate("TheseAreYourProjects"))

local dbFile = io.open(ProjectFilePath, "r")

local UserGaveAnOpenPrompt = false

if dbFile then
    local jsonData = dbFile:read("*all")
    dbFile:close()

    local objects = {}
    for object in jsonData:gmatch('({.-})') do
        table.insert(objects, object)
    end

    local entryCounter = 1 --DONT YOU DARE TO START ARRAYS / LISTS / WHATEVER WITH 0 LIKE OTHER LANGUAGES DO!1!!

    while not UserGaveAnOpenPrompt do
        for i, object in ipairs(objects) do
            local decodedData = JSON.decode(object)
            print(TerminalTextFormatBold .. i .. ". Project Name: " .. TerminalTextColorReset .. TerminalTextColorBlue .. decodedData.pName .. TerminalTextColorReset)
            entryCounter = entryCounter + 1
        end

        local whichOneToOpen = tonumber(ReadInput(""))

        if whichOneToOpen and whichOneToOpen >= 1 and whichOneToOpen <= entryCounter - 1 then
            UserGaveAnOpenPrompt = true
            local selectedEntry = JSON.decode(objects[whichOneToOpen])
            print(translate("OpeningProject", TerminalTextColorBlue .. selectedEntry.pName .. TerminalTextColorReset, whichOneToOpen))
        else
            print(translate("ERR_InvalidNumber"))
        end
    end
end
