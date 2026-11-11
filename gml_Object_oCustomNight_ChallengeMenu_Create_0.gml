function cn_button(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = -1, arg8 = true)
{
    draw_sprite_stretched(sTextBox_Windows, arg6 || !arg8, arg1, arg2, arg3, arg4);
    draw_set_font(global.FontW97Black);
    draw_set_valign(fa_top);
    
    if (arg7 == "Category")
    {
        draw_set_halign(fa_right);
        
        if (ClearedPerCategory[arg0] >= CountsPerCategory[arg0])
            draw_sprite(sCustomNightChallengeSticker, 0, (arg1 + arg3) - 20, arg2 + 2);
        else if (arg5 != "Expert Presets" && arg5 != "Cruel Presets")
            draw_text((arg1 + arg3) - 5, arg2 + 1, string("{0}/{1}", ClearedPerCategory[arg0], CountsPerCategory[arg0]));
    }
    
    draw_set_halign(fa_left);
    
    if (arg8)
        draw_text_ext(arg1 + 6, arg2 + 1, arg5, 15, arg3 - 12);
    
    if (arg7 == -1)
        exit;
    
    if (clicked(arg1, arg2, arg3, arg4) && arg8)
    {
        audio_play_sound(sfxBump, 5, false);
        
        switch (arg7)
        {
            case "Challenge":
                reset_challenge_alterations();
                var Data = Challenges[Category][arg0];
                SelectedChallenge = arg0;
                global.Challenge = Data.ID;
                global.NightSpeedup = 6 / Data.Duration;
                global.ChallengeTitle = arg5;
                global.AILevels = array_create(200, 0);
                
                if (variable_struct_exists(Data, "Upgrades"))
                    array_copy(global.CustomNightUpgrades, 0, Data.Upgrades, 0, array_length(Data.Upgrades));
                
                if (variable_struct_exists(Data, "Cheats"))
                {
                    for (var i = 0; i < array_length(Data.Cheats); i++)
                        global.Cheats[Data.Cheats[i]] = true;
                }
                
                break;
            
            case "Category":
                Category = arg0;
                SelectedChallenge = -1;
                break;
        }
    }
}

EntrySpacer = 32;
EntriesPerRow = 8;
InitializeLevels = false;
Category = -1;
MaxLvl = 80;

function draw_entry_box(arg0)
{
    var Data = Challenges[Category][SelectedChallenge];
    var Lvl = string(arg0);
    var HoveredEntry = -1;
    var VarName = "Lvl" + Lvl + "s";
    var Exists = variable_struct_exists(Data, VarName);
    
    if (Exists || arg0 == 22)
    {
        var ThisField;
        
        if (Exists)
        {
            ThisField = variable_struct_get(Data, VarName);
            
            if (array_length(ThisField) == 0)
                exit;
        }
        else
        {
            ThisField = [];
        }
        
        for (var i = 0; i < array_length(ThisField); i++)
            global.AILevels[ThisField[i]] = (arg0 == "SP") ? 21 : arg0;
        
        if (!is_string(arg0) && (arg0 > 21 && arg0 <= MaxLvl))
        {
            for (var i = 0; i < array_length(ThisField); i++)
                array_push(LevelXs, ThisField[i]);
            
            if (arg0 == 22 && array_length(LevelXs) > 0)
            {
                ThisField = LevelXs;
                Lvl = "X";
            }
            else
            {
                exit;
            }
        }
        
        ThisField = get_sorter_array(ThisField);
        draw_text(6, EntryY + 1, "Level " + Lvl + ":");
        var BoxHeight = (48 - EntrySpacer) + (ceil(array_length(ThisField) / EntriesPerRow) * EntrySpacer);
        EntryY += 20;
        draw_sprite_stretched(sTextBox_Windows, 2, 6, EntryY, InnerBoxWidth, BoxHeight);
        
        for (var i = 0; i < array_length(ThisField); i++)
        {
            var ItemX = 6 + ((i % EntriesPerRow) * EntrySpacer);
            var ItemY = EntryY + (floor(i / EntriesPerRow) * EntrySpacer);
            draw_sprite(global.IconTiles[ThisField[i]], 0, ItemX, ItemY);
            
            if (mouse_in_zone(ItemX, ItemY, 48, 48))
                HoveredItem = ThisField[i];
        }
        
        EntryY += (BoxHeight - 2);
        exit;
    }
    else
    {
        exit;
    }
}

