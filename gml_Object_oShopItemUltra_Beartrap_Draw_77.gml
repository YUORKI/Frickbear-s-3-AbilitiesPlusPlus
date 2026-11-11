set_target_to_ui();
image_index = UnknownEnum.Value_4;

if (Hovered)
    draw_outline(16777215);

draw_sprite(sprite_index, image_index, x, y);
draw_lives();
surface_reset_target();

enum UnknownEnum
{
    Value_4 = 4
}
