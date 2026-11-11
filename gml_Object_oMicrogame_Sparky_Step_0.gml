event_inherited();

if (oFredbearManager.MicrogameTimer <= 1 && ShockTimer <= 0)
{
    jumpscare(UnknownEnum.Value_43, 0, 0, false);
    instance_destroy();
}
else if (ShockTimer > 0)
{
    global.MicrogameWin = true;
    oFredbearManager.MicrogameTimer = min(1, oFredbearManager.MicrogameTimer);
}

enum UnknownEnum
{
    Value_43 = 43
}
