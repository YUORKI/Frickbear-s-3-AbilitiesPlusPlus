shader_set(shRecolor);
var Pal = [16777215, 10461087, 1248964, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
var AltColor = 13695200;
draw_sprite_ext(sTextBox, 1, 512, 0, 2, 0.75, 0, c_white, 1);
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_left);
draw_text_color(524, 12, "$" + string_format(DisplayedEarnings, 3, 2), AltColor, AltColor, AltColor, AltColor, 1);

if (abs(global.RunEarnings - DisplayedEarnings) < 0.5)
{
    DisplayedEarnings = global.RunEarnings;
}
else
{
    DisplayedEarnings += (sign(global.RunEarnings - DisplayedEarnings) * 0.5);
    audio_play_sound(sfxTally, 1, false, 0.5);
}

draw_rectangle_color(0, 0, 320 * TransitionPercent, 360, #010101, #010101, #010101, #010101, false);
draw_rectangle_color(640 - (320 * TransitionPercent), 0, 640, 360, #010101, #010101, #010101, #010101, false);
TransitionPercent += ((TransitioningOut - TransitionPercent) / 5);

if (TransitioningOut)
    TransitioningOutFrames++;

if (TransitioningOutFrames >= 60)
{
    application_surface_draw_enable(true);
    room_goto(EndlessSelection);
}

if (instance_exists(oTextBox) && !TransitioningOut)
{
    if (oTextBox.TextPage == (oTextBox.TextPageNumber - 1))
    {
        TransitioningOut = true;
        audio_sound_gain(global.Music, 0, 1000);
    }
}

shader_reset();
