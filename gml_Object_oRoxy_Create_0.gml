ID = UnknownEnum.Value_67;
Frame = 0;
AngleSpeed = 0;
AngleOffset = 45;
YOffset = 100;
YOffsetSpeed = 0;
AngleShift = 0;
Satisfied = false;
Body = -1;
Head = -1;
WaitTime = 3;
Active = false;
Satisfaction = 0;
Rage = 0;

function reset_timer(arg0)
{
    WaitTime = lerp(52, 28, arg0 / 20) * random_range(0.8, 1.2);
}

reset_timer(global.AILevels[ID]);
SPRITE_Body = skin_sprite(sRoxy_Body, ID, get_sprite_filenames(3, 4));
SPRITE_Head = skin_sprite(sRoxy_Head, ID, get_sprite_filenames(1, 2));
SOUND_Charge = skin_sound(sfxRoxyCharge, ID, "sq_charge");
SOUND_Ambience = skin_sound(sfxRoxyAmbience, ID, "sq_ambience");
SOUND_Creak = skin_sound(sfxEndoCreak, ID, "sq_creak");
SOUND_Look = skin_sound(sfxWhipCrack, ID, "sq_whip");
SOUND_Complete = skin_sound(sfxRoxyComplete, ID, "sq_complete");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_Satisfied = skin_sound_generate_array(get_misc_voicelines(ID, "Satisfied"), ID, "voc_complete");

enum UnknownEnum
{
    Value_67 = 67
}
