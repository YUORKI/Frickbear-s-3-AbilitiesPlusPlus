image_index = 0;
x = (Side == -1) ? 832 : 1856;
y = 928;

if (Dragged)
{
    var SpeedX = (global.MouseX - DragX) / 2;
    var SpeedY = (global.MouseY - DragY) / 2;
    var TargAngle = point_direction(0, 0, SpeedX, 0) - 90;
    
    if (point_distance(0, 0, SpeedX, 0) > 2)
        Angle += ((TargAngle - Angle) / 10);
    
    DragX += SpeedX;
    DragY += SpeedY;
    
    if (!mouse_check_button(mb_left))
    {
        Dragged = false;
        
        if (o3DMouse.x < 1088)
            Side = -1;
        else if (o3DMouse.x >= 1600)
            Side = 1;
        
        SquishSpeed = -0.1;
        audio_play_sound(sfxPizzaSplat, 5, false);
    }
}

if (place_meeting(x, y, o3DMouse) && mouse_check_button_pressed(mb_left))
{
    Dragged = true;
    var SpritePos = world_to_screen(oCamera.x - 256, oCamera.y, y - 448 - 256, oCamera.ViewMat, oCamera.ProjMat);
    DragX = SpritePos[0];
    DragY = SpritePos[1];
    SquishSpeed = 0.15;
    audio_play_sound(sfxPluck, 5, false);
}

if (Dragged)
    sprite_index = sNOTHING;
else
    sprite_index = sWetFloorBot;

Squish += SquishSpeed;
SquishSpeed = lerp(SquishSpeed, (1 - Squish) * 0.2, 0.35);
Angle += AngleSpeed;
AngleSpeed = lerp(AngleSpeed, angle_difference(0, Angle) * 0.3, 0.1);
image_xscale = 1 / Squish;
image_yscale = Squish;
image_index = 0;

if (BlinkTimer == 5)
    SquishSpeed -= 0.01;

if (BlinkTimer <= 5)
    image_index = 1;

if (BlinkTimer <= 0)
    BlinkTimer = irandom_range(30, 180);

BlinkTimer--;
