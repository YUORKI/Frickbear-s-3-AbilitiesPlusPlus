WindowOffset = -360;
StatsMenu = 0;
StatSurf = -1;

function completion(arg0, arg1)
{
    return $"{arg0}/{arg1} ({floor((100 * arg0) / arg1)}%)";
}

function get_stats(arg0)
{
    StatsArray = [];
    MenuScroll = 0;
    BarHeld = false;
    
    switch (arg0)
    {
        case 0:
            var TotalRuns = 0;
            
            for (var i = 0; i < array_length(global.ClearedEndings); i++)
            {
                for (var j = 0; j < array_length(global.ClearedEndings[i]); j++)
                    TotalRuns += global.ClearedEndings[i][j];
            }
            
            var Total4LDRuns = 0;
            
            for (var i = 0; i < array_length(global.RunsAttempted); i++)
            {
                for (var j = 0; j < array_length(global.RunsAttempted[i]); j++)
                    Total4LDRuns += global.RunsAttempted[i][j];
            }
            
            var Won4LDRuns = 0;
            
            for (var i = 0; i < array_length(global.RunsWon); i++)
            {
                for (var j = 0; j < array_length(global.RunsWon[i]); j++)
                    Won4LDRuns += global.RunsWon[i][j];
            }
            
            var CompletionData = completion_checks();
            var Collections = 
            {
                _Endings: CompletionData.EndingsUnlocked,
                _Animatronics: CompletionData.AnimatronicsUnlocked,
                _GalleryPages: CompletionData.PagesUnlocked,
                _Minigames: CompletionData.MinigamesUnlocked,
                _Trophies: CompletionData.TrophiesUnlocked,
                _CNChallenges: CompletionData.ChallengesUnlocked,
                _Stickers: CompletionData.StickersUnlocked,
                _Guards: CompletionData.GuardsUnlocked,
                _GuardStickers: CompletionData.GuardStickersUnlocked
            };
            var Totals = 
            {
                _Endings: CompletionData.EndingsTotal,
                _Animatronics: CompletionData.AnimatronicsTotal,
                _GalleryPages: CompletionData.PagesTotal,
                _Minigames: CompletionData.MinigamesTotal,
                _Trophies: CompletionData.TrophiesTotal,
                _CNChallenges: CompletionData.ChallengesTotal,
                _Stickers: CompletionData.AnimatronicsTotal,
                _Guards: CompletionData.GuardsTotal,
                _GuardStickers: CompletionData.GuardsTotal
            };
            var Completions = 
            {
                _Endings: Collections._Endings / Totals._Endings,
                _Animatronics: Collections._Animatronics / Totals._Animatronics,
                _GalleryPages: Collections._GalleryPages / Totals._GalleryPages,
                _Minigames: Collections._Minigames / Totals._Minigames,
                _Trophies: Collections._Trophies / Totals._Trophies,
                _CNChallenges: Collections._CNChallenges / Totals._CNChallenges,
                _Stickers: Collections._Stickers / Totals._Stickers,
                _Guards: Collections._Guards / Totals._Guards,
                _GuardStickers: Collections._GuardStickers / Totals._GuardStickers
            };
            var OverallCompletion = 0;
            OverallCompletion += (Completions._Endings * 20);
            OverallCompletion += (Completions._Animatronics * 10);
            OverallCompletion += (Completions._GalleryPages * 10);
            OverallCompletion += (Completions._Minigames * 10);
            OverallCompletion += (Completions._Trophies * 10);
            OverallCompletion += (Completions._CNChallenges * 5);
            OverallCompletion += (Completions._Stickers * 10);
            OverallCompletion += (Completions._Guards * 5);
            OverallCompletion += (Completions._GuardStickers * 20);
            OverallCompletion = floor(OverallCompletion);
            var RecordHolder = 0;
            var Tie = false;
            
            for (var i = 1; i < array_length(global.DeathRecord); i++)
            {
                if (global.DeathRecord[i] > global.DeathRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.DeathRecord[i] == global.DeathRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostLethal = Tie ? "---" : $"{global.Descriptions[RecordHolder][0]} - {global.DeathRecord[RecordHolder]} {(global.DeathRecord[RecordHolder] == 1) ? "Death" : "Deaths"}";
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.SalvageRecord); i++)
            {
                if (global.SalvageRecord[i] > global.SalvageRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.SalvageRecord[i] == global.SalvageRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostSalvaged = Tie ? "---" : $"{global.Descriptions[RecordHolder][0]} - Salvaged {global.SalvageRecord[RecordHolder]} {(global.SalvageRecord[RecordHolder] == 1) ? "Time" : "Times"}";
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < 16; i++)
            {
                if (global.TokensPerMinigame[i] > global.TokensPerMinigame[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.TokensPerMinigame[i] == global.TokensPerMinigame[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostPlayed = Tie ? "---" : $"{get_minigame_data(RecordHolder).Name} - {global.TokensPerMinigame[RecordHolder]} {(global.TokensPerMinigame[RecordHolder] == 1) ? "Token" : "Tokens"} Earned";
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.UpgradeRecord); i++)
            {
                if (global.UpgradeRecord[i] > global.UpgradeRecord[RecordHolder])
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (global.UpgradeRecord[i] == global.UpgradeRecord[RecordHolder])
                {
                    Tie = true;
                }
            }
            
            var MostBought = Tie ? "---" : $"{get_upgrades(RecordHolder).Name} - Purchased {global.UpgradeRecord[RecordHolder]} {(global.UpgradeRecord[RecordHolder] == 1) ? "Time" : "Times"}";
            RecordHolder = 0;
            Tie = false;
            
            for (var i = 1; i < array_length(global.RunsAttempted); i++)
            {
                if (count_up(global.RunsAttempted[i]) > count_up(global.RunsAttempted[RecordHolder]))
                {
                    RecordHolder = i;
                    Tie = false;
                }
                else if (count_up(global.RunsAttempted[i]) == count_up(global.RunsAttempted[RecordHolder]))
                {
                    Tie = true;
                }
            }
            
            var MostPlayedGuard = Tie ? "---" : $"{global.Descriptions[RecordHolder + UnknownEnum.Value_159][0]} - {count_up(global.RunsAttempted[RecordHolder])} {(global.RunsAttempted[RecordHolder] == 1) ? "Run" : "Runs"} Played";
            var WinRate = Won4LDRuns / Total4LDRuns;
            show_debug_message($"ATTEMPTED: {Total4LDRuns} ; WON: {Won4LDRuns}");
            StatsArray = [["Playtime", string(format_as_timer(global.Playtime))], ["Game First Opened", global.GameFirstOpened], ["Deaths", string(count_up(global.DeathRecord))], ["Playthroughs Completed (Frickbear's 3)", string(TotalRuns)], ["Runs Attempted (Four Layers Down)", string(Total4LDRuns)], ["Runs Won (Four Layers Down)", string(Won4LDRuns)], ["Victory Rate (Four Layers Down)", string(floor(100 * WinRate)) + "%"], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Deadliest Animatronic", MostLethal], ["Favorite Animatronic", MostSalvaged], ["Favorite Minigame", MostPlayed], ["Favorite Upgrade", MostBought], ["Favorite Guard", MostPlayedGuard], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Fastest Completion", format_as_timer(global.RunSpeedBest, false)], ["Biggest Paycheck", "$" + string_format(global.RunEarningsBest, 1, 2)], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Endings Seen (Frickbear's 3)", completion(Collections._Endings, Totals._Endings)], ["Animatronics Found", completion(Collections._Animatronics, Totals._Animatronics)], ["Minigames Unlocked", completion(Collections._Minigames, Totals._Minigames)], ["Gallery Entries Unlocked", completion(Collections._GalleryPages, Totals._GalleryPages)], ["Trophies Collected", completion(Collections._Trophies, Totals._Trophies)], ["Custom Night Challenges Beaten", completion(Collections._CNChallenges, Totals._CNChallenges)], ["Guards Unlocked (Four Layers Down)", completion(Collections._Guards, Totals._Guards)], ["Animatronic Stickers Gotten (Four Layers Down)", completion(Collections._Stickers, Totals._Stickers)], ["Guard Stickers Gotten (Four Layers Down)", completion(Collections._GuardStickers, Totals._GuardStickers)], ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", " "], ["Total Completion", $"{OverallCompletion}%"]];
            var MinigameStats = [];
            
            for (var mg = 15; mg >= 0; mg--)
            {
                var MinigameInfo = get_minigame_data(mg);
                var Entry = global.UnlockedMinigames[mg] ? [$"Hi-Score: {MinigameInfo.Name}", $"{timer_based_minigame(mg) ? format_as_timer(global.HiScoresOverall[mg], true) : global.HiScoresOverall[mg]}"] : ["Hi-Score: ???", "---"];
                array_insert(StatsArray, 17, Entry);
            }
            
            TextHeight = (array_length(StatsArray) * 14) + 8;
            break;
        
        case 1:
            MaxValue = 1;
            
            for (var i = 0; i <= UnknownEnum.Value_127; i++)
            {
                if (global.Descriptions[i][0] == "UNKNOWN")
                    continue;
                
                var CharValue = i;
                var KillValue = global.DeathRecord[i];
                
                if (is_nonlethal(i) && i != UnknownEnum.Value_19)
                    continue;
                
                if (CharValue == UnknownEnum.Value_19)
                    CharValue = UnknownEnum.Value_128;
                
                if (KillValue > MaxValue)
                    MaxValue = KillValue;
                
                array_push(StatsArray, 
                {
                    CharID: CharValue,
                    Kills: KillValue,
                    Hide: KillValue == 0 && !global.UnlockedAnimatronics[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 10000) + ((arg1.Kills - arg0.Kills) * 1000) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 48;
            break;
        
        case 2:
            MaxValue = 1;
            
            for (var i = 0; i <= 90; i++)
            {
                var CharValue = i;
                var Value = global.SalvageRecord[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: CharValue,
                    Salvages: Value,
                    Hide: Value == 0 && !global.UnlockedAnimatronics[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Salvages - arg0.Salvages) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 48;
            break;
        
        case 3:
            var MinigameNames = ["Fredsweeper", "Air Adventure", "Chomping With Chica", "Puppet Patrol", "Hare Pairs", "Pirate Plunder", "Circus Sorter", "Golden Fredsweeper", "Mangle Tangle Mania", "Cupcake Clicker", "Scott's Slots"];
            MaxValue = 1;
            
            for (var i = 0; i < 16; i++)
            {
                var CharValue = i;
                var Value = global.TokensPerMinigame[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: i,
                    Name: get_minigame_data(i).Name,
                    Tokens: Value,
                    Hide: Value == 0 && !global.UnlockedMinigames[i]
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Tokens - arg0.Tokens) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 32;
            break;
        
        case 4:
            var Upgrades = get_upgrades();
            MaxValue = 1;
            
            for (var i = 0; i < UnknownEnum.Value_66; i++)
            {
                var CharValue = i;
                var Value = global.UpgradeRecord[i];
                
                if (Value > MaxValue)
                    MaxValue = Value;
                
                array_push(StatsArray, 
                {
                    CharID: i,
                    Name: Upgrades[i].Name,
                    Tokens: Value,
                    Hide: Value == 0
                });
            }
            
            array_sort(StatsArray, function(arg0, arg1)
            {
                return ((arg0.Hide - arg1.Hide) * 1000) + ((arg1.Tokens - arg0.Tokens) * 100) + (arg0.CharID - arg1.CharID);
            });
            TextHeight = array_length(StatsArray) * 32;
            break;
        
        case 5:
            var DifficultyNames = ["Easy", "Normal", "Hard", global.UnlockedAnimatronics[UnknownEnum.Value_161] ? "Lunatic" : ""];
            var EndingCompletions = array_create(array_length(global.ClearedEndings[1]), 0);
            array_push(StatsArray, ["Five Nights at Frickbear's 3"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["", "Slacker", "Money", "Good", "Evil", "Ultimate", "Total"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            
            for (var i = 0; i < array_length(global.ClearedEndings); i++)
            {
                array_push(StatsArray, [DifficultyNames[i], global.ClearedEndings[i][0], global.ClearedEndings[i][1], global.ClearedEndings[i][2], global.ClearedEndings[i][3], global.ClearedEndings[i][4], count_up(global.ClearedEndings[i], false)]);
                
                for (var j = 0; j < array_length(EndingCompletions); j++)
                    EndingCompletions[j] += global.ClearedEndings[i][j];
            }
            
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["Total", EndingCompletions[0], EndingCompletions[1], EndingCompletions[2], EndingCompletions[3], EndingCompletions[4], count_up(EndingCompletions, false)]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, [" "]);
            array_push(StatsArray, ["Four Layers Down (Attempted)"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["", "Easy", "Normal", "Hard", "Lunatic", "Nightmare", "Total"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            EndingCompletions = array_create(array_length(global.RunsAttempted[1]), 0);
            
            for (var i = 0; i < array_length(global.RunsAttempted); i++)
            {
                var Name = "Custom Guard";
                
                if (i < 21)
                {
                    Name = global.GuardNames[i];
                    
                    if (!global.UnlockedGuards[i])
                        Name = "???";
                }
                
                array_push(StatsArray, [Name, global.RunsAttempted[i][0], global.RunsAttempted[i][1], global.RunsAttempted[i][2], global.RunsAttempted[i][3], global.RunsAttempted[i][4], count_up(global.RunsAttempted[i], false)]);
                
                for (var j = 0; j < array_length(EndingCompletions); j++)
                    EndingCompletions[j] += global.RunsAttempted[i][j];
            }
            
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["Total", EndingCompletions[0], EndingCompletions[1], EndingCompletions[2], EndingCompletions[3], EndingCompletions[4], count_up(EndingCompletions, false)]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, [" "]);
            array_push(StatsArray, ["Four Layers Down (Won)"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["", "Easy", "Normal", "Hard", "Lunatic", "Nightmare", "Total"]);
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            EndingCompletions = array_create(array_length(global.RunsWon[1]), 0);
            
            for (var i = 0; i < array_length(global.RunsWon); i++)
            {
                var Name = "Custom Guard";
                
                if (i < 21)
                {
                    Name = global.GuardNames[i];
                    
                    if (!global.UnlockedGuards[i])
                        Name = "???";
                }
                
                array_push(StatsArray, [Name, global.RunsWon[i][0], global.RunsWon[i][1], global.RunsWon[i][2], global.RunsWon[i][3], global.RunsWon[i][4], count_up(global.RunsWon[i], false)]);
                
                for (var j = 0; j < array_length(EndingCompletions); j++)
                    EndingCompletions[j] += global.RunsWon[i][j];
            }
            
            array_push(StatsArray, ["----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"]);
            array_push(StatsArray, ["Total", EndingCompletions[0], EndingCompletions[1], EndingCompletions[2], EndingCompletions[3], EndingCompletions[4], count_up(EndingCompletions, false)]);
            TextHeight = (array_length(StatsArray) * 14) + 8;
            break;
    }
}

get_stats(StatsMenu);
MenuScroll = 0;
BarHeld = false;
Active = true;

enum UnknownEnum
{
    Value_19 = 19,
    Value_66 = 66,
    Value_127 = 127,
    Value_128,
    Value_159 = 159,
    Value_161 = 161
}
