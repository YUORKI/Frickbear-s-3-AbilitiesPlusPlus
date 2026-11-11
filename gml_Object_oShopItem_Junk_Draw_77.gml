set_target_to_ui();
image_index = Image;

if (Hovered)
    draw_outline(16777215);

draw_sprite(sprite_index, image_index, x, y);
surface_reset_target();
