draw_set_alpha((Frame - 120) / 60);
draw_sprite(sNightOpeningRenders, Background, 0, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(FontNightOpening);
var XOffset = 16;

for (var a = 0; a < string_length(Text); a++)
{
    draw_text(XOffset, PositionY[a * 5], string_char_at(Text, a + 1));
    XOffset += string_width(string_char_at(Text, a + 1));
}

draw_set_alpha((Frame - 120) / 60);
draw_set_halign(fa_left);
draw_set_font(global.FontW97White);

if (Text == "Endless Night")
    draw_text(16, 204, "How long can you survive?");
else if (Text == "Night F")
    draw_text(16, 204, "Survive.");
else
    draw_text(16, 204, "Survive to 6 A.M.");

draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text_ext(624, (360 + TipOffset) - 16, "FRICK-TIP: " + Tip, 15, 612);
TipOffset *= 0.9;
var FadeoutAlpha = (Frame - 240) / 60;
draw_set_alpha(FadeoutAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (Frame > 300 || input_check_pressed(UnknownEnum.Value_0))
{
    if (global.Route == UnknownEnum.Value_4 && boss_fight_night())
        room_goto(FredbearHome);
    else
        room_goto(Office);
}

for (var i = 0; i < array_length(NewAnimatronics); i++)
    draw_sprite_ext(global.IconTiles[NewAnimatronics[i]], 0, 640 - (48 * (i + 1)), AnimatronicOffsets[i], 1, 1, 0, c_white, 1 - FadeoutAlpha);

for (var i = 0; i < min(array_length(NewAnimatronics), floor(Frame / 5)); i++)
    AnimatronicOffsets[array_length(NewAnimatronics) - (i + 1)] *= 0.8;

draw_set_valign(fa_top);

enum UnknownEnum
{
    Value_0,
    Value_4 = 4
}
