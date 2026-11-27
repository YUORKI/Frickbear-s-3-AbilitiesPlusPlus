var Freezeframe = instance_exists(oMinigame_EndoChase) ? (oMinigame_EndoChase.FreezeFrames > 0) : true;
SimulationDebt += SimulationSpeed;

if (Freezeframe)
    SimulationDebt = 0;

var Repeats = floor(SimulationDebt);

repeat (Repeats)
{
    if (point_distance(x, y, oEndoChase_Player.x, oEndoChase_Player.y) < 4 && !Eaten)
    {
        audio_play_sound(sfxBitCollect, 10, false);
        
        with (oMinigame_EndoChase)
            earn_points(1000);
        
        instance_destroy();
    }
    
    TargetX = oEndoChase_Player.x;
    TargetY = oEndoChase_Player.y;
    var WallToCheck = oEndoChase_Hitbox;
    var ShortestDirection = 0;
    var ShortestDistance = 0;
    
    for (var TestDirection = -90; TestDirection <= 90; TestDirection += 90)
    {
        if (place_meeting(x + lengthdir_x(1, Direction + TestDirection), y + lengthdir_y(1, Direction + TestDirection), WallToCheck))
            continue;
        
        var TestDistance = Vulnerable ? irandom(128) : point_distance(x + lengthdir_x(1, Direction + TestDirection), y + lengthdir_y(1, Direction + TestDirection), TargetX, TargetY);
        
        if (TestDistance > ShortestDistance)
        {
            ShortestDistance = TestDistance;
            ShortestDirection = TestDirection;
        }
    }
    
    Direction += ShortestDirection;
    x += lengthdir_x(Speed, Direction);
    y += lengthdir_y(Speed, Direction);
    SimulationDebt--;
    Frame++;
    Time -= (1 / SimulationSpeed);
}

image_index = floor(((angle_difference(Direction, 0) + 360) % 360) / 90);
