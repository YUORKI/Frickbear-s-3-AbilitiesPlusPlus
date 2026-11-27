set_target_to_ui();
draw_outline(16777215, SPRITE_Body);
draw_sprite_ext(SPRITE_Body, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

if (image_index == 4)
    draw_sprite(SPRITE_Body, floor(ZapFrames) + 5, x, y);

surface_reset_target();
