if global.cheat_LOAD_MUSIC_AS_NEEDED=true && ds_list_find_index(global.loadedmusic,argument0)=-1
{
    var fnamemp3, fnamewav;
    fnamemp3 = working_directory+"\Music\"+argument0+".mp3";
    fnamewav = working_directory+"\Music\"+argument0+".wav";
    if path_exists(fnamemp3) {
        saud_Load(fnamemp3,argument0);
        ds_list_add(global.loadedmusic,argument0);
    }
    else if path_exists(fnamewav) {
        saud_Load(fnamewav,argument0);
        ds_list_add(global.loadedmusic,argument0);
    }
    else {
        show_message("Attempted to load " + argument0 + " which doesn't EXIST")
    }
}
mid = argument0;
