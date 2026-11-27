var ID = UnknownEnum.Value_73;
var AI = global.AILevels[ID];

if (AI > 0 && !Activated)
{
    Activated = true;
    TotalSuits = round(lerp(4, 8, AI / 20));
    change_possessed_suit();
}

if (MovementTimer <= 0)
{
    if (AI > 0 && Active)
    {
        reverb_sound(SOUND_Move, 0, 500, false, 0.5, 1, 0.5);
        fuzz_up();
    }
    
    MovementTimer = 30;
    move_suits();
}

if (KillTimer <= 0)
{
    if (Active && AI > 0)
        jumpscare(ID, 0, 8);
    else
        KillTimer = 120;
}

KillTimer -= 0.016666666666666666;
MovementTimer -= 0.016666666666666666;

enum UnknownEnum
{
    Value_73 = 73
}
