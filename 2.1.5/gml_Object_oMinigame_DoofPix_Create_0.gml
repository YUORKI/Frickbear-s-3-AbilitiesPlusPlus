event_inherited();
x = 0;
y = 0;
VisualPoints = 60;

function initialize()
{
    HorizontalClues = [];
    VerticalClues = [];
    LastTile = -1;
    MistakeFreeze = 0;
    TileStates = array_create(100, false);
    Answer = array_create(100, false);
    Detector = instance_create_depth(0, 0, depth, oDoofPix_PuzzleCalculator);
    sprite_index = sDoofPix_Puzzles;
    SolutionImg = irandom(49);
    image_index = SolutionImg;
    MouseX = 0;
    MouseY = 0;
    PointsLeft = 60;
    WinFrames = 0;
    
    with (Detector)
    {
        for (var row = 0; row < 10; row++)
        {
            var Clues = [];
            var Streak = 0;
            x = 0;
            y = 0;
            
            for (var i = 0; i <= 10; i++)
            {
                if (place_meeting(x + i, y + row, oMinigame_DoofPix))
                {
                    Streak++;
                    other.Answer[i + (row * 10)] = true;
                }
                else if (Streak > 0)
                {
                    array_push(Clues, Streak);
                    Streak = 0;
                }
            }
            
            with (other)
                array_push(HorizontalClues, (array_length(Clues) == 0) ? ["0"] : Clues);
        }
        
        for (var column = 0; column < 10; column++)
        {
            var Clues = [];
            var Streak = 0;
            x = 0;
            y = 0;
            
            for (var i = 0; i <= 10; i++)
            {
                if (place_meeting(x + column, y + i, oMinigame_DoofPix))
                {
                    Streak++;
                }
                else if (Streak > 0)
                {
                    array_push(Clues, Streak);
                    Streak = 0;
                }
            }
            
            with (other)
                array_push(VerticalClues, (array_length(Clues) == 0) ? [0] : Clues);
        }
    }
    
    instance_destroy(Detector);
    WaitForClick = true;
    LastFrameTile = -1;
    MarkMode = 0;
    Timer = 0;
    Paused = false;
    Initialize = false;
}

function check_if_solved()
{
    for (var t = 0; t < 100; t++)
    {
        if (((TileStates[t] == 2) ? 0 : TileStates[t]) != Answer[t])
            return false;
    }
    
    return true;
}

Initialize = true;
PuzzleNames = ["Doofas", "Popsicle", "Flan", "Broom Closet", "D-C0 9", "Animdude", "The Tearing", "Fun Fungal", "Fart Hotel", "Bunny", "Pizza", "Wall Pattern", "Balloons", "Gift Box", "Cake", "Purple Guy", "Mike", "Shadow Marionette", "Crying Child", "Old Man Consequences", "Mike Shmidt", "Battery", "Snowcone", "Cupcake", "Deathcoin", "Arcade Machine", "Cartridge", "Freddy Head Interior", "Retina Burner", "Occupied Vent", "Freddy", "Endoskeleton", "Withered Bonnie", "Mangle", "Marionette", "Phantom BB", "Plushtrap", "Lolbit Sticker", "Ennard", "Helpy", "Candy", "Origami Cat", "Blank", "Popgoes", "Black Rabbit", "Morse the Mole", "Ignited Freddy", "Endo C Mouth", "Creation", "Shrimp"];
