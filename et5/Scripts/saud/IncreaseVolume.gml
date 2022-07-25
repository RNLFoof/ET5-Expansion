//script: increase_volume(argument0: how much as real)
repeat (argument0-1)
{
    keyboard_key_press(175);
    keyboard_key_release(175);
}
