set_target_to_ui();
draw_set_halign(fa_left);

if (Hovered)
    draw_outline(16777215);

draw_sprite(sprite_index, image_index, x, y);
draw_lives();

if (Hovered)
    draw_mechanic_box(string("DUPLICATED ITEM: {0}", MimicText));

surface_reset_target();
