instance_destroy(Body);
instance_destroy(Head);
instance_destroy(Arm);
audio_stop_sound(sfxWindowAmbience);
clear_window(UnknownEnum.Value_13);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Body);
sprite_delete(SPRITE_Arm);
skin_sound_delete_array([SOUND_Creak, SOUND_Slam, SOUND_Scare, SOUND_Screech, SOUND_Ambience, SOUND_Defeated]);

enum UnknownEnum
{
    Value_13 = 13
}
