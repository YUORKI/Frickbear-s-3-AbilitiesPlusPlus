set_target_to_ui();
image_index = UnknownEnum.Value_0;

if (Hovered)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        Active = true;
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxSparkleImpact, 10, false);
        global.Power = 100;
        global.Timer = 360 - (360 / global.NightSpeedup);
        deplete_uses();
    }
}

draw_sprite(sprite_index, image_index, x, y);
draw_lives();
surface_reset_target();

enum UnknownEnum
{
    Value_0
}
