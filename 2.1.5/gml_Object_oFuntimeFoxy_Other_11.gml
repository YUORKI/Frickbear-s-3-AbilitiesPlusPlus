if (AI <= 0)
    exit;

draw_on_cam(UnknownEnum.Value_2, function()
{
    depth = 15;
    var Hours = floor(Showtime / 60);
    var Minutes = (Showtime % 60) / 15;
    draw_sprite(SPRITE_Cutout, 0, 400, 300);
    draw_sprite(SPRITE_Cutout, Hours + 5, 400, 300);
    draw_sprite(SPRITE_Cutout, Minutes + 1, 400, 300);
});

enum UnknownEnum
{
    Value_2 = 2
}
