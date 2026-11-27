if (surface_exists(SleepySurf))
    surface_free(SleepySurf);

if (instance_exists(oCameraUI))
{
    for (var i = 0; i < array_length(DisabledMinigames); i++)
    {
        if (DisabledMinigames[i])
            oCameraUI.DisabledMinigames[i] = false;
    }
}

sprite_delete(SPRITE_Icon);
sprite_delete(SPRITE_Meter);
sprite_delete(SPRITE_Glitch);
skin_sound_delete_array([SOUND_Fail, SOUND_Glitch, SOUND_Laugh]);
