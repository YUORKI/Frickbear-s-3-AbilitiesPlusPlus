Timer = 0;
YOffset = 56;
Active = true;
TileSize = 0;
Trophies = array_create(UnknownEnum.Value_63, 
{
    Name: "???",
    Desc: "???",
    Display: true,
    Icon: UnknownEnum.Value_0
});
TrophiesNum = 0;
ForbiddenTrophiesNum = 0;
DisplayTrophies = countup_array(62);
Trophies[UnknownEnum.Value_0] = 
{
    Desc: "Beat the game on Easy difficulty.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_1] = 
{
    Desc: "Beat Fredsweeper in 15 seconds or less.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_2] = 
{
    Desc: "Get a score of 30 or higher in Air Adventure.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_3] = 
{
    Desc: "Get a combo of 150 or greater in Chomping With Chica.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_2],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_4] = 
{
    Desc: "Get a score of 30 or higher in 30 seconds or less in Puppet Patrol.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_3],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_5] = 
{
    Desc: "Beat Hare Pairs in 25 seconds or less.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_4],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_6] = 
{
    Desc: "Get a score of 80 or higher in Pirate Plunder.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_5],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_7] = 
{
    Desc: "Get a score of 128 or higher in Circus Sorter.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_6],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_8] = 
{
    Desc: "Get a score of 50 or higher in Mangle Tangle Mania.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_8],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_9] = 
{
    Desc: "Destroy the cupcake in Cupcake Clicker.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_9],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_10] = 
{
    Desc: "Get a jackpot worth 40 tokens or more in Scott's Slots.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_10],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_11] = 
{
    Desc: "Beat Golden Fredsweeper.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_7],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_17] = 
{
    Desc: "Have a Snowcone, an AR Mask, and Laser Doors all active at the same time.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_18] = 
{
    Desc: "Sell a Golden Cupcake for at least 40 tokens more than the amount you bought it for.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_12] = 
{
    Desc: "End a night mid-jumpscare.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_20] = 
{
    Desc: "Use a deathcoin on Funtime Chica.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_118],
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_13] = 
{
    Desc: "Salvage a guest animatronic.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_14] = 
{
    Desc: "Beat the game on Normal difficulty.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_15] = 
{
    Desc: "Get the Slacker ending.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_16] = 
{
    Desc: "Beat 10 custom night challenges without using any powerups.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_19] = 
{
    Desc: "Buy the Pickles.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_21] = 
{
    Desc: "Unlock every minigame.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_22] = 
{
    Desc: "Earn $300 or more over the course of a run.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_23] = 
{
    Desc: "Beat a run on Hard difficulty or higher without buying any upgrades (not counting Talbert's Files).",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_161],
    Gamemode: 0,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_24] = 
{
    Desc: "Finish a run in 20 minutes or less.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_160],
    Gamemode: 0,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_25] = 
{
    Desc: "Salvage all 24 regular animatronics.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_26] = 
{
    Desc: "Die to a single animatronic 10 times.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_3
};
Trophies[UnknownEnum.Value_27] = 
{
    Desc: "Hear all of Upgrade Cadet's stories.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_28] = 
{
    Desc: "Beat the game on Hard difficulty.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_29] = 
{
    Desc: "Get the Evil ending.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_30] = 
{
    Desc: "Get the Good ending.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_31] = 
{
    Desc: "Get the Money ending.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_32] = 
{
    Desc: "Clear 20 custom night challenges without the deathcoin.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_39] = 
{
    Desc: "Beat a run with the maximum possible amount of animatronics salvaged.",
    Display: true,
    Gamemode: 0,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_33] = 
{
    Desc: string("Unlock all {0} animatronics.", 87),
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_34] = 
{
    Desc: "Die to every character who can kill you at least once.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_35] = 
{
    Desc: "Beat the game on Lunatic difficulty.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_161],
    Gamemode: 0,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_36] = 
{
    Desc: "Get the Ultimate ending.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_1
};
Trophies[UnknownEnum.Value_37] = 
{
    Desc: "Clear every Standard and Special custom night challenge.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_38] = 
{
    Desc: "Clear every Standard and Special custom night challenge without using the deathcoin.",
    Display: global.UnlockedTrophies[UnknownEnum.Value_37],
    Gamemode: 2,
    Type: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_40] = 
{
    Desc: "Unlock every character in the extras menu's character gallery.",
    Display: true,
    Gamemode: 2,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_41] = 
{
    Desc: "Get every ending on Lunatic difficulty.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_162] && global.UnlockedAnimatronics[UnknownEnum.Value_126],
    Gamemode: 0,
    Type: UnknownEnum.Value_5
};
Trophies[UnknownEnum.Value_42] = 
{
    Desc: "100% the game.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_43] = 
{
    Desc: "Beat the Infernal 47 preset.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_44] = 
{
    Desc: "Clear every Standard and Special custom night challenge without using any powerups.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_45] = 
{
    Desc: "Beat a run with 30 animatronics salvaged and zero upgrades (aside from Talbert's Files) purchased.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_46] = 
{
    Desc: "Beat a run on Lunatic difficulty without dying once.",
    Display: false,
    Gamemode: 0,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_47] = 
{
    Desc: "Beat a run.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_48] = 
{
    Desc: "Beat a run as every guard.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_49] = 
{
    Desc: "Beat a run on Nightmare difficulty.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_0
};
Trophies[UnknownEnum.Value_55] = 
{
    Desc: "Get a score of 120 or higher in Tipsy Tapper.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_11],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_56] = 
{
    Desc: "Get a combo of 10 or more in Midnight Motorist without braking.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_12],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_57] = 
{
    Desc: "Clear a DoofPix puzzle in a minute or less without making a single mistake.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_13],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_58] = 
{
    Desc: "Perform a T-spin in Trash Stacker.",
    Display: false,
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_59] = 
{
    Desc: "Perform a perfect round of Endo Chase.",
    Display: global.UnlockedMinigames[UnknownEnum.Value_15],
    Gamemode: 2,
    Type: UnknownEnum.Value_2
};
Trophies[UnknownEnum.Value_50] = 
{
    Desc: "Beat a run in under 15 minutes.",
    Display: false,
    Gamemode: 1,
    Type: UnknownEnum.Value_4
};
Trophies[UnknownEnum.Value_51] = 
{
    Desc: "Earn Easy-difficulty completion stickers or better for every animatronic.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_7
};
Trophies[UnknownEnum.Value_52] = 
{
    Desc: "Earn Normal-difficulty completion stickers or better for every animatronic.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_7
};
Trophies[UnknownEnum.Value_53] = 
{
    Desc: "Earn Hard-difficulty completion stickers or better for every animatronic.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_7
};
Trophies[UnknownEnum.Value_54] = 
{
    Desc: "Earn Lunatic-difficulty completion stickers or better for every animatronic.",
    Display: true,
    Gamemode: 1,
    Type: UnknownEnum.Value_7
};
Trophies[UnknownEnum.Value_60] = 
{
    Desc: "Get a score of 60 or higher in Psycho Foe Fredbear Endless.",
    Display: global.UnlockedAnimatronics[UnknownEnum.Value_126],
    Gamemode: 2,
    Type: UnknownEnum.Value_6
};
Trophies[UnknownEnum.Value_61] = 
{
    Desc: "Earn Nightmare-difficulty completion stickers for every animatronic.",
    Display: false,
    Gamemode: 1,
    Type: UnknownEnum.Value_8
};
Trophies[UnknownEnum.Value_62] = 
{
    Desc: "Beat a run on Nightmare difficulty as every guard.",
    Display: false,
    Gamemode: 1,
    Type: UnknownEnum.Value_8
};
array_sort(DisplayTrophies, function(arg0, arg1)
{
    return ((Trophies[arg0].Type - Trophies[arg1].Type) * 100) + (arg0 - arg1);
});

for (var i = 0; i < array_length(DisplayTrophies); i++)
{
    var ID = DisplayTrophies[i];
    
    if (Trophies[ID].Type == UnknownEnum.Value_8)
    {
        if (!global.UnlockedTrophies[ID])
        {
            array_delete(DisplayTrophies, i, 1);
            i--;
        }
        else
        {
            ForbiddenTrophiesNum++;
        }
    }
    else if (global.UnlockedTrophies[ID])
    {
        TrophiesNum++;
    }
}

ScrollBarOffset = 0;
ScrollBarDragged = false;

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
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_118 = 118,
    Value_126 = 126,
    Value_160 = 160,
    Value_161,
    Value_162
}
