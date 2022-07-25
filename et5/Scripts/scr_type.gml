var pos_str,temp_str,hoc,poc;
//If the code hasn't edited the string...
if string_copy(current_string,1,position) != current_string
{
    //Checks for highlighted phrases.
    hoc = string_pos(highlight_open_character,current_string)
    //Checks for manual pauses.
    poc = string_pos(pause_open_character,current_string)
    //While there is a manual pause or highighted phrase in the string...
    while(hoc || poc)
    {
        //If there is a highlighted phrase first...
        if hoc && (!poc || hoc < poc)
        {
            //Store the highlighted phrase's position.
            highlight_position[highlight_number] = string_pos(highlight_open_character,current_string)
            //Store highlighted phrase in temp_str.
            temp_str = string_copy(current_string,highlight_position[highlight_number]+1,string_pos(highlight_close_character,current_string)-highlight_position[highlight_number]-1)
            //Remove any manual pauses within temp_str.
            while(string_pos(pause_open_character,temp_str))
                temp_str = string_delete(temp_str,string_pos(pause_open_character,temp_str),string_pos(pause_close_character,temp_str)-string_pos(pause_open_character,temp_str)+1)
            //Store the length of the highlighted string.
            highlight_length[highlight_number] = string_length(temp_str) 
            //Remove the open and close characters.
            current_string = string_delete(current_string,string_pos(highlight_open_character,current_string),1)
            current_string = string_delete(current_string,string_pos(highlight_close_character,current_string),1)
            //Increment highlight_number.
            highlight_number += 1
        }
        else
            //If there is a manual pause first...
            if !hoc || poc < hoc
            {
                //Store position of manual pause.
                pause_position[pause_number] = string_pos(pause_open_character,current_string)
                //Get surrounded number.
                pos_str = string_copy(current_string,pause_position[pause_number]+1,string_pos(pause_close_character,current_string)-pause_position[pause_number]-1)
                //Store length of manual pause.
                pause_length[pause_number] = real(pos_str)
                //Remove manual pause from string.
                current_string = string_delete(current_string,string_pos(pause_open_character,current_string),string_length(pause_length[pause_number])+string_length(pos_str)+2)
                //Increment pause_number.
                pause_number += 1
            }
            //Checks for highlighted phrases.
            if hoc
                hoc = string_pos(highlight_open_character,current_string)
            //Checks for manual pauses.    
            if poc
                poc = string_pos(pause_open_character,current_string)
    }
    //This finds a end_charcter character. If it finds one, this means the
    //messages are finished.
    message_end = sign(string_pos(end_character,current_string))
    //If there was an asterisk...
    if message_end
        //Remove it from the string.
        current_string = string_delete(current_string,string_pos(end_character,current_string),1)
    //If there is a jump_character character in the string.   
    if string_pos(jump_character,current_string)
    {
        //Take the data.
        pos_str = string_copy(current_string,string_pos("^",current_string)+1,string_length(current_string))
        //If there is a comma...
        if string_pos(",",pos_str)
        {
            //Let the code know that the message is a question message and take the position
            //data.
            yes_position = real(string_copy(pos_str,1,string_pos(",",pos_str)-1))
            no_position = real(string_copy(pos_str,string_pos(",",pos_str)+1,7))
            message_question = 1
        }
        //If there is no comma...
        else
        {
            //Let the code know that the message is a jump message and take the position
            //data.
            jump_position = real(string_copy(pos_str,1,7))
            message_jump = 1
        }
        //Remove the "^" character and the data.
        current_string = string_delete(current_string,string_pos(jump_character,current_string),10)
    }
    while(string_copy(current_string,1,position) != current_string)
    {
        //Add one to the position.
        position += 1
        //Add the width of the next character to the width counter
        width_counter += string_width(string_char_at(current_string,position))
        //If the character at the position position is a space...
        if string_char_at(current_string,position) = " "
            //Update the last_space variable to position.
            last_space = position
        //If the character at position is a line break symbol...
        if string_char_at(current_string,position) = "#"
            //Restart the width counter. This is used in case you want to add
            //manual line breaks.
            width_counter = 0
        //If the width of the characters exceeds the number that's allowed in a line...
        if width_counter > line_length
        {
            //If there was a space in the message..
            if last_space > 0
            {
                //When creating a line break, make sure that the width of the extra letters 
                //that are being placed into the next row are being counted for.
                width_counter = string_width(string_copy(string_copy(current_string,1,position),last_space+1,string_length(string_copy(current_string,1,position))-last_space+1))
                //Add a line break after the last space.
                current_string = string_copy(current_string,1,last_space-1)+"#"+string_copy(current_string,last_space+1,string_length(current_string)-last_space)
            }
            else
            //If there was no space...
            {
                //Add line break at previous position.
                current_string = string_copy(current_string,1,position-1)+"#"+string_copy(current_string,position,string_length(current_string))
                //Restart width counter.
                width_counter = 0
            }
        }
    }
}
else
{
    //Adds one to the position of the display string.
    display_position += 1
    //Update the string that's being displayed.
    display_string = string_copy(current_string,1,display_position)
    //If there is a special character or the code has finished typing out the message...
    if string_length(display_string) = string_length(current_string)        
        //Set type_end to true.
        type_end = 1 
}
