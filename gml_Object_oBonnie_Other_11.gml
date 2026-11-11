if (!character_active(ID))
    exit;

if (Stage == "ShowStage")
{
    draw_on_cam(UnknownEnum.Value_1, function()
    {
        depth = 50;
        draw_sprite(SPRITE_Cameras, 0, 0, 0);
    });
}

if (Stage == "DiningArea")
{
    draw_on_cam(UnknownEnum.Value_2, function()
    {
        depth = 50;
        draw_sprite(SPRITE_Cameras, 1, 0, 0);
    });
}

if (Stage == "Hallway")
{
    draw_on_cam(UnknownEnum.Value_4, function()
    {
        depth = 40;
        draw_sprite(SPRITE_Cameras, 2, 0, 0);
    });
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4
}
