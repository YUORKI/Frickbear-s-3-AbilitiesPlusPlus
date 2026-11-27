Frame = 0;
Delay = 0;
Size = 0;
AI = 0;
YStretch = 1;
YStretchSpeed = 0;
image_xscale = 0;
image_yscale = 0;
PatternType = 0;

function get_bullet_pattern_color(arg0)
{
    switch (arg0)
    {
        case 0:
            return 16777215;
        
        case 1:
            return 255;
        
        case 2:
            return 4235519;
        
        case 3:
            return 65535;
        
        case 4:
            return 65280;
        
        case 5:
            return 16711680;
        
        case 6:
            return 8388736;
    }
}

BlastsAllowed = 1;
BlastsMade = 0;
TimeBetweenShots = 15;
ShotMade = false;

function spit_sound()
{
    audio_stop_sound(oChicasMagicRainbow.SOUND_Shoot);
    audio_play_sound(oChicasMagicRainbow.SOUND_Shoot, 1, false);
}

function bullet_pattern(arg0)
{
    var ai = AI;
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            var BulletsPerColor = round(lerp(2, 6, ai / 20));
            var Rotation = 0;
            
            if (global.AILevels[UnknownEnum.Value_52] == 21)
                Rotation -= point_direction(other.x, other.y, global.MouseX, global.MouseY);
            
            spit_sound();
            
            for (var i = 0; i < (BulletsPerColor * 3); i++)
            {
                with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
                {
                    Rotation += (360 / (BulletsPerColor * 3));
                    Direction = point_direction(other.x, other.y, global.MouseX, global.MouseY) + Rotation;
                    Color = i;
                    Speed = lerp(4, 8, ai / 20);
                }
            }
            
            break;
        
        case UnknownEnum.Value_1:
            BlastsAllowed = 3;
            TimeBetweenShots = 10;
            var BulletsPerColor = round(lerp(2, 6, ai / 20));
            var Rotation = (BlastsMade * 180) / (BulletsPerColor * 3);
            spit_sound();
            
            for (var i = 0; i < (BulletsPerColor * 3); i++)
            {
                with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
                {
                    Rotation += (360 / (BulletsPerColor * 3));
                    Direction = Rotation;
                    Color = i;
                    Speed = lerp(4, 8, ai / 20);
                }
            }
            
            break;
        
        case UnknownEnum.Value_2:
            BlastsAllowed = 5;
            TimeBetweenShots = 3;
            var BulletsPerColor = round(lerp(2, 6, ai / 20));
            var Rotation = point_direction(x, y, global.MouseX, global.MouseY) + ((BlastsMade - (BlastsAllowed / 2)) * 5);
            spit_sound();
            
            with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
            {
                Direction = Rotation;
                Color = irandom(2);
                Speed = lerp(4, 8, ai / 20) * 1.5;
            }
            
            break;
        
        case UnknownEnum.Value_3:
            BlastsAllowed = 120;
            TimeBetweenShots = 5;
            var BulletsPerColor = round(lerp(2, 6, ai / 20));
            var Rotation = BlastsMade * 3;
            spit_sound();
            
            for (var i = 0; i < 3; i++)
            {
                Rotation += 120;
                
                with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
                {
                    Direction = Rotation;
                    Color = i;
                    Speed = lerp(4, 8, ai / 20);
                }
            }
            
            break;
        
        case UnknownEnum.Value_4:
            spit_sound();
            
            for (var i = 0; i < 12; i++)
            {
                with (instance_create_depth(0, 0 + (i * 16), depth - 1, oChicasMagicRainbow_Bullets))
                {
                    Direction = 0;
                    Color = i;
                    Speed = lerp(4, 8, ai / 20);
                }
            }
            
            for (var i = 0; i < 12; i++)
            {
                with (instance_create_depth(640, 360 - (i * 16), depth - 1, oChicasMagicRainbow_Bullets))
                {
                    Direction = 180;
                    Color = i;
                    Speed = lerp(4, 8, ai / 20);
                }
            }
            
            break;
        
        case UnknownEnum.Value_5:
            BlastsAllowed = round(lerp(80, 160, ai / 20));
            TimeBetweenShots = 5;
            var BulletsPerColor = round(lerp(2, 6, ai / 20));
            var Rotation = -90;
            spit_sound();
            
            with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
            {
                Direction = Rotation;
                Color = irandom(2);
                Speed = lerp(4, 8, ai / 20) * 1.5;
            }
            
            break;
        
        case UnknownEnum.Value_6:
            spit_sound();
            
            with (instance_create_depth(x, y, depth - 1, oChicasMagicRainbow_Bullets))
            {
                Direction = round_step(point_direction(x, y, global.MouseX, global.MouseY), 90) - 45;
                Color = irandom(2);
                Speed = 5;
                Size = 4;
                BouncesLeft = ai;
            }
            
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_52 = 52
}
