audio_stop_sound(SOUND_Static);
instance_destroy(oMimicSuit);
instance_destroy(oDataDiver);
sprite_delete(SPRITE_Jumpscare);
sprite_delete(SPRITE_CamRadar);
sprite_delete(SPRITE_DataDiver);
sprite_delete(SPRITE_Faces);
sprite_delete(SPRITE_Border);
skin_sound_delete_array([SOUND_Move, SOUND_Static, SOUND_Open, SOUND_Close, SOUND_Select, SOUND_Flag, SOUND_TaskDone, SOUND_Impact]);
