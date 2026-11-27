SimulationDebt += SimulationSpeed;
var Freezeframe = instance_exists(oMinigame_EndoChase) ? (oMinigame_EndoChase.FreezeFrames > 0) : true;

if (Freezeframe)
    SimulationDebt = 0;

sprite_index = sEndoChase_Endo;
var Repeats = floor(SimulationDebt);

repeat (Repeats)
{
    var MoveX = oMinigame_EndoChase.in_right - oMinigame_EndoChase.in_left;
    var MoveY = oMinigame_EndoChase.in_down - oMinigame_EndoChase.in_up;
    
    if (MoveX != 0)
        SpeedX = MoveX * Speed;
    
    if (MoveY != 0)
        SpeedY = MoveY * Speed;
    
    if (place_meeting(x + SpeedX, y, oEndoChase_Hitbox))
    {
        while (!place_meeting(x + sign(SpeedX), y, oEndoChase_Hitbox))
            x += (sign(SpeedX) / 4);
        
        SpeedX = 0;
        x = round(x);
    }
    
    x += SpeedX;
    WalkFrame += abs(SpeedX);
    
    if (place_meeting(x, y + SpeedY, oEndoChase_Hitbox))
    {
        while (!place_meeting(x, y + sign(SpeedY), oEndoChase_Hitbox))
            y += (sign(SpeedY) / 4);
        
        SpeedY = 0;
        y = round(y);
    }
    
    y += SpeedY;
    WalkFrame += abs(SpeedY);
    
    if (SpeedX == 0 && SpeedY == 0)
        WalkFrame = 0;
    
    if ((abs(SpeedX) + abs(SpeedY)) != 0)
        MovementDirection = point_direction(x, y, x + SpeedX, y + SpeedY);
    
    Image = floor(MovementDirection / 90) * 4;
    Image += (floor(WalkFrame / 4) % 4);
    SimulationDebt--;
}

if (SimulationSpeed > BaseSpeed)
    SimulationSpeed -= ((PelletBoost * 2) / 60);

if (SimulationSpeed < BaseSpeed)
    SimulationSpeed = BaseSpeed;

if (DeathFrames > 0)
{
    DeathFrames--;
    MovementDirection += min(45, (1800 - MovementDirection) / 10);
    Image = floor(MovementDirection / 90) * 4;
    
    if (DeathFrames <= 60)
    {
        sprite_index = sEndoChase_Puff;
        Image = min(floor((60 - DeathFrames) / 5), 4);
    }
    
    if (DeathFrames == 0)
    {
        with (oMinigame_EndoChase)
            reset();
    }
}

image_index = Image;
