if (surface_exists(global.MinigameSurface))
    surface_free(global.MinigameSurface);

if (surface_exists(global.UISurface))
    surface_free(global.UISurface);

instance_destroy(oOfficeSprite);
audio_bus_main.effects[0] = undefined;
audio_bus_main.effects[1] = undefined;
audio_bus_main.effects[2] = undefined;
audio_bus_main.effects[3] = undefined;
audio_stop_sound(sfxFan);
audio_stop_sound(sfxFreddleScreech);
