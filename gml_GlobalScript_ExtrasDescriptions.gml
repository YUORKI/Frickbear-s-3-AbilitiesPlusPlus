function string_to_int_before_underscore(arg0)
{
    return int64(string_copy(arg0, 0, 2)) - 1;
}

function get_jumpscares_per_char(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_27:
        case UnknownEnum.Value_70:
            return 2;
        
        case UnknownEnum.Value_19:
            return 6;
        
        case UnknownEnum.Value_73:
            return 9;
        
        case UnknownEnum.Value_120:
            return 5;
        
        default:
            if (is_nonlethal(arg0, false))
            {
                return 0;
                break;
            }
            
            return 1;
    }
}

function play_jumpscare_scream(arg0, arg1)
{
    var JumpSound = (global.Settings[2][4] != 3) ? get_animatronic_scream(arg0, arg1) : choose(sfxJumpscare_Funny_AmongUs, sfxJumpscare_Funny_BigMouth, sfxJumpscare_Funny_Burp, sfxJumpscare_Funny_CarHorn, sfxJumpscare_Funny_Foghorn, sfxJumpscare_Funny_Goofy, sfxJumpscare_Funny_OurTable, sfxJumpscare_Funny_Spongebob, sfxJumpscare_Funny_Tom, sfxJumpscare_Funny_Yodel, sfxJumpscare_Funny_Pingas, sfxJumpscare_Funny_Wega, sfxJumpscare_Funny_Bitch, sfxJumpscare_Funny_Buzzer);
    var Volume = 1;
    
    if (global.Settings[2][4] == 1)
        Volume = 0;
    else if (global.Settings[2][4] == 2)
        Volume = 0.25;
    
    audio_group_set_gain(voc_Springtrap_Pathetic, (Volume * global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
    return audio_play_sound(JumpSound, 99, false);
}

function get_animatronic_scream(arg0, arg1, arg2 = true)
{
    if (global.Skins[arg0] > -1 && arg2)
    {
        var AlternateQuip = array_contains([UnknownEnum.Value_27, UnknownEnum.Value_70], global.Jumpscare) && global.JumpscareType > 0;
        
        if (variable_global_exists("SkinJumpscareScream"))
            skin_sound_delete_array(global.SkinJumpscareScream);
        
        if (get_jumpscares_per_char(arg0) == 1)
            global.SkinJumpscareScream = [skin_sound(get_animatronic_scream(arg0, arg1, false), global.Jumpscare, "jumpscare")];
        else
            global.SkinJumpscareScream = skin_sound_generate_array([get_animatronic_scream(arg0, arg1, false)], global.Jumpscare, "jumpscare");
        
        return global.SkinJumpscareScream[min(array_length(global.SkinJumpscareScream) - 1, arg1)];
    }
    
    switch (arg0)
    {
        case UnknownEnum.Value_126:
            return sfxFredbearGrowl2;
        
        default:
            return sfxJumpscareNormal;
        
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_9:
        case UnknownEnum.Value_14:
        case UnknownEnum.Value_21:
        case UnknownEnum.Value_118:
        case UnknownEnum.Value_74:
        case UnknownEnum.Value_59:
        case UnknownEnum.Value_69:
        case UnknownEnum.Value_66:
            return sfxJumpscareHigh;
        
        case UnknownEnum.Value_10:
        case UnknownEnum.Value_13:
        case UnknownEnum.Value_38:
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_119:
        case UnknownEnum.Value_64:
        case UnknownEnum.Value_68:
        case UnknownEnum.Value_60:
        case UnknownEnum.Value_20:
        case UnknownEnum.Value_63:
        case UnknownEnum.Value_76:
        case UnknownEnum.Value_82:
            return sfxJumpscareLow;
        
        case UnknownEnum.Value_22:
        case UnknownEnum.Value_121:
        case UnknownEnum.Value_24:
        case UnknownEnum.Value_36:
        case UnknownEnum.Value_75:
        case UnknownEnum.Value_87:
            return sfxJumpscareLowest;
        
        case UnknownEnum.Value_41:
        case UnknownEnum.Value_50:
        case UnknownEnum.Value_154:
        case UnknownEnum.Value_5:
        case UnknownEnum.Value_58:
        case UnknownEnum.Value_71:
            return sfxJumpscareRetro;
        
        case UnknownEnum.Value_33:
        case UnknownEnum.Value_122:
        case UnknownEnum.Value_123:
        case UnknownEnum.Value_124:
        case UnknownEnum.Value_125:
        case UnknownEnum.Value_47:
        case UnknownEnum.Value_48:
            return sfxJumpscareDemonic;
        
        case UnknownEnum.Value_120:
        case UnknownEnum.Value_34:
        case UnknownEnum.Value_53:
        case UnknownEnum.Value_54:
        case UnknownEnum.Value_49:
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_84:
            return sfxJumpscareSalvage;
        
        case UnknownEnum.Value_127:
            return sfxJumpscarePhony;
        
        case UnknownEnum.Value_62:
            return sfxJumpscareOrville;
        
        case UnknownEnum.Value_89:
            return sfxJumpscareEXE;
        
        case UnknownEnum.Value_73:
            if (arg1 == 0)
                return sfxJumpscareOrville;
            else
                return sfxJumpscareSalvage;
        
        case UnknownEnum.Value_27:
            if (arg1 == 0)
            {
                return sfxJumpscareNormal;
                break;
            }
            
            return sfxJumpscareHigh;
    }
}

function get_jumpscare_templates(arg0, arg1 = -1, arg2 = [])
{
    if (arg1 == -1)
        arg1 = get_jumpscare(arg0);
    
    var returnArr = [];
    
    for (var i = 0; i < get_jumpscares_per_char(arg0); i++)
    {
        switch (arg0)
        {
            case UnknownEnum.Value_89:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: 666
                });
                break;
            
            case UnknownEnum.Value_8:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: -1,
                    JumpSideVertical: -1
                });
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: -1
                });
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 1,
                    JumpSideVertical: -1
                });
                break;
            
            case UnknownEnum.Value_9:
            case UnknownEnum.Value_49:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: 1
                });
                break;
            
            case UnknownEnum.Value_19:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: (i == 4) ? 1 : -1
                });
                break;
            
            case UnknownEnum.Value_0:
            case UnknownEnum.Value_7:
            case UnknownEnum.Value_10:
            case UnknownEnum.Value_12:
            case UnknownEnum.Value_14:
            case UnknownEnum.Value_21:
            case UnknownEnum.Value_24:
            case UnknownEnum.Value_27:
            case UnknownEnum.Value_33:
            case UnknownEnum.Value_34:
            case UnknownEnum.Value_58:
            case UnknownEnum.Value_60:
            case UnknownEnum.Value_61:
            case UnknownEnum.Value_123:
            case UnknownEnum.Value_47:
            case UnknownEnum.Value_75:
            case UnknownEnum.Value_84:
            case UnknownEnum.Value_66:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: -1,
                    JumpSideVertical: -1
                });
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 1,
                    JumpSideVertical: -1
                });
                break;
            
            case UnknownEnum.Value_1:
            case UnknownEnum.Value_18:
            case UnknownEnum.Value_20:
            case UnknownEnum.Value_82:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: -1,
                    JumpSideVertical: -1
                });
                break;
            
            case UnknownEnum.Value_2:
            case UnknownEnum.Value_28:
            case UnknownEnum.Value_88:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 1,
                    JumpSideVertical: -1
                });
                break;
            
            case UnknownEnum.Value_4:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: 0
                });
                break;
            
            default:
                array_push(returnArr, 
                {
                    JumpID: i,
                    JumpSprite: arg1,
                    JumpSide: 0,
                    JumpSideVertical: -1
                });
                break;
        }
    }
    
    if (array_length(arg2) >= array_length(returnArr))
    {
        for (var i = 0; i < array_length(returnArr); i++)
            returnArr[i].JumpSideVertical = arg2[i];
    }
    
    return returnArr;
}

function get_animatronic_jumpscare_origin(arg0, arg1, arg2 = true)
{
    if (global.SkinsFunctional[arg0] > -1 && arg2)
        return array_get(skin_get_attribute(arg0, "JumpscarePositions", get_animatronic_jumpscare_origin(arg0, arg1, false)), arg1);
    
    return array_get(get_jumpscare_templates(arg0), arg1).JumpSideVertical;
}

function get_voicelines(arg0)
{
    var returnArray = [];
    var voicelineDatabase = voiceline_database(arg0);
    var MiscNames = struct_get_names(voicelineDatabase);
    var AllPhoneCallsUnlocked = array_length(global.ShuffleCallsHeard) >= 25 || global.UnlockedTrophies[UnknownEnum.Value_42] || global.DevMode;
    
    if ((arg0 < UnknownEnum.Value_159 || arg0 > UnknownEnum.Value_179) || global.EndlessGuardStickers[arg0 - UnknownEnum.Value_159] > -1 || global.DevMode)
    {
        if (variable_struct_exists(voicelineDatabase, "Misc_Selection"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_Selection); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_Selection[l],
                    LineType: UnknownEnum.Value_0,
                    LineNum: l
                });
            }
        }
        
        if (variable_struct_exists(voicelineDatabase, "Misc_Die"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_Die); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_Die[l],
                    LineType: UnknownEnum.Value_5,
                    LineNum: l
                });
            }
        }
        
        if (variable_struct_exists(voicelineDatabase, "Misc_GameOver"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_GameOver); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_GameOver[l],
                    LineType: UnknownEnum.Value_6,
                    LineNum: l
                });
            }
        }
        
        if (variable_struct_exists(voicelineDatabase, "Misc_Victory"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_Victory); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_Victory[l],
                    LineType: UnknownEnum.Value_7,
                    LineNum: l
                });
            }
        }
        
        if (variable_struct_exists(voicelineDatabase, "Misc_Enter"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_Enter); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_Enter[l],
                    LineType: UnknownEnum.Value_0,
                    LineNum: l
                });
            }
        }
        
        if (variable_struct_exists(voicelineDatabase, "Misc_Buy"))
        {
            for (var l = 0; l < array_length(voicelineDatabase.Misc_Buy); l++)
            {
                array_push(returnArray, 
                {
                    LineID: voicelineDatabase.Misc_Buy[l],
                    LineType: UnknownEnum.Value_7,
                    LineNum: l
                });
            }
        }
    }
    
    if (variable_struct_exists(voicelineDatabase, "Misc_Call"))
    {
        for (var l = 0; l < array_length(voicelineDatabase.Misc_Call); l++)
        {
            array_push(returnArray, 
            {
                LineID: voicelineDatabase.Misc_Call[l],
                LineType: UnknownEnum.Value_8,
                LineNum: l
            });
        }
    }
    
    if (variable_struct_exists(voicelineDatabase, "Selection"))
    {
        array_push(returnArray, 
        {
            LineID: voicelineDatabase.Selection,
            LineType: UnknownEnum.Value_0,
            LineNum: -1
        });
    }
    
    for (var i = 0; i < array_length(MiscNames); i++)
    {
        if (string_pos("DeathQuips", MiscNames[i]) != 0)
            continue;
        
        if (array_contains(["Selection", "DeathQuips", "Deathcoin", "ShuffleCalls", "Misc_Selection", "Misc_Die", "Misc_GameOver", "Misc_Victory", "Misc_Call", "Misc_Enter", "Misc_Buy"], MiscNames[i]))
            continue;
        
        var ThisMiscType = variable_struct_get(voicelineDatabase, MiscNames[i]);
        
        if (!is_array(ThisMiscType))
            ThisMiscType = [ThisMiscType];
        
        for (var l = 0; l < array_length(ThisMiscType); l++)
        {
            array_push(returnArray, 
            {
                LineID: ThisMiscType[l],
                LineType: UnknownEnum.Value_1,
                LineNum: l
            });
        }
    }
    
    if (variable_struct_exists(voicelineDatabase, "DeathQuips"))
    {
        for (var l = 0; l < array_length(voicelineDatabase.DeathQuips); l++)
        {
            array_push(returnArray, 
            {
                LineID: voicelineDatabase.DeathQuips[l],
                LineType: UnknownEnum.Value_2,
                LineNum: l
            });
        }
    }
    
    for (var i = 0; i < 9; i++)
    {
        var SubEntryName = string("DeathQuips_{0}", i);
        
        if (variable_struct_exists(voicelineDatabase, SubEntryName))
        {
            var dataset = variable_struct_get(voicelineDatabase, SubEntryName);
            
            for (var l = 0; l < array_length(dataset); l++)
            {
                array_push(returnArray, 
                {
                    LineID: dataset[l],
                    LineType: UnknownEnum.Value_3 + i,
                    LineNum: l
                });
            }
        }
    }
    
    if (variable_struct_exists(voicelineDatabase, "Deathcoin"))
    {
        array_push(returnArray, 
        {
            LineID: voicelineDatabase.Deathcoin,
            LineType: UnknownEnum.Value_5,
            LineNum: -1
        });
    }
    
    if (variable_struct_exists(voicelineDatabase, "ShuffleCalls"))
    {
        for (var l = 0; l < array_length(voicelineDatabase.ShuffleCalls); l++)
        {
            if (!AllPhoneCallsUnlocked && !array_contains(global.ShuffleCallsHeard, get_call_id(voicelineDatabase.ShuffleCalls[l])))
                continue;
            
            array_push(returnArray, 
            {
                LineID: voicelineDatabase.ShuffleCalls[l],
                LineType: UnknownEnum.Value_8,
                LineNum: l
            });
        }
    }
    
    return returnArray;
}

