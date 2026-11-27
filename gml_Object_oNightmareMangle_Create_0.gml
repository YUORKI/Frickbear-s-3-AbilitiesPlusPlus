ID = UnknownEnum.Value_49;
EnnardProgress = 0;
EnnardOffset = 0;
SecondLureAvailable = has_upgrade(UnknownEnum.Value_63);
SOUND_Eat = skin_sound(sfxBiteOf87, ID, "sq_bite");
SOUND_Ambience = skin_sound(sfxEnnardWarning, ID, "sq_static");
audio_sound_gain(SOUND_Ambience, 0, 0);
audio_play_sound(SOUND_Ambience, 30, true);

enum UnknownEnum
{
    Value_49 = 49,
    Value_63 = 63
}
