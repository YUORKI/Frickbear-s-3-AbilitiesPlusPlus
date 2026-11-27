ID = UnknownEnum.Value_64;
SPRITE_Head = skin_sprite(sGrimmFoxy_Head, ID, get_sprite_filenames(1, 5));
SPRITE_Body = skin_sprite(sGrimmFoxy_Body, ID, get_sprite_filenames(6, 10));
SPRITE_Arm = skin_sprite(sGrimmFoxy_Arm, ID, get_sprite_filenames(11, 14));
SOUND_Screech = skin_sound(sfxGrimmFoxyScreech, ID, "sq_screech");
SOUND_Burning = skin_sound(sfxBurning, ID, "sq_burning");
SOUND_Impact = skin_sound(sfxFireImpact, ID, "sq_impact");
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
Body.sprite_index = SPRITE_Body;
Head.sprite_index = SPRITE_Head;
LArm.sprite_index = SPRITE_Arm;
RArm.sprite_index = SPRITE_Arm;
Burning = audio_play_sound(SOUND_Burning, 15, true, 1);
audio_sound_gain(Burning, 0, 0);
Static = audio_play_sound(SOUND_Screech, 10, true);
HurtSoundPlayed = false;
audio_sound_gain(Static, 0, 0);

enum UnknownEnum
{
    Value_64 = 64
}
