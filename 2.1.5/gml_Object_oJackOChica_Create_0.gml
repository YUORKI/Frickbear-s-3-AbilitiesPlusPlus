Head = undefined;
Arm = undefined;
UpperEarL = undefined;
LowerEarL = undefined;
ID = UnknownEnum.Value_48;
SPRITE_Head = sNOTHING;
SPRITE_Arm = sJackOChica_FrontArm;
SPRITE_Torso = sJackOChica_Torso;
SPRITE_Cupcake = sJackOChica_PumpkinArm;
SOUND_Footstep = sfxMetalFootstep;
SOUND_FootstepAlt = sfxPlantFootstep;
SOUND_Burning = sfxBurning;
SOUND_HeadTurn = sfxFireImpact;
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
