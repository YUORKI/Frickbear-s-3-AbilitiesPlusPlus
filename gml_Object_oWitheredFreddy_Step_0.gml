var ID = UnknownEnum.Value_10;
var AI = global.AILevels[ID];

if (Frame >= 460)
{
    var Autoblock = !doorway_available(Direction);
    
    if (global.Doors[sign_to_binary(Direction)] || Autoblock)
    {
        if (!Autoblock)
        {
            simple_sound(sfxBlock, Frame * Direction, -20, false);
            reverb_sound(SOUND_Blocked, Frame * Direction, -20);
            block_tokens(,1);
        }
        
        Direction *= -1;
        Frame = -580;
        Delay = Autoblock ? 30 : 60;
        KillTimer = 0;
        StepTimer = 40;
    }
    else if (KillTimer > lerp(180, 90, AI / 20))
    {
        jumpscare(ID, Direction);
    }
    
    if (!Autoblock)
        KillTimer++;
}
else if (Delay > 0)
{
    Delay--;
}
else if (AI > 0)
{
    var Walkspeed = lerp(0.5, 1.5, AI / 20);
    Frame += Walkspeed;
    StepTimer -= Walkspeed;
    
    if (StepTimer <= 0)
    {
        simple_sound(SOUND_Step, Frame * Direction * 2, -200, false, 0.15);
        StepTimer += 60;
    }
}

enum UnknownEnum
{
    Value_10 = 10
}
