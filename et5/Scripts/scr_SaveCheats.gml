f=file_text_open_write("EvilToaster5_cheats");
global.tempvar="";//stuff to save goes onto this

//with(obj_CheatsBox) 
//{
//global.tempvar+="global.cheat_"+string_replace_all(s," ","_")+"="+string(image_index)+";
//";
//};

with(obj_CheatsBox) 
{
global.tempvar+="with("+string(id)+") image_index="+string(image_index)+";
";
};

global.tempvar+="
global.cheat_exvar_1="+string(global.cheat_exvar_1)+";
global.cheat_exvar_2_1="+string(global.cheat_exvar_2_1)+";
global.cheat_exvar_2_2="+string(global.cheat_exvar_2_2)+";
global.cheat_exvar_2_3="+string(global.cheat_exvar_2_3)+";
global.cheat_exvar_2_4="+string(global.cheat_exvar_2_4)+";
global.cheat_exvar_2_5="+string(global.cheat_exvar_2_5)+";
global.cheat_exvar_2_6="+string(global.cheat_exvar_2_6)+";";

file_text_write_string(f,global.tempvar);
file_text_close(f);





with(obj_CheatsBox) execute_string("global.cheat_"+string_replace_all(string_replace_all(s,"-","_")," ","_")+"="+string(image_index));
