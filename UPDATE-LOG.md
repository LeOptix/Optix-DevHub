# Optix DevHub UPDATE LOG
Release system:
- a-x.x.x - alpha version
- b-x.x.0 - beta version
- x.0.0 - stable / main release
- x.x.x-NA - New Architecture

## Version 0.0.9 NA
- Rewrited the program from scratch.

---
> ***Versions under here are all from the Optix DevHome old architecture***
## Version 0.0.9
- Implemented translating
- Diversification of the code
## Version 0.0.8
- Fixed bugs with project opening.
- GUI version has been deprecated: It's not a priority and it's slowing down development for now.
**These need reviewing (have errors):**
- Implemented update submitting: Submit a Pull Request or a Direct Commit with ease to the source repo.
- Implemented project removing.
- Improved error handling + Now some errors are named and documented (see https://optix.rf.gd/apps/devhome/errors).
## Version 0.0.7
- It's over. Finally. WE SWITCH TO JSON! Using `.optixData` was a non-sense.
- Project name safety
- - Now you can't have two projects named the same.
- - Unlike before, the project data won't be written until the project is created
- Project searching - Now you can spot your projects and see their data from the program.
- Project updating - Now you can replace your project with the latest changes from the Git repo.
- Added coloring to many prompts - "cause' life is better in color"
## Version 0.0.6
- Refactor of the GUI
- (Unsuccessful) attemps to implement project opening
- Aditional changes to codebase
- Upload of logo and favicon
## Version 0.0.5
- Succesfully implemented .optixData parsing (now need to add a function)
- Upload of `windows.lua`, GTK based GUI version of Optix DevHome. **Needs reviewing**.
## Version 0.0.4
- Finally, HALF implementation of the .optixData parser
- Renamed some variables
- Optimised the code
- Some works to UX
- - Creation of a home menu
- - Added `about` command (Soon also a `help` command)
- - Now prompts are colored to create visual meaning
- Optimised .optixData files
- Added the GUI-mode option (currently not working as `windows.lua` will wait for version `0.0.5`)
- Added an ASCII on startup. Because, why not?
## Version 0.0.3
- Implemented a main menu
- Fixed a bug that messed up the default project location
- Changed our "custom format", now it is .optixData
- [Non working yet] Attemp to parse .optixData files, so Lua can understand it's structure.
- Changed the default folder from dhr- (DevHome Repo) to dhp- (DevHome Project)
- Renamed some variables to avoid naming problems
- Refactored (again) the code, by making it even more modular.

## Version 0.0.2
- Successfully implemented project saving, currently in (user_dir)/OptixDevHome/projects.OPTdhData
- Organised the code by using some global variables in config.lua. (Note: local variables are still highly recommended.)

## Version 0.0.1 - Released 08/07/2023
- First actual PR!
- Implemented Git cloning and directory creating