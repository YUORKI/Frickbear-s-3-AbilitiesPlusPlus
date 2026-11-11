if (surface_exists(TipsySurf))
    surface_free(TipsySurf);

sprite_delete(GuardSprite);
skin_sound_delete_array(VoiceLineID);
set_guard_parameters(global.Guard);
