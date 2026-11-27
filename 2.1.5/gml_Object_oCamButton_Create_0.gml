CamNumber = 0;
BaseY = y;
CharsOnCam = [];

function radar_draw(arg0, arg1, arg2 = false)
{
    if (CamNumber == arg1 && !array_contains(CharsOnCam, arg0))
    {
        if (RadarMode == 2)
            array_push(CharsOnCam, arg0);
        else
            CharsOnCam = [UnknownEnum.Value_0];
    }
}

RadarMode = has_upgrade(UnknownEnum.Value_11);

if (has_upgrade(UnknownEnum.Value_12))
    RadarMode = 2;

MXESInfected = false;

enum UnknownEnum
{
    Value_0,
    Value_11 = 11,
    Value_12
}
