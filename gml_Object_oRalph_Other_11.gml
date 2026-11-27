if (!character_active(ID))
    exit;

draw_on_cam(CurrentCam, function()
{
    draw_sprite(SPRITE_Cameras, Stage, 0, 0);
});
