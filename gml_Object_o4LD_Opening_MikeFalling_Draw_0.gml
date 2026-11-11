shader_set(shFlash);
draw_sprite_ext(sHD_Guard, 5, 320, GuardY, 4, 4, GuardAngle, c_white, 1);
shader_reset();
GuardY += (GuardYSpeed + (GuardYSpeed / 100));
GuardYSpeed += 0.2;

while (GuardY > 392)
{
    GuardY -= 424;
    GuardAngle -= 45;
}

check_reset();
