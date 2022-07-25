/*
if file_exists("EvilToaster5_cheats") 
{
    execute_file("EvilToaster5_cheats");
    with(obj_CheatsBox) execute_string("image_index=global.cheat_"+string_replace_all(string_replace_all(s,"-","_")," ","_"));
}
else
{
    with(obj_CheatsBox) execute_string("global.cheat_"+string_replace_all(string_replace_all(s,"-","_")," ","_")+"="+string(image_index));
    global.cheat_MOUSE_ON_MENU=true;
    global.cheat_NO_GROPPLE_PENALITY=true;
    global.cheat_DOUBLE_JUMP_INDICATOR=true;
};
exit;*/

with(obj_CheatsBox) image_index=0;
/*with(302993) image_index=1;
with(303016) image_index=1;
with(303025) image_index=1;
with(303043) image_index=1;*/
global.cheat_exvar_1=0;
global.cheat_exvar_2_1=false;
global.cheat_exvar_2_2=false;
global.cheat_exvar_2_3=false;
global.cheat_exvar_2_4=false;
global.cheat_exvar_2_5=false;
global.cheat_exvar_2_6=false;

if file_exists("EvilToaster5_cheats") execute_file("EvilToaster5_cheats");
with(obj_CheatsBox) execute_string("global.cheat_"+string_replace_all(string_replace_all(s,"-","_")," ","_")+"="+string(image_index));