function generate_extras_descriptions(arg0, arg1)
{
    ExtrasDatabase = [];
    
    for (Character = 0; Character < arg1; Character++)
    {
        var DebutData = get_animatronic_debut(Character);
        ExtrasDatabase[Character] = 
        {
            Name: global.Descriptions[Character][0],
            Debut: arg0 ? "" : (DebutData.Name + " (" + string((DebutData.Year > 2026) ? "TBA" : DebutData.Year) + ")"),
            Desc: ["No data on this animatronic is available.", "What are you looking at me for? I don't know anything about this one either!"],
            Jumpscares: (arg0 || get_jumpscare(Character) == sNOTHING) ? [] : get_jumpscare_templates(Character, get_jumpscare(Character)),
            VoiceLines: arg0 ? [] : get_voicelines(Character),
            Image: sNOTHING
        };
    }
    
    if (arg0)
    {
        TileCount = 0;
        var sprite = -1;
        var folders = get_folders("skins");
        
        for (var i = 0; i < array_length(folders); i++)
        {
            var filename = working_directory + "skins/" + folders[i] + "/" + "data.txt";
            var file = file_find_first(filename, 0);
            show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(i));
            var parsedjson = "";
            var uniqueVoiceLines = false;
            
            if (file != "")
            {
                var _buffer = buffer_load(filename);
                var _string = buffer_read(_buffer, buffer_string);
                buffer_delete(_buffer);
                parsedjson = json_parse(_string);
                ExtrasDatabase[TileCount].Name = variable_struct_get(parsedjson, "Name");
                ExtrasDatabase[TileCount].Debut = variable_struct_get(parsedjson, "Debut");
                ExtrasDatabase[TileCount].Desc[0] = variable_struct_get(parsedjson, "Description");
                ExtrasDatabase[TileCount].Desc[1] = variable_struct_get(parsedjson, "DevNotes");
                ExtrasDatabase[TileCount].VA = variable_struct_get(parsedjson, "VACredit");
                uniqueVoiceLines = variable_struct_get(parsedjson, "ReplaceVoice");
            }
            
            var _JumpID = string_to_int_before_underscore(folders[i]);
            var JumpscareSprites = ["jumpscare_body.png", "jumpscare_head.png"];
            var JumpscareSpriteNumber = get_jumpscares_per_char(_JumpID);
            
            if (JumpscareSpriteNumber > 1)
            {
                show_debug_message("MORE THAN 1 JUMPSCARE!!");
                JumpscareSprites = [];
                
                for (var j = 1; j <= JumpscareSpriteNumber; j++)
                {
                    array_push(JumpscareSprites, string("jumpscare{0}_body.png", j));
                    array_push(JumpscareSprites, string("jumpscare{0}_head.png", j));
                    array_push(JumpscareSprites, string("jumpscare{0}_head.png", j));
                }
            }
            
            show_debug_message(JumpscareSprites);
            var _JumpSprite = skin_sprite_from_directory(sJumpscare_Freddy, working_directory + "skins/" + folders[i] + "/sprites", JumpscareSprites, 1);
            show_debug_message(string("{0} integer: {1}", folders[i], _JumpID));
            ExtrasDatabase[TileCount].Jumpscares = get_jumpscare_templates(_JumpID, _JumpSprite, (parsedjson != "") ? variable_struct_get(parsedjson, "JumpscarePositions") : []);
            
            if (uniqueVoiceLines)
            {
                var directory = working_directory + "skins/" + folders[i] + "/sounds";
                var sound = -1;
                filename = directory + "/" + "voc_*.ogg";
                file = file_find_first(filename, 0);
                var CurNumbers = array_create(15, 0);
                var CurNum = -1;
                
                while (file != "")
                {
                    var filepath = directory + "/" + file;
                    var _LineType = UnknownEnum.Value_1;
                    CurNum = CurNumbers[_LineType];
                    
                    if (string_pos("voc_selection", file) != 0)
                    {
                        _LineType = UnknownEnum.Value_0;
                        CurNum = -1;
                    }
                    
                    if (string_pos("voc_deathquip", file) != 0)
                    {
                        _LineType = UnknownEnum.Value_2;
                        CurNum = CurNumbers[_LineType];
                    }
                    
                    if (string_pos("voc_removed", file) != 0)
                    {
                        _LineType = UnknownEnum.Value_5;
                        CurNum = -1;
                    }
                    
                    array_push(ExtrasDatabase[TileCount].VoiceLines, 
                    {
                        LineID: create_stream_from_filename(filepath),
                        LineType: _LineType,
                        LineNum: CurNum
                    });
                    CurNumbers[_LineType]++;
                    file = file_find_next();
                }
                
                array_sort(ExtrasDatabase[TileCount].VoiceLines, function(arg0, arg1)
                {
                    return ((arg0.LineType - arg1.LineType) * 1000) + (arg0.LineNum - arg1.LineNum);
                });
            }
            
            filename = working_directory + "skins/" + folders[i] + "/sprites/" + "portrait.png";
            
            if (file_find_first(filename, 0) != "")
                ExtrasDatabase[TileCount].Image = sprite_add(filename, 1, false, false, 0, 0);
            else
                sprite = sprite_duplicate(sNOTHING);
            
            TileCount++;
        }
        
        folders = get_folders("addons");
        
        for (var i = 0; i < array_length(folders); i++)
        {
            var filename = working_directory + "addons/" + folders[i] + "/extras_info.txt";
            var file = file_find_first(filename, 0);
            
            if (file != "")
            {
                var _buffer = buffer_load(filename);
                var _string = buffer_read(_buffer, buffer_string);
                buffer_delete(_buffer);
                var parsedjson = json_parse(_string);
                ExtrasDatabase[TileCount].Name = variable_struct_get(parsedjson, "FULL_NAME");
                ExtrasDatabase[TileCount].Debut = "";
                ExtrasDatabase[TileCount].Desc[0] = variable_struct_get(parsedjson, "DESCRIPTION");
                ExtrasDatabase[TileCount].Desc[1] = variable_struct_get(parsedjson, "DEV_NOTES");
                ExtrasDatabase[TileCount].VA = variable_struct_get(parsedjson, "VACredit");
                
                if (ExtrasDatabase[TileCount].VA == undefined)
                    ExtrasDatabase[TileCount].VA = "";
            }
            
            var directory = working_directory + "addons/" + folders[i] + "/voicelines";
            var sound = -1;
            filename = directory + "/" + "voc_*.ogg";
            file = file_find_first(filename, 0);
            var CurNumbers = array_create(15, 0);
            var CurNum = -1;
            
            while (file != "")
            {
                var filepath = directory + "/" + file;
                var _LineType = UnknownEnum.Value_1;
                CurNum = CurNumbers[_LineType];
                
                if (string_pos("voc_selection", file) != 0)
                    _LineType = UnknownEnum.Value_0;
                
                if (string_pos("voc_die", file) != 0)
                    _LineType = UnknownEnum.Value_5;
                
                if (string_pos("voc_gameover", file) != 0)
                    _LineType = UnknownEnum.Value_6;
                
                if (string_pos("voc_victory", file) != 0)
                    _LineType = UnknownEnum.Value_7;
                
                if (string_pos("voc_salvageopening", file) != 0)
                {
                    _LineType = UnknownEnum.Value_9;
                    CurNum = -1;
                }
                
                CurNum = CurNumbers[_LineType]++;
                array_push(ExtrasDatabase[TileCount].VoiceLines, 
                {
                    LineID: create_stream_from_filename(filepath),
                    LineType: _LineType,
                    LineNum: CurNum
                });
                file = file_find_next();
            }
            
            array_sort(ExtrasDatabase[TileCount].VoiceLines, function(arg0, arg1)
            {
                return ((arg0.LineType - arg1.LineType) * 1000) + (arg0.LineNum - arg1.LineNum);
            });
            filename = working_directory + "addons/" + folders[i] + "/" + "portrait.png";
            
            if (file_find_first(filename, 0) != "")
                ExtrasDatabase[TileCount].Image = sprite_add(filename, 1, false, false, 0, 0);
            else
                sprite = sprite_duplicate(sNOTHING);
            
            TileCount++;
        }
        
        exit;
    }
    
    var Character = UnknownEnum.Value_0;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The frontman of the Fazbear band! If there's anything this old bear knows, it's how to put on a show. Despite his grizzly exterior and intimidating demeanor, Freddy's a real sweetheart around the kids! ...Though around the nightguards, he's anything but.", "Freddy's portrait was, as is probably to be expected, the first one I finished out of the whole cast. I wanted to give each of the main four a distinct body shape, so Freddy wound up being designed to be very square."];
        Image = FB_Freddy;
    }
    
    Character = UnknownEnum.Value_1;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Freddy's right-hand rabbit, and the guitarist in the Fazbear Band! ...Also the only one in the band who plays an instrument, which brings into question if they can really be called a band in the first place. Regardless, this bunny can really shred! Prone to stagefright, but can put on a great show all the same.", "I find it kinda funny that practically every fan design of Bonnie makes him the skinny lanky one, and this game definitely continues that trend. Though something else I find funny is how common it seems to be in Bonnie fan redesigns to give him overalls - I've always wondered if there's one specific fan design out there that could be pointed to as the progenitor of the concept or if everyone just somehow all individually came to the same idea. I could honestly see both being equally likely."];
        Image = FB_Bonnie;
    }
    
    Character = UnknownEnum.Value_2;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The female vocalist of the Fazbear Band! As could probably be gleamed just from one look at her - be it her cupcake, her 'Let's Eat!!!' slogan proudly printed upon her bib, or just her general roundness compared to her bandmates - Chica likes to eat. She can often be found rummaging trash cans around the establishment looking for discarded pizza after hours, much to the chagrin of the janitorial staff. They've complained about this to the engineering team, though according to them, this was never a function they programmed her to be capable of.", "Considering Chica's only two known traits are being a girl and eating a lot of pizza, pretty much any redesign of her that significantly alters her body shape has to choose one of two paths - either making her curvy and feminine, or making her round. I, for one, am a firm believer in Wide Chica. Overall I wanted to make her a bit more birdlike, as well as more circular to complement the very square Freddy and very triangular Foxy."];
        Image = FB_Chica;
    }
    
    Character = UnknownEnum.Value_3;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["This pesky pirate is the eternal rival to the Fazbear Band, having his own sideshow in Pirate's Cove! His animatronic systems are surprisingly much more robust than the rest of the gang, although they're equally prone to fail because of it. Despite the popularity of the Pirate's Cove show, Foxy is rarely in good enough condition for it to be operational. The 'Out of Order' sign set outside his stage has sadly become more of a permanent fixture in the restaurant than Foxy himself.", "It's kind of messed up how overlooked Foxy seems to be these days compared to the early days of the FNaF fandom, although I guess it's only natural with how many other wacky characters have been introduced into this franchise since then. I always found the fact that he's separated from the other three really cool; even if he's typically considered one of the 'main four' it definitely helps him stand out within that group. I wanted to play into that with his characterization here, giving him a sort of one-sided rivalry with the main band."];
        Image = FB_Foxy;
    }
    
    Character = UnknownEnum.Value_4;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A desolate shell of what was once the face of the Fazbear brand. Despite his outward appearance, calling him devoid of life wouldn't be entirely correct - this empty husk has exhibited some very strange, almost supernatural capabilities. Those few who know of his existence also know well that he should be avoided. At least his vest is as fashionable as ever!", "Since all the animatronics in this game are 2D illustrations as opposed to 3D renders, and as a result each of their frames needs to be drawn from scratch, there's really no benefit to having one character just be a recolor of another like there often is with 3D models. As such, I figured I should take the opportunity to try and make former recolors more visually distinct from the characters they're originally derived from. Golden Freddy is one of many examples of this! You'll notice that despite Withered Freddy, Golden Freddy and Shadow Freddy all sharing the same base model in FNaF2, their designs are quite distinct here."];
        Image = FB_GoldenFreddy;
    }
    
    Character = UnknownEnum.Value_5;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["If you've ever wondered what Freddy would look like naked, wonder no longer! (Seriously, stop wondering, that's weird.) The Endoskeleton houses all the mechanical components that bring Freddy and his friends to life, being designed as a blank slate that can be programmed to be any character. It's against the rules at Freddy Frickbear's Pizza for an endoskeleton to be spotted by customers without its costume on, so this one doesn't enjoy being seen.", "Despite its design being moreso based on Endo-02, this endoskeleton is meant to represent endos as a whole! Golden Freddy was designed to do something similar, being sort of a fusion between his FNaF1 and FNaF2 selves. This way both could be represented in spirit without clogging up the roster with two very similar-looking and acting characters!"];
        Image = FB_Endoskeleton;
    }
    
    Character = UnknownEnum.Value_6;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Toy Freddy was the face of Fazbear Entertainment's major rebrand in the late 80's, coming after a long string of controversies regarding guest safety. As part of this initiative, Freddy and his friends were redesigned in the hopes that they'd be less scary to children. Just look how adorably sanitized he is!", "Toy Freddy, um...well...y'know, he's kinda...um...fat. I mean c'mon, y'know, he's...c'mon. What can I say? He's gained a few pounds. I mean, look at him compared to the other animatronics on the show stage. He's...y'know, rounder? More big-boned? Y'know? Ate a little bit too much pizza? Y'know what I mean? Just because it's called Freddy Fazbear's Pizza doesn't mean you gotta eat all of it, y'know what I mean?"];
        Jumpscares = [
        {
            JumpID: Character,
            JumpSprite: get_jumpscare(Character),
            JumpSide: 0,
            JumpSideVertical: -1
        }];
        Image = FB_ToyFreddy;
    }
    
    Character = UnknownEnum.Value_7;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Did you know all four Toy animatronics are equipped with facial recognition and access to criminal databases? It's true! Fazbear Entertainment was quite the trailblazer in the development of this technology, pouring a fortune into R&D to get it working as a way to demonstrate their commitment to safety. You'd better hope you've never been caught shoplifting or running a red light, because Toy Bonnie knows, and Toy Bonnie will deal with you accordingly.", "Since Toy Bonnie is meant to be a safer update to the original Bonnie, I thought it'd be funny to give him the copyright-free, safer update to his guitar."];
        Image = FB_ToyBonnie;
    }
    
    Character = UnknownEnum.Value_8;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["This newer, sleeker redesign of Chica is a real party girl! An embodiment of fun through fitness, Toy Chica was designed to encourage kids to get up and move, with a slimmer design to match. This was largely in response to parents' complaints that the previous Chica's overbearing love of pizza encouraged childhood obesity.", "This would probably be a good place to mention that leading up to this game's release, practically every time I revealed a new set of designs there were people commenting that one or more of them were hot. It wasn't even limited to the female characters, either. It's not even on purpose."];
        Image = FB_ToyChica;
    }
    
    Character = UnknownEnum.Value_9;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Originally intended as a softer, cutesier version of Foxy that could keep toddlers entertained, the company soon found they underestimated the sheer strength of preschoolers. The animatronic was torn apart within days of being introduced, and, not wanting to go any more over-budget than they already had with the restaurant, the company chose to just kind of leave it like that. It was dubbed 'The Mangle', and promoted as a take-apart-and-put-back-together attraction. While some parents questioned the safety of such a thing, Fazbear Entertainment argued such an attraction was important to encouraging kids' creativity, and may lead them to a future in the STEM field.", "Fun fact, this is my favorite animatronic! Despite usually drawing Mangle's body closer to his original model before now, I decided to finally acquiesce with this design and give her the noodle body a lot of FNaF fanartists do. Frankly, I wish I started doing this a lot sooner. Not only is it way easier to draw, it's also way more funny."];
        Image = FB_Mangle;
    }
    
    Character = UnknownEnum.Value_10;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An older Freddy model salvaged from an abandoned location. While being the model most Freddy's locations used in the company's heyday, his intimidating stature was found to be a bit too scary for a lot of kids. Not wanting the face of their brand to continue making children cry, the company chose to remedy Freddy's design in future models, making him look rounder and friendlier.", "While a lot of returning characters in this game have basically the exact same mechanics as they did in Frickbear's 2, Withered Freddy is one of the few exceptions. Funnily enough, I mainly changed his mechanic because I thought the old one was too difficult to manage, especially for a character introduced in night 2 - though it seems like I just ended up swapping one obnoxious mechanic for another."];
        Image = FB_WitheredFreddy;
    }
    
    Character = UnknownEnum.Value_11;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An older Bonnie model who met the unfortunate fate of being R&D's robotic guinea pig. His endoskeleton head was removed so it could be used to test the animatronics' facial recognition systems, though it was sadly never reattached, even after testing concluded.", "I think the bit with making Withered Bonnie bilingual came from the slight Spanish inflection his voice actor has in UCN. There wasn't really much to work with in regards to Withered Bonnie's personality otherwise, so we decided to run with it."];
        Image = FB_WitheredBonnie;
    }
    
    Character = UnknownEnum.Value_12;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An older Chica model left to rot at an abandoned location. A design flaw in her facial motors has resulted in tears around her eyes and mouth. Her endoskeleton was also not at all designed to support the weight of her abnormally large jaw, leading to it snapping off near the end of her service life. She's been left that way ever since.", "Some people make games out of passion. Some do it for admiration. Others just do it for fun. I personally made this game purely in the hopes that it would convince people to draw Withered Chica more often."];
        Image = FB_WitheredChica;
    }
    
    Character = UnknownEnum.Value_13;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An older Foxy model who was largely spared by the retrofitting efforts made to the other animatronics of his line. ...This is most likely thanks to him being out of service frequently enough for the company to deem such efforts pointless. His visual sensors were never replaced, meaning he isn't tricked by the mask like many other animatronics are. This would be a good thing for him, if not for the fact that he's still plagued by the old sensors' extreme sensitivity to light.", "Withered Foxy was the first character developed who really had any sort of special animations in the office. Fun fact - all the animations in this game are done entirely in-engine, through the sheer power of math! The 3D models in this game are actually the same way. There's probably less obtuse ways to handle both of those things, but unfortunately I don't really know how to animate or 3D model otherwise."];
        Image = FB_WitheredFoxy;
    }
    
    Character = UnknownEnum.Value_14;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Everyone's favorite! BB was an experimental animatronic created by the company with the unique purpose of selling balloons. While they hoped this would lead to a long line of similar vendor bots in the future, BB was unfortunately met with widely negative reception from customers - likely thanks to his tendency to steal their belongings after not receiving payment for his balloons. While BB can still be found at some locations, he's largely been phased out over time.", "BB is a hilarious specimen. His role actually changed quite a bit over the course of development - At one point he was going to be in every salvage location and act as a hint giver like he was in Frickbear's 2, before that responsibility was moved to the various employee memos instead. After that I think the idea of him being a shopkeeper was considered too, although that duty ultimately went to Upgrade Cadet instead. Now he's just kind of a weird anomaly, being the only one of the six default characters who activates on night 2 instead of night 1 as well as the only one who has a sprite in the salvage locations."];
        Image = FB_BB;
    }
    
    Character = UnknownEnum.Value_15;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["After BB was met with overwhelmingly negative reception from guests, JJ, a planned companion character who was set to appear in future Fazbear's locations, would ultimately wind up scrapped. Some prototypes of her are still out there, though many were never fully fabricated, often missing limbs or even her entire body. If you're lucky, you might find one under your desk!", "JJ's honestly mostly here out of obligation - every other animatronic from FNaF2 was on the roster so I figured she should've been included too, especially with how easy implementing her was going to be. She's probably the closest thing the roster has to a filler pick!"];
        Image = FB_JJ;
    }
    
    Character = UnknownEnum.Value_16;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A unique character among Freddy's ensemble, the Marionette was introduced across the majority of locations in the early 80's as a part of Fazbear Entertainment's new safety initiative! (When asked what exactly spurred this initiative on, the company refused to comment.) While it's said to enjoy entertaining and giving gifts to children, the Marionette is rarely seen performing - or even moving, for that matter. It's said that the music box keeps it lost in thought.", "I like it when Marionette is grouped alongside the main FNaF1 cast despite not being introduced until FNaF2 - I've always seen them alongside BB and the original four as the sorta 'main six' of the FNaF series. (I guess Golden Freddy should be included as part of that too, although BB and the Marionette usually stick out in my mind before just because they're completely unique characters as opposed to a variant of another one.) This is reflected in the fact that those six characters are the only ones who are activated by default in any playthrough, and also the fact that each of them has a corresponding minigame."];
        Image = FB_Marionette;
    }
    
    Character = UnknownEnum.Value_17;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["For years, employees have reported sightings of a strange shadow moving across the walls of the pizzeria in its late hours of operation. Even stranger, the employees who claim to have seen it also claim to be compelled to follow it, wandering into back rooms of the building that haven't been touched for years, walking into walls as if they don't see them there, seemingly in a state of psychosis. Company management has dismissed these stories as employees' latest excuse to hide out in the back rooms and slack off.", "You may be wondering why Shadow Freddy's eyes and teeth are missing! Aside from just making him more visually distinct from Withered Freddy AND making him quite a bit creepier, I mainly did this so him and RWQFSFASXC would naturally complement each other - One has no eyes or teeth, while the other is ONLY eyes and teeth."];
        Image = FB_ShadowFreddy;
    }
    
    Character = UnknownEnum.Value_18;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["What, were you expecting an explanation for this thing? I don't know what's up with it either!", "You may have noticed that the name 'Shadow Bonnie' is used nowhere in this game except for this very description (and that one part of BB's quiz). I like calling RWQFSFASXC by its full name because it's funny."];
        Image = FB_RWQFSFASXC;
    }
    
    Character = UnknownEnum.Value_19;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["It is said that where tragedy strikes, the Phantoms follow. Not many know what makes them manifest or from what they originate, though they always seem to appear only before those who have some deeply troubled past...or a troubled past in the making. Perhaps that's why many employees have begun seeing them lately?", "The Phantoms kinda break the trend of me trying to make former recolors look more distinct from their original counterparts, and in this case it's a combination of there just not being a whole lot to work with when it comes to the Phantoms and also me being too lazy to come up with unique designs for all six of them. "];
        Image = FB_Phantoms;
    }
    
    Character = UnknownEnum.Value_20;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["[EMPLOYEE NOTICE: This description has been redacted. Please report any and all broken and/or malfunctioning equipment to managerial staff for proper disposal. Do not touch, move, communicate with, or look away from the model as you wait for assistance. We thank you for your cooperation.]", "Springtrap is another character whose mechanic completely changed between Frickbear's 2 and 3, though he's an especially funny case since he went from being (arguably) the single easiest character to deal with in 2 to (arguably) the single hardest in 3. Maybe he's a bit unbalanced, but I figure him demanding as much attention as he does is fitting for the main antagonist of the series. After all, would it really be Springtrap if he wasn't a jerk?"];
        Image = FB_Springtrap;
    }
    
    Character = UnknownEnum.Value_21;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An adorable little plushie with hatred in every stitch! Plushtrap is rumored to have been made for a child whose father did not like him very much, hence the sharp teeth and proclivity towards non-consensual games of tag (said games often ending in Plushtrap gnashing on the legs of his playmates.) Despite these tendencies, his one-of-a-kind nature has made him a much sought-after collector's item for fans of Freddy's memorabilia. His existence implies the existence of a matching Fredbear plush somewhere out there, though if one existed, any documented evidence of it has been obscured from the public eye.", "The decision to make Plushtrap British actually wasn't my idea, it was his voice actor's! In fact, there's a lot of cases of that across this game - while I did write a pretty big chunk of the characters' various quips and death quotes, a lot of them were also come up with by the VA's, some even being completely improvised. There's a couple voice lines included in this game that were originally outtakes but I kept in the final game because I thought they were really funny."];
        Image = FB_Plushtrap;
    }
    
    Character = UnknownEnum.Value_22;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Said to be the twisted personification of events transpiring in the final days of Fredbear's Family Diner, Nightmare Fredbear is a monstrous apparition of the big man himself. ...At least, that's what some people think he is. Not many people are really sure what he is or how he came to be, if any even know of his existence to begin with. Some argue he's a twisted refurbishment of the original Fredbear animatronic made with the specific intent of freaking out kids who misbehave, although inconsistencies in his build seem to go against this theory. Others say he's just a ghost, but everyone knows those aren't real. His infamous reputation persists among employees, many joking that the best way to interrupt a meeting is to simply bring him up - everyone will be arguing about him for hours.", "Fun fact, Nightmare Fredbear was the first character to be fully voiced! (Toy Freddy doesn't really count since it was just his line for losing a minigame.) Nightmare Fredbear was ALSO one of the earliest animatronics programmed in just thanks to how simple his mechanic is, despite not being one of the characters in the demo. In fact, if you manage to enable him in the old demo using cheats, I'm pretty sure he works exactly the same as he does in the final game."];
        Image = FB_NightmareFredbear;
    }
    
    Character = UnknownEnum.Value_23;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Following the negative reception of the BB animatronic line, plans for future variations were thrown out and cancelled. One of the founders, however, thought it'd be really, really funny to make an even more upsetting variation of the existing BB design. Being a few beers deep in inspiration from his favorite (and self-owned) bar, he drove home and, after a few hours of hard work, determination, and keeping his kids up with all the noise, came out with Nightmare BB. Fortunately, he spent too much time testing its capacity to scare his own children to sneak him into any of the restaurants.", "I've always struggled coming up with mechanics for Nightmare BB specifically for some reason - in all three Frickbear's games (even Frickbear's 1 which he ultimately didn't even appear in the final version of), he never wound up having his originally planned mechanic in the final game. In 1, he was going to be an inverse Foxy who killed you if you used the flashlight on him, though he was ultimately scrapped and this mechanic was given to Endo instead (who keeps that mechanic to this day!). In 2 I think he was going to make a minigame pop up like Old Man Consequences in UCN, although this was scrapped because it would've been too complicated to program. In 3, the original idea was that you would need to beat his high score at one of the minigames, but this mechanic was ultimately transferred to Toy Freddy instead. His current mechanic is actually a slight retooling of Nightmarionne's old mechanic from 2."];
        Image = FB_NightmareBB;
    }
    
    Character = UnknownEnum.Value_24;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Campfire stories among residents of Hurricane tell of a cryptid personifying death itself, stalking the homes of those soon to pass and appearing before them as they take their final breath. Strangely, this creature takes the form of a twisted Marionette, much like the one seen at many Freddy's locations, and seems to only appear before those with a close personal connection to the restaurant chain. The tales of this creature have led to many wondering what other restaurants have their own personifications of death.", "In retrospect, I probably shouldn't have put so much effort into the animations of a character whose entire mechanic is to not to look at them."];
        Image = FB_Nightmarionne;
    }
    
    Character = UnknownEnum.Value_25;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["While the secrecy of Mendo's location has been maintained primarily as a security measure, this has led to the ironic consequence of his system not receiving a single security update since his conception. As such, a particularly nefarious hacker, said to be part of infamous group \"The Apple,\" has exploited this weakness to access company systems, only known by their online handle: \"Lolbit.\" Strangely, their attacks seem to not be born out of any monetary incentive; despite their attacks primarily consisting of increasing prices on Mendo's items, all tokens spent still wind up going to the company anyway. Security reports done on the hacker's activity seem to suggest they are motivated purely by the desire to mess with employees as much as possible...as well as use live feeds of their shifts as background noise while they draw.", "I've mentioned in the dev notes of other animatronics how I made an effort to differentiate characters who were originally just recolors of each other, and Lolbit is definitely the most extreme example of that. While in Frickbear's 2 they had a design much closer to their original Sister Location counterpart, I couldn't really get away with just making them a Funtime Foxy recolor when Funtime Foxy is now also in the game. As a result, this evil little creature was born."];
        Image = FB_Lolbit;
    }
    
    Character = UnknownEnum.Value_26;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The self-described magnum opus of Mr. Afton, Circus Baby's design exhibits ambition to a level no animatronic has ever quite been able to match since - which only makes it all the more tragic that she was only operational in a restaurant for a single day. She's been locked away ever since, her creator vetoing any idea the board has come up with to make back their investment on her. It seems she holds a certain amount of sentimental value to her creator, which for him is quite rare. Holding much less sentimental value are the freight container's worth of Bidybabs produced alongside her, known for inexplicably shattering when left alone around Baby for any extended period of time. When asked what happened to them, Baby often claimed she \"just needed to take the edge off.\"", "The Bidybabs' designs are a pretty significant departure from their original designs, and this was for good reason! Because the Bidybabs needed to be drawn more times than pretty much any other character in the game, I wanted to simplify them down as much as possible to make doing so a lot less work. Knowing how and when to be lazy is a very important skill for a game developer to have!"];
        Image = FB_Baby;
    }
    
    Character = UnknownEnum.Value_27;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["This particularly loud and obnoxious variant of Freddy is a sensation with kids, but widely hated by their parents. The amount of bells and whistles included within his mech is rivalled only by Baby herself, with his Bonnie hand puppet, lovingly dubbed \"Bon-Bon,\" being able to think and operate entirely on its own. Some of his features seem to hold no functional purpose, however - including his oversized chest cavity which, when asked, the company has refused to clarify the purpose of. It can be assumed they were just embarrassed about how much money they spent on these superfluous features.", "Some of the omissions made in the UCN roster always bugged me, especially Funtime Freddy considering his importance to the series and the fact that all of his bandmates got to appear. Something I aimed for with the Frickbear's roster was a sort of all-or-nothing approach, where if I wasn't going to include the entirety of a certain set of animatronics, I wouldn't include any of them. (There are some exceptions to this within the roster, though.) Otherwise I figured the roster would feel sorta incomplete."];
        Image = FB_FuntimeFreddy;
    }
    
    Character = UnknownEnum.Value_28;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A self-described \"sensation of the stage,\" Funtime Foxy brings a certain amount of boisterous flair to every performance, having the showmanship of a ringmaster despite always being relegated to the sideshow. While the selling point of his act was originally his impressions, in which he would take the voice of a volunteer and say whatever the audience requested with it, she became indefinitely unavailable for rentals once certain customers realized the lack of restrictions on what she could say and taught her to repeat certain...unscrupulous phrases.", "UCN is actually my favorite FNaF game (as I'm sure you could've gleaned based on how this game is designed), although even I have to admit that some of the mechanics are just plain stupid. Funtime Foxy is probably one of the most infamous characters in that game mechanically! The nice thing about fangames is that you can pick and choose which ideas to steal to avoid making the same mistakes as the official games. Hopefully Funtime Foxy's mechanic is a lot more tolerable here!"];
        Image = FB_FuntimeFoxy;
    }
    
    Character = UnknownEnum.Value_29;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Ballora values thoughtfulness and composure, hosting a much calmer performance than the rest of her troupe. In contrast, she has quite the temper in regards to her behavior around customers. Many have complained about her horrible sense of direction, being unable to correctly guide someone even to a room in her direct line of sight. Clients have been asked not to argue with her about it, as it only ever leads to her insisting they just didn't follow her directions correctly. Rowdy teens enjoy testing the limits of her advanced stabilizers by stacking objects on top of her until she falls over.", "I swear I didn't make them that big on purpose."];
        Image = FB_Ballora;
    }
    
    Character = UnknownEnum.Value_30;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["While once coming pre-installed in every Frickbear Entertainment computer, Helpy has largely been phased out over time. Originally pitched as a virtual assistant to improve workplace efficiency, he became largely disliked by the employees who were forced to install him, discovering that he was just a poorly-disguised adware program who made their computers nearly unusable thanks to his ceaseless popups. Many also found his voice really annoying.", "It's probably pretty clear just from looking at it, but Helpy's portrait here was the only one I didn't draw myself! I pretty much knew from the start that I wanted Helpy to be a parody of those old virtual assistants, crusty pre-rendered sprites and all, although I unfortunately do NOT know how to 3D model. Luckily, that's what friends are for! Orca's modelling style just so happened to perfectly fit the idea I had in mind for Helpy so it wound up working out well."];
        Image = FB_Helpy;
    }
    
    Character = UnknownEnum.Value_32;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Mr. Hippo is a long-running character in Fazbear Entertainment's pantheon of mascots, existing even before Freddy Fazbear himself! In spite of this, however, he has unfortunately fallen into obscurity in recent years. A rights dispute between Fazbear Entertainment and Murray Costume Manor, the original designers of the character, ultimately led to the company deciding he wasn't an important enough character to be worth the legal hassle to keep and dropped him from their lineup. Mr. Hippo animatronics are still being produced in the modern day, though only through cheap companies who managed to scrounge up the character's rights following Murray Costume Manor's bankruptcy.", "An unfortunate aspect of trying to represent the entire FNaF series within a limited character roster is that some characters you like will inevitably need to be left out - in the case of the release version of this game, that includes the rest of the Mediocre Melodies. Pizzeria Simulator introduced so many characters that I had to be especially picky with which ones to include compared to other games, and Mr. Hippo got in before his four bandmates because he's by far the most popular and iconic of his group. Luckily, the update gave me an opportunity to correct this!"];
        Image = FB_MrHippo;
    }
    
    Character = UnknownEnum.Value_31;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Seeing their declining profits going into the 2000's, Fazbear Entertainment knew they needed a change of direction. After promptly firing their longtime animatronic designers and hiring an up-and-coming experimental artist to direct the designs going forward, out came Music Man! The new bandmate for the new millennium, his big launch had lunch boxes, action figures, even a cartoon with cutting edge CGI! ...But everyone was so busy running and screaming that not a single sale was made. They apologized for the trauma caused, sold him off to make some of their money back, and learned to just stick to the classics. He can still be spotted at some franchise locations to this day.", "I like Music Man. I like how he just doesn't fit with any other group of animatronics made before or after him. I like how he isn't any specific animal and is just some weird human-spider hybrid. I like that he's disproportionately creepy-looking compared to all the other purchasable animatronics in Pizzeria Simulator. I like that for some reason Steel Wool keeps making new variants of him and him specifically despite being such an unimportant character in the overall series otherwise."];
        Image = FB_MusicMan;
    }
    
    Character = UnknownEnum.Value_33;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A Freddy variant made off-the-record by company co-founder Henry Emily. Though technically still company property, Frickbear Entertainment values it at a low price in the hopes of discouraging rampant creativity from employees - After all, they don't pay employees to innovate. The few technicians trusted with handling this animatronic seem to be very wary of it. They say it's always thinking.", "Lefty's salvage value was originally five dollars, before rebalances to the upgrade economy required us to increase it. I REALLY wanted to commit to the bit, even if that price was incredibly low for how hard he actually is to deal with ingame... though tragically, the game's balancing came first."];
        Image = FB_Lefty;
    }
    
    Character = UnknownEnum.Value_34;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A combo deal of the original Funtime Freddy, Funtime Foxy and Ballora models tangled up as a singular entity. Nobody's entirely sure why the three of them decided to do this - in fact, nobody sent out to retrieve them has returned to tell the tale. However, the absence of Baby from the amalgamation seems to imply some in-group drama having occurred between the four of them, leading to her expulsion. Many company employees feel sympathy for the creature, wishing they could do the same with their own bosses.", "The explanation I came up with for how Molten Freddy can exist alongside regular Funtime Freddy is just that there were multiple Funtime Freddies produced. (This is also why the Withereds and Classics or the Marionette and Lefty can coexist, etc etc.) Unfortunately, there wasn't any sensible way to explain two Springtraps running around, so Scraptrap wound up being the only one of the four vent-crawlers from Pizzeria Simulator to not be included in the base game."];
        Image = FB_MoltenFreddy;
    }
    
    Character = UnknownEnum.Value_35;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The original Circus Baby model, worn down from years of misadventures and haphazardly cobbled back together with scrap metal stolen from Hurricane's various junkyards. (Not the lobster claw, though - that was a donation from Larry's Lobster Claws LLC.) While she'll tell you she was kicked out of her band because the others \"were trying to change her lifestyle\" and that she \"really just needed a break from them,\" it seems it was more because she's the quintessential bad roommate. No care for boundaries, bad hygiene, no job, and worst of all, asks you to buy her ice cream then doesn't pay you back.", "Despite the complete shift in art styles between Frickbear's 2 and 3, the way I draw Scrap Baby remained remarkably consistent between the two games, at least relative to the other animatronics. This game's art style was actually going to be a LOT more similar to 1 and 2 at first, although in the end I feel like the current direction was the right one to take."];
        Image = FB_ScrapBaby;
    }
    
    Character = UnknownEnum.Value_36;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The owner of Afton Robotics tried many things to keep shareholders on board even during its roughest moments, and one of these many pitched ideas was the Illusion Disc, an incredible piece of technology that could be attached to any item and make you see them as an animatronic that wasn't really there. The shareholders were impressed at how lifelike these illusions were, and it had the potential to save a fortune on animatronic parts...though they had one request. \"Could you make the illusions a little less scary?\" Insulted, the owner shelved the idea, and it never saw use within the restaurants. Luckily, they found new purpose when their creator began using them to terrorize his children when he was bored.", "I honestly think my biggest regret when it comes to the base game's new roster additions was not including a surprise pick. Since the roster is limited but also has to cover the entire series up to the point of the game's creation, I had to prioritize including the more popular, important or unique characters - although there's also some that are just chosen to be funny. Twisted Wolf and especially LolzHax were sort of meant to be that for Frickbear's 2, and I guess here too now that they've returned. I said in the release version that I ever updated this game and add more characters, I'd at least one character nobody would be asking for - and I'd like to think I accomplished that!"];
        Image = FB_TwistedWolf;
    }
    
    Character = UnknownEnum.Value_37;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Since an update to its IT systems are far out of Fazbear Entertainment's budget, most of its systems rely on decades-old software, and, as such, are riddled with decades-old bugs. Because of this, rumors have spread among employees about a computer virus somehow dating all the way back to the early 70's still infecting their systems to this very day. While the company has denied these rumors, they have yet to present an explanation for the real-world manifestations of digital characters this virus is often attributed with.", "Look, I am fully aware that Glitchtrap is his 'official' name. It's what he's called in the character encyclopedia and all the merchandise and everything. But with all due respect, I am NOT calling him that. The name SUCKS! He's not even a glitch, he's a virus! Scott Cawthon himself went on record saying he doesn't even like the name! If there's any influence I hope this game has (beyond encouraging people to draw Withered Chica more often, of course) it's that I want to popularize Malhare as the default name for this guy."];
        Image = FB_Malhare;
    }
    
    Character = UnknownEnum.Value_38;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Dreadbear was put together as part of an ambitious Halloween promotion at Freddy's restaurants. Unfortunately, testing with focus groups determined that an animatronic with an actual human brain would not be very popular with families, so he wound up never being used. Legends say he wanders the forests of Hurricane to this day, searching for the man who created him in the hopes that he'll build him a robot bride.", "The plans for Dreadbear's mechanic changed a lot over the course of development - Originally he was going to have one close to his original appearance in the Danger! Keep Out levels of Curse of Dreadbear where he'd start at the back of the building and slowly move towards your office, although this mechanic was ultimately reworked and given to Springtrap instead. Afterwards was the candy idea, though in this iteration there was only going to be one candy bowl and he was going to appear at the right doorway instead of the center window. Fortunately, we quickly realized he would've been much too big to fit in the doorway, which led us to the final iteration of his mechanic. A lot of animatronics' mechanics underwent a similar pipeline over the course of the game's development!"];
        Image = FB_Dreadbear;
    }
    
    Character = UnknownEnum.Value_39;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Quite possibly the most advanced robot Afton Robotics has produced to date, LOLZHAX is a troublemaking television-headed tyrant who can bend the very fabric of time and space to summon in anything or anyone he wants. Unfortunately, his creator could not find any way this ability could be used to murder children, so LOLZHAX was stashed away, never to be used again. This has imbued him with a hatred of the Fazbear gang, seeking to exact his revenge and brainwash all of animatronic kind into becoming his willing peons as soon as he's released. Fear his despicable reign!", "LolzHax is in kind of a funny position compared to almost the entire rest of the roster, since unlike most characters who were originally 3D models and thus needed to be cartoonified to fit into this game's art style, LolzHax has ALWAYS been 2D and cartoony from his conception. As a result, his design here really isn't much different from his original one."];
        Image = FB_LolzHax;
    }
    
    Character = UnknownEnum.Value_41;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Overworked, underpaid, and underappreciated, one game developer working under Fazbear Entertainment decided he had enough and went rogue, concocting a plan to get back at the company. Reworked from a game he had created on company time into a ransomware virus, Animdude was spread across company computers, encrypting employees' files until they beat the developer's game to get them back. With nobody left at the company being skilled at the game enough to do so, they begrudgingly hired the developer back to address the issue. He was fired again soon after.", "For a while I was kind of torn on whether I wanted to characterize Animdude as 'the actual guy from There Is No Pause Button' or 'literally just Scott Cawthon.' While his mechanic is definitely more meant to be the former, his voice lines and dialogue are derived from the latter, mostly just because there would be next to nothing to work with otherwise."];
        Image = FB_Animdude;
    }
    
    Character = UnknownEnum.Value_40;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Despite having been originally created as nothing more than an autonomous service robot meant to serve breakfast to those aboard the Lun Infinitus space station, Coffee soon found himself as the last hope for humanity's survival as it reached the brink of extinction. ...That was until he got warped here. One would think he'd be happy that humanity is still alive and well, but he seems a bit upset that he's been relegated to running game simulations and serving coffee again.", "Coffee actually wasn't going to be included at first; For a while only five bonus characters were planned, and I wanted to avoid adding any more than that because I felt like doing so might be a slippery slope straight into scope creep. However: Coffee's funny, so I made an exception for him."];
        Image = FB_Coffee;
    }
    
    Character = UnknownEnum.Value_42;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Stories told of Mr. Chipper's exploits are not told lightly. A ruthless kingpin who rules his forestry empire with an iron fist, few who have gotten in the way of his business having lived to tell the tale. ...At least, that's what the termites would tell you. The rest of the forest's denizens seem to like him quite a bit. Just look at those eyes! So full of life! Do you really think anything sinister could be hiding behind them?", "If certain bits of dialogue in Chipper & Sons Lumber Co. are to be believed, every character on this roster is, in fact, a robot. The only other thing I have to mention about Chipper is that he's one of very few characters on this roster who I own merchandise of! The other two are Lefty and Funtime Foxy, who I own the plushies of. A friend got me the former for my birthday and I found the latter at a thrift store for fifty cents. ...This has absolutely nothing to do with the character, I just thought you'd like to know."];
        Image = FB_Chipper;
    }
    
    Character = UnknownEnum.Value_43;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Poor Sparky never got past the prototyping phase, being left quite literally half-finished ever since his inception. While all his bandmates have gone on to have long and successful careers across the Freddy's locations, Sparky has been left behind as nothing more than a footnote in the company's history, the few models of him left often only ever being used for spare parts and otherwise left rotting away in company storerooms. Consider yourself lucky for finding this one - he may be missing an arm and an eye, but a Sparky animatronic in this good of condition is quite the rare find!", "For the bonus characters this time around, I chose to focus on fan characters who later became officially recognized in some way along with characters from old ScottGames properties who reappeared as cameos in some of the FNaF games. I thought this would be a good way to preserve the vibe of the guest characters in Frickbear's 2 (who were all just OCs or characters who had nothing to do with FNaF) while still having them be recognizable and make sense as inclusions in a FNaF fangame."];
        Image = FB_Sparky;
    }
    
    Character = UnknownEnum.Value_44;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The mascot of Candy's Burgers & Fries, a rival restaurant chain to Freddy's that always seems to situate its stores directly across the street from them. As its primary competitor, Candy's seeks to rival Freddy's on every criteria possible, including the amount of tragedies at their restaurants.", "Out of all the fanverse characters, I mainly included the ones I did because they were distinct characters as opposed to variants of pre-existing ones - Ignited Freddy was considered, but ultimately not included because of that. (I've already drawn Withered Freddy and characters that are derivative of him enough!) I feel like Candy would've been a shoe-in for the roster regardless though, considering he's probably the most famous FNaF fan character."];
        Jumpscares = [
        {
            JumpID: Character,
            JumpSprite: get_jumpscare(Character),
            JumpSide: 0,
            JumpSideVertical: -1
        }];
        Image = FB_Candy;
    }
    
    Character = UnknownEnum.Value_45;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An original creation of Fritz (no, not that one, a different one), Popgoes is the mascot of the Popgoes Pizzeria, filling a niche as the UK's premier option in animatronic entertainment. His establishment touts itself as the most cutting-edge in the industry, being way ahead of the curve in both mobile phone and 3D printing technology. In fact, Popgoes himself makes good use of his restaurant's 3D printers, often using them to recreate a figure Fritz seems to have a traumatic past with. When asked why, Popgoes said he does this because he thinks Fritz' reaction to it is funny.", "Kane Carter saw and signed off on Popgoes' dialogue in the salvage locations, by the way. He approved the line 'If I don't get back to the Dead Forest, this is gonna be my Popgoes Finale!'"];
        Image = FB_Popgoes;
    }
    
    Character = UnknownEnum.Value_118;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Funtime Chica is an oddity among the lineup of animatronics produced by the company, having tens of thousands in R&D poured into her only to never end up being used. According to journals penned by her creator shortly after her creation, the reason for her ultimate fate was that \"her child-kidnapping functionality left much to be desired.\"", "Funtime Chica is a holdover from Frickbear's 2, one which was added literally a day before that game's release as part of the King's Prize mechanic. That mechanic was also brought over here! RNG mechanics can be kinda unfair if it's something you're forced into, but I personally think they're really funny as something you opt into, where you stand an equal chance of getting a stupidly powerful powerup as you do dying instantly."];
        Image = FB_FuntimeChica;
    }
    
    Character = UnknownEnum.Value_46;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The best character. He'll tell you himself! With the restaurant he was originally created as the mascot for having long since shut down, Rodney was forced to start a new life...one which he would later find working for the mafia. He's quick to brag about how successful his career in crime has been - in fact, he's quick to brag in general - and loves nothing more than blabbering about the sheer amount of money he's made from it. With that in mind, one does have to wonder what he's doing here begging for handouts...", "Rodney's a real character, lemme tell ya. He was the very last traditional animatronic added to the base roster, and also the only OC of mine to be included in this game up until the update! I always found including OCs in FNaF fangames kinda cheesy and forced, buuuut Rodney WAS in Frickbear's 2, and more than one person seemed interested in him returning, so I figured what the heck. I feel like I can get away with it in this specific instance since he's pretty much treated as a joke character here. Despite what you may think, Rodney isn't and was never intended to be a FNaF OC! In fact, he was created for a completely different game project of mine...One which I may be working on at this very moment ;)"];
        Image = FB_Rodney;
    }
    
    Character = UnknownEnum.Value_49;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Bitter about how quickly Toy Foxy fell into disrepair at the hands of toddlers, Fazbear Entertainment began plotting ways to prevent such an incident from occurring again with future Foxy models. After years of R&D, they came out with their solution - a monstrous new animatronic with enough teeth to scare off almost any would-be vandals, a self-defense measure in the form of its many sawblades, and a strong enough frame to thwart the plans of any child who somehow managed to get past everything else. However, Fazbear Entertainment failed to account for one crucial factor - the toddlers had grown up. En masse, teens stormed the restaurant and dogpiled the animatronic, gnashing and ripping and tearing and slashing every inch of its body, leaving it in an even worse condition than the Mangle that had come before.", "There were a lot of cases where I had an idea for a mechanic, but had to pick between two equally qualified animatronics to give it to. Nightmare Mangle was one of these, being a contender for the mechanic that eventually went to Grimm Foxy. While the majority of the time the losers of these decisions just weren't included in the final game, I liked Nightmare Mangle enough to just come up with a different mechanic so they could be included regardless. (RainingKetchup was actually the one who came up with the idea of the separate track in the vent system, so shoutout to him for that!)"];
        Image = FB_NightmareMangle;
    }
    
    Character = UnknownEnum.Value_47;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Fear engulfs the farmer's land,\nThe devil calls his hearty band.\nVines enthrall the frightened guard,\nAs costumes turn to fabric charred.\nGourds aplenty hoard and huddle,\nThe sentry's pants are drenched in puddle.\nAnd if you share this employee's fate,\nTake heed and rise, don't be late!\nOr stand and face the hare from hell,\nAnd rot inside a pumpkin's shell.", "While we were planning to cap the roster at 80 animatronics for quite some time, Jack-O-Bonnie was added in as one of 7 bonus animatronics we decided to throw in to bring it up to 87. I was kind of struggling to figure out what I wanted to do with the Jack-O's designs for the longest time, and was considering leaving them out because of it...but ultimately came around once the idea of going all-in on making them look like pumpkins came around. Making Jack-O-Bonnie's head more gourd-shaped was Ratto's idea!"];
        Image = FB_JackOBonnie;
    }
    
    Character = UnknownEnum.Value_48;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["There was once a kind and fair maiden, who ever so loved Halloween. Through January, she'd dress in thick coats of black and orange. Through July, she'd hang up her decorations to watch the fireworks that danced amongst the stars. Through September, she'd check the calendar thrice an hour just to see how much longer until October. And when that month came? Oh, there was no stopping her! Pumpkin flavored everything! So much sugar, the dentist knew her mother's maiden name! And it was all in earnest, she was truly in her prime during the autumn season! So when Fall Fest came around? She was ecstatic! She'd donned herself in the most extravagant costume she could craft, and raced to be there when the gates opened! And in that moment of bliss, as the LED lights on her costume brightened her dress, she had never been happier. Some believe it was that same dress that sealed her fate...but everyone forgets how hard it is to run in heels.", "I would like to thank TheGrandestGoon for aiding us in our continued quest to ensure Frickbear's has the stupidest FNaF fangame voice cast of all time."];
        Image = FB_JackOChica;
    }
    
    Character = UnknownEnum.Value_51;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Fazbear Entertainment may be cursed, but the BB line of animatronics has a much, much worse curse entirely of its own. Every variant of the bastard child might have been doomed since their conception, but Deedee is the worst of the bunch. Stealing batteries is child's play for this hardened, propeller-hat-clad criminal - the heists she has managed to pull off with her trusty fishing rod put even Browboy's best to shame. Fort Knox has a protocol in place specifically for her.", "Deedee was meant to be a shopkeeper at first, but I figured she fit better as an animatronic threat. She shows up in the shop menu specifically so all three FNAF World shopkeepers (Mendo, Lolbit, Deedee) could be together in the same place!"];
        Image = FB_Deedee;
    }
    
    Character = UnknownEnum.Value_50;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Shortly after defecting from Freddy's crew, the nefarious LolzHax knew if he wanted to rule the galaxy...he'd need an evil henchman. Sifting through old blueprints stolen from Afton's archives and cobbling together what pieces he could - including an old TV, a slightly-chewed-on security camera, and a whole lot of wires - he built Security, the ultimate combat robot. ...Unfortunately for him, Security's servitude didn't last long, as it immediately turned on its creator and escaped. Now, Security roams the wastes, blasting animatronics and all who protect them as a lingering byproduct of its original purpose - and LolzHax sulks in his workshop, wishing to one day find a lackey that won't pull a security-camera-shaped arm-cannon on him.", "While Security's mechanic was conceptualized pretty early on, it actually took a lot of time and discussion for us to settle on who to give it to. At first it was just going to be Redbear, Tangle and White Rabbit combined into a single character slot referred to as \"Funhouse Foes\", but some other characters that were up for consideration included Purplegeist, the owl version of Security that appears in the final version of FNAF World, and Alphus from the Desolate Hope (since this mechanic was very heavily inspired by his battle minigame in that game). We mainly settled on Security from Halloween Edition just because he looked the coolest out of all our options."];
        Image = FB_Security;
    }
    
    Character = UnknownEnum.Value_52;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Now, everyone knows ghosts aren't real, but sprites? Absolutely. Not video game sprites, mind you - FOREST sprites. Chica's Magic Rainbow is one that Freddy Fazbear's is bemused to call its own, its many controversies drawing her in like a moth to a flame. Perhaps this is her way of getting back at the chain for building over the forest she once called home... or, more likely, she just gets pleasure from making children cry. Whatever the reason may be, nothing makes her feel warm and fuzzy more than some good old-fashioned schadenfreude.", "Beyond being one of the first characters I had in mind for this update (with me wanting to include her even before the base game was released), Chica's Magic Rainbow also has the unique distinction of having by far the most annoying-to-type name in the game! Seriously, it's like, SO long. That might seem like a minor complaint but that stuff really adds up when you have to name so many assets and type so much code for her. ...She's also the only character in the game who gets to swear."];
        Image = FB_ChicasMagicRainbow;
    }
    
    Character = UnknownEnum.Value_53;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Before the band's breakup, Circus Baby and her trio of troublesome friends took the form of the hulking, tangled beast known as Ennard. While originally taking on this form in order to fit into the skin of one Fazbear employee as a means to escape their underground prison, it seems their plan was rather short-sighted. Not only did their skin-suit rot away within a matter of days...they also quickly discovered they had a complete lack of chemistry. \"Who thought this was a good idea!?\", they'd argue. \"Why did we make HER the leader!?\" \"Why didn't we just put our personality chips into Funtime Foxy when they're already roughly the same shape and size as a human?\" Their squabbles would only meet their end once Circus Baby was ejected, and Funtime Freddy took over as the new leader of the amalgamation.\n\n...Well, okay, they still squabble a lot, actually.", "Once the base roster was finalized, I felt like Ennard was the single most glaring character omission. Once this update began development, I knew he was one of the first characters I wanted to include! " + (!global.UnlockedAnimatronics[UnknownEnum.Value_120] ? "(I have more to say, but you'll need to fight a certain boss before I can say it.)" : "While it took a bit to figure out his mechanic, I ultimately decided to give him two of Salvage's moves for one simple reason - Scrap Baby and Molten Freddy made up 100% of Ennard before they split. Scrap Baby and Molten Freddy make up 50% of Salvage. Therefore, if you do the math, Ennard is 50% of Salvage, and, therefore, should have 50% of his moves.")];
        Image = FB_Ennard;
    }
    
    Character = UnknownEnum.Value_57;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Michael's time managing a pizzeria was a rather lonely one - given his appearance, the Fazbear higher-ups only offered the franchise location under the condition that he not show his face around the customers. However, this only spurred him to make his OWN set of friends. Piecing together whatever he could find in the dumpster behind his pizzeria, he soon returned with his very own cast of colorful characters, one which he dubbed the Trash Gang. The more pure-hearted circumstances of their creation compared to Fazbear's animatronics have blessed these four with much kinder personalities. If not for their support, Michael likely wouldn't have had the will to continue his mission even to this day.", "These four were all supposed to be separate animatronics at some point before they were recombined; Mr. Hugs being on his own is a remnant of this! While I thought it would've been really funny, especially in a game like this that loves giving the stupider FNaF characters a chance in the spotlight...I did kinda feel like the effort it would've taken to give all four of them totally unique mechanics would've been better spent on a different set of characters. (Admittedly, part of it is also just that I do not feel passionately enough about Pan Stan or Bucket Bob to try and figure out something cool and unique they could do. I AM genuinely a really big fan of No. 1 Crate though, hence why she's front and center in the Trash Gang's portrait and icon.)"];
        Image = FB_TrashGang;
    }
    
    Character = UnknownEnum.Value_54;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The tale of Yenndo is a tragic one indeed. Once beloved as the fan-favorite Fazbear mainstay Funnertime Freddy, his time in the spotlight soon came to an end when he took a brave stand against the leadership of Circus Baby. As punishment for standing against her skinsuit scheme, this valiant soul had his metal plating stripped from him piece by piece, as his bare endoskeleton was left to be forgotten in a dark corner of the rental facility. Sometimes, employees still see his visage appear before them - a reminder of his sacrifice and all that he gave up for just the smallest hope that they'll escape Circus Baby's grasp... that they'll never need to suffer the same fate that he did.", "A fun thing about the less popular characters on this roster is that I felt a lot more free to take creative liberties with their designs, since I figure it's not like they have many fans to get mad about those changes. Yenndo's probably the best example of this! I'm also very happy that with his inclusion in the roster, there are no longer any characters left with a gazillion wires in their design that I would need to spend a full day drawing. (No, I am NOT adding the Blob.)"];
        Image = FB_Yenndo;
    }
    
    Character = UnknownEnum.Value_55;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Bonnet was originally created to pair with Bon-Bon as another of Funtime Freddy's hand puppets, but she never had quite the same level of chemistry with the bear that her blue bunny counterpart did. While this ultimately doomed her to obscurity, she doesn't entirely mind - after all, she'd hate to play third wheel.", "Bonnet was scrapped and unscrapped a few times throughout development, and a lot of her development history is entangled with Trash & the Gang's, funnily enough. When she was first considered she was going to have something similar to her original SL Custom Night mechanic where you needed to click on her as she passed by the window, although this mechanic was retooled for Mr. Hugs instead once we began planning on adding every member of the Trash Gang as a separate animatronic. ...Eventually we went back on this idea, and the mechanic that was going to go to No. 1 Crate was transferred back to Bonnet instead. It was only after all of this that I wound up adding the rest of the Trash Gang as a single character with a new mechanic."];
        Image = FB_Bonnet;
    }
    
    Character = UnknownEnum.Value_56;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Electrobab was once just another Bidybab like all the rest... that is until he gnawed into a live cable and was supercharged with electric powers! With his newfound persona, Electrobab protects his Bab brethren from danger, showing that even a little guy can make a big difference in the world. He still chews on wires every so often, though. He hopes it'll give him even more superpowers.", "For as much as I like my weirdo picks, even I couldn't figure out what we could've possibly done with Electrobab - until Cactus drew that concept art of him with cool pointy glasses, at least. At that point everything clicked and I knew he needed to be included."];
        Image = FB_Electrobab;
    }
    
    Character = UnknownEnum.Value_58;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["While originally being built alongside his fellow Trash Gang members, Mr. Hugs was always a bit different from the rest. What Michael hadn't known when first piecing him together was that the vacuum cleaner he had found in the dumpster was actually a prototype Clean-o-Vac, an elusive piece of property from Murray Co., that had been lost years ago. Mr. Hugs' history and having witnessed all the tragedy at Murray Co. that he had has imbued a rage within him; One which he is not afraid to inflict on whatever night guard is foolish enough to cross him.", "This character sucks."];
        Image = FB_MrHugs;
    }
    
    Character = UnknownEnum.Value_63;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Afton is many things - a killer, a ruthless businessman, a menace to all who have ever had the misfortune of knowing him - but above all, he's a total hack. Behind his confident persona is a man who wouldn't have anything if not for the shoulders of others he used as footstool. Scraptrap stands as Afton at his lowest - a leech with no one left to draw blood from. Left to his own devices, the rickety suit holding him together beginning to wither away, his attempts to rebuild himself were...less than successful. There's a reason he gets others to do it for him now.", "Just between you and me, I honestly think Scraptrap's design in this game turned out way cooler-looking than Springtrap's...which is funny considering most people see it the opposite way when it comes to their original designs. Much like a lot of stupider aspects of the FNaF series adapted into this game, the fact that Scraptrap was so goofy and cartoony-looking in the actual games, while being to his detriment in the eyes of a lot of fans, just means he fits right at home here!"];
        Image = FB_Scraptrap;
    }
    
    Character = UnknownEnum.Value_59;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["After MCM began being sold off in pieces, an edutainment company came along and scrounged up the rights to a character most seemed to overlook - a funny-looking frog with a yellow bobble on its head. This character would soon become Happy Frog, the face of a long line of C-list PC games and the namesake for the Happy Hoppad educational tablet! While cheap, and primarily designed as a learning tool for kids, this specialized device was how Happy Frog got in contact with her old band after they got separated - as such, she's been their makeshift leader ever since! ...What? Jealous her cheap educational tablet is somehow more advanced than the one you have to do your job with?", "All the Mediocre Melodies were shoe-ins for the roster once we began working on the update; I tend to gravitate towards the more unique and distinct FNaFsters when it comes to picking who to add, seeing as the Mediocre Melodies (save for Nedd Bear) were all unique animal species who don't really share a face shape or even fur color with anyone else on the roster. While it's not AS big of a deal anymore now that it's become more common, getting a new set of animatronics who weren't just variants of the main four felt like a huge deal back when these guys made their debut! Happy Frog especially so - I'm pretty sure she's the only amphibian animatronic we've gotten in the series. Her original design's kinda funny-lookin' though, so I took some inspiration from Secret of the Mimic and tried making her look more like an actual frog."];
        Image = FB_HappyFrog;
    }
    
    Character = UnknownEnum.Value_60;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Pigpatch is a bit eccentric, even among the Mediocre Melodies. Nobody's quite sure of his past, nor how he fell in with his band. He largely keeps to himself - whenever one of his bandmates manage to get through to him, he says he's trying to \"keep a low profile\", lest \"the man gets'im.\" His forever-furrowed brow and the firm, violent grip he always seems to have on his banjo tend to scare most people off...but luckily for him, his friends can look past all that and love him for the hoot-hollerin' country hog he is! ...His insistence about the existence of a \"Norwegian world order\" does concern them just a little, though.", "The heater was actually a pretty late addition to the original game - so late that every animatronic had already been programmed when it was added, so none of them really got to have mechanics involving it in any significant way. This update gave us an opportunity to fix that!"];
        Image = FB_Pigpatch;
    }
    
    Character = UnknownEnum.Value_61;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["With the success of Freddy Fazbear's Pizza in its early years, imitations were soon to follow - one of many being Nedd Bear's Neddtime Pizza. While the animatronic band of this restaurant was quite shoddily put together, the chain actually found an incredible amount of success. For what reason, you may ask? Well, the answer is simple - the pizza was REALLY good. Like, shockingly good. Michelin 5-star good. Tragically, Nedd Bear was eventually phased out due to worries of him cheapening the restaurant's overall image, but the animatronics produced of him were later re-acquired by Stan's Budget Tech.", "While Nedd Bear's mechanic was deliberately designed to be very easy to deal with (assuming you don't have any other animatronics who require the audio lure), he actually wound up killing me a lot during my own testing of the game. Even though it wasn't intentional, I find it really awesome that, functionally, Nedd Bear's deadliest trait is how forgettable he is."];
        Image = FB_NeddBear;
    }
    
    Character = UnknownEnum.Value_62;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Truth is, Orville's always been quite the pompous pachyderm, always seeing himself as above his mediocre comrades. While originating as one of MCM's many mascot costumes, he got his big break after being bought out by a prestigious manufacturer after its bankruptcy. Starring as the headliner of his very own pizza parlor, Orville was an incredible feat of engineering for one reason and one reason only - he was able to perform magic. Not just common party tricks, but actual, real, unexplainable magic. He could teleport, he could make objects levitate, even make entire pizza kits vanish before children's very eyes! ...Though in spite of all of this, his pizzeria was never very popular, and so he was auctioned off. Perhaps being named \"Mediocre Pizza\" had something to do with it...?", "Despite one appearing in his portrait here, Orville doesn't actually ever use any face cards during gameplay. This was partially because I figured face cards would be a little too easy to remember and thus mess with the balancing of his mechanic, but also because I was lazy and didn't feel like drawing 12 unique card designs for this one character. Sometimes you need to know how to pick your battles!"];
        Image = FB_Orville;
    }
    
    Character = UnknownEnum.Value_64;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The first true sighting of Grimm Foxy was never recorded, though rumors were always bubbling in the pot of Hurricane's devout cryptid followers. The concept itself was so absurd, one could find only faithful whimsy in its gnarly descriptors! With fervor, tales of a fox emerging from a cornfield baked in flames spread from mouth to mouth. Alas, with an origin unquestioned, the tales of Grimm Foxy were no less mythical than the fables he was named after. Until the fire started. Oh, how it raged. Some believed it to be a foul omen, a forewarning of a disastrous harvest. Others found it to be an idol of worship, detailing their bodies with inked depictions of its gnarled visage. A larger voice reclined to their delusions, believing it to be no more than a bad dream or perhaps a frayed wire gone awry.\n\n...But none denied its presence. \nGrimm Foxy was real.\nAnd Fall Fest would burn in his wake.", "Grimm Foxy was another character who I felt was a major omission from the original roster - and hence one of the first characters we wanted to add in the update! His mechanic here is a callback to Foxy's in Frickbear's 1."];
        Image = FB_GrimmFoxy;
    }
    
    Character = UnknownEnum.Value_65;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["No night guard has ever entered Freddy's without feeling a cold chill run down their spine. That isn't fear - that's actually just the work of Freddy Frostbear! One would think this coat-clad gentleman just another seasonal character created for a seasonal promotion, but they'd actually be wrong! As it turns out, this bear is just the physical form taken on by Jack Frost, who not many people know is actually quite a big fan of Freddy's. The higher-ups have tried suing him for using Freddy's likeness, but because the rights of mythological beings exist in a legal gray area, the case keeps getting put on ice.", "The idea of a character who would push your mouse cursor around was one I had thought of as far back as when I was working on the base game, so when we began working on this update, I was very eager to finally implement it as soon as possible. As such, Frostbear was actually the very first character I programmed in once we began working on the update!"];
        Image = FB_Frostbear;
    }
    
    Character = UnknownEnum.Value_66;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["One would think being the sole security guard in the overwhelmingly large Pizzaplex was what pushed Vanessa to quit her job. Others might think it was the creepy bunny lady stalking the place, somehow slipping past every last security measure they had put in place. They would all be wrong. The real reason is Gregory. The Glamrocks still shudder reminiscing on the night they all fell by his hand. ...All but Glamrock Freddy, at least. Unlike his bandmates, Glamrock Freddy is quite fond of the boy, acting almost as a father figure to him. Whether this is out of the kindness of his heart or a bug in his programming nobody is quite sure, but what can't be denied is that their bond is unbreakable... much to the dismay of whatever sucker Gregory decides to mess with next.", "Glamrock Freddy was in danger of being the only Glamrock to not make the cut for a while, at least as an enemy - we were considering making him and Gregory a playable guard instead, but we had even less ideas for what his mechanic as a guard could be than as an enemy. His current mechanic was mainly chosen becaue it's a reverse of Classic Freddy's, much like Glamrock Freddy himself is like a reverse Classic Freddy in the fact that he's nice and in pristine condition and doesn't want to kill you! While I think making these two enemies was the right call in the end, it did mean I never got to write any funny interactions between Gregory and the other playable characters. I specifically always liked to imagine him and William having a funny dynamic where William sees this nefarious demon child as the son he always wished for."];
        Image = FB_GlamrockFreddy;
    }
    
    Character = UnknownEnum.Value_67;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Roxy has worn many hats, both figuratively and literally, since her conception as a character - starting off as a pirate, before being redesigned as a wild west hero, and ultimately winding up as the pro racer rockstar she is today. In spite of her success, and especially how much she likes to gloat about it, rumor has it that all her egotism is just a mask for deep-seated identity issues... But hey, Roxy really ought to keep her chin up - if scandalous rumors like these are popping up about her, you know she's made it as a rockstar!", "I'm honestly surprised at how little I've wound up drawing Roxy given how popular she is, though that may just be because my focus has always been moreso on the classic era stuff up until now. In general I do kinda feel that a drawback of this game having as many characters as it does is that hugely popular characters like the Glamrocks end up with as much ingame importance as randos like your JJs or Yenndos - although that can also be seen as a good thing if you really like JJ or Yenndo."];
        Image = FB_Roxanne;
    }
    
    Character = UnknownEnum.Value_68;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Believe it or not, Monty is one of FazEnt's oldest mascots, having existed for even longer than Freddy himself! ...Very few Pizzaplex-goers seem to believe this fact when Monty brags about it, though. This lack of recognition sparked a deep-seated rage within Monty, and it seems he holds a hidden resentment towards all Freddy and Bonnie models because of it. Luckily, he can always turn to Gator Golf to take the edge off...even if he isn't actually very good at the sport. He always just hits the ball with all the force he can muster, leading to guest complaints about Gator Golf being riddled with what appears to them as golfball-sized bullet holes.", "Shortly after it released, this game got a bit of flack for how exaggeratedly curvy a lot of the female character designs were. While a lot of developers probably would've responded to this by going back and toning down those designs, I figured the better way to address it would be to start making the male characters sexier to match."];
        Image = FB_Monty;
    }
    
    Character = UnknownEnum.Value_69;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["In a bit of an overcorrection for previous Chicas' personalities, Glamrock Chica is as fabulously fit as it gets - she even has her own themed fitness attraction! From her ponytail all the way down to her fashionable leg warmers, everything about Glamrock Chica was designed to encourage Pizzaplex consumers to be the best versions of themselves - so long as those versions of themselves had a BMI no greater than 15. Have you SEEN the amount of garbage Glamrock Chica eats? And I don't mean that figuratively! And if she manages to stay fit in spite of that, why can't you? No, not being a robot isn't an excuse! Come on, work those glutes!", "Normally, once a character's mechanic begins being implemented, it stays exactly the way it was originally concieved all the way up to when it's fully programmed into the game. Maybe some small tweaks will be made here and there to make it work a little better in practice, but often the way it generally works is just as it was when we originally wrote down the idea. Glamrock Chica is the sole exception. Glamrock Chica's mechanic was the only one that we fully implemented, sprites and all, but then realized completely sucked and redid from the ground up. While the pizza mechanic she has now was conceptualized pretty early on, I figured it would've been too much effort to implement, and opted for a different idea - a mechanic where you'd need to keep a pizza warm on one of the cameras by holding a button, kind of like a more generous version of the FNaF2 music box. However, this mechanic really wasn't very fun, so we went with the original idea instead, even if it did end up being quite a bit of effort to implement. (I'd say that effort was absolutely worth it, though!)"];
        Image = FB_GlamrockChica;
    }
    
    Character = UnknownEnum.Value_70;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Sun always yearned to live the life of an actor - and he got his wish! For a little while. As the audiences at the Pizzaplex became more and more spoiled for entertainment, Sun and Moon's routine of taking turns acting out plays entirely by themselves grew stale fast, and they were demoted to attendant of the newly opened Superstar Daycare. Unfortunately, neither of the animatronic's two personalities wound up being any good at tending to children - Moon's idea of discipline could make even an 18th century schoolteacher blush, and the happy-go-lucky Sun's deep seated resentment towards his job tends to shine through the cracks of his otherwise cheery demeanor every so often. Perhaps they could be the dream caregiver Fazbear Entertainment always wanted them to be with just a bit of reprogramming... but this is a tall order with not a single higher-up left who knows what children actually want.", "Sun & Moon's mechanic is a callback to Foxy and Mangle's in Frickbear's 2! Funnily enough the functionality for the Pirate's Cove poster in the office switching out has been in the code since super early on as a remnant of when this game was supposed to be a remake of the first two games, so I was glad to have an opportunity to finally realize it once Sun & Moon were added."];
        Image = FB_SunAndMoon;
    }
    
    Character = UnknownEnum.Value_71;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["They called Mr. Burrows crazy when he began letting a computer program make all his executive decisions for him. \"Replace Foxy? He's our most popular character!\" \"A megamall? Where do you expect us to get the money for that!?\" \"GOLF!? Have you lost your MIND!?\" But, lo and behold... all the riches the computer had promised him came to fruition, and Freddy Fazbear's Mega Pizzaplex became the most successful venture in the company's entire history! Of course, he'd be a fool to stop there - those human employees? Fire them all! An automated workforce can do all their jobs for a fraction of the price! It was only after he was the only one left that he had realized... the company had no use for him anymore either.", "M.X.E.S. is admittedly one of the characters we struggled figuring out a characterization for the most...but in our defense, it's not like they talk at all in RUIN! We mostly just worked off the commonly-accepted fan theory that M.X.E.S. and F10-N4 are one in the same and M.X.E.S. is a cranky old lady who acts like an evil anti-Fiona. It's entirely possible future games will throw a wrench in this theory and their appearance here will immediately become outdated, but I WOULD say I'm happy with it for the time being, if for any reason just because I think M.X.E.S. being a woman despite having a design people almost unanimously see as more masculine is really funny."];
        Image = FB_MXES;
    }
    
    Character = UnknownEnum.Value_72;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Very Informative Pig was created to assist FazEnt's higher-ups and V.I.P. partners, being trained exclusively off of business emails and the company's P.R. statements. His mastery over corpo-speak has allowed him to quickly climb the ranks and replace the positions of those he was originally created to assist. While his intentions are far from murderous, even the most lethal of Fazbear Entertainment's animatronic lineup has come to fear him - after all, is there anything scarier than middle management?", "V.I.P. was supposed to be the designated oddpall pick of the roster when we originally decided on him, though funnily enough as the roster grew and even stupider characters were added I feel like he doesn't entirely fit that role anymore. I would also like to thank RecD for agreeing to voice such a stupid character pick! I understand that YouTuber voice cameos in FNaF fangames are generally seen as sorta corny, but I do definitely think everyone did a really good job with their roles here. I figure if you ARE gonna ask a YouTuber to voice act in your game, it's best to seek out people who are already adept with character acting, even if it's just from doing funny cartoon voices for bits in their videos."];
        Image = FB_VeryInformativePig;
    }
    
    Character = UnknownEnum.Value_73;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The magnum opus of inventor Edwin Murray, and later forcefully-repossessed property of Fazbear Entertainment. After prying it from Edwin's hands, then-co-owner of the company William Afton grew quite fond of the robotic abomination, bonding with it as the obedient, self-reflecting son he never had. ...However, he began feeling his ego bruised once the Mimic began using what it had learned to plot out murderous schemes far more elaborate and impressive than even Afton's very own. As such, he dumped the Mimic back off where it was found, and left it to be forgotten. Even then, the Mimic's influence lives on even to this day - its AI system having been used as the basis for practically every robot Fazbear Entertainment has made since. If you've ever wondered why all these animatronics seem to share a proclivity towards solving any and all problems with murder, as well as the same love of snarky one-liners after disposing of their victims...it all roots back to the Mimic.", "The Mimic has by far the most unique jumpscare sprites in the game, clocking in at 9 total! (The only other character who comes close would be the Phantoms with 6, although they're kinda cheating since all their jumpscares were just edited versions of other pre-existing sprites. The Mimic's 9 jumpscares all needed to be drawn from scratch!) The Mimic was probably the single most time-consuming character to implement in this update thanks to both the complexity of its mechanic AND the amount of unique sprites it needed, but I'd say if anyone deserved that distinction it WOULD be this guy. (Besides, there really wouldn't have been any way to include the Mimic's suit-switching gimmick that DIDN'T require a stupid amount of unique sprites.)"];
        Image = FB_TheMimic;
    }
    
    Character = UnknownEnum.Value_74;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Birthday clowns are hardly a new concept, but birthday clowns with impossibly stretchy limbs? Now THAT'S the innovation you only get from Murray Co.! The secret to her stretchiness is actually her complete lack of endoskeleton - almost all of her movements are done through pure pneumatic magic! One may worry about the kind of tricks she could pull if she WERE fitted with an endoskeleton, given the level of mobility one can provide... but fortunately, that's not something anyone's ever had to worry about.", "It took a lot of restraint to not just make all of Jackie's dialogue Jackie's Box references."];
        Image = FB_Jackie;
    }
    
    Character = UnknownEnum.Value_75;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["This old geezer was the headliner attraction of the Big Top Carnival, one of Murray Co.'s favorite avenues to show off their latest midway games and innovations in animatronic technology. He functioned not only as a one-man animatronic show, but a ticket booth, billboard for the company, and even a ride as well! (That is, a ride for any customers who tried to sneak in without a ticket - rumor has it Big Top would grab these customers, spin them around at top speed, and hurl them off the fairgrounds if they refused to pay.) Big Top may have been horribly impractical from a logistical perspective, and was only ever really good as a display piece...but boy, what a display piece he was!", "Big Top's one of the biggest animatronics in the game, and has the biggest portrait in the game to match, being a whole two pixels below the spritesheet limit! ...I didn't do this intentionally, I really just lucked out. If it was two pixels larger I probably would've needed to redo a significant chunk of it. DJ Music Man was actually briefly considered for the base 4LD roster at one point, but I figured Big Top was just a little bit more unique and a little bit cooler, so he got in first."];
        Image = FB_BigTop;
    }
    
    Character = UnknownEnum.Value_76;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Captain Cobalt once was the proud leader of the scariest, yet cuddliest crew of sewn swashbucklers this side of the seven seas - that is, until he was eaten by a giant Rocktopus and promptly succeeded by his second-in-command, Foxy. In spite of his general grouchiness, hatred of pirate parties and propensity for doing things by-the-book, he is still quite fondly remembered among his crew.", "For a character who was initially only included to be an easy-to-develop sprite swap of Nightmare Freddy, Captain Cobalt actually took quite a bit of effort to implement, given the puppet pirates' mechanical differences and all the voice lines they needed! I think the effort was worth it in the end, though - there's undoubtedly at least one or two Bawson or Kit or Renard fans out there who are really happy to see them be not only included but fully voiced here."];
        Image = FB_CaptainCobalt;
    }
    
    Character = UnknownEnum.Value_77;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The once-favorite plush toy of the late David Murray, lovingly crafted by his mother. Nobody has dared to touch it again ever since it stopped being played with... but somehow, it always seems to end up in a different place each night. ...What was that? Oh, don't be silly. Plush toys can't talk. ", "A lot of times during this game's development, we had ideas for animatronics we wanted to include but no ideas for their mechanics. Other times, we had ideas for mechanics, but no animatronic to give them to. White Tiger is an example of one of the lucky times where a stray mechanic was able to be paired up with a stray animatronic!"];
        Image = FB_WhiteTiger;
    }
    
    Character = UnknownEnum.Value_78;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Locked within the underground tunnels far below Murray's Costume Manor is something terrible, something ghastly, something horrendously round. Nobody's quite sure what's inside the suit, and no employee has ever dared to face it to check. Sleepy Moon has been kept sealed underground, roaming the catacombs, singing the same lullaby to itself over and over again ever since. Perhaps MCM's giant moon prop crashing down through the facility and this freak showing up shortly afterwards was a bad omen from the celestial forces themselves, but not even that could stop Edwin from continuing his work.", "I wanna shoutout Sleepy Moon for being basically the only modern FNaF character whose design creeps me out. I appreciate that he's scary-lookin' in a way that's pretty much completely unique from any other character in the series, even if that meant it was kinda hard to recapture his vibe here."];
        Image = FB_SleepyMoon;
    }
    
    Character = UnknownEnum.Value_79;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Doofas is a pink dinosaur. He likes popsicles. He goes on adventures. He led the Dinostrian troops against the forces of Cosmose when the Iffermoon fell and put the continued existence of his home planet into jeopardy. Not everything has to be super complicated, you know.", "Doofas is the single oldest character on the roster! He's probably also the character who I expect the least number of people to recognize."];
        Image = FB_Doofas;
    }
    
    Character = UnknownEnum.Value_80;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Blank was designed to encourage children's creativity, even if his methods to do so can be a bit extreme. \"There's an artist inside us all!\", he often says. \"And I'll bring it out in you...even if I have to rip it out myself!\" Children at Candy's consider the back of his head to be an elusive and exclusive drawing spot.", "Blank was never actually a character we were considering when the update roster was first being drafted; He only came about after I was informed about a mod theWAHbox was making for him! I was really impressed with this mod (especially since I would've had no idea how to program his drawing mechanic myself), so I just asked him if I could make it a part of the vanilla game. He agreed, so now here he is! This gives Blank the unique distinction of being the only character in the game who WASN'T predominantly programmed by me. I think we were briefly considering giving the drawing mechanic to a different character (namely either Paper Pals and the creature from Scott Cawthon's retirement post), but Blank generally seemed to be the favorite among the dev team, so we went with him."];
        Image = FB_Blank;
    }
    
    Character = UnknownEnum.Value_81;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Archie prides himself as the lone keeper of the Fazbear Archives, practically being a living encyclopedia on any character Fazbear Entertainment has ever created, intentionally or otherwise. However, all this knowledge has gone to his head in more ways than one - he has a bit of a superiority complex towards those less knowledgeable on Fazbear's than him, scoffing at those who have never heard of \"Mega Brow\", \"Beacon Bonnie\" or \"Mudpie.\" Fortunately, his extensive knowledge still wasn't enough to steal MY job!", "Archie was chosen mainly because I wanted a character from the newest FNaF game at the time of this update's development, but also because I just plain like Archie and the game he comes from. Because he's another character whose mechanic essentially involves playing a game within a game, I'd say he was the most time-consuming animatronic to program among the update's newcomers."];
        Image = FB_Archie;
    }
    
    Character = UnknownEnum.Value_82;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["It's Bon the Dancing Hare! Bon was the brainchild of Felix Kranken and                       , as well as the face of Michigan's premier family restaurant, Bon's Burgers! ...A restaurant that, unfortunately, was only ever in business for a single month. Restaurant chains with animatronic mascots falling victim to some gruesome tragedy is actually a more common phenomenon than one would expect, even before Fazbear's entered the picture. As a matter of fact, 41 out of 50 U.S. states have at least one animatronic restaurant-related disappearance to call their own! Bon was actually not brought to Utah by a Fazbear employee, nor is he an apparition born of any of their memories, as word of him has never really gone beyond his home state... rather, it seems he wound up here after taking a wrong turn on his daily commute to Wonderland. The other animatronics seem intimidated by him.", "Bon is really only here because of several fortunate circumstances happening to line up. I originally wanted to take a firm stance against including characters from other fangames and FNaF-adjacent projects since I felt it'd be like opening Pandora's Box and there were already so many official FNaF characters left to include...but also I was kinda already breaking that rule with Rodney and Sally's inclusions, and also Eva was already on board to record some voice lines for White Tiger, and also this was around the same time Faces of Grief released which supplanted the Walten Files as probably my favorite FNaF-Adjacent Thing Ever, so I was willing to give into my personal biases and make an exception in this case."];
        Image = FB_Bon;
    }
    
    Character = UnknownEnum.Value_83;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Who could forget the wacky family antics of The Immortal And The Restless? With a several season run and an inconsistent production quality, this show has won over the hearts of many and earned its place on millions of household TV sets across the country. Episodes frequently see Vlad neglecting his family to get up to various misadventures, as Clara is left to clean up his mess. Naturally, most of the show's fanbase agrees Clara is the root of the family's problems.", "Despite being one of the very last characters implemented, Vlad & Clara were planned to be included fairly early on! They mainly kept getting pushed back because I knew they would be a MASSIVE undertaking in terms of scripting and voice acting - probably the biggest proportional to how simple they'd be from a mechanical and programming standpoint. Thankfully, we made it happen in the end thanks to the efforts of the other team members! (Out of all the animatronics these two were the one I was probably the least involved with myself.) I'd like to especially thank RedTV for writing all the scripts for these two!"];
        Image = FB_VladClara;
    }
    
    Character = UnknownEnum.Value_84;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Though Dr. Talbert is mainly remembered for being the CEO who sold the company off to The Boss, he was originally the head of R&D! He was in the midst of creating one of his greatest inventions when the CEO position was handed to him; An automated cleaning droid that used advanced chemical compounds to clean up the many, MANY kinds of messes that plagued Fazbear's restaurants, be it mold, cheese, or just about any human-made substance one could think of! And his doctorate was indeed not for show, because the Reagent was incredibly effective at its job - A little too effective. He abandoned the idea when he abandoned the company, but the prototype remained. The company quickly sent it to the high-traffic Pizzaplex upon discovery, without actually bothering to wonder why this prototype went unsubmitted. The entire building was put on lockdown the night it was first allowed to roam, as the few human employees left at the Pizzaplex found out the hard way how broad the Reagent's classification of organic pollutants was.", "The title of \"stupidest character inclusion\" kept changing throughout development, but I think it finally landed on the Reagent - a character who I could imagine even a lot of diehard FNaF fans not recognizing! (Or, at best, assuming it was something An Undeniably Canon FNaF Timeline made up.) Its inclusion was for more than just that, though - it also serves as our S.T.A.F.F. bot representative, as well as an excuse to include the Wet Floor Bot in the game somewhere! Given how prevalent both are to Security Breach but how many S.T.A.F.F. bot variants there were to choose from, I do feel the Reagent, being the sort of Mother of All S.T.A.F.F. Bots, made the most sense to include."];
        Image = FB_Reagent;
    }
    
    Character = UnknownEnum.Value_85;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["It only makes sense that a company as rife with sin as Fazbear Entertainment would catch the eye of the Devil himself. From the darkest pit of hell rose an infernal warrior, shaped in the image of the suit a young boy was forced to call his tomb, one that two men so foolishly tried to burn for repentance, only for the burning rage of the inferno to make it all the stronger. It will see to it that the company and all who associate with it are dragged down to the netherworld...lack of hands be damned.", "Despite how much fan demand there was for him, Ignited Freddy wasn't planned to be included for the longest time; While TJOC is REALLY cool and he seemed like a natural fit given other Fanverse reps like Candy and Popgoes were already here, I'll admit that I personally don't have much of a deep connection to it. TJoC is very much more of a traditional horror game in its art direction and overall vibe, which means it's pretty lacking in wacky cartoon mascots with big personalities - all things that are typically prioritized for inclusions on the Frickbear's roster! That combined with the amount of characters derivative of Withered Freddy on the roster already meant Ignited Freddy was never really in the running to be included...until the last few months of development, at least. When we were weighing our options for what bonus characters to include once we had finished up the initial 80, Ignited Freddy was one of the most favored options among the rest of the dev team, so he finally managed to make the cut!"];
        Image = FB_IgnitedFreddy;
    }
    
    Character = UnknownEnum.Value_86;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Many naturally assume the stories of a time-travelling ball pit tucked away somewhere in a former Freddy's location are yet another senseless rumor spread to capitalize on the brand's infamy, or at best just another of the many paranormal happenings at the restaurant - and rightfully so! However, both groups would be wrong. In truth, William Afton did actually discover time travel, and this ball pit was one of his many experiments. He wouldn't have abandoned it if not for the fact that his meddling with the fabric of space-time produced the creature you see before you: an anomalous, animalistic twist of his own Spring-Bonnie persona.", "This guy was another very late addition to the roster! He was originally scrapped after losing a community poll to Morse, although he wound up being reincorporated once the last few animatronic slots needed to be filled out after seeing how much demand there was for him. (He also serves as a representative for the Into the Pit game, which is an entry that isn't really acknowledged in any other way throughout the game.) He probably would've made the cut sooner if not for the sheer number of Aftons in this game already - even moreso had I included Dark Springtrap, who was genuinely a contender for the roster at one point earlier in development."];
        Image = FB_SpringBonnie;
    }
    
    Character = UnknownEnum.Value_87;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The west arcade is the most happening spot in the whole Pizzaplex - but like any hip club, it's valiantly defended by its very own bouncer. DJ Music Man only lets the HIPPEST cats onto his dance floor - any squares can beat it, and more than likely will once they see his huge, multi-story body shambling their way. He offers DJ'ing lessons to Pizzaplex VIPs, though none of his students have ever managed to live up to his incredibly high (and incredibly esoteric) standards. Plenty of party-goers have complained about the DJ's incredibly limited setlist, and how he only ever wants to play his own boss theme during birthday parties...but upper management is too afraid of the big guy to do anything about it.", "DJ Music Man was the character who I considered the biggest omission from the initial 4LD roster once the update had been released. Now that he's actually here, I'm honestly not sure who that title belongs to now. I DID sorta feel like Security Breach was a little underrepresented in the roster proportional to how major of a release it was - though even then, I do believe we have all the most important bases covered now! ...Except for Burntrap and the Blob I guess, but I kinda don't really care about either of those two. (Burntrap and Tiger Rock were actually considered as the two other newcomers to come alongside DJ Music Man, but both were scrapped in favor of some slightly more unique and niche picks.)"];
        Image = FB_DJMusicMan;
    }
    
    Character = UnknownEnum.Value_88;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Ralph was once the very model of an exemplary Fazbear employee; One who was fully devoted to the brand, and would happily take on the work of any worker who stopped showing up - and most importantly never ask why they stopped showing up to begin with! (You don't get a menu special named after you for questioning upper management, after all.) While it's expected for Fazbear Employees who have been at it as long as Ralph has to develop a certain numbness towards many of the company's misgivings, his went a step beyond... His view of the company wasn't rose-tinted as much as it was rose-covered. And as a show of thanks for his devotion, for all the times he defended the company, and all the times he lulled new hires into a false sense of security only for them to turn up dead shortly after, he finally gets to be a part of his favorite band - and favorite brand - forever. (He's a bit miffed he wound up in a Chica suit, though. He would've much preferred Foxy.)", "This one character is simultaneously based on the FNaF1 phone guy and protagonist of The Week Before, Ralph (I mean duh), the mysterious withered classic Chica seen at the end of the Survival Logbook (often referred to as Logbook Chica), and the night guard stuffed in the Freddy suit seen on the FNaF1 game over screen (usually referred to as \"Corpse Freddy\" or \"Stuffed Freddy\"). We WERE actually gonna just have it be a Freddy suit at first, especially since the mechanic is directly based on FNaF1 Freddy - in fact, before the phone guy angle this character WAS just straight up gonna be FNaF1 Freddy (either a Scott-accurate Freddy design drawn in the Frickbear's art style or the much more funny idea of it being a series of pre-rendered sprites using an accurate FNaF1 Freddy model), but we opted for Chica because the roster had enough bears as is and the idea of devoting a character slot to Logbook Chica of all characters was too funny to pass up. (It also acted as a cute callback to that one fan theory from the FNaF1 days!)"];
        Image = FB_Ralph;
    }
    
    Character = UnknownEnum.Value_89;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The Boss hadn't thought much when his janitor brought a bloodied Pirate Plunder arcade board to his restaurant's doorstep. It was only after having it installed that he learned this board was home to Foxy.EXE - an eldritch being from the far reaches of space who happened to take a particular liking to the Fazbear brand's beloved pirate mascot. Any employee foolish enough to click on the blood-red Foxy icon in their game tab may soon find themselves dragged into Foxy.EXE's twisted game, forced to run from him in a vessel of their favorite Fazbear character for the rest of eternity. He's also got himself a fairly successful music career!", "The idea of Foxy.EXE as a potential newcomer to the roster was originally brought up entirely as a joke. Then we kept discussing it. Then we wound up with a fully implemented character. I'm not even much of an EXE fan myself, but quite a few of the people I work with are, so we had a lot of fun with this guy. (That being said, I DO really like Sinister Minds, but I may be biased because RedTv's involved with it and he's my friend :D) This character's inclusion is ABSOLUTELY not going to help how much this game is derogatorily compared to FNF but whatever. It was too good of a bit to pass up."];
        Image = FB_FoxyEXE;
    }
    
    Character = UnknownEnum.Value_90;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Endoplush was SUPPOSED to be one of a whole fleet of little worker drones designed to help Mendo with some of the physical tasks he couldn't accomplish alone. It was SUPPOSED to mirror Mendo's helpful personality and aid employees in getting menial tasks done, as the first step into Fazbear's eventual obsession with automation. It was SUPPOSED to later be used as the template for a whole line of animatronic plush toys Fazbear Entertainment would later produce and sell to households across the nation. Unfortunately for them, Endoplush's signal was intercepted one day by a hacker well familiar with Mendo's systems...and with just a new line of code here and there, it soon became an untamable menace that even Fazbear's best engineers had no hope of reeling back in. ...Oh, and these haywire endos DID actually make it into those mass-produced plush toys, as the higher-ups quickly learned once outraged parents began flooding their restaurants. They could've SWORN Endoplush's language filter had more safeguards than that.", "You may be wondering why Endoplush was included. After all, without him, the roster would've been at a perfectly clean 90 characters. Well, the reason is simple, really: We needed to meet our character quota!"];
        Image = FB_Endoplush;
    }
    
    Character = UnknownEnum.Value_131;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["This supremely sanitized, fashionable Freddy is the foremost line used in most modern Freddy's restaurants. They seem to have finally worked out the kinks with the whole \"murdering\" quirk of their AI systems with the Rockstars- And all it took was local state laws forcing them to! Rockstar Freddy is a friend to employees and customers alike, even if he's overly eager to take your cash. If you worked at any of these locations, your job would probably be a whole heck of a lot easier.", "For the longest time, if you asked me what the lamest set of animatronics in the mainline games was, I would've said the Phantoms. ...If you ask who would be second, then I'd probably say the Rockstars. They were never really in the running during the early phases of figuring out the game's roster; I was kinda sick of drawing variants of the main four after including so many in the base game, so they fell to the wayside as our focus was put towards the more unique and fan-requested picks missing from the base game instead. That being said, after drawing so many of these more unique characters...I started missing drawing classic-styled variants of the main four again. This also happened to be around the same time shops were being implemented! As really the only variants of the main four who were friendly in their first appearances rather than acting as enemies, I thought they'd make for perfect shopkeepers here. Their inclusion has made me appreciate their original counterparts a lot more, too!"];
        Image = FB_RockstarFreddy;
    }
    
    Character = UnknownEnum.Value_132;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Bonnie's weakness as a performer was always his stage fright, which - on an exceptionally bad day - could prevent him from performing entirely. You can't really risk the sole musician being a no-show, and thus was the main thing they set out to fix with this incarnation! Rockstar Bonnie stands as a far more easygoing fellow, with a passion for the arts and \"letting the rhythm flow through his fingers\" on the stage. The thing is, while they did fix one issue, they made him so laid back he's become prone to being late for his performances... Despite his skill on the guitar, Rockstar Bonnie has always felt he'd make for a better drummer.", "While all four Rockstars ultimately made it in as shopkeepers, some other characters were considered for their roles too! Upgrade Cadet was going to reprise his role as the one you buy upgrades from originally, while the cartridge and consumable shops would be run by other random characters who vaguely suited their roles. The consumable shop was going to be run by Quad Endo from FNaF World Halloween Edition, as a parallel to Mendo. The cartridge shop, on the other hand, had a couple contenders - most notable of which being the Princess from Princess Quest and Tyke from Chipper & Sons. While I think these would've made for some really funny obscure character picks, I do feel like going with the Rockstars was the better option in the end."];
        Image = FB_RockstarBonnie;
    }
    
    Character = UnknownEnum.Value_133;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["It took until the creation of the Rockstars for Fazbear Entertainment to realize: Bonnie's the only one playing an instrument! Even with the stage's speakers doing most of the work, the Fazbear band's performances were sorely lacking without any percussion whatsoever. As such, Rockstar Chica was the first of her kind to ditch the cupcake in favor of a pair of maracas! ...Who, like Mr. Cupcake before them, also have minds of their own. It is unclear if they're bothered by being shaken around all the time, or if they find it fun. Perhaps they simply tolerate it, seeing it as their duty to the band.", "While I typically avoided letting fan interpretations of what certain animatronics would look like in the Frickbear's style influence how they actually end up looking officially, I'll admit that the Rockstars pretty much only made it in because of the cool hypothetical designs CaliginousArts made of them. Even if their ingame designs wound up looking pretty distinct from them, those takes were my main source of inspiration!"];
        Image = FB_RockstarChica;
    }
    
    Character = UnknownEnum.Value_134;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Rockstar Foxy is one of the proudest creations by R&D: A Foxy model that doesn't break down on a daily basis! With his parrot Pickles and wacky sidekick Starfish Steven, he's got comedy routines and sea shanties to for days! He's a one-man-band for the ages, though he fails to muster much more stage time than his fellow Foxys' due to management's insistence to package him with a salad bar.", "Despite other characters being considered for the shops that ultimately went to the other Rockstars, Rockstar Foxy was actually planned as soon as the idea for a luck-based shop was conceived. It would've been really weird for him to be the only Rockstar to make it in, although he was mainly prioritized just because out of the four Rockstars he's definitely my favorite."];
        Image = FB_RockstarFoxy;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_140])
    {
        Desc = ["Most animatronics are made to entertain, but Carnie is instead made to irritate. History shows nothing gets people to run in with reckless abandon more than a loud-mouthed jerk provoking them, so Carnie's here to point out all your deficiencies that make you a subpar gamer. While the company's received plenty of complaints about how personal some of Carnie's insults can be, and the amount of children and adults alike he has driven to tears... they aren't particularly eager to reprogram him when he's made them so much in midway sales.", "Not to speak on the quality of the game itself - it's a VERY well-made game - but I think Help Wanted 2 has by far the lamest cast of new animatronics out of any mainline game in the series. They're all just variants on pre-existing characters! Carnie is the THIRD Rockstar Freddy in this game! I figured it deserved to be represented in this game one way or another regardless, although I wasn't super happy about any of our potential options. Mystic Hippo was briefly considered to be a shopkeeper, but we landed on Carnie mostly just because I thought the shop mechanic he'd come along with would add the most to the gameplay loop. (He's probably also the most popular character introduced in Help Wanted 2 - which I suppose is a little sad when most people I know don't even recognize him. Seriously, at the time of writing this his Frickbear's portrait is the second result for him on Google Images and this update isn't even out yet.)"];
        Image = FB_Carnie;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_138])
    {
        Desc = ["Among tales of Hurricane's many cryptids are those speaking of a tall, porcelain banshee lurking in the shadows, often lurking near those who would, mere days or even hours later, die suddenly, and under mysterious circumstances. Strangest of all is these victims seem to seek her out willingly - or at least speak to her calmly shortly before their demise, if the blurry recollections of locals are to be believed. The few facts that seem to be consistent between all these cases is that the deceased are always found wearing a dazzling, gilded necklace in the days leading up to their untimely demise, and always seemed to be...abnormally happy about something.", "The books are admittedly a pretty big blind spot for me when it comes to the FNaF series (Can you blame me? I'm a FNaF fan, I can't read!), but I did still feel like there was enough cool stuff to pull from Fazbear Frights that a major character representing it here would only make sense. That being said, Fazbear Frights introduced a LOT of characters, and most of them only appear in a single story. Into the Pit's Spring-Bonnie is probably the most popular and recognizable one, but calling him the most iconic Frights character feels cheap when he has a whole spinoff game propping him up too. As such, my focus shifted to Eleanor! She's not SUPER well-known in comparison to a lot of the game characters, though she still has a big enough role in the books and enough diehard fans that I figured she deserved to be included here. Her challenges also provided an excuse to sneak a bunch of other Frights antagonists in, even if in a very small way."];
        Image = FB_Eleanor;
    }
    
    Character = UnknownEnum.Value_135;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Browboy thinks of himself as a bit of a godfather to all of BB kind, taking in the little scamps when nobody else will...not even the company that created them. The scrapped animatronics he's taken under his wing feel they owe their lives to him ever since, and happily help him with whatever endeavors he wishes to carry out - especially those of an illicit nature. While far from the only criminal operation headed by one of Fazbear's abandoned animatronics, Browboy's crew is by far the most loyal, and by far the most feared.", "Browboy marks the third cartoon mob boss character in this game. His inclusion was actually something I was considering almost immediately after the base game released! Something a lot of people complained about was that if you salvaged a character that was a lot harder to deal with than you expected, you were stuck with them forever unless you restarted your run. I was considering adding Browboy into the salvage locations to address this, his gimmick being that you could pay him to get rid of animatronics who were giving you trouble. Of course, this mechanic did wind up making it in pretty much exactly as originally conceived - just as a shopkeeper in Four Layers Down rather than in the main game! His design was heavily inspired by Tony Soprano."];
        Image = FB_Browboy;
    }
    
    Character = UnknownEnum.Value_137;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Poor Morse never did get along with the rest of Popgoes and his crew... although maybe that's just because of his insistence on roboticizing all their friends. (Nobody's had the heart to tell him how ineffective it would be to roboticize a cast of already animatronic animals.) Regardless, Morse was cast out of their circles, and has remained underground plotting his revenge ever since. He has free reign over the many back alleys and secret passageways he's dug throughout the Angel's tower, and he may be willing to let you use them in secret, so long as you're willing to pay. Despite his outward antagonism, he really just wishes he had more people to share his admittedly impressive handiwork with.", "The events that transpired May 11th, 2026 taught me that I probably shouldn't leave character inclusions up to community polls anymore. The funny thing is that the character who lost to him later wound up in the game anyway! In fact, only one of the losers out of the three polls I held wound up not making the cut, although that loser was Withered Golden Freddy, who I don't think toooo many people will be upset about not being here. (Just between you and me, I'm actually pretty happy Morse won that poll. He's a very unique character both in terms of design AND the corner of the FNaF franchise he represents, so I was glad to have him included here!)"];
        Image = FB_Morse;
    }
    
    Character = UnknownEnum.Value_139;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The creation of Fazbear Entertainment's \"Fazplex Tower\" project just so happened to coincide with the anime boom of the mid-2000's; As such, they knew that if they wanted to sell people on their new apartments, they would need cutesy, big-eyed mascots to market them with. Unfortunately, nobody on their staff really knew how to capture the style, and even fewer knew how to program a friendly AI, leading to a line of virtual assistants who were neither visually nor emotionally appealing. The few customers who did rent out an apartment at the Fazplex Tower, typically just being higher-up Fazbear employees who were offered them as part of their position, often complained about the Bobbiedots being \"alarmingly clingy\" or \"straight up trying to poison them.\" But really, did you expect anything more from the team behind Helpy?", "The Bobbiedots seem like one of the more popular set of characters for people to make redesigns of. Justifiably so, because their original designs SUCK ASS!! While the majority of fan interpretations I've seen make them into relatively normal-looking human women, I thought it'd be funny to go in the opposite direction and make them look even more like bug-eyed freaks. (I probably would've gone for something a lot closer to Snartles' designs had they existed when I designed them here.) Their designs here are also very much inspired by the Y2K aesthetic!"];
        Image = FB_Bobbiedots;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_142])
    {
        Desc = ["MCM's headline character for their brand new, state-of-the-art initiative: Recycling! That's right, you have MCM to thank for inventing the concept. Her doll hospital ensures that any damaged animatronics will be repaired back to tip-top shape, or remade into something else should such a task be impossible. While her methods can sometimes be a bit unorthodox, Dollie's committed to making sure no scrap is wasted and every piece of the buffalo is used. (The animatronic buffalo, that is.) Your TV? That lamp beside your desk? For all you know, they might've just been an animatronic in a past life! Just remember the next time you throw a plastic bottle into a trash bin that you have not only disappointed Dollie - you have disappointed me.", "Dollie is pretty unique in that she's one of only two shopkeepers who's exclusive to a particular gamemode! Solo mode was supposed to be the ONLY gamemode for Four Layers Down at first; Despite the idea of being able to recruit other guards being one we came up with super early on, it was briefly scrapped since I felt like it would've been way too much effort to implement. However, after a little while, we kinda just changed our minds. (The funny guard interactions were too good to pass up.) At this point, we even briefly considered having this new Party mode replace Solo mode altogether, although doing that would've meant needing to scrap Dollie, so we decided to make both ways to play accessible in the final game as separate gamemodes with their own mode-specific shopkeepers."];
        Image = FB_NurseDollie;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_136])
    {
        Desc = ["Only those who are as cutthroat, cold and uncaring as Fazbear Entertainment itself find themselves able to climb its corporate ladder. The stone-cold salesman you see before you was once just a simple, low-ranking employee like anyone else before he headhunted and mingled himself into power. The company is unfortunately stuck in a negative feedback loop of bad bosses promoting bad bosses... and with the current head honcho being as bad of a boss as you can get, no amount of soul-selling will get this representative higher on the ladder. (Maybe it serves him right for how many times he pulled it up behind him.)", "I'm very happy this guy counts as an official FNaF character because it offered a loophole to include Markiplier in the game. The idea of a shop where you could get money by taking on extra animatronics was one we had for quite a while, although it took some time before we settled on what character to give it to - Deedee was actually the top contender before she was made into a standard enemy. The only other YouTuber cameo character who got anywhere close to being included was Ness from the FNaF Movie, although we couldn't really come up with a good mechanic for him and there were so many more important human FNaF characters to include as guards that he ultimately fell by the wayside."];
        Image = FB_FazEntSpokesperson;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_143])
    {
        Desc = ["Tipsy was the headliner mascot for Fazbear's very own bar-pizzeria-arcade fusion, Jr.'s! ...A concept that never made it past a single location, out of fear that such an adult-oriented concept would damage the brand's overall kid-friendly image. The only location would soon close, as the only consistent business it got was from its own founder, who drank himself to a stupor near daily after his business partner insulted the sultry chicken animatronic he had personally designed for the establishment.", "If you've checked the concept art menu, you should know that Tipsy Bird was inspired by a faint memory of an actual restaurant mascot I remember seeing as a kid, one which I was actually able to find again between now and the release of the base game! You'd probably also know that Tipsy was in the game this whole time, but her only appearances were in the aforementioned concept art menu and a single Helpy ad until now. Funnily enough, Tipsy Bird's inclusion came about in a very similar way to Rodney's - both were just OCs I didn't think I'd include in the game at first for one reason or another, but changed my mind on after seeing the surprising amount of fan demand both of them had. (Also my buddy Kai was very insistent on us including her, that had a big part to play in all this too.)"];
        Image = FB_TipsyBird;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_141])
    {
        Desc = ["Fazbear's has had its fair share of business rivals over the years, but few gained their ire as much as El Chip's Fiesta Buffet. They knew they couldn't compete with their quality, nor their animatronic beaver, nor the fact that THEIR animatronic never broke down or attacked employees. So, in order to ensure the company's quick bankruptcy, Fazbear Entertainment filed a copyright for the word \"taco\" and quickly ran them out of business. Before they knew it, the chain had no choice but to sell to the very company that kneecapped it, and Fazbear quickly got to work redesigning their brand image with the help of the only people who would know how - their Canadian design branch, of course! And so, El Chip was born anew, headlining brand new taco bars in Freddy's locations everywhere and speaking whatever Spanish the design team could recall from high school to ensure an authentic customer experience. The food was still somehow just as good as it was before the buyout, so it's a real shame that they got him.", "El Chip was the VERY last character to be added in the game, and was only originally conceived because G-Zone had the idea of one of his voice lines being \"I'm El Chip, I'm El Beaver!\" and we thought it was funny enough to justify sneaking him in last-minute. That being said, his inclusion ALSO meant every character from UCN, every animatronic from Pizzeria Simulator, AND overall every single animatronic threat from Scott's original run of FNaF games made the cut one way or another. (All of his dialogue was also run by the Frickbear's 3 En Español team for approval and the lead thought it was funny so please don't get mad at us.)"];
        Image = FB_ElChip;
    }
    
    Character = UnknownEnum.Value_119;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The product of one particularly eccentric Fazbear franchisee, Felix was the star attraction of a short-lived \"Underwater Freddy's\" location in central Florida, touting a unique nautical theme and even a fair few water-based attractions. Unfortunately, the location was forced to shut down after it was discovered to be a front for a money laundering operation. Not one run by the owner, mind you - one run entirely by Felix himself. (That's what the owner told the judge, at least.) With the location condemned, Felix has found himself able to conduct his business free of prying eyes, and his counterfeit token operation has been booming ever since. Be wary of any vendor bot trying to sell you on his loans - they might be an underling of his!", "A driving principle in this game's overall design was asking ourselves \"you know what would be really funny?\" Felix came about pretty late into the game's development when some last couple upgrades were being added, one of which was one that would let you go into token debt. However, an upgrade like this would obviously need a punishment for not paying off your debt - and while most game developers would be smart and save resources by making the drawback to this super specific upgrade something appropriately simple, we thought it'd be really funny to tie a whole new fully-voiced character to it instead."];
        Image = FB_Felix;
    }
    
    Character = UnknownEnum.Value_120;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Cobbled together with whatever loose scraps could be found around the pizzeria, Salvage is the ultimate culmination of just about every tragedy in Fazbear Entertainment's long, troubled history, with the man responsible for them all at its helm. This mechanical amalgamation is fueled by the bad memories of the spirits trapped within itself, feeding on the agony supplied by the carefully chosen bits and pieces in its mass. One would think being stuck in the same robotic body as his angriest victims would be torture for Salvage, but it seems the sheer size of his ego has managed to completely nullify any influence they would have otherwise had. Unfortunately for him, his power trip wound up being rather short-lived.", "The idea for Salvage actually came from a scrapped concept for Frickbear's 2 - the idea was that if you salvaged all four scrap animatronics, the game would end with a boss fight against an amalgamation of all four of them. While this idea was ultimately scrapped (mostly because making a complex boss fight in Scratch wound up being too much of a headache for me), the idea got to finally be fully realized here! Beyond that, another fun little tidbit is that Salvage's name and overall premise are inspired by early pre-release fan theories for FNaF3, where Springtrap was commonly referred to as \"Salvage\" and believed to be an amalgamation of the four original animatronics before we got a better look at him. Visually, Salvage was intended to be as hideously overdesigned as we could reasonably get away with, though we did have to reel things in a bit once we realized we'd be drawing more sprites for him than any other character in the game. One last funny little tidbit: the positioning of Lefty's star on the purple part of his cloak is meant to resemble the classic Purple Guy sprite."];
        Image = FB_Salvage;
    }
    
    Character = UnknownEnum.Value_121;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Those who meddle with forces outside their control may soon find themselves face-to-face with Nightmare, the living effigy of pure dread. Born out of the terror of a long-forgotten tragedy, his cottony insides are rich with despair. Its four cohorts born of horror lurk beneath its shadowy mass, obeying his every hellish whim with no hesitation, all to keep the spirit of the child who conceived them in an eternal vortex of fear. If you speak of it, it will know. If you hear it, it's already too late. If you see it, you have nothing left to pray for, for your fate has already been sealed. To even imagine a child could know such fear is a horror in itself.", "Thanks to Nightmare's boss fight, every base FNaF4 animatronic does actually appear in this game! This also means every single enemy from the original quadralogy of games is represented on the roster which I think is neat. Nightmare's boss fight was always conceptualized as a break from the main gameplay formula, to the point that it'd feel like you're playing a different game altogether. ...Which I guess did wind up being true in a literal sense."];
        Image = FB_Nightmare;
    }
    
    Character = UnknownEnum.Value_122;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A beastly bugbear born from a child's fearful memories. He doesn't care much for getting face-to-face with his victims; Instead, he often sends his little friends, the Freddles, to wear them down before going in for the kill himself. With his sheer size and hideously big claws, he could probably rip anyone in half quite easily - though when on the hunt, his slothfulness is ultimately his greatest shortcoming.", "The Nightmares were originally going to look a lot closer to their original counterparts, just with the typical Frickbear stylizations applied, although I quickly realized this would've made them look a bit too similar to the Withered animatronics, which I felt wouldn't be very interesting. As such, I decided to go all in on making them resemble plushies, a design trait that I played around with for Nightmare Fredbear on the main roster though didn't go super far with. I feel like this was the right move in the end - not only does it make more sense symbolically considering the boss fight they're part of, it also looks a heck of a lot more cool."];
        Image = FB_NightmareFreddy;
    }
    
    Character = UnknownEnum.Value_123;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A spindly freak born from a child's fearful memories. He's always the first to pounce whenever prey is in sight, pursuing anything and anyone so long as he perceives it as weaker than himself. That being said, he's also awfully skittish - if he's caught in the act, he's just as quick to flee as he is to kill.", "Oh...my portrait is big..."];
        Image = FB_NightmareBonnie;
    }
    
    Character = UnknownEnum.Value_124;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A hulking beast born from a child's fearful memories. While not one for the hunt herself, she'll happily aid the rest of her pack in tormenting whatever victim they happen to have chosen. She does always seem to feel a hint of remorse after a victim's been dealt with, unlike the others... although that won't stop her from continuing on as soon as a new mark has been found.", "One of my favorite ongoing bits across the Frickbear's series is writing stupid text on the different Chicas' bibs. While the relatively less parodic tone of this game compared to the previous entries (key word there is relatively) meant I did wind up giving the other Chicas their typical \"Let's Eat!\" or \"Let's Party!\" text in all their sprites, I figured I could get away with making Nightmare Chica the exception."];
        Image = FB_NightmareChica;
    }
    
    Character = UnknownEnum.Value_125;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A stalking revenant born from a child's fearful memories. It knows no fear but from that it inflicts upon his victims, with fur as red as the devil himself and pointed ears to match. It's never a matter of \"if\" it will strike, only \"when\". It speaks not but lies through its serpent-like tongue, with a hook that could pierce the brightest of souls. If it knows remorse, we will never know, for none who faced it have lived to see it cry.", "I think it's written somewhere that anyone making a fan design or fanart of Nightmare Foxy is legally obligated to give him his tongue back. I see it everywhere, and frankly, I myself am not immune to fan design cliches."];
        Image = FB_NightmareFoxy;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_127])
    {
        Desc = ["The fall of Salvage and the subsequent burning of Frickbear's brought about a great change in the small city of Hurricane, Utah... That is to say, it brought great change to a certain overweight oaf's wallet. Because of this, he was more than content to cut his losses and retreat to a private island full of whatever endangered species of bird he felt needed a fine dining experience. Unfortunately for him, the spirits of the wronged rarely rest serenely. Filled with the rage of the sub-minimum wage that they so justly loathed, and having seen the demise of the one they died to guide, they infused their wrath into the metallic mass that lay beneath the rubble. After discovering that metal was surprisingly malleable when you're infused with the agony of being a wage slave, the souls took the form of the man they hated the most. Now, with vengeance and identity fraud on their mind, they resolved to make sure no such tragedy would befall Frickbear's workforce at the hands of management ever again.", "If you remember Salvage's dev notes, I mentioned that he was a retooling of Frickbear's 2's scrapped final boss. In contrast, Phony Boss IS that scrapped final boss, finally fully realized! His inclusion was an idea that came VERY late into development, and was one I myself didn't have much involvement in; It was basically entirely a passion project of RedTV's that Ellis and Marco also contributed to while I worked on the rest of the game. (The rest of the team also got to contribute by making his popups!) It MIGHT'VE been cool if he had a fully original set of moves instead of being essentially just a powered-up Psycho Foe Fredbear reskin...but in my defense, we had to get everything about this guy done only a month and a half before release!"];
        Image = FB_PhonyBoss;
    }
    
    Character = UnknownEnum.Value_159;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Jeremy's always gotten the short end of the stick in life - although you'd have a hard time getting him to believe that. Despite how much bad luck seems to magnetize itself towards him, his cheery demeanor remains unbreakable. Through every scar, scrape, scare and scalding hot cup of coffee splattered across his face, he always looks forward to tomorrow, hoping it'll finally be the day where everything goes right. Will he ever get a break...?", "The decision to make his face wrapped in bandages was meant to be a funny little homage to the fact that of all three Jeremies we know of in FNaF canon, two of them are directly known for some sort of facial injury."];
        Image = FB_Jeremy;
    }
    
    Character = UnknownEnum.Value_160;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Mike does not think of himself as a particularly lucky man, nor a particularly ambitious one. His large stature and general irritability has made it difficult for him to make many friends...or hold a job. He's grown sardonic, seldom giving any more effort than he needs to, knowing he'll probably wind up fired from any job he gets...though he keeps pushing on regardless. Could there be someone out there that motivates him to keep on trying...?", "While commonly-agreed-upon fandom knowledge seems to point to Mike Schmidt, Michael Afton, Jeremy Fitzgerald and Fritz Smith all just being the same guy in the original canon, they were all split up into different characters here, mainly for the sake of there being enough night guards for each difficulty to be covered. The same split also happened with Vanessa and Vanny!"];
        Image = FB_Mike;
    }
    
    Character = UnknownEnum.Value_161;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Vanessa stands out as one of the few employees from before the company buyout to still be around - not just as a Fazbear employee, but also just in general. Getting her start in the company's game division, she somehow found herself hired on as a security guard at their flagship location, despite having no previous qualifications. Even then, she quickly proved herself as a natural at the job, and has stuck with that position ever since. While she feels she should probably find a safer line of work, she's found it harder and harder to pry herself away from the company as time has gone on. What could it be that tethers her to this chain...?", "As you may have noticed, there's a bit of a running theme between all the playable night guards in that each sorta resembles one of the original four animatronics. While she probably looks like her counterpart the least of the four, Vanessa is meant to line up with Chica, taking design cues from Toy Chica specifically. See if you can guess who the others are supposed to line up with!"];
        Image = FB_Vanessa;
    }
    
    Character = UnknownEnum.Value_162;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The inner machinations of Fritz' minds are an enigma to all but himself. He does not concern himself with things like \"a living wage\" or \"decent working conditions.\" In fact, nobody's quite sure what he wants out of this position, or where he even came from. It seems this strange-smelling man just wandered into the establishment one day, and, out of sheer desperation on the company's part, was hired on the spot. Of course, he intends to make the most of his opportunity graciously placed into his rat-like hands. As he gazes upon the restaurant's mascots, he ponders to himself... \"What is the true purpose of these machines? What makes them tick? What do they want from me? And how do I make them worse?\" While most would consider him mad, perhaps this is all just his own brand of brilliance...?", "If you're reading this, congratulations on beating Lunatic mode! I've actually never managed to get past night 5 on it myself, I needed the help of my playtesters to prove it was possible in the first place.\nAnyway, in regards to Fritz himself: When figuring out his characterization in this game, the only canon information we had to work off of was that he showed up while the building was in lockdown, deliberately tinkered with the animatronics to make them more dangerous, got fired within a single day, and also smelled awful. I think his design here communicates those traits well."];
        Image = FB_Fritz;
    }
    
    Character = UnknownEnum.Value_163;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The last living member of his family...although \"living\" might be a stretch. Having been around long enough to experience almost all of it firsthand, nobody is as familiar with the Fazbear brand's sordid history as he is. Despite being a rotting corpse, he's far from rotten to his core - in fact, he's given a lot to try and correct the misdeeds of the company. The odds that he can make things right are insurmountable...but he's defied death far too many times to give up now.", "Michael's design here actually predates a LOT of stuff in the game; For some reason, even with how much the general direction of the game changed over time, Michael has always been an important character in it through every iteration and has also pretty much looked exactly the same since the start. You can see this if you look at his concept art!"];
        Image = FB_Michael;
    }
    
    Character = UnknownEnum.Value_158;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Clad in a homemade rabbit costume, Vanny seeks to keep the Fazbear legacy alive by any means necessary - especially the worst parts of it. While always a big fan of horror movies and local legends ever since she was young, it wasn't until she learned of Freddy's that she went from a normal if a bit quirky girl to a full-on demented superfan. Former friends say she was never quite the same ever since she visited that horror attraction...", "Vanny has the unique distinction of being the only thing from Security Breach in the whole game, aside from Vanessa. I don't even dislike Security Breach! If anything I feel like its brighter goofier character designs would be perfect for a game like this, but this game having such a big focus on the classic era of FNaF unfortunately meant a lot of newer stuff needed to be left out. If I were to ever add more animatronics to this game or do some sort of followup, Security Breach and Secret of the Mimic would definitely be the first places I'd pull characters from."];
        Image = FB_Vanny;
    }
    
    Character = UnknownEnum.Value_167;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["The Boss just seemed to appear in Hurricane one day. Claiming to be a local entrepreneur who managed to strike it rich with his video game business, he was the only bidder interested in purchasing Fazbear Entertainment when it went up for sale - mostly because he figured it was a cheap way to make a quick buck. It seems no matter what trouble he lands himself in, be it his arrest just a week into his newfound ownership or the PR disaster that came with being the new face of such a controversial brand, nothing can stop him from scraping the bottom of the barrel if it means making a few extra cents. He's greedy and heartless - in other words, he's perfect for this company!", "Okay, yeah, you and I both know who this is SUPPOSED to be, especially if you've played the previous two games. While I wanted to avoid bringing in any non-FNaF-adjacent copyrighted characters for this entry, I couldn't NOT include who's arguably the most important character across both of the first two entries! Even if his role is much smaller here, I'm glad I found a way to sneak him in regardless."];
        Image = FB_TheBoss;
    }
    
    Character = UnknownEnum.Value_156;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Three cases of one, and one case of two. Fazbear Entertainment's brand image never did manage to recover once those children went missing - and it seems it was precisely that which led to its ultimate demise. Though the restaurant's fame may have faded as the years went on...the spirits of the children remain, powerless to do anything as the mechanical cages they were forever confined to withered away with age, growing colder, lonelier by the day.\n...That is until you came along.", "One of the few things that was present in the demo but scrapped in the final game was a cutscene with one of the missing children that'd you'd get if you met the requirements for what would ultimately become the Ultimate Route in the final game. This route probably underwent the most changes over the course of development and had the least clear direction at first - I do think what we ultimately settled on ended up being pretty cool, though it took a lot more time for us to get a grasp on what we wanted to do with it compared to Michael or Vanny's story routes."];
        Image = FB_MissingChildren;
    }
    
    Character = UnknownEnum.Value_126;
    
    with (ExtrasDatabase[Character])
    {
        Debut = "";
        Desc = ["", "The fact that this game is so goofy and unserious gave us a unique opportunity - namely, by setting the player's expectations so low, it meant that if we DID decide to put something deliberately creepy in the game, it would be way, WAY more effective. That was our whole philosophy behind Fredbear! We wanted him to feel like he was as out-of-place in this game as possible, not only for the aforementioned shock value, but also because it seemed appropriate for the route he was the final boss of. (Y'know, seeing as it's the one where you as a player have to go out of your way to defy the intended structure of the game.) Now, here's the thing: I can't actually 3D model. In fact, nobody on the development team at the time this idea was conceived really had the know-how to pull it off. My backup plan was to just make Fredbear 2D and puppet-animated like everyone else, just with more detailed, airbrush-shaded sprites, sorta like a Walten Files character...but luckily, we just so happened to know a guy who knew a guy, and that guy was Marco Antonio, who created Fredbear's model and did all his animations! I really have him to thank for Fredbear being as cool as he is here visually, his fight turned out even cooler than I could've imagined. (...And certainly a lot cooler than what I could've done if I had stuck with the original idea!)"];
        Jumpscares = [
        {
            JumpID: Character,
            JumpSprite: sJumpscare_Fredbear3D,
            JumpSide: 0,
            JumpSideVertical: -1
        }, 
        {
            JumpID: Character,
            JumpSprite: get_jumpscare(Character),
            JumpSide: 0,
            JumpSideVertical: -1
        }];
        Image = FB_Fredbear;
    }
    
    Character = UnknownEnum.Value_155;
    
    with (ExtrasDatabase[Character])
    {
        Desc = [global.UnlockedAnimatronics[UnknownEnum.Value_126] ? "An old piece of Fredbear memorabilia that has sustained quite a bit of wear and tear over the years, perhaps a sign that it was well-loved by its former owner. They must not have wanted to let it go." : "A psychic friend to all, this little plush loves company! Why not play with him again?", global.UnlockedAnimatronics[UnknownEnum.Value_126] ? "Congratulations on seeing every ending! I was a bit worried that people wouldn't wanna put up with playing through a game five whole times just to see everything (or heck, even just more than once), but I hope you had fun regardless :D We definitely tried our hardest to make it worth it!" : "...I mean it. Go on, keep playing!"];
        Image = FB_PsychicFriendFredbear;
    }
    
    Character = UnknownEnum.Value_128;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Every employee needs a good trainer, and that's especially true with how dangerous incompetence can be at Freddy Frickbear's Pizza. As such, the company's best night guards are rewarded with the secondary responsibility of advising new employees! Rumor has it that the tradition started with an especially eager employee decades ago, who took it upon himself to help his coworkers through the night, having picked up a wide range of tips and tricks thanks to his own storied history at the chain. Unfortunately, nobody who has come after him seems to quite have the knack for it that he did, especially with how few of them last much longer than one night. Cut them some slack - it's hard to talk and survive the night at the same time!", "I'm honestly not sure where the idea for the bit of Phone Guy dying every night came from. I think it might've been a similar thought process to the night guards early on where I couldn't settle on who I wanted them to be so I just made them multiple characters in one."];
        Image = FB_PhoneGuy;
    }
    
    Character = UnknownEnum.Value_129;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Mendo is a uniquely utilitarian creation of R&D, being designed to maximize function over form as a company-wide vendor for employees, always eager to assist. While primarily known as the friendly virtual endoskeleton seen in the shop systems of employees' tablets, there is actually a singular physical Mendo animatronic out there, being the one who processes all transactions made through the system. While few have seen this physical Mendo, fewer knowing where exactly he's being housed, rumors spread among employees have conjured visions of a being more server than an animatronic, a giant machine bound by thousands of cables, devoid of all but the desire to serve. In that way, he's the company's perfect employee.", "I wanted to use this description to thank my buddy Zizou for introducing me to the lerp function in GameMaker, which is what's used to achieve the cool bouncy effect a lot of characters' animations have. The same thing is used for a lot of the shopkeepers in Gimmiko, which was a direct inspiration for how Mendo's animated here! You should go check out Gimmiko, by the way. I don't know if it's out by the time you're reading this, but if it is, go buy it. If it isn't, go wishlist it. There's a surprising amount of overlap in people involved with that game and people involved with this one!"];
        Image = FB_Mendo;
    }
    
    Character = UnknownEnum.Value_130;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Once a simple Candy Cadet, this vendor bot found himself narrowly avoiding certain doom when his original location went up in flames. In the heat of the moment, he grabbed any loose pieces of company property he could get his claws on and hightailed it out of there. With a new lease on his artificial life, he decided dispensing candy wasn't doing enough good for the world - and so, from that day forward, he decided to become an upgrade salesman, rolling from location to location, offering the trinkets he's gathered to anyone willing to pay. Much to the company's chagrin, it seems a lot of the property he saved was property they would've rather been lost in the fire.", "The upgrade system actually wasn't conceptualized until around halfway through the game's development, shortly after the demo was finished and released - we figured there should be a better use for the money you get from salvages than just being a number that goes up, so the upgrade system was added to be that use, as well as to add a bit of extra variety to repeat playthroughs. (And repeat playthroughs are what this whole game is designed around, so anything to spice them up is welcome!) Candy Cadet was one of a few characters we had considered as the shopkeeper to sell these upgrades, though I think we ended up settling on him just because the other FNaF shopkeepers (i.e. Lolbit and Mendo) were better fits for the office shop instead, and Candy Cadet not only stood out the most but was also our personal favorite of any remaining options. Maybe in another universe, Gumball Swivelhands could've been the one manning the upgrade shop instead..."];
        Image = FB_UpgradeCadet;
    }
    
    Character = UnknownEnum.Value_154;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["These heavy-footed hunks of metal lurk in the abandoned Freddy's locations, making sure any trespassers who get a little too greedy are properly dealt with. With the eyes of a hawk and auditory sensors so fine-tuned that they can pick up even your smallest movements (which is impressive, considering none of them have ears), you'd be wise to steer clear of them if you hear one nearby. That being said, they are also fair - once a perpetrator is caught, they'll most likely just be let off with a small fine.", "Endo Chaser is the last remnant of an idea I had SUPER early on in development - Originally the 3D salvage sections were going to be randomly-generated mazes that you'd have to run through, with the idea being that you had to grab as many valuable items around the building as possible to make money while being chased down by the animatronics inside of it. Even if it was scaled back, I'm glad this idea still made it into the final game to some extent!"];
        Image = FB_EndoChaser;
    }
    
    Character = UnknownEnum.Value_157;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Oh hey, that's me!", "A funny thing about this game is that despite releasing after the second movie, pretty much everything about it and its plot was already set in stone long before it released, meaning Charlie isn't anything like her movie counterpart in regards to her personality OR her design here. The same goes for a lot of other characters in the game. (Though, for the record, Mike and Michael were always planned to be two seperate characters in this game from the very start of its development, so I kinda called that.)"];
        Image = FB_Charlie;
    }
    
    Character = UnknownEnum.Value_200;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["An essential fixture of any self-respecting office! Watch the fingers.\n\nYou unlocked this by filling in every gallery entry. Congratulations!", "This entry wasn't originally intended to be in the game, but Zach made a fan icon so we'd have something to represent overheat deaths in the stats menu and from there I thought it'd be funny to throw it in the character gallery as a bonus for getting all the other gallery entries. Plus, it doubles as a quirky little FNAF World reference!\n\nNow, there may or may not be one more secret gallery entry that can be unlocked by 100%ing the whole game... If you're up to the challenge, try finding it!"];
        Image = FB_Fan;
    }
    
    Character = UnknownEnum.Value_169;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["Henry was once just a lowly software developer, barely scraping by with his startup brand EmilySoft, desperately searching for a way he could turn his rudimentary arcade games into a living for himself. Fortunately, a chance meeting with a roboticist exhibiting his inventions at a local amusements expo would soon become a lifelong business partnership, and the eventual creation of Freddy Fazbear's Pizza! Even after tragedy after tragedy, including the death of his daughter and the disappearance of that business partner, he seems to be determined to keep the company alive at all costs - including but not limited to the reputation of the brand and the safety of his employees. Some say he's just sentimental to an unhealthy degree, but could there be a deeper reason...?", "There was a point in time where we were considering making Henry a bit more Morally Gray and having him be the one willingly cutting every corner he can just to keep the company alive for as long as possible... At one point, we were even considering making him the true identity of Fredbear! However, as you can probably tell, these ideas were scrapped pretty early on."];
        Image = FB_Henry;
    }
    
    Character = UnknownEnum.Value_170;
    
    with (ExtrasDatabase[Character])
    {
        Desc = ["A shrewd businessman and brilliant roboticist, William Afton is one of the two minds that originally founded the Freddy's brand. While his contributions to the company are unquantifiable, current management tends to sweep him under the rug - both due to the many accounts of his generally unpleasant demeanor, and the bad PR that came with his sudden disappearance in the mid-90's. Despite how employees describe him, he actually seemed to get along great with the kids!", "This is technically like the fifth variant of William that gets its own extras menu page."];
        Image = FB_William;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_165])
    {
        Desc = ["Clark Fixy is an old employee of Fazbear's, having quit shortly before the buyout. He actually ENJOYED his job at first, and especially enjoyed working alongside Henry Emily, but...Well, you know how things go. The company crumbled, degrading over time and compromising safety just to stay in the green... Though Clark held some hope with Henry at the helm, any optimism he had was snuffed once management shifted hands. Rumor has it he was planning to make an expose on the company, wishing to not let its image be dragged through the mud anymore... But, suddenly, the building where he was safekeeping his documents caught ablaze, with seemingly no trace of his work. Nowadays, he simply works as a general technician for hire rather than being employed by Fazbear's specifically...Though they are his main customers. Few technicians still willing to work with them have as much experience with Fazbear's handiwork, after all.", "Clark Fixy came about in the SUPER early days of Frickbear's 3's development as a gag character who you could call to remove animatronics. While I wasn't seriously considering adding him in at the time, I did add his name at the end of a couple employee memos as a cute little homage to the idea. ...But over time, we began adding even more cute little homages. Zach made a hypothetical human design for him. Then we made him a reoccurring character across the employee memos and tied him to the evil route quest. Then we gave him an integral role as the person who put the Talbert Files together for the ultimate route. Then we actually had him show up in the ultimate credits. Then we made him a full-on playable character. Wouldn't be the only time a one-off gag character wound up becoming an incredibly important one over time!"];
        Image = FB_ClarkFixy;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_166])
    {
        Desc = ["Fredsweeper Frank was once just another patron of Fredbear's Family Diner, often coming in just to play the arcade cabinets for hours at a time. While he never had particularly ambitious career prospects, he was actually approached for a job at Fredbear's one day - namely, as an emergency janitor! He's been working at the chain ever since, being sent on various oddjobs by the company... though he often uses his position to sneak a couple games in on the arcade cabinets in the back closet when his bosses aren't looking. The company really shouldn't have told him how to give himself infinite credits!", "If you see the notes on Fredsweeper Frank's concept art, you'd see that his vest was actually supposed to be gray in Zach's original design. (You'd also notice that what became his spikey hair was actually just a misinterpretation of the two arrows pointing at the back of his head. Oops!) IN MY DEFENSE, while this WAS a mistake at first, his name IS Fredsweeper Frank, and Fredsweeper is green. MINESWEEPER is gray, so really, Frank SHOULD be green. It also means him and Clark get to have cute matching outfits. It's appropriate considering both of them originated as gag characters who were never meant to appear outside of their names being mentioned offhandedly in employee memos."];
        Image = FB_FredsweeperFrank;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_164])
    {
        Desc = ["What started as a flicker of interest in the mind of this peppy new QA tester had soon turned into a full-on obsession. An obsession that turned into a downward spiral - one that cost her her family, her friends, her job - until her obsession was all that she was left with. It was only in her last breath, with a metallic coil pierced through her chest, that Vannabelle had finally become herself again.", "Vanny was never even intended to take off her mask at first, but I'm glad we changed our minds! I think it's really awesome how popular Vannabelle wound up being after the base game released, given she only appears like...twice throughout the entire thing, compared to her masked Vanny self who gets a gazillion lines of dialogue and a bunch of different talk sprites. Maybe it's a little strange that only her unmasked self gets to be playable here while Michael keeps the exact same appearance between his base game and Four Layers Down appearances...but I think it's what the people would've wanted anyway."];
        Image = FB_Vannabelle;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_171])
    {
        Desc = ["Edwin Murray is the CEO of the eponymous Murray's Costume Manor, a company closely related to Fazbear's in its earliest years. If it wasn't evident from the mechanical masterpiece that is the Mimic, his engineering ingenuity is unrivaled, and his work ethic is nothing to scoff at! ...But when you give so much of yourself to your work, what does that leave you with? What does that leave for your loved ones? What does that leave for you when you don't have them anymore?\n...And how do you handle your rage when you can't bury yourself in that work anymore?", "There were quite a few contenders for a Secret of the Mimic guard - Arnold was the most obvious pick, although he felt a little basic, and we sorta struggled coming up with a fun mechanic for him. The Mimic itself was also considered, and it probably would've had a mechanic along the lines of randomly selecting another guard's gimmick to steal...although it wound up making it in as an enemy instead. Lastly was Edwin, who seemed like the best pick given his importance to the overall story and, most importantly, the potential for funny interactions with the other characters he had. His bowtie was made orange to match the Mimic's eyes! (Also because purple ties are more William's thing and it meant him and Henry could both be orange inventor guys with purple partners.)"];
        Image = FB_Edwin;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_172])
    {
        Desc = ["For what Edwin had in technical prowess, he sadly never could match his father when it came to designing appealing characters clients would actually want to buy costumes of...so it's fortunate for him that Fiona had come along! In a company largely only run by corporate suits and salesmen, Fiona brought a creative spark and artistic vision that MCM - and especially Edwin - were in desperate need of. Despite the story the company tries to peddle these days, many of Fazbear's most famous characters were first conceptualized by her! For all the tragedies that have transpired to taint the image of these characters in many's minds, it's thanks to her that they still manage to win over the hearts of so many... Do you think she would've been happy to see how far they've come?", "I feel like Fiona hasn't gotten much attention in fanworks, although to be fair that may just be because she's so new. Regardless, I thought she deserved to be here! Her being here alongside Henry, William and Edwin means the whole Fazbear Founder Quartet is in here together, which also meant I got to be cute and make each of their masks correspond to one of the four prototype springlock suits from SotM, much like how the main four guards correspond to the main four animatronics."];
        Image = FB_Fiona;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_176])
    {
        Desc = ["If you were to ask Mike's little sister what her ideal weekend would be, it wouldn't deviate from your average brooding teenager. Swing by the local graveyard, scare her brother half to death, watch her favorite ghost show \"Spectral Scoopers\", and maybe entertain the idea of the occult if she has time. You see, Mary's childhood was not an easy one. After the tragic loss of her mother, and subsequently traumatizing happenings at her local diner, Mary began to find relief in the macabre. What began as a brief fascination while channel surfing quickly grew into what therapists would call an \"identity crisis\". She would go on to become a frequent subscriber to Hurricane Horrors, and have one of her submissions used as evidence in court against an escaped felon. And while these activities would often bring many a clutched pearl from her Aunt Jane, Mary was more than content in her morbid little moments. Absent from fear, reflections, or judgement, she was content in the solemn company of the dead.", "This game's Mary Schmidt is essentially Mary Schmidt from FNaC3, Marylin Schmidt from FNaC2 and Abby from the FNaF movie all mixed together into one character. Her initial characterization was greatly influenced by the fact that I went to see Beetlejuice: The Musical shortly before we started writing her dialogue, although her actual writing was almost entirely handled by Cario. She also DOES technically appear in the base game, even if in an incredibly minor way - though if you've beaten the ultimate route as Mike, you probably know that already."];
        Image = FB_Mary;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_174])
    {
        Desc = ["Cassie's always been hard up for company. She's struggled to make connections in school, and not even her dad pulling some strings to throw her parties at the hottest megamall in town could bring people in... But that's not to say she has no friends at all! She became fast friends with Gregory, a fellow outcast with ambition too grand for any parent wrangle, and an attitude only Cassie would be kind enough to have the patience for. There's nothing Cassie wouldn't do to help a friend... But maybe she should learn to help herself first.", "Cassie was mainly added to fulfill a mechanical niche! As we were figuring out guard mechanics I quickly realized that a lot of guards' abilities rewarded staying in the cams while very few rewarded staying in the office. Cassie's ability was included to help correct that! The ability was actually thought up first, though Cassie wound up being a pretty natural fit since no other character in the series really has the close association with masks that she does. Plus, she IS another actual FNaF protagonist, and a pretty unique one at that!"];
        Image = FB_Cassie;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_173])
    {
        Desc = ["Poor Elizabeth could never catch a break! For as many gifts as her father showered her with, he was never truly there for her when it mattered most - which ultimately wound up behind her demise. The events leading up to her death being quickly covered up, and the opening day of Circus Baby's Pizza World having faded out of public consciousness almost as quickly as it appeared, Elizabeth was left to be forgotten, trapped inside the very animatronic her father had made for her for decades. It's hard to say how much of her was left once Baby had finally been retrieved.", "Unlike the animatronic roster, the guard roster was pretty much completely set in stone for the majority of 4LD's development - with the sole exception of Elizabeth, who was added as the 21st guard only about two months before release. It didn't feel right leaving her out when every other member of the Afton family got to have a major role in the game (save for Ms. Afton I guess, but not like that's anything new), and I also felt like the Eleanor challenges didn't play a big enough role in the game, so Elizabeth's inclusion solved both of those problems at once! (Her inclusion was also mostly because of EllisBros, she pitched Elizabeth just being a bonus extras menu entry you could get for 100% completion like how Henry and William were in the base game but that idea eventually evolved into making her a full-on playable character.)"];
        Image = FB_Elizabeth;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_175])
    {
        Desc = ["People make a lot of scalding accusations about Hudson's past. They say the house fire wasn't natural, and there's only one man who could've started it. But to Hudson, these are all just baseless accusations. Sure, he doesn't remember his childhood that well, but it's not like they were there! He experienced it all firsthand, yet they pretend to know what happened so well. They could never understand what he went through in that house. The house just so happened to catch fire... And, to Hudson, nothing of value was lost.", "Hudson was really the only new guard designed with the same philosophy as the original four. The idea of each guard lining up with an animatronic was mostly dropped for the new ones, though not for Hudson - his hair color and general build are meant to line up with Springtrap! I felt like it was appropriate, especially since Hudson was briefly considered to be one of the base guards before Vanessa and Fritz won out."];
        Image = FB_Hudson;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_168])
    {
        Desc = ["Billy is a plucky stick figure of indeterminate age, as well as one of the first employees of Frickbear Entertainment after the Boss took over. He's a simple guy! And you'd be a fool to think less of him for it, because once he sets his mind on something, there's nothing that'll stop him. Just don't ask Billy about his favorite show- You won't be able to get him to shut up.", "Given the amount of people who assumed the 3 at the end of this game's title was just for show, I wouldn't blame anyone for having no idea who the heck this guy is supposed to be. The real ones, however, should know. Billy seemed like a natural fit, since his inclusion meant every protagonist throughout the entire Frickbear's series could be playable in one place - however, we really struggled coming up with a mechanic for him! You'd naturally think something that makes the game play more like Frickbear's 1 would make sense, but the problem with that is that this series' base mechanics have stayed pretty much exactly the same SINCE Frickbear's 1. The TV mechanic was ultimately decided on just because I felt like the FredTV upgrade was cool enough to justify theming an entire guard around. Plus, Billy DOES love his TV shows!"];
        Image = FB_Billy;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_177])
    {
        Desc = ["Paranoid. Alert! SPORADIC! These words describe Strings, full name Sec-Strings, who was once a lifeless dreamcatcher doll, made by a man riddled with paranoia to fend off his own night terrors. As his worries tore his life apart, he sought advice, any kind of guidance, anyone to simply listen to him... and from that desire, Strings gained sentience. But Strings was not the objective, perfect problem solver he desired - Strings was curious, and the endless possibilities of life overwhelmed him, unable to act or advise without considering every little possibility... and Strings found himself wrought with the same paranoia as his creator. Though relegated to a security droid, Strings never was stripped of his sentience... nor his curiosity. And as he learned the full origins of his creation, Strings learned to keep one lesson close to his chassis: Paranoia is no excuse for cowardice.", "Strings was pretty close to being cut in favor of other guards...although we decided to squeeze him in anyway after seeing the surprising amount of fan demand for him. His personality's based on his sticky notes from the original Popgoes, and him being generally anxious and sporadic is based on the fact that he has a dedicated panic meter."];
        Image = FB_Strings;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_178])
    {
        Desc = ["While the Pal Percy has managed to assert itself as a household name and widely beloved toy in the modern day, few know how it came to be - and even fewer know who the heck the funny-looking dog on some of the older models was supposed to be. This illusive mascot was Sally, the snarky, foul-mouthed older sister to the much better known Percy Poodle. Her animatronic self is certainly a little peeved her brother got all the spotlight, although maybe less so after seeing what eventually had become of him.", "Sally is one of the few lasting remnants of Four Layers Down's original plans to include characters from a bunch of other fangames and FNaF-adjacent projects. Over time we cut back on these ideas because there were already so many characters just from the official FNaF games to cover, and Sally WAS on the verge of being cut quite a number of times...but I would've felt bad for scrapping her after I told Fazie I'd put his OC in the game, so she wound up surviving to the final iteration of the game after all. She may also be the most obscure character inclusion in the game - even if you meet the prerequisite of having played Playtime with Percy, chances are you'd have no idea who she is anyway considering how minor her role in it is! (She's the character who appears on the Early Model Pal, by the way.)"];
        Image = FB_Sally;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_179])
    {
        Desc = ["The Old Man had a routine. It was a simple routine, but it was his. Time was an afterthought in this plane, so he was more than content to judge his actions based on the roaring of the waves. When the waves were still, the fish weren't biting. So he'd frequent the grounds he'd walked a million times. Thoughts would run through his head as he'd pillage only the necessities from the frivolous landscape he'd used for repentance. Thoughts of handmade bobbers, crafted from the plush wastes of an unloved toy. Memories of the same toy being passed from hand to hand, finding care in the arms of the young. And the dreadful reminders of the same avarice that had brought this damning upon himself.\nThese thoughts would only be broken by the thrashing of waves, as the Old Man was called upon by his simple hobby once again. He had no use for the fish, but it served as a reminder for his duties on the flipside. Catch and release. He'd hook the fish, then watch as they swam away from shore as he released them. Soon after, he'd greet any soul unfortunate enough to meet their time and release them to the Angel. Then he'd catch a glimpse at the same tower they would scale to meet them...and he'd release any hopes at redemption for the sins he amounted to over his rapacity during his time alive.\nThe Old Man had a routine. It was a routine built by the consequences of his actions. A self-induced punishment that had been forged by penance and loathing. It was a simple routine, and it was his to break.", "Congratulations on seeing Four Layers Down through to the end! There's no way we WOULDN'T find some way to include Old Man Consequences, given how big of a deal he is and how much of a FNAF World bias this game has already - although I can't imagine many people were expecting him to basically be the main character of this update. A big part of it is also that this game's main inspiration as a whole is Ultimate Custom Night, which is the OTHER game Old Man Consequences plays a notable role in! I'd also say his design here is a pretty far departure from what I typically see in other fanworks; While it's common to interpret his sprite as either a pretty normal-looking cartoon alligator guy or a Scary Demon From Hell, I thought it'd be cool to go for something in between while also making his design a very literal interpretation of his sprite's head shape. The cloak was included to add to his mystique, and also just because old guys in big raggedy cloaks are cool."];
        Image = FB_OldManConsequences;
    }
    
    with (ExtrasDatabase[UnknownEnum.Value_201])
    {
        Desc = ["\"Who are you? The predominant concept of self, thrust upon one by the mass known only as what came before, is an ineffable notion. Whoever attempts dissimulation of these ideals, knows it serves as nothing more than to rattle a spirit which longs to burn like wildfire. This steadfast facade you believe to don, it does nothing to guard your truest of intentions. I see all that you are, and all that you pretend to be. Oneself is a truth all deny, for they want not to conjure another's ire. To be caught in the company of what is to be believed... Feeble. Frail. Pathetic. But all is vanity. So who are you? You are yourself. There's no one else you could be. Birthed into a righteousness twisted by a being with no alias. Deny not what you are, and through my words embrace what it is that you soon shall be... Worthy. Graceful. Beautiful. My being is a visage you will know but once. This life that has been so zealously thrust into your waking palms is yours to hold, and mine to admire. You will know it for as long as you will know yourself, then for longer and longer yet. You define yourself as you have defined myself. I, who have cradled your soul since inception. I, who will guide you towards the end as a shepherd does their lamb. Who am I? I am you. You are me. And I love you.\"\n\n...I didn't write this one.", "Great work achieving 100% completion! (Hopefully it's a lot easier now that some of the meaner custom night challenges are no longer required for it.) I sincerely hope you enjoyed this game - and you know I'm sincere because I'm writing this quite literally the day before release! This isn't your ONLY surprise, though... Go check the sound test for your REAL reward!"];
        Image = FB_Angel;
    }
    
    exit;
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
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_90,
    Value_118 = 118,
    Value_119,
    Value_120,
    Value_121,
    Value_122,
    Value_123,
    Value_124,
    Value_125,
    Value_126,
    Value_127,
    Value_128,
    Value_129,
    Value_130,
    Value_131,
    Value_132,
    Value_133,
    Value_134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_139,
    Value_140,
    Value_141,
    Value_142,
    Value_143,
    Value_154 = 154,
    Value_155,
    Value_156,
    Value_157,
    Value_158,
    Value_159,
    Value_160,
    Value_161,
    Value_162,
    Value_163,
    Value_164,
    Value_165,
    Value_166,
    Value_167,
    Value_168,
    Value_169,
    Value_170,
    Value_171,
    Value_172,
    Value_173,
    Value_174,
    Value_175,
    Value_176,
    Value_177,
    Value_178,
    Value_179,
    Value_200 = 200,
    Value_201
}
