if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

if (Paused)
{
    clear_my_inputs();
    exit;
}

clear_my_inputs();
in_left = input_check(UnknownEnum.Value_3);
in_right = input_check(UnknownEnum.Value_5);
in_sd = input_check(UnknownEnum.Value_4);
in_hd = input_check_pressed(UnknownEnum.Value_0);
in_ccw = mouse_check_button_pressed(mb_left);
in_cw = mouse_check_button_pressed(mb_right);
in_180 = input_check_pressed(UnknownEnum.Value_2);
in_hold = input_check_pressed(UnknownEnum.Value_12);

if (!Paused)
{
    if (input_check(UnknownEnum.Value_3))
        block_matching_inputs(UnknownEnum.Value_3);
    
    if (input_check(UnknownEnum.Value_5))
        block_matching_inputs(UnknownEnum.Value_5);
    
    if (input_check(UnknownEnum.Value_4))
        block_matching_inputs(UnknownEnum.Value_4);
    
    if (in_hd)
        input_clear(UnknownEnum.Value_0);
    
    if (in_ccw)
        mouse_clear(mb_left);
    
    if (in_cw)
        mouse_clear(mb_right);
    
    if (in_180)
        input_clear(UnknownEnum.Value_2);
    
    if (in_hold)
        input_clear(UnknownEnum.Value_12);
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5,
    Value_12 = 12
}
