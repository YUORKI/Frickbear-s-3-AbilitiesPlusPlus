application_surface_draw_enable(true);
Song = -1;
SongPosition = 0;

function sequenced_sprite(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    arg6 += 0.25;
    arg7 -= 0.25;
    
    if (SongPosition < arg6 || SongPosition > arg7)
        exit;
    
    var RelativeStart = SongPosition - arg6;
    var PosPercent = RelativeStart / (arg7 - arg6);
    var Alpha = 1;
    
    if (SongPosition < (arg6 + arg8))
        Alpha = RelativeStart / arg8;
    else if (SongPosition > (arg7 - arg8))
        Alpha = (arg7 - SongPosition) / arg8;
    
    Alpha = clamp(Alpha, 0, 1);
    draw_sprite_ext(arg0, arg1, lerp(arg2, arg4, PosPercent), lerp(arg3, arg5, PosPercent), 1, 1, 0, c_white, Alpha);
}

EndscreenFadein = 0;
Exiting = false;
Countdown = 1;
