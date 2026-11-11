AI = global.AILevels[UnknownEnum.Value_76];

if (AI > 0 && !Frozen)
    PuppetCountdown -= 0.016666666666666666;

if (PuppetCountdown <= 0 && array_contains(PuppetSlots, false))
{
    var LowerPuppetCount = lerp(0.5, 2.5, AI / 20);
    var UpperPuppetCount = lerp(1.5, 3.5, AI / 20);
    
    if (PuppetsToSummon == 0)
        PuppetsToSummon = round(random_range(LowerPuppetCount + 0.01, UpperPuppetCount - 0.01));
    
    var PuppetIdentity = PuppetRotation[CurrentRotationSlot];
    
    if (irandom(500) == 7)
        PuppetIdentity = 5;
    
    if (irandom(1000) == 7)
        PuppetIdentity = 6;
    
    spawn_puppet(PuppetIdentity, 0);
    PuppetsToSummon--;
    
    if (PuppetsToSummon == 0)
    {
        set_countdown();
        Vocalize = true;
    }
    else
    {
        PuppetCountdown = random_range(0.25, 0.5);
        Vocalize = false;
    }
    
    CurrentRotationSlot++;
    
    if (CurrentRotationSlot >= array_length(PuppetRotation))
    {
        PuppetRotation = array_shuffle(PuppetRotation);
        CurrentRotationSlot = 0;
    }
}

FacehugDuration = 30 * lerp(1, 2, AI / 20);

enum UnknownEnum
{
    Value_76 = 76
}
