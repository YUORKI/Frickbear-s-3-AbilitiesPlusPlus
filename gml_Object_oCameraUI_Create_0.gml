Frame = 0;
FuzzDegree = 1;
global.CamName[0] = "";
global.CamName[1] = "Showroom";

with (instance_create_depth(736, 120, -1, oCamButton))
    CamNumber = 1;

global.CamName[2] = "Dining Area";

with (instance_create_depth(736, 176, -1, oCamButton))
    CamNumber = 2;

global.CamName[3] = "Pirate's Cove";

with (instance_create_depth(656, 129, -1, oCamButton))
    CamNumber = 3;

global.CamName[4] = "Staff Hallway";

with (instance_create_depth(687, 265, -1, oCamButton))
    CamNumber = 4;

global.CamName[5] = "Restroom Hallway";

with (instance_create_depth(785, 265, -1, oCamButton))
    CamNumber = 5;

global.CamName[6] = "Entrance";

with (instance_create_depth(817, 153, -1, oCamButton))
    CamNumber = 6;

global.CamName[7] = "Arcade";

with (instance_create_depth(808, 72, -1, oCamButton))
    CamNumber = 7;

global.CamName[8] = "Parts & Service";

with (instance_create_depth(736, 65, -1, oCamButton))
    CamNumber = 8;

with (instance_create_depth(x + 4, y + 306, -1, oCamButtonSpecial))
{
    Text = "Cameras";
    image_xscale = 0.5043478260869565;
}

with (instance_create_depth(x + 62, y + 306, -1, oCamButtonSpecial))
{
    Text = "Vents";
    image_xscale = 0.5043478260869565;
}

with (instance_create_depth(x + 120, y + 306, -1, oCamButtonSpecial))
{
    Text = "Shop";
    image_xscale = 0.5043478260869565;
}

with (instance_create_depth(x + 178, y + 306, -1, oCamButtonSpecial))
{
    Text = "Games";
    image_xscale = 0.5043478260869565;
}

with (instance_create_depth(x + 245, y + 5, -1, oCamButtonSpecial))
    Text = "Reset Music";

with (instance_create_depth(x + 245, y + 5, -1, oCamButtonSpecial))
    Text = "Controlled Shock";

with (instance_create_depth(x + 264, y + 305, -1, oCamButtonSpecial))
    Text = "Heater (HOLD)";

with (instance_create_depth(x + 245, y + 5, -1, oCamButtonSpecial))
    Text = "Repair Wiring";

var AnHour = (global.NightSpeedup == 1) ? "an hour" : string("{0} seconds", round(60 / global.NightSpeedup));

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Mimic Ball";
    Description = "Gives you a duplicate of the last purchased item. (INSTANT USE)";
    Price = 0;
    Stock = 1;
    MimicItem = "NONE";
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "King's Prize";
    Description = has_upgrade(UnknownEnum.Value_48) ? "Does something good! (INSTANT USE)" : "Does...something. (INSTANT USE)";
    Price = has_upgrade(UnknownEnum.Value_48) ? 15 : 5;
    Stock = 5;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Rewind Clock";
    Description = string("Winds the clock back {0}. (INSTANT USE)", speedup_seconds_string(60, true, false, false));
    Price = 5;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Battery Pack";
    Description = "Restores 10% of your power. (INSTANT USE)";
    Price = 10;
    Stock = 3;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Snowcone";
    Description = string("Keeps the office at its lowest possible temperature for {0}. (CLICK TO USE)", speedup_seconds_string(60, true, true, false));
    Price = 10;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Golden Cupcake";
    Description = "Increases in value over time. Click it to sell it back for tokens. (CLICK TO USE)";
    Price = 15;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "AR Mask";
    Description = string("Will make all animatronics behave as if you have the mask on for {0}. (CLICK TO USE)", speedup_seconds_string(60, true, true, false));
    Price = 15;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Laser Doors";
    Description = string("Blocks off both doors for {0}. (CLICK TO USE)", speedup_seconds_string(60, true, true, false));
    Price = 20;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Beartrap";
    Description = "Blocks and resets the next animatronic who tries to jumpscare you. (AUTOMATIC)";
    Price = 25;
    Stock = 1;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Deathcoin";
    Description = "Completely deactivate an animatronic of your choice for the rest of the night. (CLICK TO USE)";
    Price = 30;
    Stock = 1;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Distortion Clock";
    Description = string("Skip {0} of the night. (INSTANT USE)", AnHour);
    Price = 35;
    Stock = 2;
}

with (instance_create_depth(x + 6 + ((instance_number(oCamButtonShopItem) % 6) * 48), y + 50 + (floor(instance_number(oCamButtonShopItem) / 6) * 64), -1, oCamButtonShopItem))
{
    Text = "Pickles";
    Description = "Happiness +1. (INSTANT USE)";
    Price = 300;
    Stock = 1;
}

with (oCamButtonShopItem)
{
    if (Text == "Distortion Clock" && array_contains(["The LolzHax Shuffle"], global.ChallengeTitle))
        instance_destroy();
    
    if (Text == "Rewind Clock" && array_contains(["Minute 2 Win It"], global.ChallengeTitle))
        instance_destroy();
}

if ((guard_ability(UnknownEnum.Value_19) || guard_ability(UnknownEnum.Value_8) || guard_ability(UnknownEnum.Value_30)) && !instance_exists(oFredbear))
{
    delete_shop_item("Rewind Clock");
    delete_shop_item("Distortion Clock");
}

