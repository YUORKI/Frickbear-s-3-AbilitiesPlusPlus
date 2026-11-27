if (!character_active(UnknownEnum.Value_20))
    exit;

if (Stage == 0)
{
    draw_on_cam(UnknownEnum.Value_8, function()
    {
        draw_sprite(SPRITE_Cameras, Stage, 0, 0);
    });
}

if (Stage == 1)
{
    draw_on_cam(UnknownEnum.Value_1, function()
    {
        draw_sprite(SPRITE_Cameras, Stage, 0, 0);
    });
}

if (Stage == 2)
{
    draw_on_cam(UnknownEnum.Value_2, function()
    {
        draw_sprite(SPRITE_Cameras, Stage, 0, 0);
    });
}

if (Stage == 3)
{
    draw_on_cam(UnknownEnum.Value_4, function()
    {
        draw_sprite(SPRITE_Cameras, Stage, 0, 0);
    });
}

if (Stage == 4)
{
    draw_on_cam(UnknownEnum.Value_4, function()
    {
        draw_sprite(SPRITE_Cameras, Stage, 0, 0);
    });
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4,
    Value_8 = 8,
    Value_20 = 20
}
