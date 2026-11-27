depth = 0;
x = 160;

if (instance_exists(o4LD_Title))
{
    audio_stop_sound(mus_4LDOpening);
    y += WindowMoveSpeed;
    WindowMoveSpeed += 0.2;
    
    if (y > 360)
        instance_destroy();
    
    o4LD_Title.Frame = max(0, o4LD_Title.Frame);
}
else
{
    y = 20;
}

var XMove = input_check(UnknownEnum.Value_5) - input_check(UnknownEnum.Value_3);

if (StuckHP > 0 || TransitionTimer >= 0 || DialogueLock || Screen == 4)
    XMove = 0;

var ScreenWidth = 160;

if (!surface_exists(Surf))
    Surf = surface_create(160, 96);

surface_set_target(Surf);
draw_clear_alpha(c_black, 1);

if (Screen == 4)
{
    var Walksprite = 0;
    
    switch (ceil(GuardTalkFrame) % 4)
    {
        case 1:
            Walksprite += 1;
            break;
        
        case 3:
            Walksprite += 2;
            break;
    }
    
    var Speaker = "";
    var TalkMode = instance_exists(oTextBox);
    
    if (instance_exists(oTextBox))
    {
        if (oTextBox.TextDrawChar == 0)
            GuardTalkFrame = 0;
        
        Speaker = (oTextBox.TextDrawChar < oTextBox.TextLength[oTextBox.TextPage]) ? oTextBox.CharacterSpeaking[oTextBox.TextPage] : "";
    }
    
    var JeremyFrame = (Speaker == "Jeremy") ? Walksprite : 0;
    var MikeFrame = (Speaker == "Mike") ? Walksprite : 0;
    var VanessaFrame = (Speaker == "Vanessa") ? Walksprite : 0;
    var OMCFrame = (Speaker == "Old Man") ? sign(Walksprite) : 0;
    GuardTalkFrame += 0.1;
    image_index = 0;
    
    switch (floor(WalkTimer) % 4)
    {
        case 1:
            image_index += 1;
            break;
        
        case 3:
            image_index += 2;
            break;
    }
    
    if (abs(round(GuardXSpeed * 5)) < 1)
        WalkTimer = 0;
    
    draw_sprite(s4LD_OldManBG, OMCFrame + (sign_to_binary(OMCDirection * -1) * 2), 0, 0);
    GuardXSpeed = min(0.75, (48 - GuardX) / 5);
    draw_sprite_ext(sHD_Guard, (TalkMode ? MikeFrame : image_index) + 4, GuardX, GuardY, 1, 1, 0, c_white, 1);
    draw_sprite_ext(sHD_Guard, (TalkMode ? VanessaFrame : image_index) + 8, GuardX - 18, GuardY, 1, 1, 0, c_white, 1);
    draw_sprite_ext(sHD_Guard, TalkMode ? JeremyFrame : image_index, GuardX - 36, GuardY, 1, 1, 0, c_white, 1);
}
else
{
    draw_sprite(s4LD_TowerBG, 0, 0, 0);
    
    switch (Screen)
    {
        case 0:
        case 2:
            draw_sprite_ext(s4LD_Trees, 0, -80 - CamX, 0, 2.5, 1, 0, c_white, 1);
            ScreenWidth = 160;
            break;
        
        case 1:
            draw_sprite_ext(s4LD_Trees, 0, -80 - CamX, 0, 2.5, 1, 0, c_white, 1);
            draw_sprite_ext(s4LD_Trees, 0, 320 - CamX, 0, 2.5, 1, 0, c_white, 1);
            draw_sprite(s4LD_ShadowBB, 0, 202 - CamX, GroundY + 8);
            draw_sprite(s4LD_ShadowBB, 0, 256 - CamX, GroundY + 8);
            draw_sprite(s4LD_ShadowBB, 0, 360 - CamX, GroundY + 8);
            draw_sprite(s4LD_ShadowBB, 0, 408 - CamX, GroundY + 8);
            ScreenWidth = 480;
            break;
        
        case 3:
            draw_sprite_ext(s4LD_Trees, 0, -80 - CamX, 0, 2.5, 1, 0, c_white, 1);
            draw_sprite_ext(s4LD_Trees, 0, 560 - CamX, 0, 2.5, 1, 0, c_white, 1);
            ScreenWidth = 688;
            break;
    }
    
    var BaseSprite = 4;
    image_index = BaseSprite;
    
    if (XMove != 0)
    {
        var WalkFrame = floor(WalkTimer) % 4;
        
        switch (WalkFrame)
        {
            case 1:
                image_index += 1;
                break;
            
            case 3:
                image_index += 2;
                break;
        }
    }
    else
    {
        WalkTimer = 0;
    }
    
    if (GuardY < GroundY)
        image_index = BaseSprite + 3;
    
    if (Screen == 2)
    {
        if (GuardX >= 32 && !DialogueLock && !PostCutsceneFlag)
        {
            DialogueLock = true;
            GuardX = 32;
            GuardXSpeed = 0;
            JeremyDirection = -1;
            audio_play_sound(sfxBitBoost, 5, false);
            alarm[0] = 60;
        }
        
        var Walksprite = 0;
        
        switch (ceil(GuardTalkFrame) % 4)
        {
            case 1:
                Walksprite += 1;
                break;
            
            case 3:
                Walksprite += 2;
                break;
        }
        
        var Speaker = "";
        
        if (instance_exists(oTextBox))
        {
            if (oTextBox.TextDrawChar == 0)
                GuardTalkFrame = 0;
            
            Speaker = (oTextBox.TextDrawChar < oTextBox.TextLength[oTextBox.TextPage]) ? oTextBox.CharacterSpeaking[oTextBox.TextPage] : "";
        }
        
        if (Speaker == "Mike")
            image_index = 4 + Walksprite;
        
        draw_sprite_ext(sHD_Guard, 0 + ((Speaker == "Jeremy") ? Walksprite : 0), 96 - CamX, GroundY, JeremyDirection, 1, 0, c_white, 1);
        draw_sprite_ext(sHD_Guard, 8 + ((Speaker == "Vanessa") ? Walksprite : 0), 120 - CamX, GroundY, VanessaDirection, 1, 0, c_white, 1);
        GuardTalkFrame += 0.1;
        
        if (DialogueLock && !instance_exists(oTextBox))
        {
            draw_sprite(sExclamationBubble, 0, 96 - CamX, GroundY - 16);
            draw_sprite(sExclamationBubble, 0, 120 - CamX, GroundY - 16);
        }
        
        if (PostCutsceneFlag)
        {
            VanessaDirection = (GuardX < 120) ? -1 : 1;
            JeremyDirection = (GuardX < 96) ? -1 : 1;
        }
    }
    
    if (GuardX < 8)
    {
        GuardX = 8;
        GuardXSpeed = 0;
        WalkTimer = 0;
    }
    
    if (StuckHP > 0)
    {
        draw_sprite_ext(sHD_Guard, image_index, (ShakeOffset + GuardX) - CamX, GuardY + 8, WalkDirection, 1, 180, c_white, 1);
        ShakeOffset *= -0.8;
        
        if (input_check_pressed(UnknownEnum.Value_3) || input_check_pressed(UnknownEnum.Value_5) || input_check_pressed(UnknownEnum.Value_0))
        {
            ShakeOffset = 2;
            StuckHP--;
            audio_play_sound(sfxBitCrunch, 10, false);
        }
        
        if (StuckHP == 0)
        {
            GuardYSpeed = -4;
            audio_play_sound(sfxBitJump, 10, false);
        }
    }
    else
    {
        draw_sprite_ext(sHD_Guard, image_index, GuardX - CamX, GuardY, WalkDirection, 1, 0, c_white, 1);
    }
    
    draw_sprite_ext(s4LD_Trees, 1, 0 - ((80 + CamX) % 16), 0, 2, 1, 0, c_white, 1);
    
    if (input_check_pressed(UnknownEnum.Value_0) && GuardY == GroundY && StuckHP <= 0 && TransitionTimer < 0 && !DialogueLock)
    {
        GuardYSpeed = -3.75;
        audio_play_sound(sfxBitJump, 10, false);
    }
}

