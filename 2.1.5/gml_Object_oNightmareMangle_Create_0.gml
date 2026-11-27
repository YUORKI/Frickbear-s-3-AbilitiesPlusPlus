EnnardProgress = 0;
EnnardOffset = 0;
SecondLureAvailable = has_upgrade(UnknownEnum.Value_63);
SOUND_Eat = sfxBiteOf87;
SOUND_Ambience = sfxEnnardWarning;
audio_sound_gain(SOUND_Ambience, 0, 0);
audio_play_sound(SOUND_Ambience, 30, true);

enum UnknownEnum
{
    Value_63 = 63
}
