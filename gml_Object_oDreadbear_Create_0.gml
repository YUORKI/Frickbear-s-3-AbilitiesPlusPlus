ID = UnknownEnum.Value_38;
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_Fed = skin_sound_generate_array(get_misc_voicelines(ID, "Fed"), ID, "voc_fed");
SOUND_Creak = skin_sound(sfxEndoCreak, ID, "sq_creak");
SOUND_Slam = skin_sound(sfxMetalSlam, ID, "sq_slam");
SOUND_Scare = skin_sound(sfxWindowScare, ID, "sq_scare");
SOUND_Eat = skin_sound(sfxEat, ID, "sq_eat");
SPRITE_Head = skin_sprite(sDreadbearHead, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png"]);
SPRITE_Torso = skin_sprite(sDreadbearTorso, ID, ["sprite_04.png"]);
SPRITE_UpperArm = skin_sprite(sDreadbearArmUpper, ID, ["sprite_05.png", "sprite_06.png"]);
SPRITE_LowerArm = skin_sprite(sDreadbearArmLower, ID, ["sprite_07.png", "sprite_08.png"]);
SPRITE_Hand = skin_sprite(sDreadbearHand, ID, ["sprite_09.png", "sprite_10.png", "sprite_11.png", "sprite_12.png"]);
SPRITE_Bubble = skin_sprite(sDreadbearBubble, ID, ["sprite_13.png", "sprite_14.png"]);
SPRITE_Bowl = skin_sprite(sCandyBowl, ID, ["sprite_15.png", "sprite_16.png"]);
SPRITE_Candy = skin_sprite(sCandy, ID, ["sprite_17.png", "sprite_18.png"]);

function CalculateInverseKinematics(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var lengthX = arg4 - arg0;
    var lengthY = arg1 - arg5;
    var lengthTrue = sqrt(sqr(lengthX) + sqr(lengthY));
    var fstRot = 0;
    var fstX = 0;
    var fstY = 0;
    var sndRot = 0;
    var sndX = 0;
    var sndY = 0;
    var ang = darccos(lengthX / lengthTrue) * sign(lengthY);
    
    if (lengthTrue < (arg2 - arg3))
    {
        lengthX = dcos(ang) * (arg2 - arg3);
        lengthY = dsin(ang) * (arg2 - arg3);
    }
    
    if (lengthTrue > (arg2 + arg3))
    {
        fstRot = ang;
    }
    else
    {
        sndRot = darccos(((sqr(lengthX) + sqr(lengthY)) - sqr(arg2) - sqr(arg3)) / (2 * arg2 * arg3));
        fstRot = darctan2(lengthY, lengthX) - ((1 - (2 * arg6)) * darctan2(arg3 * dsin(sndRot), arg2 + (arg3 * dcos(sndRot))));
    }
    
    sndRot = fstRot + ((1 - (2 * arg6)) * sndRot);
    fstX = arg0 + (dcos(fstRot) * arg2);
    fstY = arg1 - (dsin(fstRot) * arg2);
    sndX = fstX + (dcos(sndRot) * arg3);
    sndY = fstY - (dsin(sndRot) * arg3);
    
    if (fstRot < 0)
        fstRot = 360 + fstRot;
    
    if (sndRot < 0)
        sndRot = 360 + sndRot;
    
    return [fstRot, fstX, fstY, sndRot, sndX, sndY];
}

lHand = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
lHand.sprite_index = sDreadbearHand;
rHand = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
rHand.sprite_index = sDreadbearHand;
lLArm = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
lLArm.sprite_index = sDreadbearArmLower;
rLArm = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
rLArm.sprite_index = sDreadbearArmLower;
rLArm.image_yscale = -1;
lUArm = instance_create_layer(x + 96, y, "Behind_Wall", oOfficeSprite);
lUArm.sprite_index = sDreadbearArmUpper;
rUArm = instance_create_layer(x - 96, y, "Behind_Wall", oOfficeSprite);
rUArm.sprite_index = sDreadbearArmUpper;
rUArm.image_yscale = -1;
brow = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
brow.sprite_index = sNOTHING;
head = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
head.sprite_index = sNOTHING;
jaw = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
jaw.sprite_index = sNOTHING;
torso = instance_create_layer(x, y, "Behind_Wall", oOfficeSprite);
torso.sprite_index = sDreadbearTorso;
CenterX = 1344;
CenterY = 704;
x = CenterX;
y = CenterY;
TorsoX = x;
TorsoY = y + 96;
LHandX = x + 32;
LHandY = y + 96;
RHandX = x - 32;
RHandY = y + 96;
JawOffset = 0;
BrowOffset = 0;
BubbleSize = 0;
DesiredCandy = 0;
Frame = 0;
Mode = "Reset";
Patience = 10;
CurrentClip = sfxNOTHING;

function eat_candy()
{
    if (DesiredCandy == oDreadbearCandy.Color)
    {
        simple_sound(SOUND_Eat, 0, -200, false, 1);
        Mode = "Fall1";
        JawOffset = -4;
        audio_stop_sound(CurrentClip);
        CurrentClip = choose_from_array(SOUND_Fed);
        reverb_sound(CurrentClip, 0, -200, false, 1);
        block_tokens();
    }
    else
    {
        jumpscare(UnknownEnum.Value_38, 0);
    }
}

enum UnknownEnum
{
    Value_38 = 38
}
