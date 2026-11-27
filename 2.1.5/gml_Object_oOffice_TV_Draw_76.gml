var CandyActive = instance_exists(oCandy) && global.AILevels[UnknownEnum.Value_44] > 0;
TVDisabled = global.Route == UnknownEnum.Value_3 && boss_fight_night() && !character_active(UnknownEnum.Value_44) && !character_active(UnknownEnum.Value_83);

if (TVDisabled)
    exit;

if (!surface_exists(TVSurf))
    TVSurf = surface_create(128, 128);

surface_set_target(TVSurf);
draw_clear_alpha(c_black, 0);

if (Frame >= 180)
    Frame = 0;

var TVImage = (floor(Frame / 15) % 2) + (CurrentAnimation * 2);

if (TVOn)
{
    draw_sprite(SPRITE_Animations, TVImage, 10, 12);
    
    if (VladMode)
        draw_sprite(oVladClara.SPRITE_Animations, TVImage, 10, 12);
    
    draw_sprite(SPRITE_On, 0, 0, 0);
}
else if (CandyActive)
{
    draw_sprite(oCandy.SPRITE_TV, floor(Frame / 30) % 2, 10, 12);
    draw_set_font(global.FontHanddrawn);
    draw_set_halign(fa_left);
    draw_text(18, 43, format_as_timer(ceil(oCandy.WaitTime)));
    draw_sprite(SPRITE_On, 0, 0, 0);
}
else
{
    draw_sprite(SPRITE_Off, 0, 0, 0);
}

Frame++;
surface_reset_target();
OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.3, 0.2);
HeightOffset += OffsetSpeed;

if (o3DMouse.x > 2010 && o3DMouse.y < 640 && mouse_check_button_pressed(mb_left) && !global.CamUp)
{
    CurrentAnimation = irandom(floor(sprite_get_number(SPRITE_Animations) / 2) - 1);
    OffsetSpeed = -5;
    TVOn = !TVOn;
    Frame = 0;
    
    if (TVOn)
    {
        simple_sound(sfxTV_SwitchOn, 400, 200, false, 1);
        simple_sound(sfxTV_Static, 400, 200, true, 1);
    }
    else
    {
        audio_stop_sound(sfxTV_Static);
        simple_sound(sfxTV_SwitchOff, 400, 200, false, 1);
    }
    
    with (oVladClara)
    {
        if (Active)
            turn_off_tv();
    }
    
    VladMode = false;
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_44 = 44,
    Value_83 = 83
}
