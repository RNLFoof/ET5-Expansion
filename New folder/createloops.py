# mp3s don't seem to have their positions reported correctly (which the intro needs) so the intro is a wav
# wavs don't seem to consistently loop correctly (which the loop needs) so the loop is an mp3
# it's gross I know. but the saudio documentation was deleted years ago and it works so I'm keeping it

import os, shutil

dir = "S:\Code\GML\Projects\ET5-Expansion\Music"
format = ""#"-f wav -bitexact -acodec pcm_s16le -ar 22050 -ac 1"  # Putting this everywhere because some songs wouldn't loop and I wanted to normalize everything. I don't actually know what exactly this does LOL

def system(s):
    print(s)
    os.system(s)
    print()

files = os.listdir(dir)
for file in files:
    if file.endswith("Full.wav"):
        songname = file.removesuffix("Full.wav")
        introfilename = songname+"Intro.wav"
        loopfilename = songname+"Loop.mp3"
        intropath = os.path.join(dir, introfilename)
        looppath = os.path.join(dir, loopfilename)
        if introfilename in files and loopfilename in files:
            continue

        fullpath = os.path.join(dir, file)
        print(fullpath)
        system(f'pymusiclooper -e "{fullpath}"')

        for t, ext in [("Intro", ".wav"), ("Loop", ".mp3")]:
            at = os.path.join(dir, "Loops", file+"-"+t.lower()+".wav")
            shouldbeat = os.path.join(dir, songname+t+ext)
            system(f'ffmpeg -y -i "{at}" {format} "{shouldbeat}"')

        tempintropath = os.path.join(dir, songname+"TempIntro.wav")  # bc sox hates mp3s
        tempstartpath = os.path.join(dir, songname+"Start.wav")
        tempendpath = os.path.join(dir, songname+"End.wav")
        system(f"""ffmpeg -y -i "{intropath}" {format} "{tempstartpath}""")
        system(f"""ffmpeg -y -t 00:00:05 -i "{looppath}" {format} "{tempendpath}""")
        system(f"""sox "{tempstartpath}" "{tempendpath}" "{tempintropath}" """)
        system(f"""ffmpeg -y -i "{tempintropath}" {format} "{intropath}""")
        os.remove(tempintropath)
        os.remove(tempstartpath)
        os.remove(tempendpath)