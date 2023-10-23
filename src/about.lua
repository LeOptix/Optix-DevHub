print("------")

dofile("ascii.lua")
print(translate("LuaorgCopyright"))
print(translate("AboutDevHub"))

local exit = ReadInput("")

if exit then
    dofile("main.lua")
end