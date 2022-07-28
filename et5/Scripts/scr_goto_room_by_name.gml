// Gmksplit doesn't guarentee room IDs will stay the same, so use this instead of room_goto on its own. It *does* perserve DnD room changes.
i = -1;
missinginarow = 0;
desiredroomname = argument0

while true
{   
    i += 1;
    if not room_exists(i) {
        missinginarow += 1
        if missinginarow >= 100 { // There's nothing like a get_all_rooms() so instead we're just bailing if 100 rooms in a row don't exist
            show_message("idk which room to send you to so I'm just gonna put you in the hub lmao. if you see this message please yell at RNL")
            scr_goto_room_by_name('LevelSelect');
            break;
        }
        continue;
    }
    if room_get_name(i) == desiredroomname {
        room_goto(i);
        break;
    }
}

