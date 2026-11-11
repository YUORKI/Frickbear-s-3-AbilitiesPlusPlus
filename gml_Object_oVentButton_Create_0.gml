ButtonID = [0, 0];
BaseY = y;
Timer = 0;

function PositionTest(arg0, arg1)
{
    var Animatronic = get_animatronic_object(arg0);
    
    if (instance_exists(Animatronic) && floor((Timer % 1) * 8) == arg1 && global.MonitorSystem == "Vents")
    {
        if (Animatronic.VentY > 1)
            exit;
        
        var ButtonX = (oCameraUI.x + 320 + (Animatronic.VentX * 80)) - 24;
        var ButtonY = (oCameraUI.y + 164 + (Animatronic.VentY * 80)) - 24;
        draw_rectangle_color(ButtonX + 2, ButtonY + 2, ButtonX + 45, ButtonY + 45, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_sprite(global.IconTiles[arg0], 1, ButtonX, ButtonY);
    }
}

function draw_salvage_wires()
{
    with (oSalvage_VentCrawler)
    {
        for (var i = 1; i < array_length(Path); i++)
        {
            var XPrev = Path[i - 1][0];
            var YPrev = Path[i - 1][1];
            var XCur = Path[i][0];
            var YCur = Path[i][1];
            var XNext, YNext;
            
            if (i < (array_length(Path) - 1))
            {
                XNext = Path[i + 1][0];
                YNext = Path[i + 1][1];
            }
            
            var Direction = point_direction(XPrev, YPrev, XCur, YCur);
            var ImageType = 0;
            var XScale = 1;
            var YScale = 1;
            
            if (i == (array_length(Path) - 1))
            {
                ImageType = 0;
            }
            else if (point_direction(Path[i][0], Path[i][1], XNext, YNext) == Direction)
            {
                ImageType = 1;
            }
            else
            {
                ImageType = 2;
                
                if ((YCur - YPrev) == 1 && (XNext - XCur) == -1)
                    Direction = 270;
                
                if ((YCur - YPrev) == 1 && (XNext - XCur) == 1)
                    Direction = 180;
                
                if ((YCur - YPrev) == -1 && (XNext - XCur) == -1)
                    Direction = 0;
                
                if ((YCur - YPrev) == -1 && (XNext - XCur) == 1)
                    Direction = 90;
                
                if ((XCur - XPrev) == -1 && (YNext - YCur) == -1)
                    Direction = 180;
                
                if ((XCur - XPrev) == -1 && (YNext - YCur) == 1)
                    Direction = 90;
                
                if ((XCur - XPrev) == 1 && (YNext - YCur) == -1)
                    Direction = 270;
                
                if ((XCur - XPrev) == 1 && (YNext - YCur) == 1)
                    Direction = 0;
                
                draw_text((XCur * 48) + x, (YCur * 48) + y, Direction);
            }
            
            var Img = (ImageType * 2) + 1 + floor((other.Timer * 2) % 2);
            
            if (ImageType == 0 && Vanishing)
                Img = 0;
            
            if (!Vanishing || (floor(VanishFrame / 4) % 2) == 0)
            {
                with (other)
                {
                    if (ButtonID[0] == XCur && ButtonID[1] == YCur)
                        draw_sprite_ext(sBossSalvage_Wires, Img, x, y, 1, 1, Direction, c_white, 1);
                }
            }
        }
    }
}

SecondLureAvailable = has_upgrade(UnknownEnum.Value_63);

enum UnknownEnum
{
    Value_63 = 63
}
