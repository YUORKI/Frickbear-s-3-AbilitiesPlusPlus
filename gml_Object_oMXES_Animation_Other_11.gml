if (!surface_exists(MXESSurf))
    MXESSurf = surface_create(400, 300);

surface_set_target(MXESSurf);
draw_clear(c_black);
var Frame = current_frame();
var SquishOffset = (1 - Squish) * 200;
draw_sprite_ext(sMXES_Body, 0, 200, 140 + SquishOffset + (dsin(Frame * 2) * 5), 1 / Squish, Squish, 0, c_white, 1);
draw_sprite_ext(sMXES_Head, ShockedFace, 200, 120 + SquishOffset + (dsin((Frame - 45) * 2) * 3), 1 / Squish, Squish, 0, c_white, 1);
Squish += SquishSpeed;
SquishSpeed = lerp(SquishSpeed, (1 - Squish) * 0.25, 0.5);
surface_reset_target();

if (!surface_exists(DrawSurf))
    DrawSurf = surface_create(400, 300);

surface_set_target(DrawSurf);
draw_clear_alpha(c_black, 0);

if (ShockedFace)
{
    var CurrentY = 0;
    
    while (CurrentY < 300)
    {
        var XOffset = irandom_range(-4, 4);
        var PreviousY = CurrentY;
        var CurrentX = irandom_range(-160, 160);
        
        if (irandom(2) != 1)
            CurrentX = XOffset;
        
        CurrentY += irandom_range(32, 128);
        
        if (random(max(GlitchSpacer / 10, 0)) < 1)
            continue;
        
        draw_surface_part(MXESSurf, 0, PreviousY, 400, CurrentY, CurrentX - 400, PreviousY);
        draw_surface_part(MXESSurf, 0, PreviousY, 400, CurrentY, CurrentX, PreviousY);
        draw_surface_part(MXESSurf, 0, PreviousY, 400, CurrentY, CurrentX + 400, PreviousY);
    }
    
    GlitchSpacer--;
}
else
{
    draw_surface(MXESSurf, 0, 0);
}

surface_reset_target();
draw_on_cam((ShockedCam == 0) ? oMXES.InfectedCamera : ShockedCam, function()
{
    draw_surface(DrawSurf, x, y);
});

if (!instance_exists(oMXES) || GlitchSpacer <= 0)
    instance_destroy();
