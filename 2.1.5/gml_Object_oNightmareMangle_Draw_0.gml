depth = -1;
var PathX = 1176;
var PathY = 60;
var LeftLure = global.AudioLureX == 87 && global.AudioLureY == 87;
var RightLure = global.AudioLureAltX == 87 && global.AudioLureAltY == 87;

if (global.CamUp && global.MonitorSystem == "Vents" && global.AILevels[UnknownEnum.Value_49] > 0)
{
    draw_sprite(sEnnardRoute, 0, PathX, PathY);
    
    if (LeftLure)
        draw_sprite(sVentButton, 1 + SecondLureAvailable, PathX + 24, PathY + 24);
    
    if (RightLure)
        draw_sprite(sVentButton, 2, PathX + 24, PathY + 24);
    
    draw_sprite(sVentButton, 0, PathX + 24, PathY + 24 + EnnardOffset);
    draw_sprite(global.IconTiles[UnknownEnum.Value_49], 1, PathX, PathY + EnnardOffset);
}

enum UnknownEnum
{
    Value_49 = 49
}
