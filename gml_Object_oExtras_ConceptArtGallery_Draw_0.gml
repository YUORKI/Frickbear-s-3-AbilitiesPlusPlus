draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var PortraitSize = ImageSize + ImageOffsetSize;
image_index = 1;
draw_self();

if (!surface_exists(OptionsSurf))
    OptionsSurf = surface_create(192, 140);

surface_set_target(OptionsSurf);
draw_clear_alpha(c_black, 0);
var OptionsHeight = 0;
var HeightVal = 0;

for (i = 1; i < array_length(ConceptArt); i++)
{
    if (CurrentMode != ConceptArt[i].UpdateArt)
        continue;
    
    var Available = ConceptArt[i].Unlocked || global.DevMode;
    var YPos = (HeightVal * 14) - OptionsOffset;
    
    if (clicked(0 + (x + 6), YPos + (y + 30), 192, 14) && YPos > -14 && YPos < 140 && Available)
        switch_page(i);
    
    draw_set_font(global.FontW97White);
    var BGColor = 16777215;
    var TextColor = 0;
    
    if (i == Selected)
    {
        BGColor = 0;
        TextColor = 16777215;
    }
    
    draw_rectangle_color(0, YPos, 196, YPos + 14, BGColor, BGColor, BGColor, BGColor, false);
    var Text = ConceptArt[i].Name;
    
    if (!Available)
    {
        Text = "-- LOCKED --";
        TextColor = 12632256;
    }
    else if (global.ExtrasNotifs.ConceptArtNotifs[i])
    {
        draw_sprite(sExtrasNotification, 1, 187, YPos + 7);
    }
    
    draw_text_color(3, -3 + YPos, Text, TextColor, TextColor, TextColor, TextColor, 1);
    draw_set_font(global.FontW97Black);
    HeightVal++;
}

surface_reset_target();
draw_surface(OptionsSurf, x + 6, y + 30);
var ContentHeight = 14 * HeightVal;
var ScrollBar = scroll_bar(OptionsOffset, OptionsDragged, x + 6, 30, 192, 140, ContentHeight, 14);
OptionsOffset = ScrollBar[0];
OptionsDragged = ScrollBar[1];
draw_text_ext(x + 10, y + 175, ConceptArt[Selected].Description, 14, 182);
var Quit = clicked(x + 4, y + 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
draw_sprite_stretched(sButtonMini, 0, x + 4, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, x + 4 + 11, y + 4 + 11);
var ClickNext = clicked(x + 194, y + 4, 22, 22) || input_check_pressed(UnknownEnum.Value_5);
var ClickPrev = clicked(x + 172, y + 4, 22, 22) || input_check_pressed(UnknownEnum.Value_3);
draw_sprite_stretched(sButtonMini, ClickPrev, x + 172, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 1, x + 172 + 11, y + 4 + 11);
draw_sprite_stretched(sButtonMini, ClickNext, x + 194, y + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 2, x + 194 + 11, y + 4 + 11);
draw_sprite_stretched(sButtonMini, !CurrentMode, x + 28, y + 4, 71, 22);
draw_text(x + 28 + 5, y + 5, "FB3");

if (clicked(x + 28, y + 4, 71, 22) && CurrentMode)
{
    CurrentMode = false;
    audio_play_sound(sfxClick, 5, false);
}

draw_sprite_stretched(sButtonMini, CurrentMode, x + 28 + 71, y + 4, 71, 22);
draw_text(x + 28 + 5 + 71, y + 5, "4LD");

if (clicked(x + 28 + 71, y + 4, 71, 22) && !CurrentMode)
{
    CurrentMode = true;
    audio_play_sound(sfxClick, 5, false);
}

var i = Selected;
var iStart = Selected;

if (ClickPrev)
{
    do
        i = (i + (array_length(ConceptArt) - 1)) % array_length(ConceptArt);
    until ((ConceptArt[i].Unlocked || global.DevMode) && ConceptArt[i].UpdateArt == CurrentMode);
    
    switch_page(i);
    var Direction = sign(i - iStart);
    
    for (var p = iStart; p != i; p += Direction)
    {
        if (ConceptArt[p].UpdateArt == CurrentMode)
            OptionsOffset += (14 * Direction);
    }
    
    OptionsOffset = clamp(OptionsOffset, 0, ContentHeight - 140);
}

if (ClickNext)
{
    do
        i = (i + 1) % array_length(ConceptArt);
    until ((ConceptArt[i].Unlocked || global.DevMode) && ConceptArt[i].UpdateArt == CurrentMode);
    
    switch_page(i);
    var Direction = sign(i - iStart);
    
    for (var p = iStart; p != i; p += Direction)
    {
        if (ConceptArt[p].UpdateArt == CurrentMode)
            OptionsOffset += (14 * Direction);
    }
    
    OptionsOffset = clamp(OptionsOffset, 0, ContentHeight - 140);
}

if (Quit)
{
    ViewMode = false;
    Active = false;
    audio_play_sound(sfxBump, 5, false);
    oExtras.Active = true;
}

if (in_window(x + 220, y, 420, 360) && mouse_check_button_pressed(mb_left) && !ViewMode && x > -110)
    ViewMode = true;
else if (in_window(0, 0, 640, 360) && mouse_check_button_pressed(mb_left) && ViewMode)
    ViewMode = false;

if (ViewMode)
{
    x += ((-220 - x) / 5);
    ImageX += ((320 - ImageX) / 5);
    var XPosOnImage = ((ImageX + ImageOffsetX) - global.MouseX) / PortraitSize;
    var YPosOnImage = ((180 + ImageOffsetY) - global.MouseY) / PortraitSize;
    var SizeChange = (mouse_wheel_up() - mouse_wheel_down()) / 8;
    ImageOffsetSize += SizeChange;
    
    if (SizeChange != 0)
    {
        var NewSize = ImageSize + clamp(ImageOffsetSize, 0, 1 - ImageSize);
        var NewOffsetX = (XPosOnImage * NewSize) - (ImageX - global.MouseX);
        var NewOffsetY = (YPosOnImage * NewSize) - (180 - global.MouseY);
        ImageOffsetX = NewOffsetX;
        ImageOffsetY = NewOffsetY;
    }
    
    if (mouse_check_button_pressed(mb_right))
    {
        LastMouseX = global.MouseX;
        LastMouseY = global.MouseY;
    }
    
    if (mouse_check_button(mb_right))
    {
        ImageOffsetX -= (LastMouseX - global.MouseX);
        ImageOffsetY -= (LastMouseY - global.MouseY);
        LastMouseX = global.MouseX;
        LastMouseY = global.MouseY;
    }
}
else
{
    if (Active)
    {
        x -= (x / 5);
    }
    else
    {
        x += ((-220 - x) / 5);
        
        if (x < -119)
            instance_destroy();
    }
    
    ImageX += ((DefaultImageX - ImageX) / 5);
    ImageOffsetX -= (ImageOffsetX / 5);
    ImageOffsetY -= (ImageOffsetY / 5);
    ImageOffsetSize -= (ImageOffsetSize / 5);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3,
    Value_5 = 5
}
