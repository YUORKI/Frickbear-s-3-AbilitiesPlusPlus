CamNumber = 0;
BaseY = y;
CharsOnCam = [];
CharsOnCamSubtypes = [];

function radar_draw(arg0, arg1, arg2 = 0)
{
    if (CamNumber != arg1)
        exit;
    
    var Add = true;
    
    for (var i = 0; i < array_length(CharsOnCam); i++)
    {
        if (CharsOnCam[i] == arg0 && CharsOnCamSubtypes[i] == arg2)
            exit;
    }
    
    if (RadarMode == 2)
    {
        array_push(CharsOnCam, arg0);
        array_push(CharsOnCamSubtypes, arg2);
    }
    else
    {
        CharsOnCam = [sCamRadarIcon];
        CharsOnCamSubtypes = [0];
    }
}

RadarMode = has_upgrade(UnknownEnum.Value_11);

if (has_upgrade(UnknownEnum.Value_12))
    RadarMode = 2;

MXESInfected = false;

enum UnknownEnum
{
    Value_11 = 11,
    Value_12
}
