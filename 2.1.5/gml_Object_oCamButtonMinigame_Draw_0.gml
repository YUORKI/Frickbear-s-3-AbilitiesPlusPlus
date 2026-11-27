shader_set(TransparencyShader);
draw_set_font(global.FontW97White);
var Data = get_minigame_data(MinigameID);
var TexColor = Disabled ? 12632256 : 0;

if (instance_exists(Data.Object))
{
    draw_rectangle_color(x, y, x + 282, y + 13, c_black, c_black, c_black, c_black, false);
    TexColor = 16777215;
}

draw_text_color(x + 3, y - 3, Data.Name, TexColor, TexColor, TexColor, TexColor, 1);
draw_set_font(global.FontW97Black);
shader_reset();
