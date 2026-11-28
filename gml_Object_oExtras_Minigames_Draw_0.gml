var DescriptionText = "Select a game from the menu above!";
var YourScore = "-";
var MenuOffset = -224 * (1 - TileSize);
var GameWindowOffset = 400 * (1 - TileSize);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, MenuOffset, 0, 220, 360);
draw_sprite_stretched(sTextBox_Windows, 1, MenuOffset + 28, 4, 188, 22);
draw_text(MenuOffset + 33, 5, "Minigames");
draw_sprite_stretched(sTextBox_Windows, 0, GameWindowOffset + 262, 28, 336, 304);
draw_sprite_stretched(sTextBox_Windows, 2, GameWindowOffset + 268, 34, 324, 292);

if (surface_exists(global.MinigameSurface))
    draw_surface_ext(global.MinigameSurface, GameWindowOffset + 270, 36, global.MinigameWindowScale, global.MinigameWindowScale, 0, c_white, 1);
else
    draw_sprite_ext(sEmilySoftScreen, 0, GameWindowOffset + 270, 36, 2, 2, 0, c_white, 1);

draw_sprite_stretched(sTextBox_Windows, 2, MenuOffset + 4, 28, 212, 158);

if (!surface_exists(SelectionSurf))
    SelectionSurf = surface_create(192, 154);

surface_set_target(SelectionSurf);
draw_clear_alpha(c_black, 0);

for (var i = 0; i < 16; i++)
{
    var YPos = (i * 16) - ScrollOffset;
    
    if (clicked(MenuOffset + 6, YPos + 30, 196, 16) && global.UnlockedMinigames[i] && mouse_in_zone(MenuOffset + 6, 28, MenuOffset + 6 + surface_get_width(SelectionSurf), 28 + surface_get_height(SelectionSurf)) && TileSize > 0.5 && i != Selected && Active)
    {
        Selected = i;
        instance_destroy(oMinigameParent);
        instance_create_depth(-320, -320, 0, get_minigame_data(i).Object);
        audio_play_sound(sfxCamSwitch, 10, false);
    }
    
    draw_set_font(global.FontW97White);
    var BGColor = 16777215;
    var TextColor = 0;
    
    if (i == Selected)
    {
        BGColor = 0;
        TextColor = 16777215;
    }
    
    draw_rectangle_color(0, YPos, 196, YPos + 16, BGColor, BGColor, BGColor, BGColor, false);
    var Text = get_minigame_data(i).Name;
    
    if (!global.UnlockedMinigames[i])
    {
        Text = "-- LOCKED --";
        TextColor = 12632256;
    }
    
    draw_sprite(global.UnlockedMinigames[i] ? get_minigame_icon(i) : sCamRadarIcon, 0, 1, YPos);
    draw_text_color(21, YPos - 1, Text, TextColor, TextColor, TextColor, TextColor, 1);
    draw_set_font(global.FontW97Black);
}

surface_reset_target();
draw_surface(SelectionSurf, MenuOffset + 6, 30);
var ScrollBar = scroll_bar(ScrollOffset, BarDragged, MenuOffset + 6, 30, surface_get_width(SelectionSurf), surface_get_height(SelectionSurf), 256, 11);
ScrollOffset = ScrollBar[0];
BarDragged = ScrollBar[1];

if (Selected > -1)
{
    DescriptionText = get_minigame_data(Selected).Desc;
    YourScore = global.HiScoresOverall[Selected];
    
    if (timer_based_minigame(Selected))
        YourScore = format_as_timer(YourScore, true);
}

draw_sprite_stretched(sTextBox_Windows, 2, MenuOffset + 4, 188, 212, 168);
draw_text_ext(MenuOffset + 10, 190, DescriptionText, 14, 182);

if (Selected != -1)
    draw_text(MenuOffset + 10, 335, string("All-Time Hi-Score: {0}", array_contains([UnknownEnum.Value_0, UnknownEnum.Value_4, UnknownEnum.Value_7], Selected) ? format_as_timer(global.HiScoresOverall[Selected], true) : global.HiScoresOverall[Selected]));

draw_sprite_stretched(sButtonMini, 0, MenuOffset + 4, 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, MenuOffset + 4 + 11, 15);
var Quit = clicked(MenuOffset + 4, 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras.Active = true;
    instance_destroy(oMinigameParent);
    surface_free(global.MinigameSurface);
}

if (global.CupcakeMeter < 1)
    global.CupcakeMeter = max(global.CupcakeMeter - 0.002, 0);

TileSize += ((Active - TileSize) / 5);

if (TileSize < 0.01 && oExtras.Active)
    instance_destroy();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_4 = 4,
    Value_7 = 7
}
