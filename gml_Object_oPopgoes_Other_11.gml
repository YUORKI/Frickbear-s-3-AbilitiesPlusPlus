if (AI <= 0)
    exit;

draw_on_cam(CurrentCam, function()
{
    depth = 20;
    var PopgoesSprite = cam_to_sprite(TargetCam);
    
    if (CurrentCam != UnknownEnum.Value_1)
        PopgoesSprite += 4;
    
    draw_sprite(SPRITE_Popgoes, PopgoesSprite, 0, 0);
});
draw_on_cam(UnknownEnum.Value_2, function()
{
    draw_sprite(SPRITE_Popgoes, 9, 0, 0);
    depth = 20;
});
draw_on_cam(UnknownEnum.Value_3, function()
{
    draw_sprite(SPRITE_Popgoes, 10, 0, 0);
    depth = 40;
});
draw_on_cam(UnknownEnum.Value_7, function()
{
    draw_sprite(SPRITE_Popgoes, 11, 0, 0);
    depth = 10;
});
draw_on_cam(UnknownEnum.Value_8, function()
{
    draw_sprite(SPRITE_Popgoes, 12, 0, 0);
    depth = 30;
});

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_7 = 7,
    Value_8
}
