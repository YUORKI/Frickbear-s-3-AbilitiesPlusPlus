function get_trophy(arg0)
{
    if (global.UnlockedTrophies[arg0])
        exit;
    
    global.UnlockedTrophies[arg0] = true;
    array_push(global.TrophyQueue, 
    {
        _x: 640,
        _y: 360 - (56 * (array_length(global.TrophyQueue) + 1)),
        ID: arg0,
        Name: get_trophy_name(arg0),
        Timer: 0,
        UnlockType: "Trophy"
    });
}

function unlock_guard(arg0, arg1 = false)
{
    if (!global.FourLayersDownMode)
        return false;
    
    var CurValue = global.UnlockedGuards[arg0];
    
    if (CurValue == (arg1 ? 2 : 1) || CurValue == 3)
        exit;
    
    if (CurValue == 0)
    {
        global.UnlockedGuards[arg0] = arg1 ? 2 : 1;
        array_push(global.TrophyQueue, 
        {
            _x: 640,
            _y: 360 - (56 * (array_length(global.TrophyQueue) + 1)),
            ID: arg0,
            Name: global.GuardNames[arg0],
            Timer: 0,
            UnlockType: "Guard"
        });
        exit;
    }
    else
    {
        global.UnlockedGuards[arg0] = 3;
        array_push(global.TrophyQueue, 
        {
            _x: 640,
            _y: 360 - (56 * (array_length(global.TrophyQueue) + 1)),
            ID: arg0,
            Name: "Funny " + global.GuardNames[arg0],
            Timer: 0,
            UnlockType: "GuardCostume"
        });
        exit;
    }
}

function completion_checks()
{
    var _AnimatronicsUnlocked = 0;
    var _StickersUnlocked = 0;
    var _AnimatronicsTotal = 0;
    var _EndingsUnlocked = global.UnlockedTrophies[UnknownEnum.Value_30] + global.UnlockedTrophies[UnknownEnum.Value_29] + global.UnlockedTrophies[UnknownEnum.Value_31] + global.UnlockedTrophies[UnknownEnum.Value_15] + global.UnlockedTrophies[UnknownEnum.Value_36];
    var _EndingsTotal = (_EndingsUnlocked < 4) ? 4 : 5;
    var _PagesUnlocked = 0;
    var _PagesTotal = 0;
    var _MinigamesUnlocked = count_up(global.UnlockedMinigames);
    var _MinigamesTotal = 16;
    var _ChallengesUnlocked = count_up(global.ClearedChallenges, true, 32, 0);
    var _ChallengesTotal = 32;
    var _TrophiesUnlocked = 0;
    var _TrophiesTotal = 0;
    var _GuardsUnlocked = count_up(global.UnlockedGuards);
    var _GuardStickersUnlocked = count_up_stickers(global.EndlessGuardStickers);
    var _GuardsTotal = 21;
    
    for (var i = 0; i < UnknownEnum.Value_63; i++)
    {
        if (array_contains([UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_62, UnknownEnum.Value_61], i))
            continue;
        
        _TrophiesUnlocked += global.UnlockedTrophies[i];
        _TrophiesTotal++;
    }
    
    var Get24Trophy = true;
    var GetMinigameTrophy = true;
    var WFreddyGuys = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38];
    
    for (var i = 0; i < 16; i++)
    {
        if (!global.UnlockedMinigames[i] && i != UnknownEnum.Value_7)
            GetMinigameTrophy = false;
    }
    
    for (var i = 0; i <= UnknownEnum.Value_200; i++)
    {
        if (global.Descriptions[i][0] == "UNKNOWN")
            continue;
        
        var Unlocked = global.UnlockedAnimatronics[i];
        
        if (i <= 90)
        {
            _AnimatronicsTotal++;
            
            if (Unlocked)
                _AnimatronicsUnlocked++;
            
            if (global.EndlessStickers[i] > -1)
                _StickersUnlocked++;
            
            if (!Unlocked && array_contains(WFreddyGuys, i))
                Get24Trophy = false;
        }
        
        _PagesTotal++;
        
        if (Unlocked)
            _PagesUnlocked++;
    }
    
    if (_PagesUnlocked == (_PagesTotal - 1) && !global.UnlockedAnimatronics[UnknownEnum.Value_200])
    {
        global.UnlockedAnimatronics[UnknownEnum.Value_200] = true;
        _PagesUnlocked++;
    }
    
    if (Get24Trophy)
        get_trophy(UnknownEnum.Value_25);
    
    if (GetMinigameTrophy)
    {
        get_trophy(UnknownEnum.Value_21);
        global.UnlockedMinigames[UnknownEnum.Value_7] = true;
    }
    
    if (_AnimatronicsUnlocked == _AnimatronicsTotal)
        get_trophy(UnknownEnum.Value_33);
    
    if (_PagesUnlocked == _PagesTotal)
        get_trophy(UnknownEnum.Value_40);
    
    if (_StickersUnlocked >= _AnimatronicsTotal && _EndingsUnlocked >= _EndingsTotal && _PagesUnlocked >= _PagesTotal && _MinigamesUnlocked >= _MinigamesTotal && _ChallengesUnlocked >= _ChallengesTotal && _TrophiesUnlocked >= _TrophiesTotal && _GuardStickersUnlocked >= _GuardsTotal)
    {
        get_trophy(UnknownEnum.Value_42);
        global.UnlockedAnimatronics[UnknownEnum.Value_201] = true;
    }
    
    return 
    {
        AnimatronicsUnlocked: _AnimatronicsUnlocked,
        StickersUnlocked: _StickersUnlocked,
        AnimatronicsTotal: _AnimatronicsTotal,
        EndingsUnlocked: _EndingsUnlocked,
        EndingsTotal: _EndingsTotal,
        PagesUnlocked: _PagesUnlocked,
        PagesTotal: _PagesTotal,
        MinigamesUnlocked: _MinigamesUnlocked,
        MinigamesTotal: _MinigamesTotal,
        ChallengesUnlocked: _ChallengesUnlocked,
        ChallengesTotal: _ChallengesTotal,
        TrophiesUnlocked: _TrophiesUnlocked,
        TrophiesTotal: _TrophiesTotal,
        GuardsUnlocked: _GuardsUnlocked,
        GuardStickersUnlocked: _GuardStickersUnlocked,
        GuardsTotal: _GuardsTotal
    };
}

