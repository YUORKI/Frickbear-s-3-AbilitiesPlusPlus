if (!character_active(ID))
    exit;

if (Stage == "ShowStage")
{
    draw_on_cam(UnknownEnum.Value_1, function()
    {
        depth = 40;
        draw_sprite(SPRITE_Cameras, 0, 0, 0);
    });
}

if (Stage == "DiningArea")
{
    draw_on_cam(UnknownEnum.Value_2, function()
    {
        depth = 10;
        draw_sprite(SPRITE_Cameras, 1, 0, 0);
    });
}

if (Stage == "Hallway")
{
    draw_on_cam(UnknownEnum.Value_5, function()
    {
        depth = 30;
        draw_sprite(SPRITE_Cameras, 2, 0, 0);
    });
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_5 = 5
}
