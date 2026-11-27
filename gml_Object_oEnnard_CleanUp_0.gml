instance_destroy(oEnnard_VentCrawler);
instance_destroy(oEnnard_Dangler);
instance_destroy(oEnnard_Jumpscarer);
audio_stop_sound(Static);
sprite_delete(SPRITE_Dangler);
sprite_delete(SPRITE_Vents);
skin_sound_delete_array([SOUND_Static, SOUND_Squeak, SOUND_Clicked]);
