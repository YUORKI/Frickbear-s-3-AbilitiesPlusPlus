set_target_to_ui();
image_index = UnknownEnum.Value_5;

if (Hovered)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        instance_create_depth(0, 0, depth, oUltraDoorwayMenu);
        audio_play_sound(sfxClick, 10, false);
        deplete_uses();
    }
}

draw_sprite(sprite_index, image_index, x, y);
draw_lives();
surface_reset_target();

enum UnknownEnum
{
    Value_5 = 5
}
