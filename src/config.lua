-- REQUIRE STATEMENTS & GLOBAL VARIABLES
HTTP = require "socket.http" -- LuaSocket - Allows HTTP requests.
JSON = require "rapidjson" -- RapidJSON - JSON encoding & decoding.
LFS = require "lfs" -- LuaFileSystem - Easier usage of user's file systems.
-- SQL = require "lsqlite3"

OsSeparator = package.config:sub(1, 1) -- The OS separator is different between Windows & Linux.
ClearCLIcmd = "" -- Global command to clear the terminal
if OsSeparator == '\\' then
    ClearCLIcmd = "cls"
else
    ClearCLIcmd = "clear"
end

-- CLI INPUT PROCESSING
function ReadInput(prompt)
    io.write(prompt .. ": ")
    io.flush()
    return io.read()
end

-- TERMINAL FORMATS
TerminalTextColorRed = "\27[31m"
TerminalTextColorGreen = "\27[32m"
TerminalTextColorYellow = "\27[33m"
TerminalTextColorBlue = "\27[36m"
TerminalTextColorMagenta = "\27[35m"

TerminalTextFormatBold = "\27[1m"
TerminalTextFormatUnderline = "\27[4m"
TerminalTextFormatItalic = "\27[3m" -- May not be supported by all CLIs

TerminalTextBackgroundRed = "\27[30;41m"
TerminalTextBackgroundGreen = "\27[30;42m"
TerminalTextBackgroundBlue = "\27[30;44m"

TerminalTextColorReset = "\27[0m" -- Add this after formatted sentences.

-- FILE PATHS
HomeDir = os.getenv("HOME") or os.getenv("USERPROFILE") or ""
AppDirPath = HomeDir .. OsSeparator .. ".OptixDevHub"
ProjectFilePath = AppDirPath .. OsSeparator .. "projects.json"
LangFilePath = AppDirPath .. OsSeparator .. "lang.json"

-- TRANSLATIONS - This is kinda long, lol.
-- EN - ENGLISH
TRANS_EN_LoadText =  TerminalTextColorMagenta .. "Optix DevHub is loading..." .. TerminalTextColorReset
TRANS_EN_WelcomeText = TerminalTextFormatBold .. TerminalTextBackgroundBlue .. "Welcome to Optix DevHub" .. TerminalTextColorReset
TRANS_EN_LuaorgCopyright = TerminalTextColorBlue .. "Copyright © 1994-2023 Lua.org, PUC-Rio.\n" .. TerminalTextColorReset
TRANS_EN_ERR_ProjectFilesOnStart = "There was an error reading the database - Error code: DBx001"
TRANS_EN_SUC_ProjectFilesOnStart = "Success reading the database"
TRANS_EN_WhatUserCanDoAtStart = "Options:\n" .. TerminalTextFormatBold .. "open" .. TerminalTextColorReset .. " Open up a project\n" .. TerminalTextFormatBold .. "new" .. TerminalTextColorReset .. " Create a new project\n" .. TerminalTextFormatBold .. "set" .. TerminalTextColorReset .. " Change Optix DevHub's settings\n" .. TerminalTextFormatBold .. "help" .. TerminalTextColorReset .. " Get some help\n" .. TerminalTextFormatBold .. "about" .. TerminalTextColorReset .. " Credits and more" .. TerminalTextFormatBold .. "exit" .. TerminalTextColorReset .. " Quit Optix DevHub"
TRANS_EN_whatSettingsTheUserHas = "Options:\n" .. TerminalTextFormatBold .. "lang" .. TerminalTextColorReset .. " Change your language\n" .. "More options to be added soon!" .. TerminalTextColorReset
TRANS_EN_ERR_WhatToDoAtStart = TerminalTextColorRed .. "\nUnknown option. Error.\n" .. TerminalTextColorReset
TRANS_EN_ERR_WhatToDoAtSet = TerminalTextColorRed .. "\nUnknown option. Error.\n" .. TerminalTextColorReset
TRANS_EN_UserQuittedProgram = "\nLeaving Optix DevHub. See you, bro!\n"
TRANS_EN_ComingSoon = "\nComing soon!\n"
TRANS_EN_ERR_Gitnt = TerminalTextFormatBold .. TerminalTextBackgroundRed .. "Git is not installed. You must install it for Optix DevHub to work." .. TerminalTextColorReset
TRANS_EN_createNameYourProject = "Name your project"
TRANS_EN_ERR_ProjectNameAlreadyUse = TerminalTextColorRed .. "\nThe project already exists. Try with another name!" .. TerminalTextColorReset
TRANS_EN_SUC_ProjectNamed = TerminalTextColorGreen .. "\n¡Perfect! Lets continue" .. TerminalTextColorReset
TRANS_EN_createNameYourRepo = "\nWhat is the URL of the repository?"
TRANS_EN_createNameYourPath = "\nWhere will you save it? By default %s"
TRANS_EN_ConfirmYoureCreatingProject = TerminalTextColorMagenta .. "\n Create the project %s at %s using %s as the repo for the project? (y/n)" .. TerminalTextColorReset
TRANS_EN_ERR_ConfirmYoureCreatingProject = TerminalTextColorRed .. "\nUnknown key (y/n)\n" .. TerminalTextColorReset
TRANS_EN_ERR_MKDIRNewProject = TerminalTextColorRed .. "\nError: Directory %s doesn't exist AND there was an error creating it.\n" .. TerminalTextColorReset
TRANS_EN_SUC_ProjectCreated = TerminalTextBackgroundGreen .. "\nProject %s was successfully created at %s! You can program now ;]" .. TerminalTextColorReset
TRANS_EN_ERR_ProjectNotCreated = TerminalTextColorRed .. "\nError: There was an error creating your project" .. TerminalTextColorReset
TRANS_EN_settingsLabel = TerminalTextFormatBold .. TerminalTextBackgroundBlue .. "Settongs" .. TerminalTextColorReset

