-- First, project name.
-- We define name-checking functions before asking for the name.
local projectsFile = io.open(ProjectFilePath, "r")

local function isExistingProject(projectName)
    if projectsFile then
        projectsFile:seek("set")
        local line = projectsFile:read()
        while line do
            local decodedLine = JSON.decode(line)
            if decodedLine and decodedLine.pName == projectName then
                return true
            end
            line = projectsFile:read()
        end
    end
    return false
end

-- This will loop itself until you provide a valid name
local projectName

local isProjectNameValid = false
while not isProjectNameValid do
    print(translate("createNameYourProject"))
    projectName = ReadInput("")
    if isExistingProject(projectName) then
        print(translate("ERR_ProjectNameAlreadyUse"))
    else
        print(translate("SUC_ProjectNamed"))
        isProjectNameValid = true
        break
    end
end

-- We close the file if it was successfully opened
if projectsFile then
    projectsFile:close()
end

print(translate("createNameYourRepo"))
local projectRepo = ReadInput("")

local defaultPath = HomeDir .. OsSeparator .. "odh-" .. projectName
print(translate("createNameYourPath", defaultPath))
local projectPath = ReadInput("")
if projectPath == "" then
    projectPath = defaultPath
end

print(translate("ConfirmYoureCreatingProject", projectName, projectPath, projectRepo))
local hasConfirmed = false

local function createProject(name, path, repo)
    -- Check for directory
    local attrs = lfs.attributes(path)
    local canGit = false

    -- As these are only check messages, they're not translated.
    if attrs then
        print("Directory is ok.")
        canGit = true
    else
        local mkdir = lfs.mkdir(path)

        if mkdir then
            canGit = true
            print("Directory didn't exist and was created. Ok.")
        else
            print(translate("ERR_MKDIRNewProject"))
        end
    end

    local gitCmd = string.format("git clone %s %s", repo, path)
    if canGit == true then
        local gitSuc = os.execute(gitCmd)
        if gitSuc then
            local dbFile = io.open(ProjectFilePath, "a")

            if dbFile then
                local data = {
                    pName = name,
                    pPath = path,
                    pRepo = repo
                }

                dbFile:seek("end")
                dbFile:write(JSON.encode(data) .. "\n")
                dbFile:flush()
                dbFile:close()

                print(translate("SUC_ProjectCreated", name, path))
            else
                print(translate("ERR_ProjectNotCreated"))
            end
        else
            print(translate("ERR_ProjectNotCreated"))
        end
    end
end

repeat
    local confirms = ReadInput("")
    if confirms == "y" or confirms == "s" then
        createProject(projectName, projectPath, projectRepo)
        hasConfirmed = true
    elseif confirms == "n" then
        print(translate("CanceledProjectCreation"), projectName)
        hasConfirmed = true
    else
        print(translate("ERR_ConfirmYoureCreatingProject"))
    end
until hasConfirmed

-- SLEEP (3)
os.execute(Sleepcmd)
os.execute(Sleepcmd)
os.execute(Sleepcmd)

-- Open the project you just created, i guess
print("")
dofile("open.lua")