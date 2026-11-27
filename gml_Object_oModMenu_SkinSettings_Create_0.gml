reset_descriptions();

function update_template_data()
{
    var folders = get_folders("skins");
    
    for (var i = 0; i < array_length(folders); i++)
    {
        if (string_pos("(TEMPLATE)", folders[i]) == 0)
        {
            show_debug_message("Not a template: " + folders[i]);
        }
        else
        {
            var filename = working_directory + "skins/" + folders[i] + "/" + "data.txt";
            var ID = string_to_int_before_underscore(folders[i]);
            var file = file_find_first(filename, 0);
            show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(i));
            
            if (file != "")
            {
                var JumpData = get_jumpscare_templates(ID);
                var JumpPositions = [];
                
                for (var j = 0; j < array_length(JumpData); j++)
                    array_push(JumpPositions, JumpData[0].JumpSideVertical);
                
                var SaveStuff = 
                {
                    Name: $"Template {global.Descriptions[ID][0]}",
                    Mechanic: global.Descriptions[ID][1],
                    Tips: get_tips(ID, -99),
                    SalvageLocation_SayVoiceLine: true,
                    SalvageLocation_Height: 64,
                    ReplaceVoice: true,
                    JumpscarePositions: JumpPositions,
                    Debut: "Game Title (2014)",
                    Description: "This is my extras menu description!",
                    DevNotes: "Mod made by SpookyRick.\n\nDevnotes go here!",
                    VACredit: "Green-Zone"
                };
                
                if (ID == UnknownEnum.Value_16)
                    SaveStuff.ButtonText = "Reset Green Music";
                
                if (ID == UnknownEnum.Value_31)
                    SaveStuff.UseCustomSounds = false;
                
                if (ID == UnknownEnum.Value_42)
                {
                    SaveStuff.ItemName = "Green Wood";
                    SaveStuff.ItemDesc = "Buy this to keep Green Chipper happy!";
                }
                
                if (ID == UnknownEnum.Value_63)
                {
                    SaveStuff.ShortTasks = ["Task A", "Task B", "Task C"];
                    SaveStuff.MediumTasks = ["Task A", "Task B", "Task C"];
                    SaveStuff.LongTasks = ["Task A", "Task B", "Task C"];
                }
                
                if (ID == UnknownEnum.Value_73)
                {
                    SaveStuff.SuitNames = ["GREEN ELEPHANT", "MYCELIUM MAN", "SWING BEE", "SHARPAY", "JESTER", "HEDGEHOG HUDGIE", "CARTER CATERPILLAR", "GREEN TIME CHICA"];
                    SaveStuff.MessageMove = "The Green Mimic has moved to a new suit!";
                    SaveStuff.MessageDefeat = "The Green Mimic has been subdued!";
                    SaveStuff.UIColor = [255, 255, 65];
                }
                
                if (ID == UnknownEnum.Value_89)
                {
                    SaveStuff.GameName = "Green.EXE";
                    SaveStuff.ItemDesc = "I AM GREEN.";
                    SaveStuff.GlitchText = ["!?$%?!", "I AM GOD", "RUN AWAY", "DIE", "****", "&3A@!?"];
                }
                
                var _string = json_stringify(SaveStuff, true);
                var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
                buffer_write(_buffer, buffer_string, _string);
                buffer_save(_buffer, filename);
                buffer_delete(_buffer);
            }
        }
    }
}

update_template_data();
CharsWithSkins = 91;
ModNames = [];
TilesPerEntry = array_create(CharsWithSkins, 0);
ModTileSprite = -1;
OfficeNames = [];
OfficeTileSprite = -1;
var folders = get_folders("offices");

for (var i = 0; i < array_length(folders); i++)
{
    var filename = working_directory + "offices/" + folders[i] + "/" + "data.txt";
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(i));
    
    if (file == "")
    {
        array_push(OfficeNames, "N/A");
    }
    else
    {
        var _buffer = buffer_load(filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        var ThisName = variable_struct_get(json_parse(_string), "Name");
        array_push(OfficeNames, ThisName);
    }
    
    filename = working_directory + "offices/" + folders[i] + "/" + "icon.png";
    
    if (file_find_first(filename, 0) != "")
        sprite = sprite_add(filename, 1, false, false, 0, 0);
    else
        sprite = sprite_duplicate(sNOTHING);
    
    if (OfficeTileSprite == -1)
    {
        OfficeTileSprite = sprite;
    }
    else
    {
        sprite_merge(OfficeTileSprite, sprite);
        sprite_delete(sprite);
    }
}

var sprite = -1;
folders = get_folders("skins");
var curChar = 0;

for (var i = 0; i < array_length(folders); i++)
{
    var filename = working_directory + "skins/" + folders[i] + "/" + "data.txt";
    var curID = string_to_int_before_underscore(folders[i]);
    
    if (curID > curChar)
        curChar = curID;
    
    TilesPerEntry[curChar]++;
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(i));
    
    if (file == "")
    {
        array_push(ModNames, "N/A");
    }
    else
    {
        var _buffer = buffer_load(filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        var ThisName = variable_struct_get(json_parse(_string), "Name");
        array_push(ModNames, ThisName);
    }
    
    filename = working_directory + "skins/" + folders[i] + "/sprites/" + "icon.png";
    
    if (file_find_first(filename, 0) != "")
        sprite = sprite_add(filename, 1, false, false, 0, 0);
    else
        sprite = sprite_duplicate(sNOTHING);
    
    if (ModTileSprite == -1)
    {
        ModTileSprite = sprite;
    }
    else
    {
        sprite_merge(ModTileSprite, sprite);
        sprite_delete(sprite);
    }
}

ScrollBarOffset = false;
ScrollBarDragged = false;
ShowAll = false;
TransitionPercent = 1;
play_music(mus_ModMenu, 0.5);

enum UnknownEnum
{
    Value_16 = 16,
    Value_31 = 31,
    Value_42 = 42,
    Value_63 = 63,
    Value_73 = 73,
    Value_89 = 89
}
