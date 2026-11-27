global.MinigameWindowX = 0;
global.MinigameWindowY = 0;
global.MinigameWindowScale = 1;

function timer_based_minigame(arg0)
{
    return array_contains([UnknownEnum.Value_0, UnknownEnum.Value_4, UnknownEnum.Value_7], arg0);
}

function initialize_minigame_scores()
{
    global.HiScores[UnknownEnum.Value_0] = 360;
    global.HiScores[UnknownEnum.Value_1] = 0;
    global.HiScores[UnknownEnum.Value_2] = 0;
    global.HiScores[UnknownEnum.Value_3] = 0;
    global.HiScores[UnknownEnum.Value_4] = 360;
    global.HiScores[UnknownEnum.Value_5] = 0;
    global.HiScores[UnknownEnum.Value_6] = 0;
    global.HiScores[UnknownEnum.Value_7] = 1200;
    global.HiScores[UnknownEnum.Value_8] = 0;
    global.HiScores[UnknownEnum.Value_9] = 0;
    global.HiScores[UnknownEnum.Value_10] = 0;
    global.HiScores[UnknownEnum.Value_11] = 0;
    global.HiScores[UnknownEnum.Value_12] = 0;
    global.HiScores[UnknownEnum.Value_13] = 0;
    global.HiScores[UnknownEnum.Value_15] = 0;
    global.HiScores[UnknownEnum.Value_14] = 0;
}

initialize_minigame_scores();

