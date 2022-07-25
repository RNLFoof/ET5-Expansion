///scr_SpriteReplace(sprite,folder)
if file_exists(working_directory+"\"+argument1+"\"+sprite_get_name(argument0)+".png")
{
if sprite_replace(argument0,working_directory+"\"+argument1+"\"+sprite_get_name(argument0)+".png",sprite_get_number(argument0),false,false,sprite_get_xoffset(argument0),sprite_get_yoffset(argument0))=false show_message(sprite_get_name(argument0));
};// else show_message(sprite_get_name(argument0));