TRANS_EN_AboutDevHub = "test (but in english)"

-- ES - SPANISH
TRANS_ES_LoadText = TerminalTextColorMagenta .. "Optix DevHub está cargando..." .. TerminalTextColorReset
TRANS_ES_WelcomeText = TerminalTextFormatBold .. TerminalTextBackgroundBlue .. "Bienvenido a Optix DevHub" .. TerminalTextColorReset
TRANS_ES_LuaorgCopyright = TerminalTextColorBlue .. "Copyright © 1994-2023 Lua.org, PUC-Rio.\n" .. TerminalTextColorReset
TRANS_ES_ERR_ProjectFilesOnStart = "Hubo un error leyendo la base de datos - Código de error: DBx001"
TRANS_ES_SUC_ProjectFilesOnStart = "Éxito leyendo la base de datos"
TRANS_ES_WhatUserCanDoAtStart = "Opciones:\n" .. TerminalTextFormatBold .. "open" .. TerminalTextColorReset .. " Abrir un proyecto\n" .. TerminalTextFormatBold .. "new" .. TerminalTextColorReset .. " Crear un proyecto nuevo\n" .. TerminalTextFormatBold .. "set" .. TerminalTextColorReset .. " Ajustar los ajustes de Optix DevHub\n" .. TerminalTextFormatBold .. "help" .. TerminalTextColorReset .. " Ayuda para usar el programa\n" .. TerminalTextFormatBold .. "about" .. TerminalTextColorReset .. " Creditos y demás\n" .. TerminalTextFormatBold .. "exit" .. TerminalTextColorReset .. " Salir de Optix DevHub"
                                                                                                                                                                                                                                                                                                    -- ^ This one is written this particular way in purpose. Its a little bit annoying. Lol.
TRANS_ES_whatSettingsTheUserHas = "Opciones:\n" .. TerminalTextFormatBold .. "lang" .. TerminalTextColorReset .. " Cambiar tu idioma\n" .. "¡Mas opciones pronto!" .. TerminalTextColorReset
TRANS_ES_ERR_WhatToDoAtStart = TerminalTextColorRed .. "\nOpción desconocida. Error.\n" .. TerminalTextColorReset
TRANS_ES_ERR_WhatToDoAtSet = TerminalTextColorRed .. "\nOpción desconocida. Error.\n" .. TerminalTextColorReset
TRANS_ES_UserQuittedProgram = "\nSaliendo de Optix DevHub. ¡Nos vemos, amigo!\n"
TRANS_ES_ComingSoon = "\n¡Pronto disponible!\n"
TRANS_ES_ERR_Gitnt = TerminalTextFormatBold .. TerminalTextBackgroundRed .. "Git no está instalado. Debes instalarlo para que Optix DevHub funcione." .. TerminalTextColorReset
TRANS_ES_createNameYourProject = "Ponle nombre a tu proyecto"
TRANS_ES_ERR_ProjectNameAlreadyUse = TerminalTextColorRed .. "\nEl proyecto ya existe. ¡Intenta con otro nombre!" .. TerminalTextColorReset
TRANS_ES_SUC_ProjectNamed = TerminalTextColorGreen .. "\n¡Perfecto! Sigamos" .. TerminalTextColorReset
TRANS_ES_createNameYourRepo = "\n¿Cuál es la URL del repositorio?"
TRANS_ES_createNameYourPath = "\n¿Dónde lo guardarás? Por defecto %s"
TRANS_ES_ConfirmYoureCreatingProject = TerminalTextColorMagenta .. "\n¿Crear el proyecto %s en %s usando %s como repositorio del proyecto? (s/n)" .. TerminalTextColorReset
TRANS_ES_ERR_ConfirmYoureCreatingProject = TerminalTextColorRed .. "\nTecla desconocida (s/n)\n" .. TerminalTextColorReset
TRANS_ES_ERR_MKDIRNewProject = TerminalTextColorRed .. "\nError: El directorio %s no existe Y hubo un error creándolo.\n" .. TerminalTextColorReset
TRANS_ES_SUC_ProjectCreated = TerminalTextBackgroundGreen .. "\n¡El proyecto %s fue creado con éxito en %s! Ya puedes programar ;]" .. TerminalTextColorReset
TRANS_ES_ERR_ProjectNotCreated = TerminalTextColorRed .. "\nError: Hubo un error creando tu proyecto" .. TerminalTextColorReset
TRANS_ES_settingsLabel = TerminalTextFormatBold .. TerminalTextBackgroundBlue .. "Configuración" .. TerminalTextColorReset

