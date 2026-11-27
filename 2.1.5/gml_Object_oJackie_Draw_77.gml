set_target_to_ui();
depth = 1;
var CrankX = 320;
var CrankY = CrankPos;
var AngleToMouse = point_direction(CrankX, CrankY, global.MouseX, global.MouseY);
draw_sprite(sJackie_Crank, 0, CrankX, CrankY);
draw_sprite_ext(sJackie_Crank, 1, CrankX, CrankY, 1, 1, CrankAngle - 90, c_white, 1);
var HandleX = CrankX + lengthdir_x(40, CrankAngle);
var HandleY = CrankY + lengthdir_y(40, CrankAngle);
draw_sprite(sJackie_Crank, 2, HandleX, HandleY);

if (mouse_check_button_pressed(mb_left) && point_distance(global.MouseX, global.MouseY, HandleX, HandleY) < 20 && !CrankingIt)
{
    CrankingIt = true;
    CrankAngle = AngleToMouse;
}

if ((!mouse_check_button(mb_left) || global.TurnedAround || global.CamUp) && CrankingIt)
    CrankingIt = false;

if (CrankingIt && !Defeated)
{
    if (!audio_is_playing(sfxJackie_Crank))
        audio_play_sound(sfxJackie_Crank, 8, true);
    
    if (!audio_is_playing(sfxJackie_Pull))
        audio_play_sound(sfxJackie_Pull, 8, true);
    
    var AngDiff = angle_difference(AngleToMouse, CrankAngle);
    audio_sound_gain(sfxJackie_Pull, (DefaultHeadTarget - HeadTargetY) / (DefaultHeadTarget - DefeatPosition), 0);
    audio_sound_pitch(sfxJackie_Crank, abs(AngDiff) / 40);
    show_debug_message(AngDiff);
    Crankitude = (AngDiff / -10) * lerp(1.25, 0.6, AI / 20);
    
    if (HeadTargetY <= DefaultHeadTarget || Crankitude >= 0)
    {
        CrankAngle += (AngDiff / 2);
        HeadTargetY -= Crankitude;
        PermanentProgressGain += (Crankitude / lerp(2, 5, AI / 20));
    }
    else
    {
        Crankitude = 0;
    }
    
    if (oSuperGameManager.UpsideDownTest)
    {
        HandleX = rot_x(HandleX - 320, HandleY - 180, oCamera.ScreenAngle) + 320;
        HandleY = rot_y(HandleY - 320, HandleY - 180, oCamera.ScreenAngle) + 180;
    }
    
    var WindowXSetter = HandleX / display_get_gui_width();
    var WindowYSetter = HandleY / display_get_gui_height();
    window_mouse_set(window_get_width() * WindowXSetter, window_get_height() * WindowYSetter);
}
else if (!Defeated)
{
    HeadTargetY = DefaultHeadTarget - PermanentProgressGain;
    Crankitude = 0;
    CrankAngle += (angle_difference(0, CrankAngle) / 4);
}

if (!CrankingIt)
{
    audio_stop_sound(sfxJackie_Crank);
    audio_stop_sound(sfxJackie_Pull);
}

CrankPos += CrankSpeed;
CrankSpeed = lerp(CrankSpeed, (((Active && Frame > 1 && !(global.CamUp || global.TurnedAround)) ? (CrankingIt ? 296 : 296) : 440) - CrankPos) * 0.35, 0.2);
surface_reset_target();
