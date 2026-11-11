if (OfficeSprite != undefined)
    instance_destroy(OfficeSprite);

if (global.Power > 0)
    global.Brightness = global.BaseBrightness;

sprite_delete(SPRITE_Office);
skin_sound_delete_array(SOUND_Appear);
