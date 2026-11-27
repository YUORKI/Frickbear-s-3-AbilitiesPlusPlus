YOffset = 600;
EarningAmount = string_format(global.RunEarningsTotal, 1, 2);
TimeAmount = format_as_timer(global.RunTime, false);

if (global.RunEarningsTotal > global.RunEarningsBest)
    global.RunEarningsBest = global.RunEarningsTotal;

if (global.RunSpeedBest > global.SavedTime)
    global.RunSpeedBest = global.SavedTime;

global.UnlockedMinigames[UnknownEnum.Value_8] = true;
FaceSprites = import_sprites("icon.png", sCustomNightGuardFaces);

function generate_tiles(arg0)
{
    global.AllTimeSalvages = [];
    
    for (var i = 0; i < arg0; i++)
        array_push(global.AllTimeSalvages, i);
}

var TextOrder = "NECimndlesghtuo1234567890 PaFBRuVcry!R";
FontNightOpening = font_add_sprite_ext(sFontNightOpening, TextOrder, true, 4);
Victory = lives_left() > 0;
MusicPlaying = -1;
audio_stop_all();

if (Victory)
{
    audio_play_sound(sfxChildrenCheering, 10, false);
    MusicPlaying = play_music(musEndlessWin);
}
else
{
    audio_play_sound(sfxSwoosh, 10, false);
    MusicPlaying = play_music(musShop_Seedy);
}

ChoiceMade = 0;
StickersEarned = 0;
VoiceLine = -1;
VoiceLineStarted = false;
RoomDestination = title_screen();

if (Victory)
{
    save_endless_data(EndlessShopSelection);
    var MaskChars = 0;
    var TurnaroundChars = 0;
    
    for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
    {
        var ID = global.AllTimeSalvages[i];
        
        if (global.Difficulty > global.EndlessStickers[ID])
        {
            global.EndlessStickers[ID] = global.Difficulty;
            StickersEarned++;
        }
        
        if (array_contains(get_animatronic_data(ID).DefenseProcedure, "Mask"))
            MaskChars++;
        
        if (array_contains(get_animatronic_data(ID).DefenseProcedure, "Turnaround"))
            TurnaroundChars++;
    }
    
    var BestSticker = 4;
    
    for (var i = 0; i <= 90; i++)
    {
        if (global.EndlessStickers[i] < BestSticker)
            BestSticker = global.EndlessStickers[i];
    }
    
    if (BestSticker >= 0)
    {
        get_trophy(UnknownEnum.Value_51);
        
        if (BestSticker >= 1)
        {
            get_trophy(UnknownEnum.Value_52);
            
            if (BestSticker >= 2)
            {
                get_trophy(UnknownEnum.Value_53);
                
                if (BestSticker >= 3)
                {
                    get_trophy(UnknownEnum.Value_54);
                    
                    if (BestSticker >= 4)
                        get_trophy(UnknownEnum.Value_61);
                }
            }
        }
    }
    
    var ThisGuardsSticker = global.EndlessGuardStickers[global.TrueAbilityIndex[global.Guard]];
    global.EndlessGuardStickers[global.TrueAbilityIndex[global.Guard]] = max(ThisGuardsSticker, global.Difficulty);
    BestSticker = 4;
    
    for (var i = 0; i < 21; i++)
    {
        if (global.EndlessGuardStickers[i] < BestSticker)
            BestSticker = global.EndlessGuardStickers[i];
    }
    
    if (BestSticker == 4)
        get_trophy(UnknownEnum.Value_62);
    else if (BestSticker == 0)
        get_trophy(UnknownEnum.Value_48);
    
    get_trophy(UnknownEnum.Value_47);
    
    if (global.Difficulty >= 4)
        get_trophy(UnknownEnum.Value_49);
    
    unlock_guard(UnknownEnum.Value_3);
    
    if (global.EndlessGuardStickers[UnknownEnum.Value_0] > -1 && global.EndlessGuardStickers[UnknownEnum.Value_1] > -1 && global.EndlessGuardStickers[UnknownEnum.Value_2] > -1 && global.EndlessGuardStickers[UnknownEnum.Value_3] > -1)
        unlock_guard(UnknownEnum.Value_16);
    
    if (count_up_stickers(global.EndlessGuardStickers, true, 21) >= 10 || global.Difficulty >= 2)
        unlock_guard(UnknownEnum.Value_4);
    
    if (count_up_stickers(global.EndlessStickers) >= 40)
        unlock_guard(UnknownEnum.Value_5);
    
    if (count_up_stickers(global.EndlessStickers) >= 91)
        unlock_guard(UnknownEnum.Value_10);
    
    if (MaskChars >= 5)
        unlock_guard(UnknownEnum.Value_15);
    
    if (TurnaroundChars >= 5)
        unlock_guard(UnknownEnum.Value_18);
    
    if (array_contains(global.AllTimeSalvages, UnknownEnum.Value_73))
        unlock_guard(UnknownEnum.Value_12);
    
    if (global.Deaths == 0 && global.Difficulty >= 2)
        unlock_guard(UnknownEnum.Value_11);
    
    if (global.Guard < 21)
        global.UnlockedAnimatronics[global.Guard + UnknownEnum.Value_159] = true;
}

if (count_up_stickers(global.EndlessGuardStickers, true, 21) >= 20 && !global.UnlockedGuards[UnknownEnum.Value_20])
    RoomDestination = OMCUnlock;

alarm[1] = Victory ? 60 : 30;
application_surface_draw_enable(true);
save_permanent_data();
SubtitleList = [];
SubtitleTimingList = [];
SubtitleEntry = 0;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_8 = 8,
    Value_10 = 10,
    Value_11,
    Value_12,
    Value_15 = 15,
    Value_16,
    Value_18 = 18,
    Value_20 = 20,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_51 = 51,
    Value_52,
    Value_53,
    Value_54,
    Value_61 = 61,
    Value_62,
    Value_73 = 73,
    Value_159 = 159
}
