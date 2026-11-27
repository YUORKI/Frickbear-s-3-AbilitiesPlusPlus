image_index = UnknownEnum.Value_6;

if (Hovered)
{
    draw_outline(16777215);
    
    if (mouse_check_button_pressed(mb_left))
    {
        Active = true;
        audio_play_sound(sfxClick, 10, false);
        
        with (oEndless_AnimatronicPicker)
        {
            calculate_repeat_prevention();
            rerollMultiplier = 2;
            pick_choices();
            WindowOffsetSpeed = 10;
        }
        
        audio_play_sound(sfxSparkleImpact, 10, false);
        deplete_uses();
    }
}

draw_sprite(sprite_index, image_index, x, y);
draw_lives();

enum UnknownEnum
{
    Value_6 = 6
}
