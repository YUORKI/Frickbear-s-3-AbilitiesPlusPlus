var DiffScaler = global.AILevels[ID] / 20;
var BurnoutTime = lerp(300, 600, DiffScaler);
var BurnoutDuration = lerp(180, 90, DiffScaler);

if (DiffScaler > 0)
{
    var Traction = lerp(0.99, 0.97, power(DiffScaler * 0.8, 1.25));
    var Speed = lerp(0.015, 0.14, power(DiffScaler * 0.8, 1.4)) * SpeedScaler;
    SpeedX *= Traction;
    SpeedY *= Traction;
    Dir = point_direction(x, y, global.MouseX, global.MouseY);
    
    if (!Running)
        Dir = point_direction(x, y, x + SpeedX, y + SpeedY);
    
    SpeedX += lengthdir_x(Speed, Dir);
    SpeedY += lengthdir_y(Speed, Dir);
    var PrevX = x;
    var PrevY = y;
    x += SpeedX;
    y += SpeedY;
    WalkFrame += (point_distance(PrevX, PrevY, x, y) / 16);
}

var _x = global.PrevMouseX;
var _y = global.PrevMouseY;
var Contact = false;
var Dir = point_direction(_x, _y, global.MouseX, global.MouseY);
var HitRadius = 18;

while (DrainTimer == 0)
{
    if (point_distance(_x, _y, x, y) <= HitRadius)
    {
        Contact = true;
        break;
    }
    
    var Dist = point_distance(_x, _y, global.MouseX, global.MouseY);
    _x += lengthdir_x(min(HitRadius / 2, Dist), Dir);
    _y += lengthdir_y(min(HitRadius / 2, Dist), Dir);
    
    if (Dist < (HitRadius / 2))
        break;
}

var Draining = true;

if (Contact)
{
    audio_play_sound(SOUND_Drain, 5, false, 0.5);
    DrainTimer = round(lerp(20, 10, DiffScaler));
    var DrainAmount = round_step(global.NightSpeedup / 3, 0.01);
    
    with (instance_create_depth(x, y, depth - 2, oTextPopup))
    {
        Text = string("-{0}%", DrainAmount);
        Frame = 45;
    }
    
    global.Power -= DrainAmount;
    
    if (!ZapLinePlayed)
    {
        bitcrush_sound(choose_from_array(SOUND_Zapped), 0, 0, false, 1, 4);
        ZapLinePlayed = true;
    }
}
else if (DrainTimer > 0)
{
    DrainTimer--;
}
else
{
    Draining = false;
    ZapLinePlayed = false;
}

if (Draining)
{
    SpeedX *= 0.5;
    SpeedY *= 0.5;
    ZapFrames = (ZapFrames + 0.5) % 4;
    DowntimeCounter = BurnoutTime;
}

image_index = WalkFrame % 2;

if (!Running)
    image_index += 2;

if (Draining)
    image_index = 4;

if (!Draining && sign(x - global.MouseX) != 0)
    image_xscale = sign(global.MouseX - x);

SpeedScaler += ((Running - SpeedScaler) / (Running ? 5 : 20));

if (DowntimeCounter > 0)
    Running = true;

if (DowntimeCounter > BurnoutTime && (point_distance(x, y, global.MouseX, global.MouseY) < 64 || Draining))
{
    Running = false;
    DowntimeCounter = BurnoutDuration * -1;
}

DowntimeCounter++;
