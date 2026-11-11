ID = UnknownEnum.Value_86;
AI = 0;
Mode = 0;
Frame = 0;
WhackAngle = 0;
WhackAngleSpeed = 0;
Squish = 1;
SquishSpeed = 0;
HitFrames = 0;
AggroLevel = -0.5;
Head = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Body = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Arm = instance_create_layer(-999, -999, "InFrontOf_Wall", oOfficeSprite);
Balls = instance_create_layer(1088, -999, "InFrontOf_Wall", oOfficeSprite);

with (Balls)
{
    DrawDepth = 30;
    sprite_index = sSpringBonnie_BallPile;
}

Ballz = 0;
WaitForFlip = true;
BallCounterOffset = 64;
KillFrames = 0;
Ambience = audio_play_sound(sfxSpringBonnieAmbience, 8, true, 1, 0, 1);
audio_sound_gain(Ambience, 0, 0);

enum UnknownEnum
{
    Value_86 = 86
}
