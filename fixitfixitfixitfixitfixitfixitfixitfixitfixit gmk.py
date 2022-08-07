# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK
# USE AT YOUR OWN RISK

# Creates a new gm81 from the directory tree or vice versa based on which was edited more recently (or which one exists).
# Also only replaces dir tree files that were actually modified, so that GitHub Desktop has an easier time knowing what the deal is.
# Problem with this vs. the .bats is that you need Python installed.

# To do:
# - Replace the regex bits so it's not slow as hell
# - Make it make a lil noise when it's done or fails
# - Make it save the timestamp of the last run so that if you modify both it can yell at you
# - Maybe add a progress bar that would be cool

import pickle
import shutil
import traceback
import os
import filecmp
import re
from datetime import datetime
from enum import Enum
from pathlib import Path

gm81path = r"et5.gmk"
dtpath = r"et5"

soundfailure = "et5\Sounds\Sound\ExExploding.wav"
soundsucceed = "et5\Sounds\Sound\SaveHappified.wav"
soundunlock = "et5\Sounds\Sound\BeastUnlock1.wav"

class Target(Enum):
    gm81 = "gm81"
    dt = "dir tree"

def done(code=1):
    print("Hit enter to close.")
    playsound(soundsucceed if code == 0 else soundfailure)
    input()
    exit(code)
    
def printandrun(s):
    print()
    print(f"Running: {s}")
    os.system(s)
    print()
    
def playsound(path):
    # In its own little try because it doesn't really matter
    try:
        import winsound
        winsound.PlaySound(path, winsound.SND_FILENAME)
    except:
        pass

try:
    # Which ones exist?
    gm81exists = os.path.exists(gm81path)
    dtexists = os.path.exists(dtpath)
    if not gm81exists and not dtexists:
        print("Neither one exists dumbass")
        done()
    elif not gm81exists:
        print("gm81 doesn't exist...")
        replacing = Target.gm81
    elif not dtexists:
        print("dir tree doesn't exist...")
        replacing = Target.dt

    # Which is oldest?
    if gm81exists:
        gm81age = os.stat(gm81path).st_mtime
        print(f"gm81 was last modified {datetime.now() - datetime.fromtimestamp(gm81age)} ago...")
    if dtexists:
        dtage = 0
        for root, dirs, files in os.walk(dtpath):
            for file in files:
                fullpath = os.path.join(root, file)
                dtage = max(dtage, os.stat(fullpath).st_mtime)
        print(f"dir tree was last modified {datetime.now() - datetime.fromtimestamp(dtage)} ago...")
    if gm81exists and dtexists:
        replacing = Target.gm81 if gm81age < dtage else Target.dt

    # ok go
    print(f"Replacing {replacing.value}.")

    if replacing == Target.gm81:
        if gm81exists:
            os.remove(gm81path)
        printandrun(f"gmksplit {dtpath} {gm81path}")
    elif replacing == Target.dt:
        temppath = "temptree"
        # Delete temp (duh)
        if os.path.exists(temppath):
            shutil.rmtree(temppath)
        # Remake temp
        printandrun(f"gmksplit {gm81path} {temppath}")
        if not os.path.exists(temppath):
            print("Pretty sure that command failed.")
            done()
        print("The temp tree has been made, you don't have to worry about making changes to the gm81. (Not sure if you /ever/ have to worry about that, but)")
        playsound(soundunlock)
        # Transfer changes from temp to the real one
        for fromdir, dirs, files in os.walk(temppath):
            todir = os.path.join(dtpath, re.sub(r"^.*?($|[\/\\])", "", fromdir))
            for file in files:
                fromfile = os.path.join(fromdir, file)
                tofile = os.path.join(todir, file)
                tofileexists = os.path.exists(tofile)
                if not tofileexists or not filecmp.cmp(tofile, fromfile): # If they aren't equal, there was a change
                    print(f"Gonna copy {fromfile} to {tofile}")
                    if tofileexists:
                        os.remove(tofile)
                    Path(todir).mkdir(parents=True, exist_ok=True)
                    shutil.copy(fromfile, tofile)
        # Delete files that no longer exist in temp
        # This walks through the other tree so it can't be the same loop
        for root, dirs, files in os.walk(dtpath):
            for file in files:
                dtfullpath = os.path.join(root, file)
                tempfullpath = os.path.join(temppath, re.sub(r"^.*?($|[\/\\])", "", root), file)
                tempfullpathexists = os.path.exists(tempfullpath)
                if not tempfullpathexists:
                    print(f"Gonna delete {dtfullpath} bc {tempfullpath} doesn't exist")
                    os.remove(dtfullpath)
        # Delete temp (duh)
        if os.path.exists(temppath):
            shutil.rmtree(temppath)
    print("ok done")
    done(0)
except:
    print(traceback.format_exc())
    done()