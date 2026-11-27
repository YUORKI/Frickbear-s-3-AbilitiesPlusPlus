var AI = global.AILevels[ID];

if (AI == 0)
    SpawnTimer = 0;

var TimeToSpawn = lerp(35, 12, AI / 20);
var ActiveAnomalies = instance_number(oFoxyEXE_FakerParent);

if (SpawnTimer >= TimeToSpawn && ActiveAnomalies < 4)
{
    var PossibleAttacks = [];
    
    if (!instance_exists(oFoxyEXE_FakeCamButton) && !(global.CamUp && global.MonitorSystem == "Cameras"))
        array_push(PossibleAttacks, oFoxyEXE_FakeCamButton);
    
    if (!instance_exists(oFoxyEXE_FakeVentButton) && !(global.CamUp && global.MonitorSystem == "Vents"))
        array_push(PossibleAttacks, oFoxyEXE_FakeVentButton);
    
    if (!instance_exists(oFoxyEXE_FakeShopButton) && !(global.CamUp && global.MonitorSystem == "Shop"))
        array_push(PossibleAttacks, oFoxyEXE_FakeShopButton);
    
    if (!instance_exists(oFoxyEXE_FakeMinigameButton) && !(global.CamUp && global.MonitorSystem == "Games"))
        array_push(PossibleAttacks, oFoxyEXE_FakeMinigameButton);
    
    for (var i = 0; i < array_length(PossibleAttacks); i++)
    {
        if (PossibleAttacks[i] == LastAnomaly)
        {
            array_delete(PossibleAttacks, i, 1);
            break;
        }
    }
    
    if (array_length(PossibleAttacks) > 0)
    {
        var Attack = choose_from_array(PossibleAttacks);
        LastAnomaly = Attack;
        instance_create_depth(0, 0, -1, Attack);
    }
    
    SpawnTimer = 0;
}

if (ActiveAnomalies >= 3)
{
    Aggro += 0.0016666666666666668;
    
    if (!audio_is_playing(SOUND_Countdown))
        audio_play_sound(SOUND_Countdown, 50, false, 0.7);
    
    if (Aggro >= 1)
        jumpscare(ID);
}
else
{
    audio_stop_sound(SOUND_Countdown);
}

audio_sound_gain(Static, Aggro, 0);
SpawnTimer += 0.016666666666666666;
StaticTimer = (StaticTimer + 1) % sprite_get_number(sStatic);
depth = -50;
