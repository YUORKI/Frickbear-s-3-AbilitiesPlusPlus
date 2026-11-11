if (Head != -1)
    instance_destroy(Head);

if (Body != -1)
    instance_destroy(Body);

clear_window(UnknownEnum.Value_69);
audio_stop_sound(sfxRoxyAmbience);
surface_free(SpeechBubbleSurf);
instance_destroy(oGlamrockChica_AssemblyMenu);

enum UnknownEnum
{
    Value_69 = 69
}
