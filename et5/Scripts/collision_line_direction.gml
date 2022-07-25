//argument0=x1
//argument1=y1
//argument2=x2
//argument3=y2
//argument4=distamce
//argument5=object
var dir;
dir=point_direction(argument0,argument1,argument2,argument3);
if (collision_line(argument0,argument1,argument0+lengthdir_x(argument4,dir),argument1+lengthdir_y(argument4,dir),argument5,true,true)) {
    return true;
}
else {
    return false;
}
