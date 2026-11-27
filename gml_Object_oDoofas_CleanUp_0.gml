instance_destroy(oDoofas_Popsicle);
sprite_delete(SPRITE_Player);
sprite_delete(SPRITE_Collectibles);
sprite_delete(SPRITE_Tokens);
skin_sound_delete_array([SOUND_Appear, SOUND_Collect, SOUND_Fail]);
skin_sound_delete_array(SOUND_Miss);
