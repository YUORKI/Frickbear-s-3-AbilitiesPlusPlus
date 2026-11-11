if (point_distance(x, y, o3DMouse.x, o3DMouse.y) < Radius && mouse_check_button_pressed(mb_left) && !global.CamUp)
    audio_play_sound(oWall.HonkSound, 15, false);

sprite_index = sNOTHING;
