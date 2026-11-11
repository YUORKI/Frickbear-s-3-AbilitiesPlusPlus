depth = 9;

if (global.AILevels[UnknownEnum.Value_73] <= 0 || !character_active(UnknownEnum.Value_73))
    exit;

if (global.CamUp)
{
    draw_on_cam(global.Cam, function()
    {
        var MimicIcons = [];
        
        for (var i = 0; i < instance_number(oMimicSuit); i++)
        {
            var Suit = instance_find(oMimicSuit, i);
            
            if (global.Cam == Suit.Camera)
                array_push(MimicIcons, Suit.Identity);
        }
        
        for (var i = 0; i < array_length(MimicIcons); i++)
        {
            var Angle = 45 - (i * 90);
            var XOffset = lengthdir_x(-200 * HeadOffset, Angle);
            var YOffset = lengthdir_y(-150 * HeadOffset, Angle);
            
            if (i < 4)
                draw_sprite_ext(sJumpscare_Mimic, (MimicIcons[i] * 3) + 2, 200 + XOffset, 150 + YOffset, 0.75, 0.75, (Angle - 90) + round(random_range(-0.6, 0.6)), c_white, 1);
        }
    });
}

var HeadOffsetTarget = mouse_in_zone(240, 32, 400, 300) ? 2.5 : 1;
HeadOffset += HeadOffsetSpeed;
HeadOffsetSpeed = lerp(HeadOffsetSpeed, (HeadOffsetTarget - HeadOffset) * 0.25, 0.2);

enum UnknownEnum
{
    Value_73 = 73
}
