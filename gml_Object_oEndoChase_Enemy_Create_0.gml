SpeedX = 0;
SpeedY = 0;
Direction = 90;
Speed = 1;
SpawnX = x;
SpawnY = y;
ScatterX = 0;
ScatterY = 0;
TargetX = 0;
TargetY = 0;
DrawColor = 16777215;
CycleTimer = 0;
Frame = 0;
SimulationDebt = 0;
SimulationSpeed = 1;
Eaten = false;
Vulnerable = false;
GhostHouseCooldown = 180;
Image = 0;
BackwardsCheckPass = false;
EnemyID = 0;
Leader = undefined;

function set_target()
{
    switch (EnemyID)
    {
        case 0:
            TargetX = oEndoChase_Player.x;
            TargetY = oEndoChase_Player.y;
            DrawColor = 4235519;
            break;
        
        case 1:
            if (Leader != undefined)
            {
                TargetX = oEndoChase_Player.x + lengthdir_x(16, oEndoChase_Player.MovementDirection);
                TargetY = oEndoChase_Player.y + lengthdir_y(16, oEndoChase_Player.MovementDirection);
                var FredDistance = point_distance(Leader.x, Leader.y, TargetX, TargetY);
                var FredDirection = point_direction(Leader.x, Leader.y, TargetX, TargetY);
                TargetX += lengthdir_x(FredDistance, FredDirection);
                TargetY += lengthdir_y(FredDistance, FredDirection);
            }
            
            DrawColor = 16711680;
            break;
        
        case 2:
            TargetX = oEndoChase_Player.x + lengthdir_x(32, oEndoChase_Player.MovementDirection);
            TargetY = oEndoChase_Player.y + lengthdir_y(32, oEndoChase_Player.MovementDirection);
            DrawColor = 65535;
            break;
        
        case 3:
            if (point_distance(oEndoChase_Player.x, oEndoChase_Player.y, x, y) < 128)
            {
                TargetX = SpawnX;
                TargetY = SpawnY;
            }
            else
            {
                TargetX = oEndoChase_Player.x;
                TargetY = oEndoChase_Player.y;
            }
            
            DrawColor = 255;
    }
}
