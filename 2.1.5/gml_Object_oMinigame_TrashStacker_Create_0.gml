event_inherited();
Initialize = true;
Paused = false;
Dead = false;
DeathTimer = 0;
DcdTimer = 0;
LowestY = 0;
YOffset_Glob = 0;

function arr_safe_(arg0, arg1, arg2)
{
    if (arg1 >= 0 && arg1 < array_length(arg0))
        return arg0[arg1];
    
    return arg2;
}

function clear_my_inputs()
{
    in_left = false;
    in_right = false;
    in_sd = false;
    in_hd = false;
    in_ccw = false;
    in_cw = false;
    in_180 = false;
    in_hold = false;
}

clear_my_inputs();
ARR = 2;
DAS = 10;
DCD = 2;
SDF = 16;
LockDelayMax = 30;
Pieces = [[], [[0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0], [0, 0, 0, 0]], [[2, 0, 0], [2, 2, 2], [0, 0, 0]], [[0, 0, 3], [3, 3, 3], [0, 0, 0]], [[0, 4, 4], [0, 4, 4], [0, 0, 0]], [[0, 5, 5], [5, 5, 0], [0, 0, 0]], [[0, 6, 0], [6, 6, 6], [0, 0, 0]], [[7, 7, 0], [0, 7, 7], [0, 0, 0]]];

function get_kick(arg0, arg1, arg2, arg3)
{
    if (arg3 == 0)
        return [0, 0];
    
    var state = string(arg1) + string(arg2);
    
    if (arg0 != 1)
    {
        switch (state)
        {
            case "01":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [-1, -1];
                
                if (arg3 == 3)
                    return [0, 2];
                
                if (arg3 == 4)
                    return [-1, 2];
                
                break;
            
            case "10":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [1, 1];
                
                if (arg3 == 3)
                    return [0, -2];
                
                if (arg3 == 4)
                    return [1, -2];
                
                break;
            
            case "12":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [1, 1];
                
                if (arg3 == 3)
                    return [0, -2];
                
                if (arg3 == 4)
                    return [1, -2];
                
                break;
            
            case "21":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [-1, -1];
                
                if (arg3 == 3)
                    return [0, 2];
                
                if (arg3 == 4)
                    return [-1, 2];
                
                break;
            
            case "23":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [1, -1];
                
                if (arg3 == 3)
                    return [0, 2];
                
                if (arg3 == 4)
                    return [1, 2];
                
                break;
            
            case "32":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [-1, 1];
                
                if (arg3 == 3)
                    return [0, -2];
                
                if (arg3 == 4)
                    return [-1, -2];
                
                break;
            
            case "30":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [-1, 1];
                
                if (arg3 == 3)
                    return [0, -2];
                
                if (arg3 == 4)
                    return [-1, -2];
                
                break;
            
            case "03":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [1, -1];
                
                if (arg3 == 3)
                    return [0, 2];
                
                if (arg3 == 4)
                    return [1, 2];
                
                break;
        }
    }
    else
    {
        switch (state)
        {
            case "01":
                if (arg3 == 1)
                    return [-2, 0];
                
                if (arg3 == 2)
                    return [1, 0];
                
                if (arg3 == 3)
                    return [-2, 1];
                
                if (arg3 == 4)
                    return [1, -2];
                
                break;
            
            case "10":
                if (arg3 == 1)
                    return [2, 0];
                
                if (arg3 == 2)
                    return [-1, 0];
                
                if (arg3 == 3)
                    return [2, -1];
                
                if (arg3 == 4)
                    return [-1, 2];
                
                break;
            
            case "12":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [2, 0];
                
                if (arg3 == 3)
                    return [-1, -2];
                
                if (arg3 == 4)
                    return [2, 1];
                
                break;
            
            case "21":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [-2, 0];
                
                if (arg3 == 3)
                    return [1, 2];
                
                if (arg3 == 4)
                    return [-2, -1];
                
                break;
            
            case "23":
                if (arg3 == 1)
                    return [2, 0];
                
                if (arg3 == 2)
                    return [-1, 0];
                
                if (arg3 == 3)
                    return [2, -1];
                
                if (arg3 == 4)
                    return [-1, 2];
                
                break;
            
            case "32":
                if (arg3 == 1)
                    return [-2, 0];
                
                if (arg3 == 2)
                    return [1, 0];
                
                if (arg3 == 3)
                    return [-2, 1];
                
                if (arg3 == 4)
                    return [1, -2];
                
                break;
            
            case "30":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [-2, 0];
                
                if (arg3 == 3)
                    return [1, 2];
                
                if (arg3 == 4)
                    return [-2, -1];
                
                break;
            
            case "03":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [2, 0];
                
                if (arg3 == 3)
                    return [-1, -2];
                
                if (arg3 == 4)
                    return [2, 1];
                
                break;
        }
    }
    
    if (abs(arg1 - arg2) == 2)
    {
        if (arg3 == 0)
            return [0, 0];
        
        state = string(arg1) + string(arg2);
        
        switch (state)
        {
            case "02":
                if (arg3 == 1)
                    return [0, -1];
                
                if (arg3 == 2)
                    return [1, -1];
                
                if (arg3 == 3)
                    return [-1, -1];
                
                if (arg3 == 4)
                    return [1, 0];
                
                if (arg3 == 5)
                    return [-1, 0];
                
                break;
            
            case "20":
                if (arg3 == 1)
                    return [0, 1];
                
                if (arg3 == 2)
                    return [-1, 1];
                
                if (arg3 == 3)
                    return [1, 1];
                
                if (arg3 == 4)
                    return [-1, 0];
                
                if (arg3 == 5)
                    return [1, 0];
                
                break;
            
            case "13":
                if (arg3 == 1)
                    return [1, 0];
                
                if (arg3 == 2)
                    return [1, -2];
                
                if (arg3 == 3)
                    return [1, -1];
                
                if (arg3 == 4)
                    return [0, -2];
                
                if (arg3 == 5)
                    return [0, -1];
                
                break;
            
            case "31":
                if (arg3 == 1)
                    return [-1, 0];
                
                if (arg3 == 2)
                    return [-1, -2];
                
                if (arg3 == 3)
                    return [-1, -1];
                
                if (arg3 == 4)
                    return [0, -2];
                
                if (arg3 == 5)
                    return [0, -1];
                
                break;
        }
    }
    
    return [0, 0];
}

