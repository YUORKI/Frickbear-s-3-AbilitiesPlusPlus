var MouseX = global.MouseX - x - 182;
var MouseY = global.MouseY - y - 6;
var Generosity = 6;

if ((0 - Generosity) <= MouseX && (16 + Generosity) > MouseX && (0 - Generosity) <= MouseY && (14 + Generosity) > MouseY && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)))
{
    audio_play_sound(sfxClick, 10, false);
    instance_destroy();
}

movement();
depth = -50;
