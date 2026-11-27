sprite_delete(SPRITE_Border);
sprite_delete(SPRITE_Tiles);
sprite_delete(SPRITE_Background);
sprite_delete(SPRITE_Screen);
skin_sound_delete_array([SOUND_Open, SOUND_Select, SOUND_TaskDone, SOUND_Close]);
instance_destroy(oControlPanel);
