var AIlvl = global.AILevels[ID];
var CornerL = 64;
var CornerR = 576;
var CornerT = 64;
var CornerB = 296;
var CenterX = 320;
var CenterY = 180;
var AntiX = 640 - clamp(global.MouseX, CornerL, CornerR);
var AntiY = 360 - clamp(global.MouseY, CornerT, CornerB);
AntiX = lerp(AntiX, global.MouseX, 0.25);
AntiY = lerp(AntiY, global.MouseY, 0.25);

if (AIlvl < 21)
{
    if (WaitTime > 0 && AIlvl > 0)
    {
        WaitTime -= 0.016666666666666666;
        
        if (WaitTime <= 0)
        {
            spawn_shooter(UnknownEnum.Value_0, AIlvl, AntiX, AntiY);
            set_wait_time(AIlvl);
        }
    }
}
else
{
    if (global.Power <= 0)
        global.Temperature = 40;
    
    switch (global.Timer - 300)
    {
        case 2:
        case 4:
            spawn_shooter(UnknownEnum.Value_0, 5, AntiX, AntiY);
            break;
        
        case 6:
            spawn_shooter(UnknownEnum.Value_0, 10, 90, 180);
            spawn_shooter(UnknownEnum.Value_0, 10, 550, 180);
            break;
        
        case 8:
            spawn_shooter(UnknownEnum.Value_5, 20, CornerL, 32);
            spawn_shooter(UnknownEnum.Value_5, 20, CornerR, 32);
            break;
        
        case 10:
            spawn_shooter(UnknownEnum.Value_3, 10, 320, 180);
            break;
        
        case 12:
        case 14:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            spawn_shooter(UnknownEnum.Value_0, 10, AntiX, AntiY);
            break;
        
        case 21:
            spawn_shooter(UnknownEnum.Value_0, 5, CornerL, CornerT);
            spawn_shooter(UnknownEnum.Value_0, 5, CornerL, CornerB);
            spawn_shooter(UnknownEnum.Value_0, 5, CornerR, CornerT);
            spawn_shooter(UnknownEnum.Value_0, 5, CornerR, CornerB);
            break;
        
        case 23:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerR, CornerT);
            break;
        
        case 24:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerR, CornerB);
            break;
        
        case 25:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerL, CornerT);
            break;
        
        case 25.5:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerL, CornerB);
            break;
        
        case 27:
        case 28:
        case 29:
        case 30:
            spawn_shooter(UnknownEnum.Value_4, 5, choose(CornerL, CornerR), choose(CornerT, CornerB, CenterY));
            break;
        
        case 31:
            spawn_shooter(UnknownEnum.Value_2, 10, CenterX, CenterY);
            break;
        
        case 33:
            spawn_shooter(UnknownEnum.Value_6, 4, CornerL, CornerB);
            spawn_shooter(UnknownEnum.Value_6, 4, CornerR, CornerB);
            spawn_shooter(UnknownEnum.Value_6, 4, CornerL, CornerT);
            spawn_shooter(UnknownEnum.Value_6, 4, CornerR, CornerT);
            break;
        
        case 35:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerR, CornerT);
            break;
        
        case 36:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerR, CornerB);
            break;
        
        case 37:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerL, CornerT);
            break;
        
        case 38:
            spawn_shooter(UnknownEnum.Value_2, 20, CornerL, CornerB);
            break;
        
        case 40:
            spawn_shooter(UnknownEnum.Value_1, 4, CenterX, CornerT);
            break;
        
        case 42:
            spawn_shooter(UnknownEnum.Value_1, 8, CornerL, CornerB);
            spawn_shooter(UnknownEnum.Value_1, 10, CornerR, CornerB);
            break;
        
        case 44:
            spawn_shooter(UnknownEnum.Value_1, 12, CenterX, CenterY);
            break;
        
        case 46:
            var i = CenterX + 64;
            
            while (i < 640)
            {
                spawn_shooter(UnknownEnum.Value_5, 5, i, 32);
                i += 32;
            }
            
            break;
        
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 54:
        case 55:
        case 56:
            spawn_shooter(UnknownEnum.Value_0, 20, choose(CornerL, lerp(CornerL, CenterX, 0.5), CenterX), CornerT);
            break;
        
        case 53:
            spawn_shooter(UnknownEnum.Value_3, 20);
            break;
        
        case 58:
            spawn_shooter(UnknownEnum.Value_2, 20);
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6
}
