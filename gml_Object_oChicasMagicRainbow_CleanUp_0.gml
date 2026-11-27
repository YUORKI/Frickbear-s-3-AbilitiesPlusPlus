instance_destroy(oChicasMagicRainbow_Shooter);
instance_destroy(oChicasMagicRainbow_Bullets);
sprite_delete(SPRITE_Rainbow);
sprite_delete(SPRITE_Bullet);
skin_sound_delete_array(SOUND_HitOnce);
skin_sound_delete_array(SOUND_HitTwice);
skin_sound_delete_array(SOUND_HitThrice);
skin_sound_delete_array([SOUND_Fail, SOUND_Shoot, SOUND_Charge]);
