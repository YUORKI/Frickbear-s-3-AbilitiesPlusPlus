ChestPool = [];
RewardSize = global.Jumpscare;

function get_items(arg0)
{
    var ReturnArr = [];
    var AvailableUpgrades = [];
    var UpgradeList = [];
    var FillerDesc = "";
    
    switch (arg0)
    {
        case "Upgrade":
            AvailableUpgrades = get_available_upgrade_ids();
            UpgradeList = get_upgrades();
            break;
            break;
        
        case "Cartridge":
            AvailableUpgrades = get_available_cartridge_ids();
            UpgradeList = get_shop_minigames();
            break;
        
        case "Consumable":
            AvailableUpgrades = get_available_consumable_ids();
            UpgradeList = get_consumables();
            break;
    }
    
    for (var i = 0; i < array_length(AvailableUpgrades); i++)
    {
        var UpgradeID = AvailableUpgrades[i];
        var Upgrade = UpgradeList[UpgradeID];
        array_push(ReturnArr, 
        {
            Name: Upgrade.Name,
            Type: arg0,
            Desc: Upgrade.Desc,
            Price: Upgrade.Price,
            ID: UpgradeID
        });
    }
    
    return ReturnArr;
}

ChestPool = array_concat(get_items("Upgrade"), get_items("Cartridge"), get_items("Consumable"));
ChestPool_SMALL = [];
ChestPool_MEDIUM = [];
ChestPool_LARGE = [];

for (var i = 0; i < array_length(ChestPool); i++)
{
    var Item = ChestPool[i];
    var ItemPrice = Item.Price;
    
    if (ItemPrice >= 30)
        array_push(ChestPool_LARGE, Item);
    else if (ItemPrice > 15 || (ItemPrice == 15 && irandom(3) == 1))
        array_push(ChestPool_MEDIUM, Item);
    else
        array_push(ChestPool_SMALL, Item);
}

var Roll = irandom_range(1, 100);

if (array_length(ChestPool_SMALL) == 0)
{
    array_push(ChestPool_SMALL, 
    {
        Name: "Nothing",
        Type: "Nothing",
        Desc: "Try again.",
        Price: 0,
        ID: 0
    });
}

if (array_length(ChestPool_MEDIUM) == 0)
{
    array_push(ChestPool_MEDIUM, 
    {
        Name: "Nothing",
        Type: "Nothing",
        Desc: "Try again.",
        Price: 0,
        ID: 0
    });
}

if (array_length(ChestPool_LARGE) == 0)
{
    array_push(ChestPool_LARGE, 
    {
        Name: "Nothing",
        Type: "Nothing",
        Desc: "Try again.",
        Price: 0,
        ID: 0
    });
}

switch (RewardSize)
{
    case 0:
        Reward = ChestPool_SMALL[irandom(array_length(ChestPool_SMALL) - 1)];
        break;
    
    case 1:
        Reward = ChestPool_MEDIUM[irandom(array_length(ChestPool_MEDIUM) - 1)];
        
        if (Roll <= 25)
        {
            Reward = 
            {
                Name: "Nothing",
                Type: "Nothing",
                Desc: "Try again.",
                Price: 0,
                ID: 0
            };
        }
        
        break;
    
    case 2:
        Reward = ChestPool_LARGE[irandom(array_length(ChestPool_LARGE) - 1)];
        
        if (Roll <= 2)
        {
            Reward = 
            {
                Name: "",
                Type: "Bear5",
                Desc: "",
                Price: 0,
                ID: 0
            };
        }
        else if (Roll <= 20 && !any_challenge_active())
        {
            var ChallengeID = choose_from_array(get_available_challenge_ids());
            var Challenge = get_eleanor_challenges(ChallengeID);
            Reward = 
            {
                Name: Challenge.Name,
                Type: "Challenge",
                Desc: Challenge.Desc,
                Price: 0,
                ID: ChallengeID
            };
        }
        else if (Roll <= 50)
        {
            var PossibleAnimatronics = [];
            
            for (var i = 0; i < 86; i++)
            {
                if (array_contains(global.AllTimeSalvages, i))
                    continue;
                
                array_push(PossibleAnimatronics, i);
            }
            
            var Animatronic = choose_from_array(PossibleAnimatronics);
            Reward = 
            {
                Name: global.Descriptions[Animatronic][0],
                Type: "Animatronic",
                Desc: global.Descriptions[Animatronic][1],
                Price: 0,
                ID: Animatronic
            };
        }
        
        break;
}

ChestX = 640;
ChestStretch = 1;
Frame = 0;
Open = false;
ChestOffset = 0;
PageOffset = 360;
PageUp = false;
FadingOut = false;
BlackAlpha = 0;
audio_play_sound(sfxDrumRoll, 10, false);
