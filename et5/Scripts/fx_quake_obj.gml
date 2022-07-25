{
    //argument0 = x-axis power of the quake
    //argument1 = y-axis power of the quake
    //argument2 = Time the quake last in Steps
    //argument3 = Auto(0),Left(1),Right(2)
    //argument4 = NoSolid(0),Solid(1),All(-1)
    //argument5 = Object to check (All)
    //argument6 = Reset Position after quake
    //argument7 = Reset Every Time
    //argument8 = Delay
    
    if (variable_local_exists("eqInternalClock")=false) {variable_local_set("eqInternalClock",0)};
    if (eqInternalClock=argument2) then
    {
        eqInternalClock=0;
        if (argument6=true) then
        {
            with (argument5)
            {
                if (variable_local_exists("eqResetX")=true) {if (eqResetX!=noone){x=eqResetX};eqResetX=noone};
                if (variable_local_exists("eqResetY")=true) {if (eqResetY!=noone){y=eqResetY};eqResetY=noone};
            }
        }
        return false;
    }
    eqInternalClock+=1;
    
    if (variable_local_exists("eqClockDelay")=false) {variable_local_set("eqClockDelay",argument8)}else{if(eqClockDelay<=-1){eqClockDelay=argument8}};
    eqClockDelay-=1;
    if (eqClockDelay=-1)then
    {
    
    if (argument6=true) then
    {
        switch (argument4)
        {
            case -1:
                    with (argument5)
                    {
                        if (variable_local_exists("eqResetX")=false) {variable_local_set("eqResetX",x)}else{if (eqResetX=noone){eqResetX=x}};
                        if (variable_local_exists("eqResetY")=false) {variable_local_set("eqResetY",y)}else{if (eqResetY=noone){eqResetY=y}};
                    }
            break;
            case 0:
                    if (solid=false) then
                    {
                        with (argument5)
                        {
                            if (variable_local_exists("eqResetX")=false) {variable_local_set("eqResetX",x)}else{if (eqResetX=noone){eqResetX=x}};
                            if (variable_local_exists("eqResetY")=false) {variable_local_set("eqResetY",y)}else{if (eqResetY=noone){eqResetY=y}};
                        }
                    }
            break;
            case 1:
                    if (solid=true) then
                    {
                        with (argument5)
                        {
                            if (variable_local_exists("eqResetX")=false) {variable_local_set("eqResetX",x)}else{if (eqResetX=noone){eqResetX=x}};
                            if (variable_local_exists("eqResetY")=false) {variable_local_set("eqResetY",y)}else{if (eqResetY=noone){eqResetY=y}};
                        }
                    }
            break;
        }
        if (argument7=true)&&(eqResetX!=noone)&&(eqResetY!=noone){
            with (argument5){
                switch (argument4)
                {
                    case -1:x=eqResetX;y=eqResetY;break;
                    case 0:if (solid=false){x=eqResetX;y=eqResetY;};break;
                    case 1:if (solid=true){x=eqResetX;y=eqResetY;};break;
                }
            }
        }
    }
    
    switch (argument4)
    {
        case -1:
                with (argument5)
                {
                    switch(argument3){
                        case 0:if (floor(random(2))=0){x-=floor(random(argument0+1))}else{x+=floor(random(argument0+1))};break;
                        case 1:x-=floor(random(argument0+1));break;
                        case 2:x+=floor(random(argument0+1));break;
                    }
                    if (floor(random(2))=0){y-=floor(random(argument1+1))}else{y+=floor(random(argument1+1))};
                }
        break;
        case 0:
                with (argument5)
                {
                    if (solid=false) then
                    {
                        switch(argument3){
                            case 0:if (floor(random(2))=0){x-=floor(random(argument0+1))}else{x+=floor(random(argument0+1))};break;
                            case 1:x-=floor(random(argument0+1));break;
                            case 2:x+=floor(random(argument0+1));break;
                        }
                        if (floor(random(2))=0){y-=floor(random(argument1+1))}else{y+=floor(random(argument1+1))};
                    }
                }
        break;
        case 1:
                with (argument5)
                {
                    if (solid=true) then
                    {
                        switch(argument3){
                            case 0:if (floor(random(2))=0){x-=floor(random(argument0+1))}else{x+=floor(random(argument0+1))};break;
                            case 1:x-=floor(random(argument0+1));break;
                            case 2:x+=floor(random(argument0+1));break;
                        }
                        if (floor(random(2))=0){y-=floor(random(argument1+1))}else{y+=floor(random(argument1+1))};
                    }
                }
        break;
    }
    }
    return true;
}
