if (surface_exists(global.SurfaceF))
    surface_free(global.SurfaceF);

if (surface_exists(global.SurfaceL))
    surface_free(global.SurfaceL);

if (surface_exists(global.SurfaceR))
    surface_free(global.SurfaceR);

if (surface_exists(global.SurfaceB))
    surface_free(global.SurfaceB);

array_foreach(DeletionArray, function(arg0, arg1)
{
    sprite_delete(arg0);
});

if (NightMusic != -1 && audio_get_type(NightMusic))
    audio_destroy_stream(NightMusic);

if (HonkSound != sfxNoseHonk && audio_get_type(HonkSound))
    audio_destroy_stream(HonkSound);