CategoryNames = ["Standard Presets", "Special Presets", "Expert Presets", "Cruel Presets"];
Challenges = [[], [], [], []];
LevelXs = [];
reset_challenge_alterations();
array_push(Challenges[0], 
{
    Name: "Era of '87",
    Desc: "All your friends from the new and improved Freddy Fazbear's Pizza are here!",
    Lvl20s: [UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_14, UnknownEnum.Value_16, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13],
    Lvl5s: [UnknownEnum.Value_4, UnknownEnum.Value_15, UnknownEnum.Value_5, UnknownEnum.Value_17, UnknownEnum.Value_18],
    Duration: 3
});
array_push(Challenges[0], 
{
    Name: "Rabbit Season",
    Desc: "Face off against every rabbit in the Frickbear's 3 roster!",
    Lvl20s: [UnknownEnum.Value_1, UnknownEnum.Value_7, UnknownEnum.Value_11, UnknownEnum.Value_18, UnknownEnum.Value_20, UnknownEnum.Value_21, UnknownEnum.Value_37],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "Rabbit Season 2",
    Desc: "Face off against every rabbit in the game!",
    Lvl20s: [UnknownEnum.Value_1, UnknownEnum.Value_7, UnknownEnum.Value_11, UnknownEnum.Value_18, UnknownEnum.Value_20, UnknownEnum.Value_86, UnknownEnum.Value_21, UnknownEnum.Value_47, UnknownEnum.Value_37, UnknownEnum.Value_71, UnknownEnum.Value_82],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "Window Watchers",
    Desc: "Keep an eye on the office window - it seems to be particularly crowded tonight.",
    Lvl20s: [UnknownEnum.Value_5, UnknownEnum.Value_10, UnknownEnum.Value_13, UnknownEnum.Value_38, UnknownEnum.Value_16, UnknownEnum.Value_21, UnknownEnum.Value_44],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "Window Watchers 2",
    Desc: "The window's even MORE crowded! Keep an eye behind you, too!",
    Lvl20s: [UnknownEnum.Value_5, UnknownEnum.Value_10, UnknownEnum.Value_13, UnknownEnum.Value_38, UnknownEnum.Value_21, UnknownEnum.Value_48, UnknownEnum.Value_68, UnknownEnum.Value_67, UnknownEnum.Value_69, UnknownEnum.Value_85, UnknownEnum.Value_58, UnknownEnum.Value_51, UnknownEnum.Value_64],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "Ladies' Night",
    Desc: "Try not to catch their cooties.",
    Lvl20s: [UnknownEnum.Value_2, UnknownEnum.Value_8, UnknownEnum.Value_15, UnknownEnum.Value_12, UnknownEnum.Value_26, UnknownEnum.Value_29, UnknownEnum.Value_35],
    Lvl10s: [UnknownEnum.Value_9, UnknownEnum.Value_16, UnknownEnum.Value_25, UnknownEnum.Value_28],
    LvlSPs: [UnknownEnum.Value_19],
    Lvl5s: [UnknownEnum.Value_34, UnknownEnum.Value_33],
    Duration: 3
});
array_push(Challenges[0], 
{
    Name: "Ladies' Night 2",
    Desc: "Like half of these are just different versions of Chica!",
    Lvl20s: [UnknownEnum.Value_2, UnknownEnum.Value_12, UnknownEnum.Value_8, UnknownEnum.Value_48, UnknownEnum.Value_69, UnknownEnum.Value_15, UnknownEnum.Value_51, UnknownEnum.Value_52, UnknownEnum.Value_26, UnknownEnum.Value_29, UnknownEnum.Value_55, UnknownEnum.Value_35, UnknownEnum.Value_59, UnknownEnum.Value_67, UnknownEnum.Value_74],
    Duration: 3
});
array_push(Challenges[0], 
{
    Name: "Back Attack",
    Desc: "It's every Turnaround character all at once! Can you get all your tasks done in two minutes?",
    Lvl20s: [UnknownEnum.Value_54, UnknownEnum.Value_59, UnknownEnum.Value_63, UnknownEnum.Value_82],
    Lvl15s: [UnknownEnum.Value_85, UnknownEnum.Value_69, UnknownEnum.Value_86, UnknownEnum.Value_64],
    Lvl10s: [UnknownEnum.Value_73, UnknownEnum.Value_80, UnknownEnum.Value_81, UnknownEnum.Value_70],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "Old Friends",
    Desc: "The veterans of Frickbear's 1 are back for thirds!",
    Lvl20s: [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_9, UnknownEnum.Value_14, UnknownEnum.Value_16, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_18, UnknownEnum.Value_22, UnknownEnum.Value_24],
    Duration: 2
});
array_push(Challenges[0], 
{
    Name: "New Friends",
    Desc: "The newcomers of Frickbear's 3 are dying to meet you! ...Or maybe you'll be dying to meet them.",
    Lvl20s: [UnknownEnum.Value_15, UnknownEnum.Value_17, UnknownEnum.Value_21, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_30, UnknownEnum.Value_31, UnknownEnum.Value_38, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45],
    Duration: 3
});
array_push(Challenges[0], 
{
    Name: "Even a Bear!",
    Desc: "They put the bear in Frickbear's!",
    Lvl20s: [UnknownEnum.Value_0, UnknownEnum.Value_4, UnknownEnum.Value_6, UnknownEnum.Value_10, UnknownEnum.Value_17, UnknownEnum.Value_22, UnknownEnum.Value_27, UnknownEnum.Value_30, UnknownEnum.Value_33, UnknownEnum.Value_34, UnknownEnum.Value_38],
    LvlSPs: [UnknownEnum.Value_19],
    Duration: 3
});
array_push(Challenges[0], 
{
    Name: "The Second Coming",
    Desc: "The awkward middle children of Frickbear's 2 are here too!",
    Lvl20s: [UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_10, UnknownEnum.Value_13, UnknownEnum.Value_19, UnknownEnum.Value_20, UnknownEnum.Value_23, UnknownEnum.Value_25, UnknownEnum.Value_32, UnknownEnum.Value_33, UnknownEnum.Value_34, UnknownEnum.Value_35, UnknownEnum.Value_36, UnknownEnum.Value_37, UnknownEnum.Value_39, UnknownEnum.Value_46],
    Duration: 3
});
array_push(Challenges[1], 
{
    Name: "Withered Without You",
    Desc: "You only have a few threats to worry about...but they've all been supercharged! Stay on your toes!",
    Lvl80s: [UnknownEnum.Value_10],
    Lvl30s: [UnknownEnum.Value_11, UnknownEnum.Value_85],
    Lvl25s: [UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_16],
    Duration: 2
});
array_push(Challenges[1], 
{
    Name: "Blind Mode",
    Desc: "Try beating this with your eyes closed!",
    LvlSPs: [UnknownEnum.Value_17, UnknownEnum.Value_14],
    Lvl20s: [UnknownEnum.Value_0, UnknownEnum.Value_3, UnknownEnum.Value_7, UnknownEnum.Value_12, UnknownEnum.Value_32, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_43],
    Lvl15s: [UnknownEnum.Value_1, UnknownEnum.Value_2],
    Lvl10s: [UnknownEnum.Value_31, UnknownEnum.Value_24],
    Duration: 3
});
array_push(Challenges[1], 
{
    Name: "You Bring a Light?",
    Desc: "Creeps are crawling in from every corner... See if you can fend them all off at once!",
    LvlSPs: [UnknownEnum.Value_17],
    Lvl20s: [UnknownEnum.Value_13, UnknownEnum.Value_85, UnknownEnum.Value_68, UnknownEnum.Value_76, UnknownEnum.Value_47, UnknownEnum.Value_18, UnknownEnum.Value_64],
    Lvl10s: [UnknownEnum.Value_5, UnknownEnum.Value_24],
    Duration: 3
});
array_push(Challenges[1], 
{
    Name: "Deafening",
    Desc: "Music Man has muted all the audio! Can you survive without sound cues?",
    LvlSPs: [UnknownEnum.Value_31],
    Lvl20s: [UnknownEnum.Value_0, UnknownEnum.Value_8, UnknownEnum.Value_14, UnknownEnum.Value_15, UnknownEnum.Value_20, UnknownEnum.Value_35, UnknownEnum.Value_38],
    Lvl10s: [UnknownEnum.Value_18],
    Duration: 3
});
array_push(Challenges[1], 
{
    Name: "What's On TV?",
    Desc: "Your cameras are unavailable! You'll have to rely on your office TVs alone to fend off Freddy and friends.",
    Lvl30s: [UnknownEnum.Value_84],
    Lvl25s: [UnknownEnum.Value_27],
    Lvl20s: [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3],
    Lvl10s: [UnknownEnum.Value_83],
    Duration: 2,
    Upgrades: [UnknownEnum.Value_53],
    DisabledTools: ["Cameras"]
});
array_push(Challenges[1], 
{
    Name: "Watchful Eye",
    Desc: "You only have one monitor flip for the entire night! Power while using the camera drains a bit slower to compensate.",
    Lvl10s: [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_20, UnknownEnum.Value_23, UnknownEnum.Value_25],
    Lvl20s: [UnknownEnum.Value_3, UnknownEnum.Value_6, UnknownEnum.Value_16, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_43, UnknownEnum.Value_45],
    LvlSPs: [UnknownEnum.Value_37],
    Duration: 3
});
array_push(Challenges[1], 
{
    Name: "Gaming Hard?",
    Desc: "Your power and temperature aren't an issue - you just need to beat Toy Freddy's high scores! EIGHT of them.",
    LvlSPs: [UnknownEnum.Value_6],
    Duration: 6,
    Cheats: [UnknownEnum.Value_2, UnknownEnum.Value_4]
});
array_push(Challenges[1], 
{
    Name: "Embodiment of Scarlet Rainbow",
    Desc: "Chica's Magic Rainbow is out for blood! See if you can survive her onslaught of bullets.",
    Lvl1s: [UnknownEnum.Value_79],
    LvlSPs: [UnknownEnum.Value_52],
    Duration: 1,
    DisabledTools: ["Cameras", "Fan"]
});
array_push(Challenges[1], 
{
    Name: "Paddleball Panic",
    Desc: "Can you keep a rally going for two minutes straight?",
    Lvl1s: [UnknownEnum.Value_3],
    Lvl20s: [UnknownEnum.Value_30],
    LvlSPs: [UnknownEnum.Value_40, UnknownEnum.Value_17],
    Duration: 2
});
array_push(Challenges[1], 
{
    Name: "Paddleball Panic X",
    Desc: "Doofas and Coffee are crossing over! Can you survive both at the same time?",
    Lvl1s: [UnknownEnum.Value_3],
    Lvl5s: [UnknownEnum.Value_79],
    Lvl10s: [UnknownEnum.Value_52],
    LvlSPs: [UnknownEnum.Value_40, UnknownEnum.Value_17],
    Duration: 2
});
array_push(Challenges[1], 
{
    Name: "The General's Challenge",
    Desc: "1 life, 15 levels in a row. Are you up to it?",
    LvlSPs: [UnknownEnum.Value_41],
    Duration: 2
});
array_push(Challenges[1], 
{
    Name: "Chipper's Revenge",
    Desc: "Buy Chipper's exorbitantly overpriced lumber before time runs out!",
    Lvl20s: [UnknownEnum.Value_25],
    LvlSPs: [UnknownEnum.Value_42],
    Duration: 6
});
array_push(Challenges[1], 
{
    Name: "Blank's Art School",
    Desc: "You've got a BIG stack of papers on your desk - see if you can meet the demands of a particularly strict Blank before 6 A.M.!",
    LvlSPs: [UnknownEnum.Value_80],
    Duration: 6,
    DisabledTools: ["Cameras", "Fan"]
});
array_push(Challenges[1], 
{
    Name: "Token Trouble",
    Desc: "You'll be losing tokens throughout the entire night - earn enough to stay out of the red!",
    Lvl20s: [UnknownEnum.Value_69, UnknownEnum.Value_78],
    Lvl10s: [UnknownEnum.Value_26, UnknownEnum.Value_42, UnknownEnum.Value_25],
    LvlSPs: [UnknownEnum.Value_51],
    Duration: 2,
    Upgrades: [UnknownEnum.Value_22, UnknownEnum.Value_1]
});
array_push(Challenges[1], 
{
    Name: "Camera Whack-a-Mole",
    Desc: "You're equipped with a cam radar...but how much will that help you against these supercharged animatronics?",
    Lvl27s: [UnknownEnum.Value_45, UnknownEnum.Value_35, UnknownEnum.Value_29, UnknownEnum.Value_16],
    Lvl26s: [UnknownEnum.Value_43, UnknownEnum.Value_20],
    Lvl23s: [UnknownEnum.Value_71],
    LvlSPs: [UnknownEnum.Value_37],
    Duration: 2,
    Upgrades: [UnknownEnum.Value_12, UnknownEnum.Value_0]
});
array_push(Challenges[1], 
{
    Name: "Are You Smarter Than a Frog?",
    Desc: "See if you can solve Happy Frogs' increasingly difficult math problems!",
    LvlSPs: [UnknownEnum.Value_59],
    Duration: 6
});
array_push(Challenges[1], 
{
    Name: "Archie Armageddon",
    Desc: "It's just you and Archie! See if you can beat his guessing game three times in a row...and do so before the heat gets you.",
    Lvl20s: [UnknownEnum.Value_81],
    Duration: 6,
    DisabledTools: ["Cameras", "Fan"]
});
array_push(Challenges[1], 
{
    Name: "Archie Armageddon 2",
    Desc: "ANY character is fair game now!",
    LvlSPs: [UnknownEnum.Value_81],
    Duration: 6,
    DisabledTools: ["Cameras", "Fan"]
});
array_push(Challenges[1], 
{
    Name: "Minute 2 Win It",
    Desc: "You have 60 seconds to deal with every animatronic listed here. Good luck! (Rewind Clock disabled)",
    Lvl5s: [UnknownEnum.Value_6],
    LvlSPs: [UnknownEnum.Value_17],
    Lvl20s: [UnknownEnum.Value_26, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42],
    Lvl15s: [UnknownEnum.Value_29],
    Duration: 6
});
array_push(Challenges[1], 
{
    Name: "The LolzHax Shuffle",
    Desc: "LolzHax will summon 3 random characters each hour of the night. Adapt on the fly to survive! (He'll only summon base game characters if playing in Five Nights at Frickbear's 3 mode.)",
    Lvl20s: [UnknownEnum.Value_16],
    LvlSPs: [UnknownEnum.Value_39],
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "Demo Demons",
    Desc: "The maxmode of yesteryear.",
    Lvl20s: array_concat(countup_array(UnknownEnum.Value_18, UnknownEnum.Value_0), [UnknownEnum.Value_20]),
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "Full Game Fiends",
    Desc: "The rest!",
    Lvl20s: array_concat(countup_array(UnknownEnum.Value_46, UnknownEnum.Value_21), [UnknownEnum.Value_19]),
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "Four-Layered Frenzy: Classic",
    Desc: "Face off against the newcomers of the classic era!",
    Lvl20s: [UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_51, UnknownEnum.Value_52, UnknownEnum.Value_53, UnknownEnum.Value_54, UnknownEnum.Value_55, UnknownEnum.Value_56, UnknownEnum.Value_57, UnknownEnum.Value_58, UnknownEnum.Value_59, UnknownEnum.Value_60, UnknownEnum.Value_61, UnknownEnum.Value_62, UnknownEnum.Value_63, UnknownEnum.Value_79, UnknownEnum.Value_80, UnknownEnum.Value_47, UnknownEnum.Value_48, UnknownEnum.Value_83],
    Duration: 3
});
array_push(Challenges[2], 
{
    Name: "Four-Layered Frenzy: Modern",
    Desc: "Face off against the newcomers of the modern era!",
    Lvl20s: [UnknownEnum.Value_64, UnknownEnum.Value_65, UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69, UnknownEnum.Value_70, UnknownEnum.Value_71, UnknownEnum.Value_73, UnknownEnum.Value_74, UnknownEnum.Value_75, UnknownEnum.Value_76, UnknownEnum.Value_77, UnknownEnum.Value_78, UnknownEnum.Value_72, UnknownEnum.Value_81, UnknownEnum.Value_84, UnknownEnum.Value_82, UnknownEnum.Value_86, UnknownEnum.Value_85],
    Duration: 3
});
array_push(Challenges[2], 
{
    Name: "A Bit of Everything",
    Desc: "Face off against EVERY character in Frickbear's 3 at 5 AI!",
    Lvl5s: countup_array(UnknownEnum.Value_46, UnknownEnum.Value_0),
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "A Bit of Everything Else",
    Desc: "Face off against EVERY character in Four Layers Down at 5 AI!",
    Lvl5s: countup_array(86, 47),
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "Fortified 40",
    Desc: "It's the Frickbear 40...but you've got some of the best upgrades to help you through! See if you can make the most of them and survive to 6 AM.",
    Lvl20s: countup_array(UnknownEnum.Value_39, UnknownEnum.Value_0),
    Upgrades: [UnknownEnum.Value_40, UnknownEnum.Value_51, UnknownEnum.Value_53, UnknownEnum.Value_4, UnknownEnum.Value_39, UnknownEnum.Value_12, UnknownEnum.Value_37, UnknownEnum.Value_63],
    Duration: 6
});
array_push(Challenges[2], 
{
    Name: "1_87",
    Desc: "Strength in numbers...but not necessarily numbers.",
    Lvl1s: countup_array(86, UnknownEnum.Value_0),
    Duration: 6
});
array_push(Challenges[3], 
{
    Name: "The Frickbear Forty",
    Desc: "This might be the easiest challenge in this category, but that doesn't mean it's easy.",
    Lvl20s: countup_array(UnknownEnum.Value_39, UnknownEnum.Value_0),
    Duration: 6
});
array_push(Challenges[3], 
{
    Name: "The New Forty",
    Desc: "The rest.",
    Lvl20s: countup_array(86, 47),
    Duration: 6
});
array_push(Challenges[3], 
{
    Name: "Infernal 47",
    Desc: "The base game's true maxmode! You'll get a cool trophy if you beat this one.",
    Lvl20s: countup_array(UnknownEnum.Value_46, UnknownEnum.Value_0),
    Duration: 6
});
array_push(Challenges[3], 
{
    Name: "Fright of 87",
    Desc: "This one's impossible. For your own sake, do not seriously attempt it.",
    Lvl20s: countup_array(86, UnknownEnum.Value_0),
    Duration: 6
});
SelectedChallenge = -1;
var CurrentCategory = 0;
var CurrentChallenge = 0;
var Count = 0;
CountsPerCategory = [0, 0, 0, 0];
ClearedPerCategory = [0, 0, 0, 0];

