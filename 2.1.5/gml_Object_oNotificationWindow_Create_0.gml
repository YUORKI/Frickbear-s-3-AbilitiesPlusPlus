Text = "Balls!";
YOffset = 0;
YTarget = 32;
Alpha = 2;

function draw_stuff()
{
    draw_set_font(global.FontW97Black);
    draw_set_halign(fa_center);
    var BoxWidth = string_width(Text) + 12;
    draw_set_alpha(Alpha);
    draw_sprite_stretched(sTextBox_Windows, 0, x - floor(BoxWidth / 2), y, BoxWidth, 22);
    draw_text(x, y + 1, Text);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}
