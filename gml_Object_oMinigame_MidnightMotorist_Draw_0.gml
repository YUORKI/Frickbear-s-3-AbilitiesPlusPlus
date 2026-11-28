if (!surface_exists(global.MinigameSurface))
    global.MinigameSurface = surface_create(160, 144);

surface_set_target(global.MinigameSurface);
draw_clear_alpha(c_black, 0);

if (Paused && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && mouse_in_minigame_window())
    Paused = false;

if (input_check_pressed(UnknownEnum.Value_0))
    Paused = !Paused;

if (room == Office)
{
    if (global.MonitorSystem != "Games" || !global.CamUp)
        Paused = true;
}

var SpringImage = 1;
var MouseX = (global.MouseX - global.MinigameWindowX) / global.MinigameWindowScale;
var MouseY = (global.MouseY - global.MinigameWindowY) / global.MinigameWindowScale;
var LapSpacer = 1024;
var LapPosition = LapSpacer - (DistTravelled % LapSpacer);

for (var l = 0; l < 6; l++)
{
    draw_sprite_tiled(sMM_BG, 0, (l * 32) - floor(DistTravelled % 32), 0);
    draw_sprite_tiled(sMM_BG, 0, (l * 32) - floor(DistTravelled % 32), 48);
}

draw_line_width_color(LapPosition, 0, LapPosition, 144, 4, #E0F8D0, #E0F8D0);

if (CarSlowdownFrames < 0)
    SpeedTarget = min(SpeedTarget + (1 / LapSpacer), 4);

if ((DistTravelled + CarX) > (LapSpacer * (LapsPassed + 1)) && !Paused)
{
    var PointsGained = min(3 + (LapsCombo * 1), 10);
    Score += PointsGained;
    add_tokens(PointsGained);
    global.TokensPerMinigame[UnknownEnum.Value_12] += PointsGained;
    
    if (global.HiScores[UnknownEnum.Value_12] < Score)
        global.HiScores[UnknownEnum.Value_12] = Score;
    
    if (global.HiScoresOverall[UnknownEnum.Value_12] < Score)
        global.HiScoresOverall[UnknownEnum.Value_12] = Score;
    
    LapsPassed++;
    LapsCombo++;
    SpeedingCombo++;
    
    if (SpeedingCombo >= 10)
        get_trophy(UnknownEnum.Value_56);
}

draw_sprite_ext(sMM_Car, 0, CarX, CarY, 1, 1, CarAngle + CarAngleOffset, c_white, 1);

for (var i = 0; i < instance_number(oMM_Car); i++)
{
    var Car = instance_find(oMM_Car, i);
    draw_sprite_ext(sMM_Car, 1, Car.x, Car.y, 1, 1, Car.image_angle, c_white, 1);
    
    if (point_distance(Car.x, Car.y, CarX, CarY) <= 9)
    {
        instance_destroy(oMM_Car);
        CarAngleOffset = 1440;
        CarSlowdownFrames = 180;
        SpeedTarget = 2;
        LapsCombo = 0;
        SpeedingCombo = 0;
        audio_play_sound(sfxBitExplosion, 10, false);
        moon_death_gain(0.5);
    }
}

if (!Paused)
{
    if (CarSlowdownFrames > 60)
    {
        Speed += ((0 - Speed) / 50);
        SpringImage = (floor(CarSlowdownFrames / 10) % 2) + 3;
    }
    else if (mouse_check_button(mb_left))
    {
        Speed += ((1 - Speed) / 50);
        SpringImage = 2;
        SpeedingCombo = 0;
    }
    else if (mouse_check_button(mb_right))
    {
        Speed += ((5 - Speed) / 200);
        SpringImage = 0;
    }
    else
    {
        Speed += ((SpeedTarget - Speed) / 100);
    }
    
    if (MotorSound == -1)
        MotorSound = audio_play_sound(sfxBitMotor, 5, true);
    
    audio_sound_pitch(MotorSound, lerp(1, Speed, 0.2));
}
else if (MotorSound != -1)
{
    audio_stop_sound(MotorSound);
    MotorSound = -1;
}

draw_rectangle_color(0, 108, 160, 144, #002F33, #002F33, #002F33, #002F33, false);
draw_set_font(global.FontGameboy);
draw_set_halign(fa_right);
draw_text_color(158, 114, string("SCORE: {0}", Score), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
draw_text_color(158, 124, string(round(Speed * 20)) + " MPH", #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
draw_text_color(158, 134, string("COMBO: {0}", LapsCombo), #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
draw_set_halign(fa_left);
draw_sprite(sMM_Springtrap, SpringImage, 1, 106);

if (Paused)
{
    var TexC = 3354368;
    var TexCLight = 13695200;
    draw_set_halign(fa_center);
    draw_rectangle_color(0, 64, 160, 80, TexC, TexC, TexC, TexC, false);
    draw_text_color(80, 69, "PAUSED", TexCLight, TexCLight, TexCLight, TexCLight, 1);
    draw_set_halign(fa_left);
    draw_set_font(global.FontW97Black);
    surface_reset_target();
    exit;
}

surface_reset_target();
CarAngle = point_direction(CarX, CarY, CarX + 16, MouseY);

if (!Paused)
{
    moon_passive_gain();
    CarX += ((MouseX - CarX) / clamp(CarSlowdownFrames / 2, 2, 50));
    CarY += ((clamp(MouseY, 16, 96) - CarY) / clamp(CarSlowdownFrames / 2, 2, 50));
    CarX = clamp(CarX, 0, 160);
    CarY = clamp(CarY, 8, 104);
    DistTravelled += Speed;
    CarSpawner_TopLane -= (Speed + 1);
    CarSpawner_BottomLane -= (Speed - 1);
    CarAngleOffset += CarAngleOffsetSpeed;
    CarAngleOffsetSpeed = max(lerp(CarAngleOffsetSpeed, (0 - CarAngleOffset) / 2, 0.1), -30);
    CarSlowdownFrames--;
    
    if (CarSpawner_TopLane <= 0)
    {
        var YChosen = irandom(2) * 16;
        
        with (instance_create_depth(168, YChosen + 16, 0, oMM_Car))
        {
            image_angle = 180;
            Speed = random_range(-0.2, -0.5);
        }
        
        if (irandom(4) == 1)
        {
            with (instance_create_depth(184, ((YChosen + 16) % 32) + 16, 0, oMM_Car))
            {
                image_angle = 180;
                Speed = -0.25;
            }
        }
        
        CarSpawner_TopLane += (irandom_range(24, 80) * 2.5);
    }
    
    if (CarSpawner_BottomLane <= 0)
    {
        var YChosen = irandom(2) * 16;
        
        with (instance_create_depth(168, YChosen + 64, 0, oMM_Car))
        {
            image_angle = 0;
            Speed = 1;
        }
        
        if (irandom(2) == 2)
        {
            YChosen = (YChosen + 16 + (irandom(1) * 8)) % 32;
            
            with (instance_create_depth(184, YChosen + 64, 0, oMM_Car))
            {
                image_angle = 0;
                Speed = random_range(0.9, 1.1);
            }
        }
        
        CarSpawner_BottomLane += (irandom_range(24, 80) * 1.5);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_12 = 12,
    Value_56 = 56
}
