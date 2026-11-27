set_target_to_ui();
depth = 1;

if (Active)
{
    draw_sprite_ext(SPRITE_Body, 0, x + rot_x(0, 160, image_angle), y + rot_y(0, 160, image_angle), 1, 1, BodyAngle, c_white, 1);
    draw_sprite_ext(SPRITE_Ear, 0, x + rot_x(-50, 0, image_angle), y + rot_y(-50, 0, image_angle), -1, 1, BodyAngle, c_white, 1);
    draw_sprite_ext(SPRITE_Ear, 1, x + rot_x(50, 0, image_angle), y + rot_y(50, 0, image_angle), 1, 1, BodyAngle, c_white, 1);
    draw_sprite_ext(SPRITE_Head, Thrown ? 2 : (Grabbed ? 1 : 0), x, y, 1, 1, image_angle, c_white, 1);
}

BodyAngle += (angle_difference(image_angle, BodyAngle) / 5);
surface_reset_target();
