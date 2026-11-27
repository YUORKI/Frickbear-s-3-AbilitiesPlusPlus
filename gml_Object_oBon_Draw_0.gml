if (!character_active(ID))
    exit;

var SurfWidth = 512;

if ((Frame % 4) == 0 && Aggro >= 1)
{
    HeadAOffset += sign(HeadATarget - HeadAOffset);
    
    if (irandom(5) == 5)
        HeadATarget = choose(-5, 5, 15);
    
    HeadAOffset = round(HeadAOffset);
    BodyAOffset += sign(BodyATarget - BodyAOffset);
    
    if (irandom(5) == 5 && BodyAOffset == BodyATarget)
        BodyATarget = choose(0, 10, -15);
    
    BodyAOffset = round(BodyAOffset);
    ArmLOffset += sign(ArmLTarget - ArmLOffset);
    
    if (irandom(5) == 5)
        ArmLTarget = choose(-15, 0, 15);
    
    ArmLOffset = round(ArmLOffset);
    ArmROffset += sign(ArmRTarget - ArmROffset);
    
    if (irandom(5) == 5)
        ArmRTarget = choose(-15, 0, 15);
    
    ArmROffset = round(ArmROffset);
    LowerArmLOffset += sign(LowerArmLTarget - LowerArmLOffset);
    
    if (irandom(5) == 5)
        LowerArmLTarget = choose(-30, 15, 0);
    
    LowerArmLOffset = round(LowerArmLOffset);
    LowerArmROffset += sign(LowerArmRTarget - LowerArmROffset);
    
    if (irandom(5) == 5)
        LowerArmRTarget = choose(30, -15, 0);
    
    LowerArmROffset = round(LowerArmROffset);
    JawOffset += JawDirection;
    
    if (JawOffset <= 0)
    {
        JawDirection = 1;
        JawOffset = 0;
    }
    else if (JawOffset >= 8)
    {
        JawDirection = -1;
        JawOffset = 8;
    }
}

if ((Frame % 4) == 0 && Aggro < 1)
{
    var JawSpeed = (Aggro - 0.75) * 2;
    
    if (Aggro >= 0.75)
    {
        JawOffset += (JawDirection * JawSpeed);
        
        if (JawOffset <= 0)
        {
            JawDirection = 1;
            JawOffset = 0;
        }
        else if (JawOffset >= 8)
        {
            JawDirection = -1;
            JawOffset = 8;
        }
    }
    
    var RandomRange = (90 * (1 - Aggro)) + 10;
    
    if (irandom(RandomRange * 2) == 5 && Aggro >= 0.8)
    {
        BodyAOffset = random_sign() * 1;
        ticking_sound();
    }
    
    BodyAOffset *= -0.8;
    
    if (irandom(RandomRange) == 5 && Aggro >= 0.7)
    {
        HeadAOffset = random_sign() * 1;
        ticking_sound();
    }
    
    HeadAOffset *= -0.8;
    
    if (irandom(RandomRange) == 5 && Aggro >= 0.6)
    {
        ArmROffset = random_sign() * 1;
        ticking_sound();
    }
    
    ArmROffset *= -0.8;
    
    if (irandom(RandomRange) == 5 && Aggro >= 0.5)
    {
        ArmLOffset = random_sign() * 1;
        ticking_sound();
    }
    
    ArmLOffset *= -0.8;
    
    if (irandom(RandomRange) == 5 && Aggro >= 0.4)
    {
        LowerArmROffset = random_sign() * 1;
        ticking_sound();
    }
    
    LowerArmROffset *= -0.8;
    
    if (irandom(RandomRange) == 5 && Aggro >= 0.3)
    {
        LowerArmLOffset = random_sign() * 1;
        ticking_sound();
    }
    
    LowerArmLOffset *= -0.8;
}

