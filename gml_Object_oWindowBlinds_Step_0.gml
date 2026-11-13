image_xscale = -1;
y = BaseY;

if (((place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left) && (o3DMouse.x >= 1344) == image_index) || (ForcedOpen && !Open)) && !global.PanelUp && !global.CamUp && global.TurnedAround)
{
    Open = true;
    audio_play_sound(sfxBlindsOpen, 3, false);
}

if (Open && (!mouse_check_button(mb_left) || !global.TurnedAround) && !ForcedOpen)
{
    Open = false;
    audio_play_sound(sfxBlindsClose, 3, false);
}

if (Open)
{
    BlindStretch += ((0.85 - BlindStretch) / 5);
    
    if (strings_panic(0))
        global.Temperature -= ((oCamera.FanSpeed * 8) / 60);
}
else
{
    BlindStretch += ((0 - BlindStretch) / 5);
}

y = BaseY - (BlindStretch * 155);
FullyClosed = round(BlindStretch * 100) == 0;
ForcedOpen = false;

enum UnknownEnum
{
    Value_18 = 18
}
