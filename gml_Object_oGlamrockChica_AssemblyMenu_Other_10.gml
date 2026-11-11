BinOffset = 40 - TabletOffset;
var TopBins = floor(BinCount / 2);
var BottomBins = ceil(BinCount / 2);
var BinX = 320 + (((TopBins - 1) / 2) * -90);
var BinY = BinOffset - (TabletOffset + 8);
Input = -1;

if (mouse_check_button_pressed(mb_left))
{
    for (var i = 0; i < BinCount; i++)
    {
        draw_sprite(sGlamrockChica_ToppingBins, i, BinX, BinY);
        
        if (mouse_in_zone(BinX - 38, BinY - 36, 76, (i >= TopBins) ? 86 : 44))
        {
            Input = i;
            mouse_clear(mb_left);
        }
        
        if (i == (TopBins - 1))
        {
            BinX = 320 + (((BottomBins - 1) / 2) * -90);
            BinY += 42;
        }
        else
        {
            BinX += 90;
        }
    }
    
    if (mouse_in_zone(233, 360 - BinOffset - 36, 174, 87))
    {
        Input = 10;
        mouse_clear(mb_left);
    }
    
    if (mouse_check_button_pressed(mb_left))
        TabletUp = false;
}

if (global.PanelUp)
    TabletUp = false;

if (!global.TurnedAround || global.CamUp || PizzaGrabbed || global.PanelUp || (mouse_check_button(mb_left) && !TabletUp))
{
    TabletUp = false;
}
else if (global.TurnedAround && !TabletUp)
{
    TabletUp = true;
    audio_play_sound(sfxControlPanel_Open, 5, false);
}
