Head = undefined;
Arm = undefined;
UpperEarL = undefined;
LowerEarL = undefined;
ID = UnknownEnum.Value_48;
SPRITE_Head = skin_sprite(sJackOChica_HeadEmpty, ID, get_sprite_filenames(1, 2));
SPRITE_Arm = skin_sprite(sJackOChica_FrontArm, ID, ["sprite_09.png"]);
SPRITE_Torso = skin_sprite(sJackOChica_Torso, ID, get_sprite_filenames(3, 6));
SPRITE_Cupcake = skin_sprite(sJackOChica_PumpkinArm, ID, get_sprite_filenames(7, 9));
SOUND_Footstep = skin_sound(sfxMetalFootstep, ID, "sq_footstep");
SOUND_FootstepAlt = skin_sound(sfxPlantFootstep, ID, "sq_footstep2");
SOUND_Burning = skin_sound(sfxBurning, ID, "sq_burning");
SOUND_HeadTurn = skin_sound(sfxFireImpact, ID, "sq_look");
Head = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Arm = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Torso = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Cupcake = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);

with (Head)
{
    sprite_index = other.SPRITE_Head;
    DrawDepth = DrawDepth == -6;
}

with (Arm)
{
    sprite_index = other.SPRITE_Arm;
    DrawDepth = -7;
}

with (Torso)
{
    sprite_index = other.SPRITE_Torso;
    DrawDepth = -8;
}

with (Cupcake)
{
    sprite_index = other.SPRITE_Cupcake;
    DrawDepth = -9;
}

Frame = 0;
Cur_HeadB = 0;
CurSpeed_HeadB = 0;
HeadTurned = false;
HeadTurning = false;
Reset = true;
Freeze = false;
AI = 20;
KillTimer = 0;
Frozen = false;
BurningSound = -1;

enum UnknownEnum
{
    Value_48 = 48
}
