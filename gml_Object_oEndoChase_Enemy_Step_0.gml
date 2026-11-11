var Freezeframe = instance_exists(oMinigame_EndoChase) ? (oMinigame_EndoChase.FreezeFrames > 0) : true;
var SpeedMult = 1.25;
SimulationSpeed = SpeedMult;

if (Vulnerable)
    SimulationSpeed = SpeedMult / 2;

if (Eaten)
    SimulationSpeed = SpeedMult * 2;

SimulationDebt += SimulationSpeed;

if (Freezeframe)
    SimulationDebt = 0;

var Repeats = floor(SimulationDebt);

repeat (Repeats)
{
    if (Vulnerable || Eaten)
        BackwardsCheckPass = false;
    
    if (point_distance(x, y, oEndoChase_Player.x, oEndoChase_Player.y) < 4 && !Eaten)
    {
        if (Vulnerable)
        {
            Eaten = true;
            Vulnerable = false;
            audio_play_sound(sfxBitCollect, 5, false, 1, 0, 1 + (oMinigame_EndoChase.GhostCombo / 10));
            
            with (oMinigame_EndoChase)
            {
                with (oEndoChase_Player)
                    SimulationSpeed += (PelletBoost * 2);
                
                FreezeFrames = 15;
                GhostCombo++;
                earn_points(power(2, GhostCombo) * 50);
                
                if (GhostCombo == 4)
                    bitcrush_sound(sfxChildrenCheering);
            }
            
            audio_play_sound(sfxBitPlace, 5, false);
        }
        else if (oEndoChase_Player.DeathFrames == 0)
        {
            with (oMinigame_EndoChase)
            {
                FreezeFrames = 120;
                moon_death_gain();
            }
            
            oEndoChase_Player.DeathFrames = 120;
            oEndoChase_Player.MovementDirection = 0;
            audio_play_sound(sfxBitFail, 10, false);
        }
    }
    
    var Chasing = oMinigame_EndoChase.ChaseMode && oMinigame_EndoChase.LightsOnTimer <= 0;
    var InGhostHouse = place_meeting(x, y, oMinigame_EndoChase.GhostHouseHitbox);
    set_target();
    
    if (!Chasing)
    {
        TargetX = ScatterX;
        TargetY = ScatterY;
    }
    
    if (InGhostHouse && !Eaten)
    {
        TargetX = SpawnX;
        TargetY = SpawnY + 64;
        Eaten = false;
    }
    
    if (Eaten)
    {
        TargetX = SpawnX;
        TargetY = SpawnY;
        
        if (point_distance(x, y, TargetX, TargetY) <= 2)
        {
            x = TargetX;
            y = TargetY;
            Eaten = false;
            GhostHouseCooldown = 240;
        }
    }
    
    var WallToCheck = (InGhostHouse || Eaten) ? oMinigame_EndoChase.Walls : oEndoChase_Hitbox;
    var ShortestDirection = 180;
    var ShortestDistance = 99999;
    
    for (var TestDirection = -90; TestDirection <= (BackwardsCheckPass ? 180 : 90); TestDirection += 90)
    {
        if (place_meeting(x + lengthdir_x(1, Direction + TestDirection), y + lengthdir_y(1, Direction + TestDirection), WallToCheck))
            continue;
        
        var TestDistance = Vulnerable ? irandom(128) : point_distance(x + lengthdir_x(1, Direction + TestDirection), y + lengthdir_y(1, Direction + TestDirection), TargetX, TargetY);
        
        if (TestDistance < ShortestDistance)
        {
            ShortestDistance = TestDistance;
            ShortestDirection = TestDirection;
        }
    }
    
    BackwardsCheckPass = false;
    Direction += ShortestDirection;
    
    if (GhostHouseCooldown > 0)
    {
        GhostHouseCooldown--;
        Speed = 0;
        Direction = 270;
    }
    else
    {
        Speed = 1;
    }
    
    x += lengthdir_x(Speed, Direction);
    y += lengthdir_y(Speed, Direction);
    SimulationDebt--;
    
    if (Vulnerable || Eaten)
    {
        Image = floor(((angle_difference(Direction, 0) + 360) % 360) / 90) * 3;
        Image += (floor(oMinigame_EndoChase.ModeSwitchTimer / 10) % 3);
    }
    else
    {
        Image = floor(((angle_difference(Direction, 0) + 360) % 360) / 90) * 8;
        Image += (floor(oMinigame_EndoChase.ModeSwitchTimer / 10) % 4);
        Image += ((Chasing * 4) + (EnemyID * 32));
    }
}

sprite_index = Eaten ? sEndoChase_GhostKid_Eaten : (Vulnerable ? sEndoChase_GhostKid : sEndoChase_Animatronics);
image_index = Image;
