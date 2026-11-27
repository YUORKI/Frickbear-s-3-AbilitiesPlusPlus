event_inherited();

function initialize()
{
    carnie_check();
    Walls = instance_create_depth(0, 0, 0, oEndoChase_Hitbox);
    
    with (Walls)
    {
        image_xscale = 16;
        image_yscale = 16;
        Image = 0;
    }
    
    GhostHouseHitbox = instance_create_depth(0, 0, 0, oEndoChase_Hitbox);
    
    with (GhostHouseHitbox)
    {
        image_xscale = 16;
        image_yscale = 16;
        Image = 3;
    }
    
    PlayerSpawnX = 144;
    PlayerSpawnY = 80;
    Player = instance_create_depth(PlayerSpawnX, PlayerSpawnY, depth - 1, oEndoChase_Player);
    Detector = instance_create_depth(0, 0, depth, oDoofPix_PuzzleCalculator);
    var MazeWidth = sprite_get_width(sEndoChase_MazeHitbox);
    var MazeHeight = sprite_get_height(sEndoChase_MazeHitbox);
    WallSprites = array_create(MazeWidth * MazeHeight, -1);
    BonusFruitSpawnX = 0;
    BonusFruitSpawnY = 0;
    var Tile = 0;
    var EnemiesSpawned = 0;
    
    with (Detector)
    {
        for (var Y = 0; Y < MazeHeight; Y++)
        {
            for (var X = 0; X < MazeWidth; X++)
            {
                x = X * 16;
                y = Y * 16;
                other.Walls.image_index = 0;
                
                if (place_meeting(x, y, oEndoChase_Hitbox))
                {
                    other.WallSprites[Tile] = (place_meeting(x, y - 16, oEndoChase_Hitbox) * 1) + (place_meeting(x, y + 16, oEndoChase_Hitbox) * 2) + (place_meeting(x - 16, y, oEndoChase_Hitbox) * 4) + (place_meeting(x + 16, y, oEndoChase_Hitbox) * 8);
                }
                else
                {
                    other.WallSprites[Tile] = 16;
                    other.Walls.image_index = 1;
                    
                    if (!place_meeting(x, y, oEndoChase_Hitbox))
                    {
                        other.Walls.image_index = 3;
                        
                        if (place_meeting(x, y, oEndoChase_Hitbox))
                        {
                            other.WallSprites[Tile] = 17;
                            
                            with (instance_create_depth(x, y, depth - 1, oEndoChase_Enemy))
                            {
                                ScatterX = (EnemiesSpawned % 2) ? 0 : (MazeWidth * 16);
                                ScatterY = (floor(EnemiesSpawned / 2) % 2) ? (MazeWidth * 16) : 0;
                                EnemyID = EnemiesSpawned;
                                GhostHouseCooldown = (EnemiesSpawned + 1) * 120;
                            }
                            
                            if (EnemiesSpawned == 1)
                            {
                                other.BonusFruitSpawnX = x;
                                other.BonusFruitSpawnY = y - 32;
                            }
                            
                            EnemiesSpawned++;
                        }
                        else
                        {
                            other.Walls.image_index = 2;
                            var PowerPellet = place_meeting(x, y, oEndoChase_Hitbox);
                            
                            with (instance_create_depth(x, y, depth - 1, oEndoChase_Pellet))
                                IsPowerPellet = PowerPellet;
                        }
                    }
                    else
                    {
                        other.Walls.image_index = 3;
                        
                        if (place_meeting(x, y, oEndoChase_Hitbox))
                            other.WallSprites[Tile] = 17;
                    }
                }
                
                Tile++;
            }
        }
    }
    
    with (oEndoChase_Enemy)
        Leader = instance_find(oEndoChase_Enemy, 1);
    
    instance_destroy(Detector);
    FlickerTimer = 0;
    LightsOnTimer = 0;
    ChaseMode = 0;
    ScatterDuration = 300;
    ModeSwitchTimer = ScatterDuration;
    FreezeFrames = 0;
    Score = 0;
    ScoreThisRound = 0;
    GhostCombo = 0;
    
    function power_pellet()
    {
        if (LightsOnTimer == 0)
            FlickerTimer = 30;
        
        LightsOnTimer = 450;
        GhostCombo = 0;
        
        with (oEndoChase_Enemy)
        {
            Direction = (Direction + 360 + 180) % 360;
            Vulnerable = true;
        }
    }
    
    TokensPaid = 0;
    
    function earn_points(arg0)
    {
        Score += (arg0 / 10);
        ScoreThisRound += (arg0 / 10);
        var TargetTokens = floor(Score / 10);
        
        if (TargetTokens > TokensPaid)
        {
            add_tokens_silently(TargetTokens - TokensPaid);
            global.TokensPerMinigame[UnknownEnum.Value_15] += TargetTokens - TokensPaid;
            TokensPaid = TargetTokens;
        }
    }
    
    function reset()
    {
        carnie_check();
        var CarryOverScore = 0;
        var CarryOverLevel = 0;
        
        if (Won)
            CarryOverScore = Score;
        
        if (room != EndlessShop)
        {
            instance_destroy();
            
            with (instance_create_depth(x, y, depth, oMinigame_EndoChase))
            {
                Score = CarryOverScore;
                TokensPaid = floor(CarryOverScore / 100);
            }
        }
    }
    
    CameraX = PlayerSpawnX;
    CameraY = PlayerSpawnY;
    Won = false;
    Paused = true;
    in_left = false;
    in_right = false;
    in_up = false;
    in_down = false;
    Initialized = true;
}

global.MinigameWindowScale = 1;
initialize();

enum UnknownEnum
{
    Value_15 = 15
}
