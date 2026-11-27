var BoxX = 28 - WindowOffset;
var BoxY = 28;
draw_sprite_stretched(sTextBox, 0, BoxX, BoxY, 336, 304);

if (surface_exists(global.MinigameSurface))
{
    global.MinigameWindowX = BoxX + 8;
    global.MinigameWindowY = BoxY + 8;
    draw_surface_ext(global.MinigameSurface, global.MinigameWindowX, global.MinigameWindowY, global.MinigameWindowScale, global.MinigameWindowScale, 0, c_white, 1);
}

BoxX = 368 + WindowOffset;
BoxY = 236;
BoxWidth = 268;

if (ShowScore)
{
    draw_sprite_stretched(sTextBox, 1, BoxX, BoxY, BoxWidth, 48);
    draw_set_font(global.FontHanddrawn);
    draw_text_color(BoxX + 12, BoxY + 12, "SCORE:", #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    draw_set_halign(fa_right);
    draw_text_color((BoxX + BoxWidth) - 12, BoxY + 12, string("{0} / {1}", string(global.HiScores[Minigame]), string(TargetScore)), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    BoxY += 48;
}

if (ShowTimer)
{
    draw_set_halign(fa_left);
    draw_sprite_stretched(sTextBox, 1, BoxX, BoxY, BoxWidth, 48);
    draw_set_font(global.FontHanddrawn);
    draw_text_color(BoxX + 12, BoxY + 12, "TIME:", #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    draw_set_halign(fa_right);
    draw_set_font(global.FontHanddrawn_Antijitter);
    draw_text_color((BoxX + BoxWidth) - 17, BoxY + 12, format_as_timer(max(TimeLimit, 0), true), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    draw_set_halign(fa_left);
}

WindowOffset -= (WindowOffset / 5);
