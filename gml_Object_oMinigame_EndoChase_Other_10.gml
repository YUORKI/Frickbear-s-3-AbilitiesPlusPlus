if (!Initialized)
    initialize();

var MonitorDownPause = false;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        MonitorDownPause = true;
}

if (mouse_in_minigame_window() && !MonitorDownPause)
{
    if (mouse_check_button_pressed(mb_left))
        Paused = false;
    
    if (input_check_pressed(UnknownEnum.Value_0))
    {
        input_clear(UnknownEnum.Value_0);
        Paused = false;
    }
}
else
{
    Paused = true;
}

if (!Paused)
    moon_passive_gain();

if (Paused)
    FreezeFrames = max(2, FreezeFrames + 1);

if (Paused)
{
    in_left = false;
    in_right = false;
    in_up = false;
    in_down = false;
    exit;
}
else
{
    in_left = input_check(UnknownEnum.Value_3);
    in_right = input_check(UnknownEnum.Value_5);
    in_up = input_check(UnknownEnum.Value_2);
    in_down = input_check(UnknownEnum.Value_4);
    
    if (input_check(UnknownEnum.Value_3))
        block_matching_inputs(UnknownEnum.Value_3);
    
    if (input_check(UnknownEnum.Value_5))
        block_matching_inputs(UnknownEnum.Value_5);
    
    if (input_check(UnknownEnum.Value_2))
        block_matching_inputs(UnknownEnum.Value_2);
    
    if (input_check(UnknownEnum.Value_4))
        block_matching_inputs(UnknownEnum.Value_4);
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5
}