function generate_bag()
{
    var new_bag = [1, 2, 3, 4, 5, 6, 7];
    new_bag = array_shuffle(new_bag);
    
    for (var i = 0; i < 7; i++)
        array_push(Bag, new_bag[i]);
}

function check_collision(arg0, arg1, arg2)
{
    var px = floor(arg0);
    var py = floor(arg1);
    var shape = Pieces[ActivePiece];
    var size = array_length(shape);
    
    for (var r = 0; r < size; r++)
    {
        for (var c = 0; c < size; c++)
        {
            var src_r, src_c;
            
            if (arg2 == 0)
            {
                src_r = r;
                src_c = c;
            }
            else if (arg2 == 1)
            {
                src_r = size - 1 - c;
                src_c = r;
            }
            else if (arg2 == 2)
            {
                src_r = size - 1 - r;
                src_c = size - 1 - c;
            }
            else if (arg2 == 3)
            {
                src_r = c;
                src_c = size - 1 - r;
            }
            
            if (shape[src_r][src_c] != 0)
            {
                var grid_x = px + c;
                var grid_y = py + r;
                
                if (grid_x < 0 || grid_x >= BoardWidth || grid_y >= BoardHeight)
                    return true;
                
                if (grid_y < 0)
                {
                }
                else if (Grid[(grid_y * BoardWidth) + grid_x] != 0)
                {
                    return true;
                }
            }
        }
    }
    
    return false;
}

function spawn_piece(arg0)
{
    var y_offset = YOffset_Glob;
    DcdTimer = DCD;
    ActivePiece = arg0;
    ActiveRot = 0;
    ActiveY = 19 + y_offset;
    ActiveX = 3;
    
    if (arg0 == 4)
        ActiveX = 3;
    else if (arg0 == 1)
        ActiveY = 18 + y_offset;
    
    LowestY = floor(ActiveY);
    LockTimer = 0;
    LockResets = 0;
    LastMoveRotate = false;
    LastKickIndex = 0;
    SpinKicked = false;
    IsImmobile = false;
    
    if (check_collision(ActiveX, ActiveY, ActiveRot))
    {
        Dead = true;
        audio_play_sound(sfxBitFail, 10, false);
        moon_death_gain();
    }
}

function reset_game()
{
    Dead = false;
    DeathTimer = 0;
    BoardWidth = 10;
    BoardHeight = 40;
    Grid = array_create(BoardWidth * BoardHeight, 0);
    Level = 1;
    Score = 0;
    LinesCleared = 0;
    TokenFraction = 0;
    Bag = [];
    HoldPiece = -1;
    DcdTimer = 0;
    CanHold = true;
    ActivePiece = -1;
    DasTimer = 0;
    DasDir = 0;
    ArrTimer = 0;
    LockTimer = 0;
    LockResets = 0;
    LastMoveRotate = false;
    LastKickIndex = 0;
    SpinKicked = false;
    IsImmobile = false;
    Combo = 0;
    B2B = 0;
    ClearText = "";
    ClearAttack = 0;
    ClearTextTimer = 0;
    AllClearTimer = 0;
    generate_bag();
    spawn_piece(array_shift(Bag));
    generate_bag();
    carnie_check();
}

reset_game();
