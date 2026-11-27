if (instance_exists(oTipsyBird_Window))
{
    keyboard_string = "";
    
    if (!instance_exists(oTextBox))
        instance_destroy(oTipsyBird_Window);
    
    exit;
}

if (keyboard_check_pressed(vk_enter))
{
    output(CurrentLine, 4210752);
    var SplitLine = string_split(CurrentLine, " ");
    CurrentLine = "";
    
    if (is_array(SplitLine))
    {
        if (SplitLine[0] == "unlock")
        {
            switch (SplitLine[1])
            {
                default:
                    output("ERR: Invalid command.", 255);
                    break;
                
                case "lunaticmode":
                    global.UnlockedAnimatronics[UnknownEnum.Value_161] = true;
                    output("You can now play on Lunatic difficulty!", 65280);
                    break;
                
                case "animatronics":
                    output("All 47 animatronics have been unlocked!", 65280);
                    
                    for (var i = 0; i <= 86; i++)
                        global.UnlockedAnimatronics[i] = true;
                    
                    break;
                
                case "pages":
                    output("All gallery pages unlocked!", 65280);
                    
                    for (var i = 0; i <= UnknownEnum.Value_201; i++)
                        global.UnlockedAnimatronics[i] = true;
                    
                    break;
                
                case "guards":
                    output("All guards unlocked!", 65280);
                    
                    for (var i = 0; i <= 21; i++)
                        global.UnlockedGuards[i] = true;
                    
                    break;
                
                case "shuffler":
                    global.UnlockedAnimatronics[UnknownEnum.Value_126] = true;
                    output("Shuffler mode unlocked!", 65280);
                    break;
                
                case "ultimateroute":
                    add_flag("FredbearCloser_Slacker");
                    add_flag("FredbearCloser_Good");
                    add_flag("FredbearCloser_Evil");
                    add_flag("FredbearCloser_Money");
                    global.UnlockedAnimatronics[UnknownEnum.Value_128] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_167] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_163] = true;
                    global.UnlockedAnimatronics[UnknownEnum.Value_158] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_15] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_31] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_30] = true;
                    global.UnlockedTrophies[UnknownEnum.Value_29] = true;
                    output("Received credit for all other endings!", 65280);
                    break;
                
                case "extras":
                    global.UnlockedAnimatronics[UnknownEnum.Value_128] = true;
                    output("You can now access the extras menu!", 65280);
                    break;
                
                case "minigames":
                    global.UnlockedMinigames = array_create(array_length(global.UnlockedMinigames), true);
                    output("You can now access all minigames!", 65280);
                    break;
                
                case "trophies":
                    global.UnlockedTrophies = array_create(array_length(global.UnlockedTrophies), true);
                    output("Got credit for all trophies!", 65280);
                    break;
            }
        }
        else if (SplitLine[0] == "room")
        {
            var Room = asset_get_index(SplitLine[1]);
            
            if (Room != -1)
                room_goto(Room);
            else
                output("ERR: Room does not exist.", 255);
        }
        else if (SplitLine[0] == "devmode")
        {
            if (!global.DevMode)
            {
                global.DevMode = true;
                output("Developer mode enabled.", 65280);
            }
            else
            {
                global.DevMode = false;
                output("Developer mode disabled.", 65280);
            }
        }
        else if (SplitLine[0] == "boss")
        {
            global.Night = 6;
            
            if (SplitLine[1] == "Salvage")
                global.Route = UnknownEnum.Value_3;
            else if (SplitLine[1] == "Nightmare")
                global.Route = UnknownEnum.Value_2;
            
            global.Difficulty = 0;
            global.AllTimeSalvages = [UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_13, UnknownEnum.Value_14, UnknownEnum.Value_7, UnknownEnum.Value_30, UnknownEnum.Value_38];
            room_goto(NightOpening);
        }
        else if (SplitLine[0] == "cutscene")
        {
            var Cutscene = SplitLine[1];
            var Night = SplitLine[2];
            global.Night = real(Night);
            global.Upgrades = [];
            global.SalvagedMasks = [false, false, false, false];
            global.SalvagedScraps = [false, false, false, false];
            global.ShuffleMode = false;
            
            if (Cutscene == "ultimate" || Cutscene == "good")
                global.SalvagedMasks = [true, true, true, true];
            
            if (Cutscene == "ultimate" || Cutscene == "evil")
                global.SalvagedScraps = [true, true, true, true];
            
            if (Cutscene == "failed")
            {
                global.SalvagedMasks = [global.Night > 2, global.Night > 3, global.Night > 4, global.Night > 5];
                global.SalvagedScraps = [global.Night > 2, global.Night > 3, global.Night > 4, global.Night > 5];
            }
            
            if (array_length(SplitLine) > 3)
            {
                if (SplitLine[3] == "talbert")
                    global.Upgrades = [UnknownEnum.Value_41];
            }
            
            room_goto(MidnightCutscnes);
        }
        else if (SplitLine[0] == "tipsy")
        {
            var Buyer = real(SplitLine[1]);
            var Recipient = real(SplitLine[2]);
            
            with (instance_create_depth(0, 0, depth - 1, oTipsyBird_Window))
            {
                SelectedSeat = 1;
                global.Guard = Buyer;
                Patrons = [Recipient, Recipient, Recipient];
            }
            
            with (instance_create_depth(0, 0, depth - 2, oTextBox))
                game_text("Bar_Pick1");
        }
    }
}

if (keyboard_check(vk_backspace))
    BackspaceHeld++;
else
    BackspaceHeld = 0;

if ((keyboard_check_pressed(vk_backspace) || BackspaceHeld >= 30) && string_length(CurrentLine) > 0)
{
    CurrentLine = string_copy(CurrentLine, 0, string_length(CurrentLine) - 1);
    keyboard_string = "";
}

if (keyboard_string != "")
{
    CurrentLine += keyboard_string;
    keyboard_string = "";
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_7 = 7,
    Value_13 = 13,
    Value_14,
    Value_15,
    Value_16,
    Value_20 = 20,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_38 = 38,
    Value_41 = 41,
    Value_126 = 126,
    Value_128 = 128,
    Value_158 = 158,
    Value_161 = 161,
    Value_163 = 163,
    Value_167 = 167,
    Value_201 = 201
}