TRANS_ES_AboutDevHub = "test (pero en español)"

-- TRANSLATIONS FUNCTIONALITY
CurrentUserLanguage = "en"

function SetLanguage(lang)
    CurrentUserLanguage = lang
end

function translate(key, ...)
    local translation
    if CurrentUserLanguage == "en" then
        translation = _G["TRANS_EN_" .. key]
    elseif CurrentUserLanguage == "es" then
        translation = _G["TRANS_ES_" .. key]
    else
        -- Fallback to English if the current language is not supported
        translation = _G["TRANS_EN_" .. key]
    end

    if not translation then
        return key -- Return the original string if no translation is available
    else
        return string.format(translation, ...) -- Substitute variables using string.format
    end
end

-- GET USER LANGUAGE
local languageSavedData = io.open(LangFilePath, "r")

if languageSavedData then
    local langFileContent = languageSavedData:read("*all")
    languageSavedData:close()

    if JSON.decode(langFileContent) == "es" then
        languageToUse = "es"
    elseif JSON.decode(langFileContent) == "en" then
        languageToUse = "en"
    else
        if languageToUse == nil then
            languageToUse = ReadInput(TerminalTextColorYellow .. "SELECT LANGUAGE\nES - ESPAÑOL\nEN - ENGLISH\n(USE LOWERCASE // USE MINÚSCULAS)\n" .. TerminalTextColorReset)

            -- Save the chosen language as JSON to the file.
            local langFileContent = JSON.encode(languageToUse)
            local file = io.open(LangFilePath, "w")
            if file then
                file:write(langFileContent)
                file:close()
            else
                print(translate("ERR_SavingLangDataToJSON"))
            end
        end
    end
end

if languageToUse == "en" then
    CurrentUserLanguage = "en"
elseif languageToUse == "es" then
    CurrentUserLanguage = "es"
else
    print(TerminalTextColorRed .. "\nNo valid language code given. Fallback to English.\n" .. TerminalTextColorReset)
    CurrentUserLanguage = "en"
end

print(translate("LoadText"))

-- PROJECT HANDLING

local function ensureDirectoryAndFileExist(directoryPath, fileName)
    local dirExists = lfs.attributes(directoryPath, "mode") == "directory"

    if not dirExists then
        local success, err = lfs.mkdir(directoryPath)
        if not success then
            return false, "Error creating directory: " .. err
        end
    end

    local filePath = directoryPath .. OsSeparator .. fileName
    local fileExists = lfs.attributes(filePath, "mode") == "file"

    if not fileExists then
        local file = io.open(filePath, "w")
        if not file then
            return false, "Error creating file"
        end
        file:close()  -- Close the file after creating it
    end

    return true, nil -- No error message in case of success
end

-- Call the function and handle the result
local projectFileExists = ensureDirectoryAndFileExist(AppDirPath, "projects.json")
local langFileExists = ensureDirectoryAndFileExist(AppDirPath, "lang.json")

if not projectFileExists then
    print(translate("ERR_ProjectFilesOnStart"))
    -- Close or exit here as needed
else
    print(translate("SUC_ProjectFilesOnStart"))
end

if not langFileExists then
    print(translate("ERR_LangFilesOnStart"))
    -- Close or exit here as needed
else
    print(translate("SUC_LangFilesOnStart"))
end

-- EXTRAS
-- Extra features

-- Check if the user has Git installed. If not, don't even try DevHub, it ain't do anything bro.
-- (btw should we add git to the credits too? idk as we're using it for the program but not directly ·-·)
function IsGitInstalled()
    local handle = io.popen("git --version")
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result:find("git version") ~= nil
    else
        return false
    end
end

if IsGitInstalled() then
    print("Git is installed.\n")
else
    print("Git is not installed.\n")
    print(translate("ERR_Gitnt"))
    os.exit(1)
end