var BodyX = SurfWidth / 2;
var BodyY = 310;
var BodyA = BodyAOffset;
var HeadX = BodyX + rot_x(48, -219, BodyA);
var HeadY = BodyY + rot_y(48, -219, BodyA);
var HeadA = lerp(0, 10, Pose) + HeadAOffset;
var UpperArmLX = BodyX + rot_x(-83, -183, BodyA);
var UpperArmLY = BodyY + rot_y(-83, -183, BodyA);
var UpperArmLA = lerp(-10, 0, Pose) + ArmLOffset;
var LowerArmLX = UpperArmLX + rot_x(-6, 113, UpperArmLA);
var LowerArmLY = UpperArmLY + rot_y(-6, 113, UpperArmLA);
var LowerArmLA = (CandyBowlMode ? 0 : 25) + ArmLOffset + LowerArmLOffset;
var CandyBowlX = LowerArmLX + rot_x(76, -46, LowerArmLA);
var CandyBowlY = LowerArmLY + rot_y(76, -46, LowerArmLA);
var HandLX = LowerArmLX + rot_x(96, -5, LowerArmLA);
var HandLY = LowerArmLY + rot_y(96, -5, LowerArmLA);
var HandLA = -10;
var UpperArmRX = BodyX + rot_x(70, -183, BodyA);
var UpperArmRY = BodyY + rot_y(70, -183, BodyA);
var UpperArmRA = 25 + ArmROffset;
var LowerArmRX = UpperArmRX + rot_x(0, 132, UpperArmRA);
var LowerArmRY = UpperArmRY + rot_y(0, 132, UpperArmRA);
var LowerArmRA = 10 + ArmROffset + LowerArmROffset;
var HandRX = LowerArmRX + rot_x(-96, -5, LowerArmRA);
var HandRY = LowerArmRY + rot_y(-96, -5, LowerArmRA);
var HandRA = 75;

if (!surface_exists(Surf))
    Surf = surface_create(SurfWidth, 512);

surface_set_target(Surf);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(SPRITE_UpperArm, 1, UpperArmRX, UpperArmRY, 1, 1, UpperArmRA, c_white, 1);
draw_sprite(SPRITE_Leg, 1, BodyX + 28, BodyY);
draw_sprite_ext(SPRITE_Body, 0, BodyX, BodyY, 1, 1, BodyA, c_white, 1);
draw_sprite(SPRITE_Leg, 0, BodyX - 52, BodyY);
draw_sprite_ext(SPRITE_UpperArm, 0, UpperArmLX, UpperArmLY, 1, 1, UpperArmLA, c_white, 1);
draw_sprite(SPRITE_Tie, 0, BodyX + rot_x(14, -198, BodyA), BodyY + rot_y(14, -198, BodyA));
draw_sprite_ext(SPRITE_Ear, 1, HeadX + rot_x(54, -80, HeadA), HeadY + rot_y(54, -80, HeadA), -1, 1, 0, c_white, 1);
draw_sprite_ext(SPRITE_Jaw, 0, HeadX, HeadY + rot_y(0, JawOffset, HeadA), 1, 1, HeadA, c_white, 1);
draw_sprite_ext(SPRITE_Head, 0, HeadX, HeadY, 1, 1, HeadA, c_white, 1);
draw_sprite_ext(SPRITE_Ear, 0, HeadX + rot_x(-54, -72, HeadA), HeadY + rot_y(-54, -72, HeadA), 1, 1, 0, c_white, 1);

if (CandyBowlMode)
    draw_sprite_ext(oDreadbear.SPRITE_Bowl, 0, CandyBowlX, CandyBowlY, 1, 1, LowerArmLA, c_white, 1);

draw_sprite_ext(SPRITE_Hand, 0, HandLX, HandLY, 1, 1, HandLA, c_white, 1);
draw_sprite_ext(SPRITE_LowerArm, 0, LowerArmLX, LowerArmLY, 1, 1, LowerArmLA, c_white, 1);
draw_sprite_ext(SPRITE_Hand, 1, HandRX, HandRY, -1, 1, HandRA, c_white, 1);
draw_sprite_ext(SPRITE_LowerArm, 1, LowerArmRX, LowerArmRY, -1, 1, LowerArmRA, c_white, 1);
surface_reset_target();
var ScaleSize = 0.45;
var Angle = 120;
var _x = oCamera.x + lengthdir_y(128, Angle + 180);
var _y = oCamera.y + lengthdir_x(128, Angle + 180);
var x1 = _x + ((SurfWidth / 2) * dcos(Angle) * ScaleSize);
var y1 = _y + ((SurfWidth / 2) * dsin(Angle) * ScaleSize);
var x2 = _x - ((SurfWidth / 2) * dcos(Angle) * ScaleSize);
var y2 = _y - ((SurfWidth / 2) * dsin(Angle) * ScaleSize);
var zBottom = (256 + (256 * ScaleSize)) - YOffset;
var zTop = 256 - (256 * ScaleSize) - YOffset;
var TextureX = 0;
var TextureWidth = 1;
var Texture = surface_get_texture(Surf);
VertexBuffer = vertex_create_buffer();
vertex_begin(VertexBuffer, global.VertexFormat);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureX, 1);
vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
vertex_set_point(VertexBuffer, x2, y2, zTop, TextureWidth, 0);
vertex_end(VertexBuffer);
vertex_submit(VertexBuffer, pr_trianglelist, Texture);
vertex_delete_buffer(VertexBuffer);
shader_reset();
Frame++;
