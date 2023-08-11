# Optix DevHub
"*Development just has to be connected*"
---

## About

The objective of Optix DevHub is to create a simple but powerful productivity solution for both solo developers & team developers, built on top of the **Lua** programming language.

## What to implement:

- [X] Connect to remote Git repositories and clone them onto user's selected location.
- [ ] Send PRs, commits, and more.
- [ ] Implement Projects
    - [X] Basic Projects
    - [ ] Advanced Projects
        - [ ] Project setups
        - [X] Project files
        - [X] Project updating
            - [ ] Secure project updating
        - [ ] Project sharing
        - [ ] JSON -> SQLite migration
        - [ ] Recordings
- [X] Multiple languages
- [ ] Accounting system
- [ ] GUI
    - [ ] GUI based on the Umbra design system (Link to Figma (very) soon)

## Documentation

### Set up

You will need to install Lua to work on this project. Also you will need the Luarocks Package Manager to install the libraries we use.
Libraries:
- LuaSocket
- RapidJSON
- LuaFileSystem
- SQLite

First, install Lua 5.3 from [their website](https://lua.org), or if you're on Linux make it faster from your terminal.
- **Debian or Ubuntu**
```bash
sudo apt-get install lua5.3
```
- **Fedora or CentOS**
```bash
sudo dnf install lua
```
- **Arch**
```bash
sudo pacman -S lua
```

After that, install [the Luarocks package manager](https://luarocks.org), and install the following packages:
```bash
[sudo] luarocks install [package name]
```
The names are
**luasocket**
**rapidjson**
**lfs**
**lsqlite3**

- LuaSocket: For HTTP requests.
- RapidJSON: JSON encoding and decoding.
- LuaFileSystem: LFS is a library for easier access to the users file system.
- SQLite 3: SQLite integration for Lua.
<!-- - LGI: GObject integration for Lua, brings Gtk, Gdk, Pango, etc... For GUIs. -->

## Editing

When writing code, follow the [code guidelines](https://optix.rf.gd/apps/devhub/docs.php#writing)

## Testing

Open up a terminal. It will probably open on the source directory. Enter the `src` directory:
```bash
cd src
```
```bash
lua main.lua
```

Well, that's it! You're now ready to write some fancy code on this project. Have fun and thanks for contributing!

## Credits

- [The Lua programming language (made by PUC-Rio)](https://lua.org)
<!--this is actually here because it needs to be: i just noticed Lua required this for it's usage XD
they deserve it tho, lua is just so cool-->

Copyright &copy; 1994–2023 Lua.org, PUC-Rio.