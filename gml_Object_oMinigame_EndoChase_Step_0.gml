if (FreezeFrames > 0)
{
    FreezeFrames--;
    exit;
}

if (FlickerTimer > 0)
    FlickerTimer--;

if (LightsOnTimer > 0)
{
    LightsOnTimer--;
    
    if (LightsOnTimer <= 0)
    {
        oEndoChase_Enemy.Vulnerable = false;
        GhostCombo = 0;
    }
}

ModeSwitchTimer--;

if (ModeSwitchTimer <= 0)
{
    ChaseMode = !ChaseMode;
    ModeSwitchTimer = ChaseMode ? 900 : ScatterDuration;
    
    if (ScatterDuration <= 0)
    {
        ChaseMode = true;
        exit;
    }
    
    if (ChaseMode)
        oEndoChase_Enemy.BackwardsCheckPass = true;
}

if (Score > global.HiScores[UnknownEnum.Value_15])
    global.HiScores[UnknownEnum.Value_15] = Score;

if (Score > global.HiScoresOverall[UnknownEnum.Value_15])
    global.HiScoresOverall[UnknownEnum.Value_15] = Score;

enum UnknownEnum
{
    Value_15 = 15
}
