depth = 10;
draw_rectangle_color(0, 0, 640, 360, c_red, c_red, c_red, c_red, false);
draw_sprite(sAngelScene_OMC, 0, 105, 98);
draw_sprite_ext(sAngelScene_Angel, 0, (Timer > 7) ? 300 : lerp(342, 300, AngelPosition), lerp(-199, -12, AngelPosition), 1, 1, AngelPositionSpeed * 100, c_white, 1);
draw_rectangle_color(0, 231, 640, 360, c_black, c_black, c_black, c_black, false);

if (Timer == 1)
    audio_play_sound(sfxFredbearGrowl, 5, false, 1, 0, 0.5);

if (Timer == 7)
{
    global.Music = play_music(mus_Angel);
    
    with (instance_create_depth(0, 0, 0, oTextBox))
    {
        game_text("4LD_Angel");
        TextBoxSprite = sNOTHING;
    }
}

var AngelPosTarg = Timer > 1;

if (Timer > 7)
{
    AngelPosTarg = 1 + (dsin((Timer - 7) * 45) * 0.03);
    AngelPosition += ((AngelPosTarg - AngelPosition) / 10);
}
else
{
    AngelPositionSpeed = lerp(AngelPositionSpeed, (AngelPosTarg - AngelPosition) / 30, 0.04);
    AngelPosition += AngelPositionSpeed;
}

Timer += 0.016666666666666666;

if (FadingOut)
{
    draw_set_alpha(round_step(Fade, 0.25));
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    Fade += 0.004166666666666667;
}

check_reset();
