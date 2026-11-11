ID = UnknownEnum.Value_43;
SPRITE_Head = skin_sprite(sSparky, ID, get_sprite_filenames(1, 3));
SOUND_Appear = skin_sound(sfxSparkyCue, ID, "sq_appear");
SOUND_Hint = skin_sound(sfxBark, ID, "sq_hint");
SOUND_Zapped = skin_sound(sfxSparkyDie, ID, "sq_zapped");
CurrentCam = irandom_range(1, 8);
LastCam = 1;
ClickedCamX = 0;
ClickedCamY = 0;
CurrentCamX = 0;
CurrentCamY = 0;
Active = false;
Offset = 1;
OffsetSpeed = 0;
Shake = 0;
ShakeSpeed = 0;
ShakeOffset = 0;
ShockTimer = 0;
WaitTime = 999;
KillTimer = 999;
Randomizer = random_range(0.8, 1.2);

enum UnknownEnum
{
    Value_43 = 43
}
