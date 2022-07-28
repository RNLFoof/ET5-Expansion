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
import os
import filecmp
import re
from datetime import datetime
from enum import Enum

gm81path = r"et5.gm81"
dtpath = r"et5"

class Target(Enum):
    gm81 = "gm81"
    dt = "dir tree"

def done():
    print("Hit enter to close.")
    input()
    exit(-1)
    
def printandrun(s):
    print()
    print(f"Running: {s}")
    os.system(s)
    print()

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
    # Transfer changes from temp to the real one
    for root, dirs, files in os.walk(temppath):
        for file in files:
            tempfullpath = os.path.join(root, file)
            dtfullpath = os.path.join(dtpath, re.sub(r"^.*?($|[\/\\])", "", root), file)
            dtfullpathexists = os.path.exists(dtfullpath)
            if not dtfullpathexists or not filecmp.cmp(dtfullpath, tempfullpath): # If they aren't equal, there was a change
                print(f"Gonna copy {tempfullpath} to {dtfullpath}")
                if dtfullpathexists:
                    os.remove(dtfullpath)
                shutil.copy(tempfullpath, dtfullpath)
    # Delete files that no longer exist in temp
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