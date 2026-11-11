Frame = -580;
Direction = 1;
KillTimer = 0;
Delay = 0;
StepTimer = 40;
ArmFront = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Jaw = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
Torso = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
ArmBack = instance_create_layer(-300, -300, "Behind_Wall", oOfficeSprite);
SPRITE_Head = skin_sprite(sWitheredFreddy_Head, UnknownEnum.Value_10, "sprite_01.png");
SPRITE_Jaw = skin_sprite(sWitheredFreddy_Jaw, UnknownEnum.Value_10, "sprite_02.png");
SPRITE_Torso = skin_sprite(sWitheredFreddy_Torso, UnknownEnum.Value_10, "sprite_03.png");
SPRITE_ArmFront = skin_sprite(sWitheredFreddy_ArmFront, UnknownEnum.Value_10, "sprite_04.png");
SPRITE_ArmBack = skin_sprite(sWitheredFreddy_ArmBack, UnknownEnum.Value_10, "sprite_05.png");
SOUND_Step = skin_sound(sfxMetalFootstep, UnknownEnum.Value_10, "sq_step");
SOUND_Blocked = skin_sound(sfxWitheredFreddyBlocked, UnknownEnum.Value_10, "sq_blocked");

with (ArmFront)
{
    DrawDepth = -1;
    sprite_index = other.SPRITE_ArmFront;
}

with (Head)
{
    DrawDepth = -1;
    sprite_index = other.SPRITE_Head;
}

with (Jaw)
{
    DrawDepth = -2;
    sprite_index = other.SPRITE_Jaw;
}

with (Torso)
{
    DrawDepth = -3;
    sprite_index = other.SPRITE_Torso;
}

with (ArmBack)
{
    DrawDepth = -4;
    sprite_index = other.SPRITE_ArmBack;
}

enum UnknownEnum
{
    Value_10 = 10
}
