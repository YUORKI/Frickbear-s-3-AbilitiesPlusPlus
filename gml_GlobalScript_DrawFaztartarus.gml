function draw_ferris_wheel(arg0, arg1, arg2)
{
    arg2 = arg2 / -3;
    
    for (var i = 0; i < 3; i++)
    {
        var Angle = arg2 + (i * 60);
        draw_sprite(sFazTartarus_FerrisWheel, 3, arg0 + lengthdir_x(80, Angle + 90), arg1 + lengthdir_y(80, Angle + 90) + 12);
        draw_sprite(sFazTartarus_FerrisWheel, 3, arg0 + lengthdir_x(80, Angle - 90), arg1 + lengthdir_y(80, Angle - 90) + 12);
        draw_sprite_ext(sFazTartarus_FerrisWheel, 1, arg0, arg1, 1, 1, Angle, c_white, 1);
    }
    
    draw_sprite_ext(sFazTartarus_FerrisWheel, 0, arg0, arg1, 1, 1, arg2, c_white, 1);
    draw_sprite(sFazTartarus_FerrisWheel, 2, arg0, arg1);
}

function draw_tower(arg0, arg1, arg2 = 320, arg3 = false, arg4 = 16777215, arg5 = 16777215, arg6 = 16777215)
{
    var X = arg2;
    var Y = arg3 ? lerp(360, 1180, arg0) : lerp(440, 1180, arg0);
    draw_sprite_ext(sFazTartarus_BG, floor(arg1 / 30), X, lerp(540, Y, 0.8), 1, 1, 0, arg6, 1);
    draw_ferris_wheel(X + 155, lerp(0, Y, 0.98) - 320, arg1);
    draw_sprite_ext(sFazTartarus_Moon, 0, X + 8, lerp(1080, Y, 0.9) - 1005, 1, 1, 0, arg4, 1);
    draw_sprite(sFazTartarus_PowerLines, 0, X - 320, lerp(360, Y, 0.96) - 187);
    draw_sprite_ext(sFazTartarus_Tower, floor(arg1 / 30), X, Y, 1, 1, 0, arg5, 1);
    draw_sprite_ext(sFazTartarus_RollerCoaster, floor(arg1 / 15) % 32, X, Y - 392, 1, 1, 0, arg5, 1);
    var TreeY = Y + ((Y - (arg3 ? 360 : 480)) * 1.5);
    draw_sprite(sFazTartarus_Trees, 0, X, TreeY);
    draw_rectangle_color(0, TreeY, 640, 360, c_black, c_black, c_black, c_black, false);
}
