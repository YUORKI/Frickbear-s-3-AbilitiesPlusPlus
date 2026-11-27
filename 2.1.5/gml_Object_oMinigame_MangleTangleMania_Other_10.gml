UpInput = false;
LeftInput = false;
DownInput = false;
RightInput = false;

if (!mouse_in_minigame_window() || WaitForClick)
{
    WaitForClick = true;
}
else
{
    WaitForClick = false;
    var LeftTurnInput = -1;
    var RightTurnInput = 1;
    UpInput = input_check_pressed(UnknownEnum.Value_2);
    LeftInput = input_check_pressed(UnknownEnum.Value_3);
    DownInput = input_check_pressed(UnknownEnum.Value_4);
    RightInput = input_check_pressed(UnknownEnum.Value_5);
    
    if (UpInput)
        input_clear(UnknownEnum.Value_2);
    
    if (LeftInput)
        input_clear(UnknownEnum.Value_3);
    
    if (DownInput)
        input_clear(UnknownEnum.Value_4);
    
    if (RightInput)
        input_clear(UnknownEnum.Value_5);
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5
}
