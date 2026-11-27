var YTarget = 360;
WindowY += ((YTarget - WindowY) / 4);
draw_sprite_stretched(sWindowBase, 0, 0, WindowY, 496, 360 - WindowY);

if (!ChallengesOpen)
{
    draw_sprite_stretched(sWindowBase, 0, 496, 96, 144, 136);
    draw_sprite_stretched(sWindowBase, 0, 496, 232, 144, 64);
    global.Challenge = undefined;
    global.ChallengeTitle = "None";
    var ScrollBar = scroll_bar(TilesOffset, TilesDrag, 0, 0, 480, 360, 64 * ceil(8.7), 64);
    TilesOffset = ScrollBar[0];
    TilesDrag = ScrollBar[1];
}
else
{
    draw_sprite_stretched(sWindowBase, 0, 496, 260, 144, 36);
}

if (input_check_pressed(UnknownEnum.Value_1))
{
    global.Cheats = array_create(10, false);
    reset_challenge_alterations();
    audio_stop_sound(musCustomNight);
    audio_play_sound(sfxBump, 10, false);
    room_goto(title_screen());
}

draw_set_font(global.FontW97Black);

enum UnknownEnum
{
    Value_1 = 1
}
