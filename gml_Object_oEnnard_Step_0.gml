var ID = UnknownEnum.Value_53;
var AI = global.AILevels[ID];
var WireTimerShift = 0;

switch (WiresSpawned % 3)
{
    case 0:
        WireTimerShift = 0.9;
        break;
    
    case 1:
        WireTimerShift = 0.2;
        break;
    
    case 2:
        WireTimerShift = 1.6;
        break;
}

var SpawnTime = lerp(28, 12, AI / 20) * Randomizer * WireTimerShift;

if (SpawnTimer >= SpawnTime)
{
    LastSpawnPoint = (LastSpawnPoint + 1) % 3;
    
    with (instance_create_depth(0, 0, 0, oEnnard_VentCrawler))
    {
        Sprite = other.SPRITE_Vents;
        VentX = (other.LastSpawnPoint - 1) * 2;
        Path = [];
        array_push(Path, [VentX, VentY - 1], [VentX, VentY]);
        Speed = lerp(8.5, 6.5, AI / 20);
        set_wait_time(AI);
    }
    
    WiresSpawned++;
    audio_play_sound(SOUND_Squeak, 5, false, 0.5, 0, random_range(0.95, 1.05));
    SpawnTimer = 0;
    Randomizer = random_range(0.85, 1.15);
}

if (AI > 0)
{
    SpawnTimer += 0.016666666666666666;
    audio_sound_gain(Static, instance_exists(oSalvage_Dangler) && !instance_exists(oSalvage), 0);
}

enum UnknownEnum
{
    Value_53 = 53
}
