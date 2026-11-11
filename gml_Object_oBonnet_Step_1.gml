if (point_distance(x + rot_x(0, 80, image_angle), y + rot_y(0, 80, image_angle), global.MouseX, global.MouseY) <= 96 && mouse_check_button_pressed(mb_left) && GrabDelay <= 0)
{
    Grabbed = true;
    audio_play_sound(sfxPluck, 8, false);
    mouse_clear(mb_left);
}

GrabDelay--;
