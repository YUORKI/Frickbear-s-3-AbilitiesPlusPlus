PuppetsActive = 0;
PuppetPositions = [[736, 576, -135], [720, 808, -60], [952, 720, 75], [1224, 552, -150], [1408, 752, 15], [1512, 560, 165], [1736, 744, -60], [1856, 552, -180], [1968, 824, 45]];
PuppetSlots = array_create(array_length(PuppetPositions), false);
PuppetsToSummon = 0;
AI = 0;
Frozen = false;
AvailablePuppets = array_create(5, true);
FirstPuppetSide = random_sign();
PuppetRotation = array_shuffle(countup_array(4));
CurrentRotationSlot = 0;

function spawn_puppet(arg0, arg1, arg2 = [])
{
    var PuppetSlot = irandom(array_length(PuppetPositions) - 1);
    
    while (PuppetSlots[PuppetSlot] && array_contains(PuppetSlots, false))
        PuppetSlot = (PuppetSlot + 1) % array_length(PuppetPositions);
    
    with (instance_create_layer(PuppetPositions[PuppetSlot][0], PuppetPositions[PuppetSlot][1], "Behind_Wall", oCaptainCobalt_Puppet))
    {
        image_angle = other.PuppetPositions[PuppetSlot][2];
        SlotID = PuppetSlot;
        TimeToKill = lerp(16, 8, other.AI / 20);
        Vocalize = other.Vocalize;
        HeadSprite = arg0;
        
        switch (HeadSprite)
        {
            case 0:
                break;
            
            case 1:
                STAT_KillSpeed = 0.75;
                STAT_FlashSpeed = 1;
                STAT_FlashGenerosity = 2;
                break;
            
            case 2:
                STAT_KillSpeed = 1.5;
                STAT_LatchDuration = 0.5;
                break;
            
            case 3:
                STAT_HP = 2 - arg1;
                break;
            
            case 4:
                STAT_FlashSpeed = 0.5;
                STAT_KillSpeed = 0.5;
                STAT_FlashGenerosity = 2;
                break;
            
            case 5:
                STAT_KillSpeed = 0;
                STAT_FlashGenerosity = 2;
                break;
            
            case 6:
                STAT_KillSpeed = 0;
                STAT_HP = 1;
                break;
        }
    }
    
    PuppetSlots[PuppetSlot] = true;
    PuppetsActive++;
}

function set_countdown()
{
    PuppetCountdown = lerp(36, 22, AI / 20) * random_range(0.8, 1.2);
}

set_countdown();
PuppetCountdown *= random_range(0.75, 1);
Vocalize = true;
