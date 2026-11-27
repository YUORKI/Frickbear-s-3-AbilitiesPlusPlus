texturegroup_load("Renders");
reset_descriptions();
Timer = 0;
YOffset = 0;
BarDragged = false;
Active = true;
TileSize = 0;
IncludeFan = false;
IncludeHenry = false;
IncludeWilliam = false;
var InitialUnlocks = array_create(202, false);

for (var i = 0; i < array_length(InitialUnlocks); i++)
    InitialUnlocks[i] = global.UnlockedAnimatronics[i];

UnlockedArray = InitialUnlocks;
SorterArray = get_sorter_array(countup_array(UnknownEnum.Value_201 - !global.UnlockedAnimatronics[UnknownEnum.Value_201]));
ModNames = [];
ModTileSprite = -1;
TileCount = 0;

function get_mod_tiles()
{
    var sprite = -1;
    var folders = get_folders("skins");
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "skins/" + folders[i] + "/" + "data.txt";
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
        
        TileCount++;
    }
    
    folders = get_folders();
    
    for (var i = 0; i < array_length(folders); i++)
    {
        array_push(ModNames, no_brackets(folders[i]));
        var filename = working_directory + "addons/" + folders[i] + "/" + string("icon.png");
        
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
        
        TileCount++;
    }
}

get_mod_tiles();
ModsMenu = false;
ShowStickers = false;

function show_stickers_checkbox(arg0, arg1, arg2)
{
    draw_sprite(sCheckbox, ShowStickers, arg0, arg1);
    
    if (clicked(arg0, arg1, 13, 13))
    {
        ShowStickers = !ShowStickers;
        audio_play_sound(sfxBump, 5, false);
    }
    
    draw_text(arg0 + 19, arg1 - 3, arg2);
}

enum UnknownEnum
{
    Value_201 = 201
}
