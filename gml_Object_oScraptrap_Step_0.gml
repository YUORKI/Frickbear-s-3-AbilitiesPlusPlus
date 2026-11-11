var ID = UnknownEnum.Value_63;
var AI = global.AILevels[ID];

if ((TimeToKill + global.Timer) >= 360 && AI > 0 && array_length(Tasks) > 0)
    jumpscare(ID, 0);

enum UnknownEnum
{
    Value_63 = 63
}
