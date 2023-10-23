dofile("config.lua")

-- Welcome screen
os.execute(ClearCLIcmd)

print("------")

dofile("ascii.lua")

print(translate("LuaorgCopyright"))
print(translate("WelcomeText"))

print("------")

-- We ask what to do
-- A separate file for each option
-- NOTE: Don't add the dofile() statement inside the files used for each section,
-- they work without it. Adding it would make a few things go the way they shouldn't.
UserGaveAPrompt = false

while not UserGaveAPrompt do
    print(translate("WhatUserCanDoAtStart"))
    local userPrompt = ReadInput("")
    if userPrompt == "open" then
        UserGaveAPrompt = true
        os.execute(ClearCLIcmd)
        dofile("open.lua")
    elseif userPrompt == "new" then
        UserGaveAPrompt = true
        os.execute(ClearCLIcmd)
        dofile("create.lua")
    elseif userPrompt == "set" then
        UserGaveAPrompt = true
        os.execute(ClearCLIcmd)
        dofile("set.lua")
    elseif userPrompt == "help" then
        UserGaveAPrompt = true
        os.execute(ClearCLIcmd)
        dofile("help.lua")
    elseif userPrompt == "about" then
        UserGaveAPrompt = true
        os.execute(ClearCLIcmd)
        dofile("about.lua")
    elseif userPrompt == "exit" then
        os.execute(ClearCLIcmd)
        print(translate("UserQuittedProgram"))
        os.exit(0)
    else
        print(translate("ERR_WhatToDoAtStart"))
    end
end