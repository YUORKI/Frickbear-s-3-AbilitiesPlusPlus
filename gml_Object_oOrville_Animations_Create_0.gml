Frame = 0;
Squish = 0.5;
TornadoMode = true;
Exiting = false;
YOffset = 512;
YOffsetSpeed = 0;
audio_play_sound(oOrville.SOUND_Appear, 30, false);
Body = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
LHand = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
RHand = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);

with (Body)
{
    sprite_index = sNightmareBonnie_UpperEar;
    DrawDepth = 40;
}

with (Head)
{
    sprite_index = sNightmareBonnie_UpperEar;
    DrawDepth = 41;
}

with (LHand)
{
    sprite_index = sNightmareBonnie_LowerEar;
    DrawDepth = 42;
}

with (RHand)
{
    sprite_index = sNightmareBonnie_LowerEar;
    DrawDepth = 42;
}

function vanish()
{
    YOffset = 0;
    YOffsetSpeed = -6;
    Exiting = true;
    TornadoMode = true;
}
