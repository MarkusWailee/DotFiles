import os
import platform


class SymlinkManager:
    def __init__(self, allowed_root):
        self.allowed_root = ""
        self.src_dir = ""
        self.links = {}

    def SetDir(self, dir):
        self.src_dir = os.path.join(os.getcwd(), dir)

    def Add(self, file, dest):
        self.links[os.path.join(self.src_dir, file)] = os.path.join(dest, file)

    def LinkPaths(self):
        print("Starting...")
        for src, dest in self.links.items():
            if not dest.startswith(self.allowed_root):
                print("Access not allows for ", dest)
                continue
            if os.path.exists(dest):
                # print("Replace " + dest + "?")
                # result = input("[Y/N]: ").lower()
                # if result == "y":
                #     os.remove(dest)
                # else:
                #     continue
                print("Please remove " + dest)
                continue
            os.symlink(src, dest)


# this symlinkmanager works like state machine with SetDir


home = os.path.expanduser('~')

if platform.system() == "Windows":
    print("\n\n")
    print("Window Detected")
    windows = SymlinkManager(home)

# sets relative dir to windows
    windows.SetDir("windows")

    windows.Add(".glzr",            home)
    windows.Add("cmake-kits.json",  home)

# sets relative dir to windows
    windows.SetDir("common")

    windows.Add(".wezterm.lua",     home)
    windows.Add("yazi",             home + "\\AppData\\Roaming")

    try:
        windows.LinkPaths()
    except Exception as e:
        print("Exception ERROR")
        print(e)
elif platform.system() == "Linux":
    print("Linux detected")
