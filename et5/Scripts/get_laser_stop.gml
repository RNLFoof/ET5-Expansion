/*
Gets the position of the end of the laser if were to hit a wall.
Argument0: X position of the laser origin
Argument1: Y position of the laser origin
Argument2: Direction laser is pointing
Argument3: Precise. If this is true, then the function gets a much more accurate position, but
            requres more processing of course.
Argument4: Objects that the laser stops at (eg. obj_wall | obj_crate);
Argument5: [Optional] Interval. This is how often the script checks for walls in pixels. Less
            means that it will check more often and be more accurate, but slower. If this 
            argument is not entered, the default interval is 8.

*/

var interval, bool_found, current_i, tempx1, tempy1, maxlen;
if (argument5>0)
{
interval = argument5;
}else{
interval = 8;
}
bool_found = false;
current_i = 0;
maxlen = 960;
while (bool_found==false)
{
    if (current_i>maxlen)
    {
    tempx1 = lengthdir_x(room_height,argument2)+argument0;
    tempy1 = lengthdir_y(room_height,argument2)+argument1;
    RetX=tempx1;
    RetY=tempy1;
    break;
    }
    
tempx1 = lengthdir_x(current_i,argument2)+argument0;
tempy1 = lengthdir_y(current_i,argument2)+argument1;
if (position_meeting(tempx1,tempy1,argument4))
{



    if (argument3==false)
    {
    RetX=tempx1;
    RetY=tempy1;
    }

    if (argument3==true)
    {
    var ibeg, iint, b_rck, icr, tx, ty;
    b_rck = false;
    icr = current_i-interval;
    iint = 1;
        while (b_rck==false)
        {
        tx = lengthdir_x(icr,argument2)+argument0;
        ty = lengthdir_y(icr,argument2)+argument1;
            if (position_meeting(tx,ty,argument4))
            {
            b_rck = true;
            RetX=tx;
            RetY=ty;
            }
        icr+=iint
        }
    }
bool_found=true;
}
current_i+=interval;

}