var HalfHeight = surface_get_height(Surf) / 2;
var TransitionAmount = round_step(1.2 - abs(TransitionTimer * 2.4), 0.125);
draw_set_color(#002F33);
draw_rectangle(0, -1, surface_get_width(Surf), lerp(0, HalfHeight, TransitionAmount) - 1, false);
draw_rectangle(0, lerp(HalfHeight * 2, HalfHeight, TransitionAmount), surface_get_width(Surf), HalfHeight * 2, false);
draw_set_color(c_white);
surface_reset_target();
shader_set(shRecolor);
var Pal = [16777215, 10461087, 1248964, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_sprite(sprite_index, 0, round(x), round(y));
draw_surface_ext(Surf, round(x), round(y), 2, 2, 0, c_white, 1);
shader_reset();
GuardXSpeed += (XMove / 6);
GuardX += GuardXSpeed;
GuardXSpeed *= 0.85;

if ((GuardY + GuardYSpeed) >= 72)
{
    GuardY = GroundY;
    GuardYSpeed = 0;
}

GuardY += GuardYSpeed;

if (!input_check(UnknownEnum.Value_0) && GuardYSpeed < 0)
    GuardYSpeed *= 0.5;

GuardYSpeed += 0.2;
WalkTimer += (abs(GuardXSpeed) / 10);

if (XMove == 0 && Screen != 4)
    WalkTimer = 0;
else
    WalkDirection = XMove;

CamX = clamp(0, GuardX - 80, ScreenWidth - 160);

if (GuardX > ScreenWidth)
{
    if (TransitionTimer <= -0.5)
    {
        TransitionTimer = 0.5;
    }
    else if (TransitionTimer <= 0)
    {
        Screen++;
        GuardX = 8;
        CamX = 0;
        
        if (Screen == 1)
            play_music(mus_4LDOpening);
        
        if (Screen == 4)
        {
            alarm[0] = 180;
            GuardX = -60;
        }
    }
    
    GuardXSpeed = 0;
}

TransitionTimer = max(-0.5, TransitionTimer - 0.016666666666666666);
check_reset();

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_5 = 5
}
