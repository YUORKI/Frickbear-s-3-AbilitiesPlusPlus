if (!character_active(ID))
    exit;

draw_on_cam(UnknownEnum.Value_3, function()
{
    var Frame = floor((Phase / WaitTime) * 4);
    
    if (Mode != "Wait")
        Frame = 4;
    else
        draw_sprite(SPRITE_Cameras, Frame, 0, 0);
});

enum UnknownEnum
{
    Value_3 = 3
}
