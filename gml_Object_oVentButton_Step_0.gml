if (global.MonitorSystem == "Vents")
    y = BaseY;
else
    y = BaseY + 360;

var RightClick = mouse_check_button_pressed(mb_right) && SecondLureAvailable;

if (place_meeting(x, y, oMouseHitbox) && (mouse_check_button_pressed(mb_left) || RightClick))
{
    var CanEnsnare = false;
    
    with (oSalvage_VentCrawler)
    {
        if (VentX == other.ButtonID[0] && VentY == other.ButtonID[1])
        {
            destroy_crawler();
            CanEnsnare = true;
        }
    }
    
    if (!CanEnsnare)
    {
        if (RightClick)
        {
            if (global.Tools.AudioLure[1] > 0)
            {
                audio_play_sound(sfxError, 5, false);
            }
            else
            {
                global.AudioLureAltX = ButtonID[0];
                global.AudioLureAltY = ButtonID[1];
                audio_play_sound(sfxCamSwitch, 10, false);
            }
        }
        else if (global.Tools.AudioLure[0] > 0)
        {
            audio_play_sound(sfxError, 5, false);
        }
        else
        {
            global.AudioLureX = ButtonID[0];
            global.AudioLureY = ButtonID[1];
            audio_play_sound(sfxCamSwitch, 10, false);
        }
    }
}

Timer = (Timer + 0.016666666666666666) % 2;
