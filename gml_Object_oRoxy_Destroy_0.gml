if (Head != -1)
    instance_destroy(Head);

if (Body != -1)
    instance_destroy(Body);

clear_window(UnknownEnum.Value_67);
audio_stop_sound(sfxRoxyCharge);
audio_stop_sound(sfxRoxyAmbience);

enum UnknownEnum
{
    Value_67 = 67
}