function get_minigame_data(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return 
            {
                Object: oMinigame_FreddyFazsweep,
                Name: "Fredsweeper",
                Desc: "Clear out all the blank tiles, but watch out for Freddles! The numbers on each tile will let you know how many Freddles are in the tiles adjacent to it. Left click to clear a tile and right click to mark it."
            };
        
        case UnknownEnum.Value_1:
            return 
            {
                Object: oMinigame_AirAdventure,
                Name: "Air Adventure",
                Desc: "Help BB navigate through the clouds! Left click to rise and space to pause. Passing ten clouds in a row will increase your multiplier!"
            };
        
        case UnknownEnum.Value_2:
            return 
            {
                Object: oMinigame_ChicasFeedingFrenzy,
                Name: "Chomping With Chica",
                Desc: "Hold the left mouse button to eat the pizzas coming your way, but watch out for bombs! Rack up combos to earn tokens! Press space to pause / unpause."
            };
        
        case UnknownEnum.Value_3:
            return 
            {
                Object: oMinigame_PuppetPatrol,
                Name: "Puppet Patrol",
                Desc: "Help the Marionette find its assigned child! Click on the kid it requests to earn a point. If you spot a crying child, you can click on it for bonus points! Hold right click to turn on your flashlight, but be sure not to run out of battery."
            };
        
        case UnknownEnum.Value_4:
            return 
            {
                Object: oMinigame_HarePairs,
                Name: "Hare Pairs",
                Desc: "Clear out the deck by matching pairs of cards adjacent to one another! Left click to select a card and then left click a matching card next to it vertically, horizontally, or diagonally. If you clear out the entire board, you win!"
            };
        
        case UnknownEnum.Value_5:
            return 
            {
                Object: oMinigame_PiratePlunder,
                Name: "Pirate Plunder",
                Desc: "Plunder Seagoon's treasure and get back to your pirate ship! If you get grabbed by Seagoon's tentacles, it's game over. Use the left and right mouse buttons to move. Hold the right mouse button while at the treasure chest to collect treasure."
            };
        
        case UnknownEnum.Value_6:
            return 
            {
                Object: oMinigame_CircusSorter,
                Name: "Circus Sorter",
                Desc: "Drag the Bidybabs to Baby and the Minireenas to Ballora! Left click to pick up either. Taking too long to sort a bot or sorting one to the wrong side will result in a jumpscare."
            };
        
        case UnknownEnum.Value_7:
            return 
            {
                Object: oMinigame_GoldenFazsweep,
                Name: "Golden Fredsweeper",
                Desc: "A harder version of Fredsweeper, with four times the tiles! Beat this game to earn a huge token bonus!"
            };
        
        case UnknownEnum.Value_8:
            return 
            {
                Object: oMinigame_MangleTangleMania,
                Name: "Mangle Tangle Mania",
                Desc: "Collect gears to put Mangle back together! The more you grab, the more tokens you'll earn. Watch out, though - if you run into yourself or a wall, it's game over! Use the WASD keys to move. The game will only run when moused over!"
            };
        
        case UnknownEnum.Value_9:
            return 
            {
                Object: oMinigame_CupcakeClicker,
                Name: "Cupcake Clicker",
                Desc: "Click the cupcake! Every 5 clicks grants 1 token. Be sure to not fill the meter!"
            };
        
        case UnknownEnum.Value_10:
            return 
            {
                Object: oMinigame_ScottsSlots,
                Name: "Scott's Slots",
                Desc: "Who doesn't love a good old-fashioned slot machine? Bet your tokens for the chance to win big! The more tokens you bet, the more lines you can score across. Each animatronic has a different token value!"
            };
        
        case UnknownEnum.Value_11:
            return 
            {
                Object: oMinigame_TipsyTapper,
                Name: "Tipsy Tapper",
                Desc: "Serve root beer to your thirsty customers! Hold either mouse button to fill up a mug, and release to slide it down the counter. You earn tokens by serving customers and catching the mugs they send back. Don't let any mugs fall off the counter!"
            };
        
        case UnknownEnum.Value_12:
            return 
            {
                Object: oMinigame_MidnightMotorist,
                Name: "Midnight Motorist",
                Desc: "Dodge the other cars on the highway and cross the finish line to earn points! Hold the right mouse button to speed up and left mouse button to brake. You earn more tokens for longer combos."
            };
        
        case UnknownEnum.Value_13:
            return 
            {
                Object: oMinigame_DoofPix,
                Name: "DoofPix",
                Desc: "Use the clues to chisel out a picture! Each number represents a consecutive set of tiles in a column or row. Your first click will clear out a row and a column for free, but each wrong guess afterwards will decrease your final payout. Left click to chisel tiles and right click to mark them!"
            };
        
        case UnknownEnum.Value_15:
            return 
            {
                Object: oMinigame_EndoChase,
                Name: "Endo Chase",
                Desc: "The animatronics want to stuff you into a suit! Dodge them, collect all the tokens scattered across the maze, and grab lightbulbs to turn the animatronics temporarily vulnerable. Cupcakes will grant bonus points. Use WASD to move. The game will only run when moused over!"
            };
        
        case UnknownEnum.Value_14:
            return 
            {
                Object: oMinigame_TrashStacker,
                Name: "Trash Stacker",
                Desc: "Stack blocks and make lines to score points! Use WASD to move blocks, space to quickdrop, shift to store and the left/right mouse buttons to rotate. The game will only run when moused over!"
            };
        
        default:
            return 
            {
                Object: oMinigameParent,
                Name: "???",
                Desc: "???"
            };
    }
}

