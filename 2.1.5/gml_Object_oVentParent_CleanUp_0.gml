instance_destroy(Eyes);

if (HippoSound != undefined)
    audio_stop_sound(HippoSound);

skin_sound_delete_array(SOUND_Enter);
skin_sound_delete_array(SOUND_Leave);
skin_sound_delete_array(SOUND_CoolGlasses);

if (!is_undefined(SPRITE_Eyes))
    sprite_delete(SPRITE_Eyes);
