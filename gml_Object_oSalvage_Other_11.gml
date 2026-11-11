SpriteOffset = 0;

if (global.Flashlight)
    SpriteOffset = random_range(-1.5, 1.5);

draw_on_cam(SiphonCam, function()
{
    draw_sprite(sCameras_Salvage, max(SiphonCam + 35, 40), 0, 0);
});
draw_on_cam(CurrentCam, function()
{
    draw_sprite(sCameras_Salvage, ((CurrentCam - 1) * 5) + (Phase - 1), SpriteOffset, 0);
});