function get_shop_minigames(arg0 = -1)
{
    var Inventory = [];
    Inventory[UnknownEnum.Value_1] = 
    {
        Name: "BB Cartridge",
        Desc: "Lets you play Air Adventure from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_0] = 
    {
        Name: "Freddy Cartridge",
        Desc: "Lets you play Fredsweeper from the Games menu.",
        Price: 20
    };
    Inventory[UnknownEnum.Value_2] = 
    {
        Name: "Chica Cartridge",
        Desc: "Lets you play Chomping With Chica from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_3] = 
    {
        Name: "Marionette Cartridge",
        Desc: "Lets you play Puppet Patrol from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_4] = 
    {
        Name: "Bonnie Cartridge",
        Desc: "Lets you play Hare Pairs from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_5] = 
    {
        Name: "Foxy Cartridge",
        Desc: "Lets you play Pirate Plunder from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_6] = 
    {
        Name: "Baby Cartridge",
        Desc: "Lets you play Circus Sorter from the Games menu.",
        Price: 20
    };
    Inventory[UnknownEnum.Value_7] = 
    {
        Name: "Fredbear Cartridge",
        Desc: "Lets you play Golden Fredsweeper from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_8] = 
    {
        Name: "Mangle Cartridge",
        Desc: "Lets you play Mangle Tangle Mania from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_9] = 
    {
        Name: "Cupcake Cartridge",
        Desc: "Lets you play Cupcake Clicker from the Games menu.",
        Price: 20
    };
    Inventory[UnknownEnum.Value_10] = 
    {
        Name: "Animdude Cartridge",
        Desc: "Lets you play Scott's Slots from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_11] = 
    {
        Name: "Tipsy Cartridge",
        Desc: "Lets you play Tipsy Tapper from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_12] = 
    {
        Name: "Springtrap Cartridge",
        Desc: "Lets you play Midnight Motorist from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_13] = 
    {
        Name: "Doofas Cartridge",
        Desc: "Lets you play DoofPix from the Games menu.",
        Price: 10
    };
    Inventory[UnknownEnum.Value_15] = 
    {
        Name: "Endo Cartridge",
        Desc: "Lets you play Endo Chase from the Games menu.",
        Price: 15
    };
    Inventory[UnknownEnum.Value_14] = 
    {
        Name: "Trash Cartridge",
        Desc: "Lets you play Trash Stacker from the Games menu.",
        Price: 20
    };
    
    if (arg0 == -1)
        return Inventory;
    else
        return Inventory[arg0];
}

function get_carnie_scores(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return 
            {
                NormalScore: [infinity, infinity, infinity],
                NormalTimer: [45, 30, 15]
            };
        
        case UnknownEnum.Value_1:
            return 
            {
                NormalScore: [10, 20, 30],
                NormalTimer: [infinity, infinity, infinity]
            };
        
        case UnknownEnum.Value_2:
            return 
            {
                NormalScore: [40, 80, 120],
                NormalTimer: [infinity, infinity, infinity]
            };
        
        case UnknownEnum.Value_3:
            return 
            {
                NormalScore: [15, 30, 45],
                NormalTimer: [45, 45, 45]
            };
        
        case UnknownEnum.Value_4:
            return 
            {
                NormalScore: [infinity, infinity, infinity],
                NormalTimer: [60, 45, 30]
            };
        
        case UnknownEnum.Value_5:
            return 
            {
                NormalScore: [20, 35, 50],
                NormalTimer: [45, 45, 45]
            };
        
        case UnknownEnum.Value_6:
            return 
            {
                NormalScore: [40, 80, 120],
                NormalTimer: [infinity, infinity, infinity]
            };
        
        case UnknownEnum.Value_8:
            return 
            {
                NormalScore: [15, 25, 30],
                NormalTimer: [90, 80, 70]
            };
        
        case UnknownEnum.Value_9:
            return 
            {
                NormalScore: [25, 25, 15],
                NormalTimer: [5, 3, 1]
            };
        
        case UnknownEnum.Value_10:
            return 
            {
                NormalScore: [10, 10, 20],
                NormalTimer: [10, 5, 5]
            };
        
        case UnknownEnum.Value_11:
            return 
            {
                NormalScore: [10, 30, 75],
                NormalTimer: [30, 60, 90]
            };
        
        case UnknownEnum.Value_12:
            return 
            {
                NormalScore: [3, 7, 30],
                NormalTimer: [15, 15, 30]
            };
        
        case UnknownEnum.Value_13:
            return 
            {
                NormalScore: [5, 40, 60],
                NormalTimer: [120, 90, 60]
            };
        
        case UnknownEnum.Value_15:
            return 
            {
                NormalScore: [250, 500, 1000],
                NormalTimer: [120, 120, 120]
            };
        
        case UnknownEnum.Value_14:
            return 
            {
                NormalScore: [100, 300, 600],
                NormalTimer: [60, 60, 60]
            };
        
        default:
            return 
            {
                NormalScore: [15, 20, 30],
                NormalTimer: [infinity, infinity, infinity]
            };
    }
}

function get_cabinet_scores(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return [300, 30];
        
        case UnknownEnum.Value_1:
            return [10, 25];
        
        case UnknownEnum.Value_2:
            return [50, 100];
        
        case UnknownEnum.Value_3:
            return [20, 40];
        
        case UnknownEnum.Value_4:
            return [180, 40];
        
        case UnknownEnum.Value_5:
            return [20, 40];
        
        case UnknownEnum.Value_6:
            return [50, 100];
        
        case UnknownEnum.Value_7:
            return [600, 300];
        
        case UnknownEnum.Value_8:
            return [15, 30];
        
        case UnknownEnum.Value_9:
            return [30, 100];
        
        case UnknownEnum.Value_10:
            return [10, 50];
        
        case UnknownEnum.Value_11:
            return [25, 75];
        
        case UnknownEnum.Value_12:
            return [20, 50];
        
        case UnknownEnum.Value_13:
            return [5, 60];
        
        case UnknownEnum.Value_15:
            return [200, 750];
        
        case UnknownEnum.Value_14:
            return [250, 1000];
        
        default:
            return [25, 50];
    }
}

function calc_high_score(arg0, arg1, arg2)
{
    if (arg2 == 21)
        arg2 = 10;
    
    arg2 /= 20;
    return round(lerp(arg0, arg1, arg2));
}

function get_toyfreddy_scores(arg0)
{
    var AI = arg0 / global.NightSpeedup;
    var TFScores = [];
    TFScores[UnknownEnum.Value_0] = calc_high_score(120, 45, AI);
    TFScores[UnknownEnum.Value_1] = calc_high_score(5, 25, AI);
    TFScores[UnknownEnum.Value_2] = calc_high_score(0, 100, AI);
    TFScores[UnknownEnum.Value_3] = calc_high_score(10, 30, AI);
    TFScores[UnknownEnum.Value_4] = calc_high_score(360, 60, AI);
    TFScores[UnknownEnum.Value_5] = calc_high_score(5, 25, AI);
    TFScores[UnknownEnum.Value_6] = calc_high_score(10, 30, AI);
    TFScores[UnknownEnum.Value_7] = 360;
    TFScores[UnknownEnum.Value_8] = calc_high_score(5, 20, AI);
    TFScores[UnknownEnum.Value_9] = calc_high_score(50, 200, AI);
    TFScores[UnknownEnum.Value_10] = calc_high_score(20, 100, AI);
    TFScores[UnknownEnum.Value_11] = calc_high_score(5, 25, AI);
    TFScores[UnknownEnum.Value_12] = calc_high_score(5, 30, AI);
    TFScores[UnknownEnum.Value_13] = calc_high_score(5, 60, AI);
    TFScores[UnknownEnum.Value_15] = calc_high_score(50, 400, AI);
    TFScores[UnknownEnum.Value_14] = calc_high_score(50, 250, AI);
    return TFScores;
}

function get_minigame_icon(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return UnknownEnum.Value_1;
        
        case UnknownEnum.Value_1:
            return UnknownEnum.Value_6;
        
        case UnknownEnum.Value_2:
            return UnknownEnum.Value_3;
        
        case UnknownEnum.Value_3:
            return UnknownEnum.Value_7;
        
        case UnknownEnum.Value_4:
            return UnknownEnum.Value_2;
        
        case UnknownEnum.Value_5:
            return UnknownEnum.Value_4;
        
        case UnknownEnum.Value_6:
            return UnknownEnum.Value_16;
        
        case UnknownEnum.Value_7:
            return UnknownEnum.Value_26;
        
        case UnknownEnum.Value_8:
            return UnknownEnum.Value_5;
        
        case UnknownEnum.Value_9:
            return UnknownEnum.Value_27;
        
        case UnknownEnum.Value_10:
            return UnknownEnum.Value_28;
        
        case UnknownEnum.Value_11:
            return UnknownEnum.Value_29;
        
        case UnknownEnum.Value_12:
            return UnknownEnum.Value_14;
        
        case UnknownEnum.Value_13:
            return UnknownEnum.Value_30;
        
        case UnknownEnum.Value_15:
            return UnknownEnum.Value_33;
        
        case UnknownEnum.Value_14:
            return UnknownEnum.Value_32;
        
        default:
            return 0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_26 = 26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_32 = 32,
    Value_33
}
