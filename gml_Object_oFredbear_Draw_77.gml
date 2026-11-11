set_target_to_ui();
draw_set_font(global.FontHanddrawn);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < 360; i += 45)
{
    draw_set_color(c_black);
    draw_text_transformed(320 + (TextSize * round(lengthdir_x(1, i))), TextOffset + 180 + (TextSize * round(lengthdir_y(1, i))), ChosenTitle, TextSize, TextSize, 0);
}

draw_set_color(c_white);
draw_text_transformed(320, TextOffset + 180, ChosenTitle, TextSize, TextSize, 0);
draw_set_valign(fa_top);
surface_reset_target();
