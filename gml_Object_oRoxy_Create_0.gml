ID = UnknownEnum.Value_67;
Frame = 0;
AngleSpeed = 0;
AngleOffset = 45;
YOffset = 100;
YOffsetSpeed = 0;
AngleShift = 0;
Satisfied = false;
Body = -1;
Head = -1;
WaitTime = 3;
Active = false;
Satisfaction = 0;
Rage = 0;

function reset_timer(arg0)
{
    WaitTime = lerp(52, 28, arg0 / 20) * random_range(0.8, 1.2);
}

reset_timer(global.AILevels[ID]);
SOUND_Appear = get_misc_voicelines(ID, "Appear");
SOUND_Satisfied = get_misc_voicelines(ID, "Satisfied");

enum UnknownEnum
{
    Value_67 = 67
}
