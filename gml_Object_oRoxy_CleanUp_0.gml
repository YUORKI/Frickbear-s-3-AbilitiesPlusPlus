if (Head != -1)
    instance_destroy(Head);

if (Body != -1)
    instance_destroy(Body);

clear_window(UnknownEnum.Value_67);
audio_stop_sound(SOUND_Charge);
audio_stop_sound(SOUND_Ambience);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Head);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_Satisfied);
skin_sound_delete_array([SOUND_Charge, SOUND_Ambience, SOUND_Creak, SOUND_Look, SOUND_Complete]);

enum UnknownEnum
{
    Value_67 = 67
}
