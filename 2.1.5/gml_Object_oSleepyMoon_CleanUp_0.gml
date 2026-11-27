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
