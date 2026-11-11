for (i = 1; i < array_length(SliceLocations); i++)
{
    if (!SliceLocations[i])
        continue;
    
    if (global.Cam == UnknownEnum.Value_4)
        depth = 10;
    else if (global.Cam == UnknownEnum.Value_3)
        depth = 10;
    else
        depth = 30;
    
    draw_on_cam(i, function()
    {
        draw_sprite(sprite_index, image_index, 0, 0);
    });
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4
}