if (guard_ability(UnknownEnum.Value_22))
    delete_shop_item("Deathcoin");

if (eleanor_challenge_active(UnknownEnum.Value_0))
    delete_shop_item_all();

if (numbered_night() && !global.ShuffleMode)
{
    for (var m = 0; m < array_length(global.SalvagedMinigames); m++)
    {
        if (global.UnlockedMinigames[UnknownEnum.Value_2 + m])
            global.SalvagedMinigames[m] = true;
    }
}

var GFredsweepUnlocked = global.UnlockedMinigames[UnknownEnum.Value_7];
var MinigameUnlocks = array_create(16, false);

if (numbered_night())
{
    MinigameUnlocks[UnknownEnum.Value_1] = true;
    MinigameUnlocks[UnknownEnum.Value_0] = true;
    MinigameUnlocks[UnknownEnum.Value_7] = GFredsweepUnlocked;
    MinigameUnlocks[UnknownEnum.Value_8] = has_upgrade(UnknownEnum.Value_27);
    MinigameUnlocks[UnknownEnum.Value_9] = has_upgrade(UnknownEnum.Value_28);
    MinigameUnlocks[UnknownEnum.Value_10] = has_upgrade(UnknownEnum.Value_29);
    
    for (var i = 0; i < array_length(global.SalvagedMinigames); i++)
        MinigameUnlocks[UnknownEnum.Value_2 + i] = global.SalvagedMinigames[i];
}

if (global.Night == "Custom")
    MinigameUnlocks = global.UnlockedMinigames;

if (has_upgrade(UnknownEnum.Value_27))
    global.UnlockedMinigames[UnknownEnum.Value_8] = true;

if (has_upgrade(UnknownEnum.Value_28))
    global.UnlockedMinigames[UnknownEnum.Value_9] = true;

if (has_upgrade(UnknownEnum.Value_29))
    global.UnlockedMinigames[UnknownEnum.Value_10] = true;

AvailableMinigames = [];
DisabledMinigames = array_create(16, false);

if (global.Night == "Endless")
{
    for (var i = 0; i < 16; i++)
    {
        MinigameUnlocks[i] = array_contains(global.EndlessInventory.Cartridges, i);
        
        if (MinigameUnlocks[i])
            global.UnlockedMinigames[i] = true;
    }
}

if (global.GuardParameters.randomize_minigames)
{
    var ShufflerArray = [];
    
    for (var i = 0; i < 16; i++)
    {
        if (i != UnknownEnum.Value_7)
            array_push(ShufflerArray, i);
    }
    
    ShufflerArray = array_shuffle(ShufflerArray);
    
    for (var i = 0; i < array_length(global.EndlessInventory.Cartridges); i++)
        array_push(AvailableMinigames, ShufflerArray[i]);
}
else
{
    for (var i = 0; i < 16; i++)
    {
        if (MinigameUnlocks[i])
        {
            var ThisID = i;
            
            if (numbered_night() && global.ShuffleMode)
                ThisID = global.ShuffleData.Minigames[i];
            
            array_push(AvailableMinigames, ThisID);
            global.UnlockedMinigames[ThisID] = true;
        }
    }
}

if (array_length(AvailableMinigames) < 16 && has_upgrade(UnknownEnum.Value_56))
{
    var FlashcartGame;
    
    do
        FlashcartGame = irandom(15);
    until (!array_contains(AvailableMinigames, FlashcartGame));
    
    array_push(AvailableMinigames, FlashcartGame);
}

var MinigamesToDisable = eleanor_challenge_active(UnknownEnum.Value_3) ? ceil(array_length(AvailableMinigames) / 2) : 0;
var DisableTarget = 0;

repeat (MinigamesToDisable)
{
    do
        DisableTarget = irandom(array_length(AvailableMinigames) - 1);
    until (DisabledMinigames[DisableTarget] == false);
    
    DisabledMinigames[DisableTarget] = true;
}

var EleanorMinigame = 0;

if (eleanor_challenge_active(UnknownEnum.Value_14))
    instance_create_depth(0, 0, 0, oEleanor_ScoreTracker);

MinigameDescriptionText = "Select a game from the menu above!";
SelectedMinigame = -1;
global.AudioLureX = -99;
global.AudioLureY = 99;
global.AudioLureAltX = -99;
global.AudioLureAltY = 99;

for (var Y = -1; Y <= 1; Y += 1)
{
    for (var X = -2; X <= 2; X += 1)
    {
        var ButtonX = x + 320 + (X * 80);
        var ButtonY = y + 164 + (Y * 80);
        
        with (instance_create_depth(ButtonX, ButtonY, -1, oVentButton))
            ButtonID = [X, Y];
    }
}

global.MinigameWindowX = 313;
global.MinigameWindowY = 37;
global.MinigameWindowScale = 2;
initialize_minigame_scores();
ShopkeepFrame = 0;
ShopkeepAnim = 0;

if (has_upgrade(UnknownEnum.Value_19))
{
    with (oCamButtonShopItem)
        Stock += 2;
}
else if (has_upgrade(UnknownEnum.Value_18))
{
    with (oCamButtonShopItem)
        Stock += 1;
}

ZapAlpha = 0;
MinigameScrollOffset = 0;
MinigameScrollDragged = false;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_7 = 7,
    Value_8,
    Value_9,
    Value_10,
    Value_14 = 14,
    Value_18 = 18,
    Value_19,
    Value_22 = 22,
    Value_27 = 27,
    Value_28,
    Value_29,
    Value_30,
    Value_48 = 48,
    Value_56 = 56
}
