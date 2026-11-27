ID = UnknownEnum.Value_59;
SPRITE_HappyFrog = skin_sprite(sHappyFrog, ID, get_sprite_filenames(1, 7));
SPRITE_Background = skin_sprite(sHappyFrog_BG, ID, "sprite_08.png");
SPRITE_Border = skin_sprite(sHappyFrog_Border, ID, "sprite_09.png");
SPRITE_Buttons = skin_sprite(sHappyFrog_Buttons, ID, get_sprite_filenames(11, 21));
SPRITE_Tiles = skin_sprite(sHappyFrog_TileBG, ID, "sprite_10.png");
SPRITE_Tablet = skin_sprite(sHappyFrogTablet, ID, get_sprite_filenames(23, 24));
SOUND_Music = skin_sound(sfxHappyFrogJingle, ID, "sq_jingle");
SOUND_Rumble = skin_sound(sfxHappyFrog_Rumble, ID, "sq_rumble");
SOUND_Flip = skin_sound(sfxMonitor, ID, "sq_open");
SOUND_Correct = skin_sound(sfxSparkleImpact, ID, "sq_solved");
SOUND_Error = skin_sound(sfxError, ID, "sq_error");
SOUND_Select = skin_sound(sfxClick, ID, "sq_click");
SOUND_Solved = skin_sound_generate_array(get_misc_voicelines(ID, "Solved"), ID, "sq_solved");
ButtonOffset = array_create(11, 0);
ButtonValues = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Enter"];
AnswerString = "";
FrogSurf = -1;
TabletOffset = 360;
TabletOffsetSpeed = 0;

function initialize_problem(arg0 = -1)
{
    if (arg0 == -1)
        arg0 = choose("+", "x", "-", "/");
    
    var OperandA = 0;
    var OperandB = 0;
    Solution = 0;
    
    switch (arg0)
    {
        case "+":
            Solution = irandom_range(2, 9);
            OperandA = irandom_range(1, Solution - 1);
            OperandB = Solution - OperandA;
            break;
        
        case "-":
            OperandA = irandom_range(2, 9);
            OperandB = irandom_range(1, OperandA - 1);
            Solution = OperandA - OperandB;
            break;
        
        case "x":
            OperandA = irandom_range(2, 9);
            OperandB = irandom_range(2, 9);
            Solution = OperandA * OperandB;
            break;
        
        case "/":
            OperandB = irandom_range(2, 9);
            Solution = irandom_range(2, 9);
            OperandA = OperandB * Solution;
            break;
    }
    
    Problem = string(OperandA) + " " + arg0 + " " + string(OperandB);
}

initialize_problem();

function custom_problem(arg0, arg1, arg2)
{
    switch (arg0)
    {
        case "+":
            Solution = arg1 + arg2;
            break;
        
        case "-":
            Solution = arg1 - arg2;
            break;
        
        case "x":
            Solution = arg1 * arg2;
            break;
        
        case "/":
            Solution = arg1 / arg2;
            break;
        
        case "^":
            Solution = power(arg1, arg2);
            break;
        
        case "%":
            Solution = arg1 % arg2;
            break;
        
        case "sqrt":
            Solution = sqrt(arg1);
            Problem = "sqrt(" + string(arg1) + ") = ?";
            exit;
    }
    
    Problem = string(arg1) + " " + arg0 + " " + string(arg2);
}

function change_pose(arg0)
{
    FrogSquishSpeed = -0.1;
    Pose = arg0;
}

TabletUp = false;
KillTimer = 999;
Pose = 0;
FrogSquish = 1;
FrogSquishSpeed = 0;
Frame = 0;
ProblemsLeft = "INITIALIZE";

function get_challenge_problem()
{
    var CurrentProblem = 21 - ProblemsLeft;
    var S = 0;
    var oA = 0;
    var oB = 0;
    var Operation = "+";
    
    switch (CurrentProblem)
    {
        case 1:
            return initialize_problem("+");
        
        case 2:
            return initialize_problem("-");
        
        case 3:
            return initialize_problem("x");
        
        case 4:
            return initialize_problem("/");
        
        case 5:
        case 6:
        case 7:
            Operation = "+";
            S = (irandom_range(1, 9) * 10) + irandom_range(1, 9);
            oA = irandom_range(11, S - 11);
            oB = S - oA;
            break;
        
        case 9:
        case 12:
        case 19:
            Operation = "sqrt";
            oA = power(irandom_range(8, 12), 2);
            break;
        
        case 10:
            Operation = "x";
            oA = irandom_range(4, 8);
            oB = 16;
            break;
        
        case 11:
            Operation = "^";
            oA = 2;
            oB = irandom_range(4, 8);
            break;
        
        case 13:
        case 15:
            Operation = "%";
            oA = irandom_range(10, 40);
            oB = irandom_range(3, 9);
            break;
        
        case 14:
        case 18:
            Operation = "+";
            S = (irandom_range(1, 9) * 100) + (irandom_range(1, 9) * 10) + irandom_range(1, 9);
            oA = irandom_range(11, S - 11);
            oB = S - oA;
            break;
        
        case 16:
            Operation = "+";
            S = (irandom_range(1, 9) * 100) + (irandom_range(1, 9) * 10) + irandom_range(1, 9);
            oA = irandom_range(11, S - 11);
            oB = S - oA;
            break;
        
        case 17:
            Operation = "x";
            oA = irandom_range(5, 9);
            oB = irandom_range(11, 12);
            break;
        
        case 20:
            Operation = "+";
            S = (irandom_range(1, 9) * 1000) + (irandom_range(1, 9) * 100) + (irandom_range(1, 9) * 10) + irandom_range(1, 9);
            oB = irandom_range(11, S - 11);
            oA = S - oA;
            break;
        
        default:
            return initialize_problem();
    }
    
    return custom_problem(Operation, oA, oB);
}

function reset_timer(arg0)
{
    TimeToActivate = lerp(58, 22, arg0 / 20) * random_range(0.9, 1.1);
    Pose = 0;
    
    if (arg0 == 21)
    {
        if (ProblemsLeft == "INITIALIZE")
        {
            TimeToActivate = 1;
            ProblemsLeft = 20;
        }
        else
        {
            TimeToActivate = 0;
            ProblemsLeft--;
            
            if (ProblemsLeft == 0)
            {
                global.Timer = 358;
                audio_stop_sound(SOUND_Music);
                exit;
            }
            
            get_challenge_problem();
            
            with (oHappyFrogTablet)
                Active = true;
            
            KillTimer = 10;
        }
    }
}

reset_timer(global.AILevels[ID]);

enum UnknownEnum
{
    Value_59 = 59
}
