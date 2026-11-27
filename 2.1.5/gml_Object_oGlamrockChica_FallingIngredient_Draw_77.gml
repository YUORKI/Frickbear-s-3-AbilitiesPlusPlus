set_target_to_ui();
depth = 10;
DropSpeed += 1;
y += DropSpeed;
Alpha -= (1/15);

if (Alpha <= 0)
    instance_destroy();

draw_sprite_ext(sprite_index, image_index, x, y, Size, Size, 0, c_white, Alpha);
surface_reset_target();

if (!mouse_check_button(mb_left))
    Grabbed = false;

Size += ((1 - Size) / 5);
