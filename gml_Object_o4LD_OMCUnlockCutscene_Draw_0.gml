if (!surface_exists(Surf))
    Surf = surface_create(160, 96);

surface_set_target(Surf);
draw_clear_alpha(c_black, 1);

switch (Phase)
{
    case "FadeIn":
        if (Timer >= 0)
            Fade -= 0.004166666666666667;
        
        if (Timer == 5)
        {
            OMCSprite = 1;
            audio_play_sound(sfxBitPlace, 5, false, 0.5, 0, 0.8);
        }
        
        if (Timer == 6)
        {
            Timer = 0;
            Phase = "Pan";
        }
        
        break;
    
    case "Pan":
        PanPercent = sign_to_binary(dcos(clamp(Timer * 30, 0, 180)) * -1);
        
        if (Timer >= 8)
        {
            audio_stop_all();
            Fade = 1;
            Timer = 0;
            Phase = "Dialogue";
        }
        
        break;
    
    case "Dialogue":
        if (Timer == 1)
        {
            with (instance_create_depth(0, 0, 0, oTextBox))
            {
                game_text("4LD_Cassidy");
                TextBoxSprite = sNOTHING;
            }
        }
        
        break;
    
    case "Cassidy":
        if (Timer == 0.016666666666666666)
            play_music(mus_Cassidy, 1, 0.7);
        
        if (Timer >= 0)
            CassidyFade += 0.002777777777777778;
        
        break;
    
    case "Unlock":
        CassidyFade = 0;
        
        if (instance_exists(oTextBox))
            Timer = 0;
        
        if (Timer == 1)
            unlock_guard(UnknownEnum.Value_20);
        
        if (Timer == 4)
            room_goto(title_screen());
        
        break;
}

draw_sprite(s4LD_OMCUnlockScene, 2, lerp(80, 0, PanPercent), 0);
draw_sprite(s4LD_OMCUnlockScene, OMCSprite, lerp(0, -80, PanPercent), 0);
surface_reset_target();
shader_set(shRecolor);
var Pal = [16777215, 10461087, 1248964, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_sprite(sprite_index, 0, round(x), round(y));
draw_surface_ext(Surf, round(x), round(y), 2, 2, 0, c_white, 1);
draw_set_alpha(Fade);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_sprite_ext(sOMCCassidy, floor(Timer) % 3, 0, 0, 1, 1, 0, c_white, CassidyFade);
Timer += 0.016666666666666666;
check_reset();

enum UnknownEnum
{
    Value_20 = 20
}
