///scr_SpriteReplace(sprite,folder)
if file_exists(working_directory+"\"+argument1+"\"+sprite_get_name(argument0)+".png") 
sprite_replace(argument0,
working_directory+"\"+argument1+"\"+sprite_get_name(argument0)+".png",
sprite_get_number(argument0),
true,
false,
sprite_get_xoffset(argument0),
sprite_get_yoffset(argument0));
