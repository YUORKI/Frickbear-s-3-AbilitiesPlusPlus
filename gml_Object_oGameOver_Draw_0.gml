if (global.Jumpscare == -1)
    draw_sprite_ext(sJumpscareDeathscreen, UnknownEnum.Value_15, 320, 180, 1, 1, 0, c_white, 1);
else if (global.Skins[global.Jumpscare] > -1)
    draw_imported_deathscreen(CustomDeathscreen);
else
    draw_normal_deathscreen(global.Jumpscare);

draw_self();

if (global.Night == "Endless")
{
    var AllGuards = array_concat(global.Lives, GuardsWhoDied);
    
    if (BoozeBlocked)
        array_push(AllGuards, 999);
    
    var CenterOffset = ((array_length(AllGuards) - 1) / 2) * -36;
    var ExplosionFrame = 40;
    var SecondaryExplosionFrame = 100;
    
    if (Frame == ExplosionFrame)
    {
        audio_play_sound(sfxBitExplosion, 50, false, 0.75);
        
        if (array_length(GuardsWhoDied) > 0)
        {
            VoiceLineID = get_guard_line(GuardsWhoDied[0], "Die");
            GuardLine = reverb_sound(VoiceLineID, 0, 0, false, 1);
            GuardLinePlayed = true;
        }
    }
    
    if (Frame == SecondaryExplosionFrame && LostChallenge != undefined)
    {
        audio_play_sound(sfxBitExplosion, 50, false, 0.75);
        reverb_sound(voc_Eleanor_Laugh, 0, 0, false, 2);
    }
    
    for (var i = 0; i < array_length(AllGuards); i++)
    {
        if (i < lives_left() || Frame < ExplosionFrame || (Frame < (ExplosionFrame + 60) && (floor(Frame / 5) % 2) == 0))
        {
            shader_set(shFlash);
            var Sprite = (AllGuards[i] == 999) ? sBarrierBooze : GuardSprite;
            show_debug_message(string("ALLGUARDS: {0} | FRAME: {1} | EXPLODE: {2}", AllGuards, Frame, ExplosionFrame));
            var Img = (AllGuards[i] == 999) ? ((Frame >= ExplosionFrame) ? 2 : 0) : (AllGuards[i] * 4);
            
            for (var ang = -45; ang < 360; ang += 90)
                draw_sprite_ext(Sprite, Img, 320 + (36 * i) + CenterOffset + round(lengthdir_x(1, ang)), 92 + round(lengthdir_y(1, ang)), 2, 2, 0, c_red, 1);
            
            shader_set(shRecolor);
            replace_color(13695200, 7389320, 5662772, 3354368, 255, 170, 85, 0);
            draw_sprite_ext(Sprite, Img, 320 + (36 * i) + CenterOffset, 92, 2, 2, 0, c_white, 1);
        }
    }
    
    if (LostChallenge != undefined && (Frame < SecondaryExplosionFrame || (Frame < (SecondaryExplosionFrame + 60) && (floor(Frame / 5) % 2) == 0)))
    {
        shader_set(shRecolor);
        replace_color(13695200, 7389320, 5662772, 3354368, 255, 170, 85, 0);
        draw_sprite(sEleanorChallengeIcons_Shop, LostChallenge, 320, 32);
    }
    
    shader_reset();
}

draw_set_halign(fa_center);
draw_set_font(global.FontW97White);
draw_set_color(c_red);
draw_set_alpha(Alpha);
var TimeLasted = "Time Lasted: " + format_as_timer(min(global.TimeOfDeath, 359.99), true);

if (boss_fight_night())
    TimeLasted = "Died on phase " + string(global.BossPhase);

draw_text_ext(320, 216, Tip, 14, 600);
draw_text_ext(320, 12, TimeLasted, 14, 600);
draw_set_alpha(1);

