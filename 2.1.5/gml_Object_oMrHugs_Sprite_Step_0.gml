var ID = UnknownEnum.Value_58;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

var WaitTime = lerp(46, 26, AI / 20);
var PosOffset = lerp(-256 * Direction, 256 * Direction, WindowPosition);

if (FramesWaiting >= WaitTime && !Attacking)
    attack(AI);

x = 1344 + PosOffset;
y = (760 + round(random_range(-0.6, 0.6)) + YOffset) - (160 - sprite_get_yoffset(sprite_index));
image_xscale = Direction * -1;

if (Attacking)
{
    AttackFrame++;
    
    if (AttackFrame >= 0 && HPLeft > 0)
        WindowPosition += Speed;
    
    var Cutoff = 3584 - (abs(PosOffset) * 6);
    var Gain = 2 - (abs(PosOffset) / 256);
    global.AudioBusSPECIAL4.effects[0].cutoff = Cutoff;
    global.AudioBusSPECIAL4.effects[1].gain = Gain;
    
    if (audio_emitter_exists(CoolEmitter))
        audio_emitter_position(CoolEmitter, oCamera.x + PosOffset, oCamera.y, oCamera.depth);
    
    if (place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left) && HPLeft > 0 && WindowPosition > 0.05 && !global.CamUp)
    {
        audio_play_sound(choose(sfxPunch1, sfxPunch2, sfxPunch3), 8, false);
        AngleSpeed += ((10 * random_sign()) / HPLeft);
        HPLeft--;
        
        if (HPLeft == 0)
        {
            image_angle = 360 * Direction;
            sprite_set_offset(sprite_index, 64, 96);
            YSpeed = -7;
            audio_play_sound(sfxCartoonHitSlip, 10, false);
            block_tokens();
            audio_stop_sound(sfxMrHugsApproach);
        }
    }
    
    image_angle += AngleSpeed;
    AngleSpeed = (HPLeft == 0) ? (((-90 * Direction) - image_angle) / 5) : lerp(AngleSpeed, (0 - image_angle) * 0.4, 0.2);
    
    if (WindowPosition >= 1)
    {
        jumpscare(ID, Direction);
        instance_destroy();
    }
    
    if (HPLeft <= 0 && YOffset < 160)
    {
        YOffset += YSpeed;
        Speed *= 0.8;
        
        if (YSpeed <= 0)
            YSpeed += 0.4;
        else
            YSpeed += max(0.25, YSpeed / 3);
        
        if (YOffset >= 160)
            reset();
    }
}

FramesWaiting += 0.016666666666666666;

enum UnknownEnum
{
    Value_58 = 58
}
