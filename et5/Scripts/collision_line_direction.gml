//argument0=x1
//argument1=y1
//argument2=x2
//argument3=y2
//argument4=distance
//argument5=direction
//argument6=object
var dir;
if (collision_line(argument0,argument1,argument0+lengthdir_x(argument4,argument5),argument1+lengthdir_y(argument4,argument5),argument6,true,true)) {
    return true;
}
else {
    return false;
}
