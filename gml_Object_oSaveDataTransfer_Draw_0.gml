draw_set_font(global.FontW97White);
var sprite = sUIBox_Black;
var WindowWidth = 360;
var WindowHeight = 180;
var WindowX = (640 - WindowWidth) / 2;
var WindowY = ((360 - WindowHeight) / 2) + Offset;
var InnerWindowX = WindowX + 4;
var InnerWindowY = WindowY + 4;
var InnerWindowWidth = WindowWidth - 8;
var InnerWindowHeight = WindowHeight - 32;
draw_sprite_stretched(sprite, 0, WindowX, WindowY, WindowWidth, WindowHeight);
draw_sprite_stretched(sprite, 0, InnerWindowX, InnerWindowY, InnerWindowWidth, InnerWindowHeight);
draw_text_ext(WindowX + 4 + 6, WindowY + 4 + 1, ContinueString, 15, WindowWidth - 20);
draw_set_font(global.FontW97Black);
var ButtonX = InnerWindowX;
var ButtonY = InnerWindowY + InnerWindowHeight + 2;
var ButtonWidth = (InnerWindowWidth / 2) - 1;
var ButtonHeight = 22;
draw_sprite_stretched(sprite, 2, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Transfer Data");

if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight))
{
    OptionPressed = true;
    visible = false;
    alarm[0] = 60;
    audio_stop_all();
    audio_play_sound(sfxClick, 10, false);
    records_data_transfer();
}

ButtonX = InnerWindowX + (InnerWindowWidth / 2) + 2;
draw_sprite_stretched(sprite, 2, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Start Fresh");

if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight))
{
    OptionPressed = true;
    visible = false;
    alarm[0] = 60;
    audio_stop_all();
    audio_play_sound(sfxClick, 10, false);
}

Offset += ((OffsetTarget - Offset) / 5);

if (Offset >= 359 && OptionPressed)
    instance_destroy();
