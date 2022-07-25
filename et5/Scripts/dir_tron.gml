//changes a direciton to rotate towards another direction
//so face moves toward face_to and returns the next step to get there
//argument0 = first direction
//argument1 = direciton to move to
//argument2 = will be the amount to turn
var face,face_to;

face=tron(argument0);
face_to=tron(argument1);

if face<face_to
{
        if face<face_to-180 face-=argument2;
        else                face+=argument2;
}

if face>face_to
{
        if face>face_to+180 face+=argument2;
        else                face-=argument2;
}

if abs(face-face_to)<argument2
    face=face_to;
    
return face;
