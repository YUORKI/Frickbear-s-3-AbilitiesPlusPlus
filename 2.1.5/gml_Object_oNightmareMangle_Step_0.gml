var ID = UnknownEnum.Value_49;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

var RightClick = mouse_check_button_pressed(mb_right) && SecondLureAvailable;

if (global.CamUp && global.MonitorSystem == "Vents" && in_window(536, 60, 48, 48) && (mouse_check_button_pressed(mb_left) || RightClick))
{
    if (global.Tools.AudioLure[RightClick] > 0)
    {
        audio_play_sound(sfxError, 5, false);
    }
    else
    {
        if (RightClick)
        {
            global.AudioLureAltX = 87;
            global.AudioLureAltY = 87;
        }
        else
        {
            global.AudioLureX = 87;
            global.AudioLureY = 87;
        }
        
        audio_play_sound(sfxCamSwitch, 10, false);
    }
}

EnnardOffset = floor((EnnardProgress * 208) / 16) * 16;

if (EnnardOffset < 48)
    EnnardOffset = 0;

var LeftLure = global.AudioLureX == 87 && global.AudioLureY == 87;
var RightLure = global.AudioLureAltX == 87 && global.AudioLureAltY == 87;

if (LeftLure || RightLure)
{
    EnnardProgress -= 0.0033333333333333335;
    
    if (EnnardOffset == 0)
    {
        EnnardProgress = 0;
        
        if (LeftLure)
            disable_audiolure(round(lerp(15, 30, AI / 20)), 0);
        
        if (RightLure)
            disable_audiolure(round(lerp(15, 30, AI / 20)), 1);
        
        audio_play_sound(SOUND_Eat, 5, false);
        block_tokens();
    }
}
else
{
    EnnardProgress += (1 / (60 * lerp(120, 50, AI / 20)));
    
    if (EnnardProgress >= 1)
        jumpscare(ID, 0);
}

audio_sound_gain(SOUND_Ambience, (EnnardProgress - 0.75) * 2, 0);
show_debug_message(global.Tools.AudioLure);

enum UnknownEnum
{
    Value_49 = 49
}
