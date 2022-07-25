//which variable

if argument0="global.cheat_exvar_1"
{
    var o;
    
    o=instance_create(144,176+16,obj_CheatsCircle);
    o.s="HIPPOS";
    o.vari=argument0;
    o.n=0;
    
    o=instance_create(144,176+16+(32*1),obj_CheatsCircle);
    o.s="TRUMP HEADS";
    o.vari=argument0;
    o.n=1;
};
if argument0="global.cheat_exvar_2"
{
    var o;
    
    o=instance_create(144,176+16,obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="APP CAN BE KILLED";
    o.vari=argument0;
    o.n=0;
    
    o=instance_create(144,176+16+(32*1),obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="SPLAPPLES CAN BE KILLED";
    o.vari=argument0;
    o.n=1;
    
    o=instance_create(144,176+16+(32*2),obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="GROPPLES CAN BE KILLED";
    o.vari=argument0;
    o.n=2;
    
    o=instance_create(144,176+16+(32*3),obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="GROPPLE DESTROYERS CAN BE KILLED";
    o.vari=argument0;
    o.n=3;
    
    o=instance_create(144,176+16+(32*4),obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="EXPLOSIONS CAN BE KILLED";
    o.vari=argument0;
    o.n=4;
    
    o=instance_create(144,176+16+(32*5),obj_CheatsCircle);
    o.sprite_index=spr_CheatsBox;
    o.s="THE CAMERA CAN BE KILLED";
    o.vari=argument0;
    o.n=5;
};


//instance_create(320,304,obj_CheatsCircle);
