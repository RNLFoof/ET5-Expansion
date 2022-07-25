f=file_text_open_write("EvilToaster5_save");
file_text_write_string(f,"room_goto("+string(room)+")
MainApple.x="+string(MainApple.x)+"
MainApple.y="+string(MainApple.y)+"
global.maxlives[0] = "+string(global.maxlives[0])+"
global.levels[0] = "+string(global.levels[0])+"
global.splapatonce[0] = "+string(global.splapatonce[0])+"
global.swimsuit[0] = "+string(global.swimsuit[0])+"
global.toastblasting[0] = "+string(global.toastblasting[0])+"
global.finalunlocked[0] = "+string(global.finalunlocked[0])+"
global.groppleup[0] = "+string(global.groppleup[0])+"
global.discount[0] = "+string(global.discount[0])+"
global.tjump[0] = "+string(global.tjump[0])+"
global.ssmash[0] = "+string(global.ssmash[0])+"
global.chapter[0] = "+string(global.chapter[0])+"
global.hover[0] = "+string(global.hover[0])+"
global.run[0] = "+string(global.run[0])+"
global.charge[0] = "+string(global.charge[0])+"
global.spowers[0] = "+string(global.spowers[0])+"
global.itemspace[0] = "+string(global.itemspace[0])+"
global.trials[0] = "+string(global.trials[0])+"
global.firstlevel[0] = "+string(global.firstlevel[0])+"
global.maxsplapples[0] = "+string(global.maxsplapples[0])+"

global.usespawnpoint = "+string(global.usespawnpoint)
);
file_text_close(f);