function get_trophy_name(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return "Jeremy's For You and Me";
        
        case UnknownEnum.Value_1:
            return "A One to the Left, and a Three to the Right";
        
        case UnknownEnum.Value_2:
            return "Cloud Cruiser";
        
        case UnknownEnum.Value_3:
            return "That Much Pizza Can't Possibly Be Healthy";
        
        case UnknownEnum.Value_4:
            return "Peoplewatching";
        
        case UnknownEnum.Value_5:
            return "Consider Your Hares Paired";
        
        case UnknownEnum.Value_6:
            return "Coming For Your Booty";
        
        case UnknownEnum.Value_7:
            return "The Incredible Virtual Circus";
        
        case UnknownEnum.Value_8:
            return "Twist & Tangle";
        
        case UnknownEnum.Value_9:
            return "I'M SO HUNGRY!!";
        
        case UnknownEnum.Value_10:
            return "Keep Gambling";
        
        case UnknownEnum.Value_11:
            return "It'll Clear Out Several";
        
        case UnknownEnum.Value_17:
            return "Better Safe Than Sorry";
        
        case UnknownEnum.Value_18:
            return "Money Moves";
        
        case UnknownEnum.Value_12:
            return "FIVE FIFTY-NINE!?";
        
        case UnknownEnum.Value_20:
            return "Think Fast, Chucklenuts";
        
        case UnknownEnum.Value_13:
            return "Backdoor Dealings";
        
        case UnknownEnum.Value_14:
            return "We Like Mike";
        
        case UnknownEnum.Value_15:
            return "See You Next Week!";
        
        case UnknownEnum.Value_16:
            return "Pffft, I'm Broke!";
        
        case UnknownEnum.Value_19:
            return "True Happiness Achieved";
        
        case UnknownEnum.Value_21:
            return "Gamer Extraordinaire";
        
        case UnknownEnum.Value_22:
            return "Zillion-Dollar Coffin";
        
        case UnknownEnum.Value_23:
            return "Bear Necessities";
        
        case UnknownEnum.Value_24:
            return "You Know If You Beat It Even Faster You Get to See Freddy in a Bikini";
        
        case UnknownEnum.Value_25:
            return "Something Borrowed";
        
        case UnknownEnum.Value_26:
            return "Long Time No See!";
        
        case UnknownEnum.Value_27:
            return "Lorekeeper";
        
        case UnknownEnum.Value_28:
            return "Vanessa? I Barely Know Ya!";
        
        case UnknownEnum.Value_29:
            return "Ashes to Ashes";
        
        case UnknownEnum.Value_30:
            return "Put Back Together";
        
        case UnknownEnum.Value_31:
            return "Employee of the Month";
        
        case UnknownEnum.Value_32:
            return "Pacifist Run";
        
        case UnknownEnum.Value_39:
            return "Maximalist";
        
        case UnknownEnum.Value_33:
            return "Now It's a Party";
        
        case UnknownEnum.Value_34:
            return "World of Jumpscares";
        
        case UnknownEnum.Value_35:
            return "On the Fritz";
        
        case UnknownEnum.Value_36:
            return "The End";
        
        case UnknownEnum.Value_37:
            return "Gold Star";
        
        case UnknownEnum.Value_38:
            return "Platinum Star";
        
        case UnknownEnum.Value_40:
            return "These Truly Were Five Nights at Frickbear's";
        
        case UnknownEnum.Value_41:
            return "Into Madness";
        
        case UnknownEnum.Value_42:
            return "Too Much to Bear";
        
        case UnknownEnum.Value_43:
            return "Ursus Maximus";
        
        case UnknownEnum.Value_44:
            return "NPU";
        
        case UnknownEnum.Value_45:
            return "Naked and Afraid";
        
        case UnknownEnum.Value_46:
            return "Unkillable";
        
        case UnknownEnum.Value_47:
            return "Ten Outta Ten";
        
        case UnknownEnum.Value_48:
            return "Four Layers Up";
        
        case UnknownEnum.Value_49:
            return "Sweet Dreams are Overrated";
        
        case UnknownEnum.Value_50:
            return "You Showed Speed";
        
        case UnknownEnum.Value_51:
            return "Stick in the Mud";
        
        case UnknownEnum.Value_52:
            return "Stick Around Awhile";
        
        case UnknownEnum.Value_53:
            return "Stick It to the Man";
        
        case UnknownEnum.Value_54:
            return "Sticker Shock";
        
        case UnknownEnum.Value_55:
            return "Booze Boss";
        
        case UnknownEnum.Value_56:
            return "Don't Drink & Drive";
        
        case UnknownEnum.Value_57:
            return "Doofin' Around";
        
        case UnknownEnum.Value_58:
            return "The T Stands For Trash";
        
        case UnknownEnum.Value_59:
            return "Endo Fever";
        
        case UnknownEnum.Value_60:
            return "Forever and Ever";
        
        case UnknownEnum.Value_61:
            return "Sticker Star";
        
        case UnknownEnum.Value_62:
            return "Through Hell and Back";
        
        default:
            return "No Trophy Title Found :(";
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
    Value_200 = 200,
    Value_201
}