while (CurrentCategory < array_length(Challenges))
{
    for (var c = 0; c < array_length(Challenges[CurrentCategory]); c++)
    {
        with (Challenges[CurrentCategory][c])
            ID = Count;
        
        if (array_length(global.ClearedChallenges) <= Count)
            array_push(global.ClearedChallenges, false);
        
        CountsPerCategory[CurrentCategory]++;
        
        if (global.ClearedChallenges[Count] > 0)
            ClearedPerCategory[CurrentCategory]++;
        
        Count++;
    }
    
    CurrentCategory++;
    CurrentChallenge = 0;
}

for (var cat = 0; cat < array_length(Challenges); cat++)
{
    for (var i = 0; i < array_length(Challenges[cat]); i++)
    {
        var Data = Challenges[cat][i];
        var Unlock = true;
        var Names = array_concat(countup_array(MaxLvl, 1), ["SP"]);
        
        for (var AILevel = 0; AILevel < array_length(Names); AILevel++)
        {
            var Lvl = string(Names[AILevel]);
            var VarName = "Lvl" + Lvl + "s";
            
            if (variable_struct_exists(Data, VarName))
            {
                var Entries = variable_struct_get(Data, VarName);
                
                for (var j = 0; j < array_length(Entries); j++)
                {
                    if (!global.UnlockedAnimatronics[Entries[j]])
                    {
                        Unlock = false;
                        break;
                    }
                }
            }
            
            if (!Unlock)
                break;
        }
        
        if (Data.Name == "Archie Armageddon" && !global.UnlockedTrophies[UnknownEnum.Value_33])
            Unlock = false;
        
        if (Data.Name == "Archie Armageddon 2" && !global.UnlockedTrophies[UnknownEnum.Value_40])
            Unlock = false;
        
        if (Data.Name == "Gaming Hard?" && !global.UnlockedTrophies[UnknownEnum.Value_21])
            Unlock = false;
        
        with (Challenges[cat][i])
        {
            Unlocked = Unlock;
            
            if (global.ClearedChallenges[Data.ID] > 0)
                Unlocked = true;
        }
    }
}

reset_challenge_alterations();
ChallengeInfoOffset = 0;
ChallengeInfoDragged = 0;
ChallengeButtonOffset = 0;
ChallengeButtonDragged = 0;

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
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_76,
    Value_77,
    Value_78,
    Value_79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_84,
    Value_85,
    Value_86
}
