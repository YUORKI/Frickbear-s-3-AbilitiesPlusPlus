var AI = global.AILevels[ID];
var CurX = x;
var CurY = y;
var TargX = global.MouseX;
var TargY = global.MouseY;
depth = 1;

if (!Active)
{
    var TimeToAttack = lerp(22, 8.5, AI / 20);
    
    if (AttackTimer > (TimeToAttack * Randomizer))
    {
        initialize();
        Active = true;
        x = -999;
        y = -999;
        audio_play_sound(sfxSalvage_WireDrop, 8, false, 0.5);
        audio_play_sound(sfxCartoonPop, 8, false, 0.5);
        audio_play_sound((irandom(5) == 3) ? choose_from_array(SOUND_AppearRare) : choose_from_array(SOUND_Appear), 10, false, 0.8);
    }
}
else if (!Grabbed && !Thrown)
{
    x = 320 + lengthdir_x(JumpOffset, JumpAngle - 90) + lengthdir_x(128, JumpAngle - 90) + rot_x(0, -160, image_angle);
    y = 180 + lengthdir_y(JumpOffset, JumpAngle - 90) + rot_y(0, -160, image_angle);
    JumpOffset += JumpSpeed;
    JumpSpeed = lerp(JumpSpeed, (128 - JumpOffset) / 4, 0.25);
    image_angle = JumpAngle + (dsin(AttackTimer * 10 * 60) * 10);
}
else if (Grabbed && !Thrown)
{
    var _XSpeed = (TargX - CurX) / 2;
    var _YSpeed = (TargY - CurY) / 2;
    var TargAngle = point_direction(0, 0, _XSpeed, 0) - 90;
    
    if (point_distance(0, 0, _XSpeed, 0) > 2)
        image_angle += ((TargAngle - image_angle) / 10);
    
    image_angle += AngleSpeed;
    AngleSpeed = lerp(AngleSpeed, angle_difference(0, image_angle) * 0.3, 0.05);
    x += ((global.MouseX - x) / 2);
    y += ((global.MouseY - y) / 2);
    
    if (mouse_check_button_released(mb_left))
    {
        XSpeed = (TargX - CurX) / 3;
        YSpeed = (TargY - CurY) / 3;
        
        if (point_distance(XSpeed, YSpeed, 0, 0) >= 8)
        {
            Grabbed = false;
            Thrown = true;
            audio_play_sound(sfxSalvage_WireShoot, 8, false);
            audio_play_sound(choose_from_array(SOUND_Thrown), 10, false);
        }
        else
        {
            Grabbed = false;
        }
    }
}
else if (Thrown)
{
    x += XSpeed;
    y += YSpeed;
    image_angle = point_direction(0, 0, XSpeed, YSpeed) - 90;
    YSpeed += 0.5;
    
    if (abs(x - 320) > 640 || abs(y - 180) > 480)
    {
        Active = false;
        AttackTimer = 0;
        audio_play_sound(sfxWoodBreak, 8, false, 0.75, sign(320 - x), 1);
    }
}

if (AI > 0)
    AttackTimer += 0.016666666666666666;