if (DeathLinePlayed && SoundPlaying != undefined && subtitles_enabled())
{
    draw_set_halign(fa_center);
    draw_set_font(global.FontW97White);
    var SubtitleText = SubtitleList[SubtitleEntry];
    var SubtitleEndpoint = 999;
    
    if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
        SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
    
    if (audio_sound_get_track_position(SoundPlaying) > SubtitleEndpoint)
        SubtitleEntry++;
    
    if (!audio_is_playing(SoundPlaying))
        SoundPlaying = undefined;
    
    draw_text_ext(320, 330, SubtitleText, 14, 600);
}

draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
draw_set_color(c_white);

if (Frame > 120)
    Alpha = min(Alpha + 0.016666666666666666, 1);

if (Frame > 120)
{
    draw_set_halign(fa_center);
    draw_set_font(global.FontW97White);
    
    for (var i = 0; i < array_length(Options); i++)
        draw_text_color(320, 270 + OptionOffset + (i * 20), Options[i], c_red, c_red, c_red, c_red, Alpha * (1 - (abs((-10 * i) - OptionOffset) / 20)));
    
    OptionOffset += (((-10 * SelectedOption) - OptionOffset) / 5);
    
    if (ExitFrame == 0)
        SelectedOption += (input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2));
    
    if ((input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2)) != 0)
        audio_play_sound(sfxCamSwitch, 99, false);
    
    SelectedOption = (SelectedOption + 3) % 3;
    draw_set_halign(fa_left);
}

if (input_check_pressed(UnknownEnum.Value_0) && ExitFrame == 0 && Frame > 120)
{
    ExitFrame = 1;
    
    if (SoundPlaying != undefined)
        audio_stop_sound(SoundPlaying);
    
    instance_destroy(oSoundPlayer);
    audio_play_sound(sfxClick, 99, false);
}

if ((Frame > 15 && global.Jumpscare != -1 && !DeathLinePlayed) && (GuardLinePlayed && (GuardLine == -1 || !audio_is_playing(GuardLine))))
{
    if (global.Skins[global.Jumpscare] > -1 && skin_get_attribute(global.Jumpscare, "ReplaceVoice", false))
    {
        var AlternateQuip = array_contains([UnknownEnum.Value_27, UnknownEnum.Value_70], global.Jumpscare) && global.JumpscareType > 0;
        var QuipList = skin_sound_array(global.Jumpscare, !AlternateQuip ? "voc_deathquip" : "voc_deathquipALT");
        
        if (array_length(QuipList) == 0)
        {
            Sound = sfxNOTHING;
        }
        else
        {
            var Line = ((global.DeathRecord[global.Jumpscare] + global.FunValue[0]) * global.FunValue[1]) % array_length(QuipList);
            var File = QuipList[Line];
            Sound = create_stream_from_filename(File);
        }
    }
    else
    {
        Sound = get_deathquip(global.Jumpscare);
    }
    
    var Subtitles = subtitle(Sound);
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    SoundPlaying = reverb_sound(Sound, 0, 0, false, 1.25);
    SubtitleEntry = 0;
    DeathLinePlayed = true;
}

if (ExitFrame != 0)
{
    draw_rectangle_color(0, 0, 640, 180 * ExitDegree, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 360 - (180 * ExitDegree), 640, 360, c_black, c_black, c_black, c_black, false);
    ExitDegree += ((1 - ExitDegree) / 5);
    
    if (ExitFrame >= 60)
    {
        switch (Options[SelectedOption])
        {
            case "Retry Night":
                clear_summons();
                room_goto(Office);
                break;
            
            case "See Results":
                room_goto(EndlessResults);
                break;
            
            case "Quit to Menu":
                if (global.Night == "Custom")
                {
                    room_goto(CustomNightMenu);
                }
                else
                {
                    clear_summons();
                    room_goto(title_screen());
                }
                
                break;
            
            case "Quit Game":
                game_end();
                break;
        }
    }
    
    ExitFrame++;
}

Frame++;

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_4 = 4,
    Value_15 = 15,
    Value_27 = 27,
    Value_70 = 70
}
