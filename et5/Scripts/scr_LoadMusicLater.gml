if global.cheat_LOAD_MUSIC_AS_NEEDED=true && ds_list_find_index(global.loadedmusic,argument0)=-1
{
    saud_Load(working_directory+"\Music\"+argument0+".mp3",argument0);
    ds_list_add(global.loadedmusic,argument0);
}
mid = argument0;
