if (!instance_exists(oMinigame_MidnightMotorist))
{
    instance_destroy();
    exit;
}

if (!oMinigame_MidnightMotorist.Paused)
    x += (Speed - oMinigame_MidnightMotorist.Speed);
