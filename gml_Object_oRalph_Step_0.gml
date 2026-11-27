var AI = global.AILevels[ID];

if (AI == 0)
    Progress = 0;

var TargStage = floor(power(Progress, 1.5) * 9);

if (Stage != TargStage)
{
    if (TargStage == 10)
    {
        if (!global.Doors[1])
            jumpscare(ID, 1);
        
        Progress = 1;
    }
    else
    {
        fuzz_up(CurrentCam);
        Stage = TargStage;
        var MoveSound = choose_from_array(SOUND_Move);
        
        switch (TargStage)
        {
            case 0:
                CurrentCam = UnknownEnum.Value_8;
                break;
            
            case 1:
            case 2:
                CurrentCam = UnknownEnum.Value_7;
                reverb_sound(MoveSound, 0, -500, false, 0.1, 1, 0.9);
                break;
            
            case 3:
            case 4:
                CurrentCam = UnknownEnum.Value_1;
                reverb_sound(MoveSound, 0, -500, false, 0.2, 1, 0.8);
                break;
            
            case 5:
            case 6:
                CurrentCam = UnknownEnum.Value_2;
                reverb_sound(MoveSound, 0, -500, false, 0.3, 1, 0.7);
                break;
            
            case 7:
            case 8:
                CurrentCam = UnknownEnum.Value_5;
                reverb_sound(MoveSound, 500, -500, false, 0.5, 1, 0.5);
                break;
                break;
        }
        
        switch (TargStage)
        {
            case 0:
                depth = 35;
                break;
            
            case 1:
                depth = 75;
                break;
            
            case 2:
                depth = 75;
                break;
            
            case 3:
                depth = 75;
                break;
            
            case 4:
                depth = 75;
                break;
            
            case 5:
                depth = 75;
                break;
            
            case 6:
                depth = 75;
                break;
            
            case 7:
                depth = 75;
                break;
            
            case 8:
                depth = 11;
                break;
        }
        
        fuzz_up(CurrentCam);
    }
}

if (camera_viewed(CurrentCam))
    FreezeFrames = lerp(6, 4, AI / 20);

var TimeToRightDoor = lerp(100, 80, AI / 20) * (3 / global.NightSpeedup);

if (FreezeFrames <= 0)
    Progress += (1 / (TimeToRightDoor * 60));

FreezeFrames -= 0.016666666666666666;

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_5 = 5,
    Value_7 = 7,
    Value_8
}
