//this will convert any number to a number 
//between 0 and 359, so -90 becomes 270
//argument0 = first direction

tt=argument0;

while(tt>=360)  tt-=360;
while(tt<0)     tt+=360;

return tt;
