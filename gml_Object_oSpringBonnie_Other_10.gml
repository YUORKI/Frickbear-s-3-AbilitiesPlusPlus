AI = global.AILevels[ID];
Balls.y = character_active(ID) ? 1000 : -999;

if (AI <= 0)
    exit;

var RisingMode = 0;
var AngryMode = 1;
var HitMode = 2;
var TimeToTop = lerp(30, 16, AI / 20);
var HitsToBottom = lerp(2, 6, AI / 20);
var TimeToKill = lerp(10, 5, AI / 20);

if (global.CamUp && WaitForFlip)
{
    WaitForFlip = false;
    var BallsToSpawn = lerp(24, 16, AI / 20);
    var CamPositions = [];
    
    for (var i = 0; i < 40; i++)
        array_push(CamPositions, (i % 8) + 1);
    
    CamPositions = array_shuffle(CamPositions);
    
    for (var i = 0; i < BallsToSpawn; i++)
    {
        var BallX = 200 + (((i % 5) - 2) * 64) + irandom_range(-24, 24);
        var BallY = 150 + ((floor(i / 5) - 2) * 48) + irandom_range(-16, 16);
        
        with (instance_create_depth(BallX, BallY, 10, oSpringBonnie_Ball))
            Camera = CamPositions[i];
    }
}

if (!global.CamUp)
{
    WaitForFlip = true;
    instance_destroy(oSpringBonnie_Ball);
}

if (HitFrames > 0 && Mode != HitMode)
{
    Mode = 2;
    SquishSpeed = -0.05;
}

if (HitFrames <= 0 && Mode == HitMode)
{
    Mode = 0;
    SquishSpeed = 0.05;
}

if (HitFrames <= 0 && AggroLevel >= 1 && Mode != 1)
{
    Mode = 1;
    SquishSpeed = 0.05;
}

if (Mode == 1)
    KillFrames += 0.016666666666666666;

if (KillFrames > TimeToKill)
    jumpscare(UnknownEnum.Value_86);

WhackAngle += WhackAngleSpeed;
WhackAngleSpeed = lerp(WhackAngleSpeed, (0 - WhackAngle) * 0.2, 0.3);
Squish += SquishSpeed;
SquishSpeed = lerp(SquishSpeed, (1 - Squish) * 0.2, 0.5);

if (Mode == 0 && AggroLevel < 1)
    AggroLevel += (1 / (TimeToTop * 60));

var HSquish = -1 / Squish;
var VSquish = Squish;
x = 1368;
y += (((960 + lerp((AggroLevel <= 0) ? 830 : 720, 480, AggroLevel)) - y) / 10);
var BodyX = x;
var BodyY = y;
var BodyA = dsin(Frame) + (WhackAngle / 4);

with (Body)
{
    sprite_index = other.SPRITE_Body;
    image_index = other.Mode == 2;
    x = BodyX;
    y = BodyY;
    image_angle = BodyA * -1;
    image_xscale = HSquish;
    image_yscale = VSquish;
    DrawDepth = 10;
}

var HeadX = BodyX + rot_x(51 * HSquish, -228 * Squish, BodyA);
var HeadY = BodyY + rot_y(51 * HSquish, -228 * Squish, BodyA);
var HeadA = round(random_range(-0.6, 0.6)) + WhackAngle;
var HeadSprite = (Mode == HitMode) ? SPRITE_HeadAway : ((Mode == RisingMode) ? SPRITE_Head : SPRITE_HeadAttacking);

with (Head)
{
    sprite_index = HeadSprite;
    x = HeadX;
    y = HeadY;
    image_angle = HeadA * -1;
    image_xscale = HSquish;
    image_yscale = VSquish;
    DrawDepth = 11;
    
    if (mouse_check_button_pressed(mb_left) && turnaround_accessible() && other.Ballz > 0 && place_meeting(x, y, o3DMouse))
    {
        with (other)
        {
            HitFrames = 60;
            WhackAngleSpeed = -10;
            SquishSpeed = -0.05;
            AggroLevel -= (1 / HitsToBottom);
            KillFrames = 0;
            Ballz--;
            
            if (AggroLevel <= 0)
                AggroLevel = -0.5;
            
            instance_create_layer(o3DMouse.x, o3DMouse.y, "InFrontOf_Wall", oSpringBonnie_BallDebris);
        }
        
        mouse_clear(mb_left);
        audio_play_sound(other.SOUND_Hurt, 4, false, 0.7, 0, random_range(0.6, 1.4));
        audio_play_sound(choose_from_array(other.SOUND_Clicked), 8, false);
        audio_play_sound(other.SOUND_Pluck, 4, false);
    }
}

var ArmX = BodyX + rot_x(-42 * HSquish, -201 * Squish, BodyA);
var ArmY = BodyY + rot_y(-42 * HSquish, -201 * Squish, BodyA);
var ArmA = round(random_range(-0.6, 0.6)) + (WhackAngle * -1);

with (Arm)
{
    sprite_index = other.SPRITE_Arm;
    image_index = other.Mode;
    x = ArmX;
    y = ArmY;
    image_angle = ArmA * -1;
    image_xscale = HSquish;
    image_yscale = VSquish;
    DrawDepth = 12;
}

Frame++;
HitFrames--;
var AmbVolume = (AggroLevel - 0.5) * 2 * (turnaround_accessible() ? 1 : 0.5) * ((AggroLevel >= 1) ? 0.5 : 0.25);
audio_sound_gain(Ambience, AmbVolume, 100);
BallCounterOffset += (((turnaround_accessible() ? 0 : 64) - BallCounterOffset) / 5);

enum UnknownEnum
{
    Value_86 = 86
}
