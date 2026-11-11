ID = UnknownEnum.Value_64;
Size = 1;
Frame = 0;
Stretch = 1;
StretchSpeed = 0;
YOffset = 0;
YOffsetSpeed = 0;
AttackDegree = random_range(0, 0.1);
AnimMode = "Approach";
Body = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
LArm = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
RArm = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Body.sprite_index = sGrimmFoxy_Body;
Head.sprite_index = sGrimmFoxy_Head;
LArm.sprite_index = sGrimmFoxy_Arm;
RArm.sprite_index = sGrimmFoxy_Arm;
Burning = audio_play_sound(sfxBurning, 15, true, 1);
audio_sound_gain(Burning, 0, 0);
Static = audio_play_sound(sfxGrimmFoxyScreech, 10, true);
HurtSoundPlayed = false;
audio_sound_gain(Static, 0, 0);

enum UnknownEnum
{
    Value_64 = 64
}
