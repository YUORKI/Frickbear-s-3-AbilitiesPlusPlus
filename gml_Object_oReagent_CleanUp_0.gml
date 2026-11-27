instance_destroy(oWetFloorBot);
audio_stop_sound(SOUND_Ambience);
sprite_delete(SPRITE_Cameras);
sprite_delete(SPRITE_WetFloorSign);
sprite_delete(SPRITE_WetFloorSignAlt);
sprite_delete(SPRITE_CamRadar);
skin_sound_delete_array([SOUND_Ambience, SOUND_Appear, SOUND_Leave, SOUND_Pluck, SOUND_Place]);
