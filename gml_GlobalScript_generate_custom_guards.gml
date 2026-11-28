global.GuardAmount = 21;
global.GuardNames = ["Jeremy", "Mike", "Vanessa", "Fritz", "Michael", "Vannabelle", "Clark Fixy", "Fredsweeper Frank", "The Boss", "Billy", "Henry", "William", "Edwin", "Fiona", "Elizabeth", "Cassie", "Hudson", "Mary", "Strings", "Sally", "Old Man Consequences"];
global.CreatedSprites = [];
global.CreatedSounds = [];

function delete_created_sprite(arg0)
{
    for (var i = 0; i < array_length(global.CreatedSprites); i++)
    {
        if (global.CreatedSprites[i] == arg0)
        {
            sprite_delete(global.CreatedSprites[i]);
            array_delete(global.CreatedSprites, i, 1);
            exit;
        }
    }
    
    exit;
}

function int_to_suffix(arg0)
{
    return ((arg0 < 10) ? "0" : "") + string(arg0);
}

function get_folders(arg0 = "addons", arg1 = "*")
{
    var folders = [];
    var folder = file_find_first(working_directory + arg0 + "/" + arg1, 16);
    
    if (arg0 == "addons")
    {
        global.GuardNames = ["Jeremy", "Mike", "Vanessa", "Fritz", "Michael", "Vannabelle", "Clark Fixy", "Fredsweeper Frank", "The Boss", "Billy", "Henry", "William", "Edwin", "Fiona", "Elizabeth", "Cassie", "Hudson", "Mary", "Strings", "Sally", "Old Man Consequences"];
        global.GuardAmount = 21;
    }
    
    while (folder != "")
    {
        array_push(folders, folder);
        
        if (arg0 == "addons")
            array_push(global.GuardNames, folder);
        
        folder = file_find_next();
    }
    
    global.GuardAmount = array_length(global.GuardNames);
    return folders;
}

function skin_sprite_from_directory_unlimited(arg0, arg1, arg2, arg3 = 1)
{
    var sprite = -1;
    var filename = arg1 + "/" + arg2 + "*.png";
    var file = file_find_first(filename, 0);
    
    if (file == "")
    {
        return sprite_duplicate(arg0);
    }
    else
    {
        filename = arg1 + "/" + file;
        sprite = sprite_add(filename, arg3, false, false, 0, 0);
    }
    
    var spriteTemp = -1;
    file = file_find_next();
    show_debug_message(string("FILENAME: {0} | DIRECTORY: {1}", file, filename));
    
    while (file != "")
    {
        filename = arg1 + "/" + file;
        show_debug_message(filename);
        spriteTemp = sprite_add(filename, arg3, false, false, 0, 0);
        sprite_merge(sprite, spriteTemp);
        sprite_delete(spriteTemp);
        file = file_find_next();
    }
    
    var XOffFromCenter = sprite_get_xoffset(arg0) - (sprite_get_width(arg0) / 2);
    var YOffFromCenter = sprite_get_yoffset(arg0) - (sprite_get_height(arg0) / 2);
    sprite_set_offset(sprite, (sprite_get_width(sprite) / 2) + XOffFromCenter, (sprite_get_height(sprite) / 2) + YOffFromCenter);
    sprite_set_bbox_mode(sprite, sprite_get_bbox_mode(arg0));
    sprite_set_bbox(sprite, sprite_get_bbox_left(arg0) + ((sprite_get_width(sprite) - sprite_get_width(arg0)) / 2), sprite_get_bbox_top(arg0) + ((sprite_get_height(sprite) - sprite_get_height(arg0)) / 2), sprite_get_bbox_right(arg0) + ((sprite_get_width(sprite) - sprite_get_width(arg0)) / 2), sprite_get_bbox_bottom(arg0) + ((sprite_get_height(sprite) - sprite_get_height(arg0)) / 2));
    sprite_set_nineslice(sprite, sprite_get_nineslice(arg0));
    return sprite;
}

function skin_sprite_from_directory(arg0, arg1, arg2, arg3 = 1)
{
    var sprite = -1;
    
    if (!is_array(arg2))
        arg2 = [arg2];
    
    var filename = arg1 + "/" + arg2[0];
    
    if (file_find_first(filename, 0) != "")
        sprite = sprite_add(filename, arg3, false, false, 0, 0);
    else
        return sprite_duplicate(arg0);
    
    var spriteTemp = -1;
    
    for (var i = 1; i < array_length(arg2); i++)
    {
        show_debug_message(i);
        filename = arg1 + "/" + arg2[i];
        show_debug_message(filename);
        
        if (file_find_first(filename, 0) != "")
            spriteTemp = sprite_add(filename, arg3, false, false, 0, 0);
        else
            spriteTemp = sprite_duplicate(arg0);
        
        show_debug_message(spriteTemp);
        sprite_merge(sprite, spriteTemp);
        sprite_delete(spriteTemp);
    }
    
    var XOffFromCenter = sprite_get_xoffset(arg0) - (sprite_get_width(arg0) / 2);
    var YOffFromCenter = sprite_get_yoffset(arg0) - (sprite_get_height(arg0) / 2);
    sprite_set_offset(sprite, (sprite_get_width(sprite) / 2) + XOffFromCenter, (sprite_get_height(sprite) / 2) + YOffFromCenter);
    sprite_set_nineslice(sprite, sprite_get_nineslice(arg0));
    sprite_set_bbox_mode(sprite, sprite_get_bbox_mode(arg0));
    sprite_set_bbox(sprite, sprite_get_bbox_left(arg0) + ((sprite_get_width(sprite) - sprite_get_width(arg0)) / 2), sprite_get_bbox_top(arg0) + ((sprite_get_height(sprite) - sprite_get_height(arg0)) / 2), sprite_get_bbox_right(arg0) + ((sprite_get_width(sprite) - sprite_get_width(arg0)) / 2), sprite_get_bbox_bottom(arg0) + ((sprite_get_height(sprite) - sprite_get_height(arg0)) / 2));
    sprite_set_nineslice(sprite, sprite_get_nineslice(arg0));
    return sprite;
}

function skin_sound_from_directory(arg0, arg1, arg2, arg3 = [])
{
    var filename = arg1 + "/" + arg2;
    show_debug_message(string("LOOKING FOR {0}", filename));
    
    if (file_find_first(filename, 0) != "")
    {
        show_debug_message("FILE FOUND: " + string(filename));
        var Stream = audio_create_stream(filename);
        
        if (array_length(arg3) > 0)
        {
            audio_sound_loop_start(Stream, arg3[0]);
            audio_sound_loop_end(Stream, arg3[1]);
        }
        
        audio_sound_gain(Stream, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        return Stream;
    }
    else
    {
        return arg0;
    }
}

function check_skins(arg0)
{
    var SkinFolders = get_folders("skins", int_to_suffix(arg0 + 1) + "_*");
    
    if (global.Skins[arg0] > (array_length(SkinFolders) - 1))
        global.Skins[arg0] = -1;
}

function skin_sprite(arg0, arg1, arg2, arg3 = 1)
{
    if (arg1 < 0 || arg1 >= array_length(global.SkinsFunctional))
        return sprite_duplicate(arg0);
    
    var SkinID = global.SkinsFunctional[arg1];
    
    if (SkinID < 0)
        return sprite_duplicate(arg0);
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg1 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sprites";
    return skin_sprite_from_directory(arg0, directory, arg2, arg3);
}

function skin_sprite_unlimited(arg0, arg1, arg2, arg3 = 1)
{
    if (arg1 < 0 || arg1 >= array_length(global.SkinsFunctional))
        return sprite_duplicate(arg0);
    
    var SkinID = global.SkinsFunctional[arg1];
    
    if (SkinID < 0)
        return sprite_duplicate(arg0);
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg1 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sprites";
    return skin_sprite_from_directory_unlimited(arg0, directory, arg2, arg3);
}

function skin_hybrid_sprite(arg0, arg1 = "icon.png", arg2 = 0, arg3 = 0)
{
    var width = sprite_get_width(arg0);
    var height = sprite_get_height(arg0);
    var DrawSurf = surface_create(width, height);
    var ReturnSprite = -1;
    var ThisIcon = -1;
    surface_set_target(DrawSurf);
    
    for (var AnimatronicID = 0; AnimatronicID <= 90; AnimatronicID++)
    {
        draw_clear_alpha(c_black, 0);
        var SkinID = global.SkinsFunctional[AnimatronicID];
        
        if (SkinID < 0)
        {
            ThisIcon = sprite_duplicate(arg0);
            show_debug_message(string("{0}: Default skin", AnimatronicID));
        }
        else
        {
            var SkinFolders = get_folders("skins", int_to_suffix(AnimatronicID + 1) + "_*");
            var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sprites";
            var file = directory + "/" + arg1;
            
            if (file_find_first(file, 0) != "")
            {
                ThisIcon = sprite_add(file, 1, false, false, 0, 0);
                show_debug_message(string("{0}: File found successfully", AnimatronicID));
            }
            else
            {
                ThisIcon = sprite_duplicate(arg0);
                show_debug_message(string("{0}: NO FILES FOUND", AnimatronicID));
            }
        }
        
        draw_sprite(ThisIcon, AnimatronicID, 0, 0);
        
        if (AnimatronicID == 0)
            ReturnSprite = sprite_create_from_surface(DrawSurf, 0, 0, width, height, false, false, 0, 0);
        else
            sprite_add_from_surface(ReturnSprite, DrawSurf, 0, 0, width, height, false, false);
        
        sprite_delete(ThisIcon);
    }
    
    surface_reset_target();
    surface_free(DrawSurf);
    return ReturnSprite;
}

function get_sprite_filenames(arg0, arg1, arg2 = "sprite")
{
    var returnArr = [];
    
    for (var i = arg0; i <= arg1; i++)
    {
        var numString = string(i);
        
        if (i < 10)
            numString = "0" + numString;
        
        array_push(returnArr, arg2 + "_" + numString + ".png");
    }
    
    return returnArr;
}

function skin_get_attribute_set(arg0, arg1 = "data.txt")
{
    var SkinID = global.SkinsFunctional[arg0];
    
    if (SkinID < 0)
        return -1;
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg0 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID];
    var filename = directory + "/" + arg1;
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(arg0));
    
    if (file == "")
    {
        return -1;
    }
    else
    {
        var _buffer = buffer_load(filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        return json_parse(_string);
    }
}

function skin_data_from_directory(arg0, arg1, arg2 = "data.txt")
{
    var returndata = arg0;
    var filename = arg1 + "/" + arg2;
    var file = file_find_first(filename, 0);
    
    if (file == "")
    {
        return arg0;
    }
    else
    {
        try
        {
            var _buffer = buffer_load(filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            return json_parse(_string);
        }
        catch (_exception)
        {
            show_message(string("ERR: {0} appears to be incorrectly formatted. Data could not be imported.", filename));
        }
    }
}

function skin_get_attribute(arg0, arg1, arg2, arg3 = "data.txt")
{
    var attributeSet = skin_get_attribute_set(arg0, arg3);
    
    if (attributeSet == -1)
        return arg2;
    
    var attributeToReturn = variable_struct_get(attributeSet, arg1);
    
    if (attributeToReturn == -1)
        return arg2;
    
    return variable_struct_get(attributeSet, arg1);
}

function skin_salvage_dialogue(arg0, arg1 = "DIALOGUE")
{
    var fileBase = "dialogue.txt";
    var SkinID = global.SkinsFunctional[arg0];
    
    if (SkinID < 0)
        return -1;
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg0 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID];
    var filename = directory + "/" + fileBase;
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file) + " for animatronic " + string(arg0));
    
    if (file == "")
    {
        return -1;
    }
    else
    {
        var _buffer = buffer_load(filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        var Import = json_parse(_string);
        
        if (variable_struct_exists(Import, arg1))
        {
            var Struct = variable_struct_get(Import, arg1);
            read_script(Struct);
            return true;
        }
    }
}

function skin_replace_descriptions(arg0 = "data.txt")
{
    reset_descriptions();
    
    for (var i = 0; i <= 90; i++)
    {
        if (global.SkinsFunctional[i] < 0)
            continue;
        
        global.Descriptions[i] = [skin_get_attribute(i, "Name", "NO NAME FOUND"), skin_get_attribute(i, "Mechanic", "NO MECHANIC FOUND")];
    }
}

function skin_sound_subtitles(arg0)
{
    var txt = filename_change_ext(arg0, ".txt");
    
    if (!file_exists(txt))
        return [["No subtitles found."], [0]];
    
    var returnString;
    
    try
    {
        var _buffer = buffer_load(txt);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        returnString = json_parse(_string);
    }
    catch (_exception)
    {
        show_message(string("ERROR: Subtitles for {0} formatted incorrectly.", arg0));
        return [["No subtitles found."], [0]];
    }
    
    return returnString;
}

function skin_sound(arg0, arg1, arg2)
{
    var AnimatronicID = 0;
    var SkinID = global.SkinsFunctional[arg1];
    
    if (SkinID < 0)
        return arg0;
    
    if (string_pos("voc_", arg2) != 0 && !skin_get_attribute(arg1, "ReplaceVoice", false))
        return arg0;
    
    var SkinFolders = get_folders("skins", int_to_suffix(arg1 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sounds";
    var sound = -1;
    var filename = directory + "/" + arg2 + ".ogg";
    var file = file_find_first(filename, 0);
    show_debug_message("FILE FOUND: " + string(file));
    
    if (file == "")
        return arg0;
    else
        return create_stream_from_filename(filename);
}

function skin_sound_array(arg0, arg1)
{
    var SkinID = global.SkinsFunctional[arg0];
    
    if (SkinID < 0)
        return [sfxNOTHING];
    
    var AnimatronicFolders = get_folders("skins");
    var SkinFolders = get_folders("skins", int_to_suffix(arg0 + 1) + "_*");
    var directory = working_directory + "skins/" + SkinFolders[SkinID] + "/sounds";
    return skin_sound_array_from_directory(directory, arg1);
}

function skin_sound_array_from_directory(arg0, arg1, arg2 = false)
{
    var sound = -1;
    var filename = arg0 + "/" + arg1 + "_*.ogg";
    
    if (arg2)
        filename = arg0 + "/" + arg1 + ".ogg";
    
    var file = file_find_first(filename, 0);
    var results = [];
    
    while (file != "")
    {
        array_push(results, arg0 + "/" + file);
        file = file_find_next();
    }
    
    return results;
}

function choose_from_array(arg0)
{
    return arg0[irandom(array_length(arg0) - 1)];
}

function skin_sound_generate_array(arg0, arg1, arg2)
{
    var SkinID = global.SkinsFunctional[arg1];
    
    if (SkinID < 0)
        return arg0;
    
    if (string_pos("voc_", arg2) != 0 && !skin_get_attribute(arg1, "ReplaceVoice", false))
        return arg0;
    
    var Arr = skin_sound_array(arg1, arg2);
    var ReturnArray = [];
    
    if (array_length(Arr) == 0)
    {
        return arg0;
    }
    else
    {
        for (var i = 0; i < array_length(Arr); i++)
            array_push(ReturnArray, create_stream_from_filename(Arr[i]));
        
        return ReturnArray;
    }
}

global.ImportedSubtitles = ds_map_create();

function create_stream_from_filename(arg0)
{
    var audiogroup = 0;
    
    if (string_pos("sq_", arg0) != 0)
        audiogroup = 1;
    else if (string_pos("voc_", arg0) != 0)
        audiogroup = 3;
    
    var stream = audio_create_stream(arg0);
    audio_sound_gain(stream, (global.Settings[2][0] * global.Settings[2][audiogroup]) / 100, 0);
    
    if (audiogroup == 3)
        ds_map_add(global.ImportedSubtitles, stream, skin_sound_subtitles(arg0));
    
    return stream;
}

function skin_sound_delete_array(arg0)
{
    if (!is_array(arg0))
        arg0 = [arg0];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (audio_get_type(arg0[i]))
        {
            if (ds_map_exists(global.ImportedSubtitles, arg0[i]))
                ds_map_delete(global.ImportedSubtitles, arg0[i]);
            
            audio_destroy_stream(arg0[i]);
        }
    }
}

function generate_face_tiles()
{
    if (variable_global_exists("IconTiles"))
    {
        for (var i = 0; i < array_length(global.IconTiles); i++)
            sprite_delete(global.IconTiles[i]);
    }
    
    global.IconTiles = [];
    
    for (var i = 0; i < UnknownEnum.Value_201; i++)
    {
        var Sprite = skin_sprite(get_tile(i), i, ["icon.png", "icon_gray.png", "icon_salvage.png"]);
        array_push(global.IconTiles, Sprite);
    }
    
    exit;
}

function generate_voicelines()
{
    if (variable_global_exists("DeathcoinLines") && variable_global_exists("SelectionLines"))
    {
        skin_sound_delete_array(global.SelectionLines);
        skin_sound_delete_array(global.DeathcoinLines);
    }
    
    global.SelectionLines = [];
    global.DeathcoinLines = [];
    
    for (var i = 0; i <= UnknownEnum.Value_201; i++)
    {
        array_push(global.SelectionLines, skin_sound(get_selection_voiceline(i), i, "voc_selection"));
        array_push(global.DeathcoinLines, skin_sound(get_deathcoin_voiceline(i), i, "voc_removed"));
    }
    
    exit;
}

function draw_imported_deathscreen(arg0)
{
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    shader_set(shFlash);
    
    for (var i = 0; i < 360; i += 45)
        draw_sprite_ext(arg0, 1, 320 + round(lengthdir_x(1, i)), 180 + round(lengthdir_y(1, i)), 1, 1, 0, #280000, 1);
    
    shader_set(shDeathscreen);
    shader_set_uniform_f(shader_get_uniform(shDeathscreen, "u_tint"), 0.9098, 0.0784, 0.0784);
    draw_sprite(arg0, 0, 320, 180);
    shader_reset();
}

function draw_normal_deathscreen(arg0)
{
    var sprite = get_jumpscare(arg0);
    var image = 2 + (global.JumpscareType * 3);
    draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
    
    if (arg0 == UnknownEnum.Value_127)
        sprite = sPhonyDeathscreen;
    
    shader_set(shFlash);
    
    for (var i = 0; i < 360; i += 45)
        draw_sprite_ext(sprite, image, 320 + round(lengthdir_x(1, i)), 180 + round(lengthdir_y(1, i)), 1, 1, 0, #280000, 1);
    
    shader_set(shDeathscreen);
    shader_set_uniform_f(shader_get_uniform(shDeathscreen, "u_tint"), 0.9098, 0.0784, 0.0784);
    draw_sprite(sprite, image, 320, 180);
    shader_reset();
}

function apply_skins_random()
{
    if (global.RandomizeSkins)
        apply_skins(UnknownEnum.Value_2, global.Seed);
    else
        apply_skins(UnknownEnum.Value_0, global.Seed);
}

function apply_skins(arg0 = 0, arg1 = 0)
{
    global.SkinsFunctional = array_create(202, -1);
    
    for (var i = 0; i <= 90; i++)
        check_skins(i);
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            array_copy(global.SkinsFunctional, 0, global.Skins, 0, array_length(global.Skins));
            break;
        
        case UnknownEnum.Value_1:
            break;
        
        case UnknownEnum.Value_2:
            var SavedSeed = random_get_seed();
            random_set_seed(arg1);
            
            for (var i = 0; i <= 90; i++)
            {
                var SkinFolders = get_folders("skins", int_to_suffix(i + 1) + "_*");
                global.SkinsFunctional[i] = irandom(array_length(SkinFolders)) - 1;
            }
            
            random_set_seed(SavedSeed);
    }
    
    skin_replace_descriptions();
    generate_face_tiles();
    generate_voicelines();
}

function no_brackets(arg0)
{
    var _pos = string_pos(" (", arg0);
    
    if (_pos > 0)
        return string_copy(arg0, 1, _pos - 1);
    
    return arg0;
}

function import_sprites(arg0, arg1, arg2 = 1, arg3 = 0, arg4 = 0, arg5 = sBear5)
{
    var custom_sprite = sprite_duplicate(arg1);
    var sprite = -1;
    var folders = get_folders();
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/" + string(arg0);
        
        if (file_find_first(filename, 0) != "")
            sprite = sprite_add(filename, arg2, false, false, arg3, arg4);
        else
            sprite = sprite_duplicate(arg5);
        
        if (sprite != -1)
        {
            sprite_merge(custom_sprite, sprite);
            sprite_delete(sprite);
        }
    }
    
    return custom_sprite;
}

function import_sprites_solo(arg0, arg1, arg2 = sBear5, arg3 = 1, arg4 = 0, arg5 = 0)
{
    var folders = get_folders();
    
    if (arg0 < 21)
        return sprite_duplicate(arg2);
    
    var filename = working_directory + "addons/" + folders[arg0 - 21] + "/" + string(arg1);
    show_debug_message(string("FOUND DIRECTORY: {0}", filename));
    
    if (file_find_first(filename, 0) != "")
        return sprite_add(filename, arg3, false, false, arg4, arg5);
    else
        return sprite_duplicate(arg2);
}

function import_sound(arg0, arg1 = "/talksound.ogg", arg2 = [])
{
    var filename = working_directory + "addons/" + guard_name(arg0) + arg1;
    
    if (file_find_first(filename, 0) != "")
    {
        var Stream = audio_create_stream(filename);
        
        if (array_length(arg2) > 0)
        {
            audio_sound_loop_start(Stream, arg2[0]);
            audio_sound_loop_end(Stream, arg2[1]);
        }
        
        audio_sound_gain(Stream, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        return Stream;
    }
    else
    {
        return voc_tsDefault;
    }
}

function import_dialogue(arg0, arg1 = "/opening_dialogue.txt", arg2 = false)
{
    var filename = working_directory + "addons/" + guard_name(arg0) + arg1;
    
    if (file_find_first(filename, 0) != "")
    {
        try
        {
            var _buffer = buffer_load(filename);
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);
            return json_parse(_string);
        }
        catch (_exception)
        {
            show_message(string("ERR: {0}'s {1} file appears to be incorrectly formatted. Data could not be imported.", guard_name(), arg1));
        }
    }
    
    return 
    {
        DIALOGUE: ["There was an error loading the dialogue. Bet you feel real stupid now, huh?"],
        FIRST_PERSON: "false",
        PHOTO_CAPTION: "As for you..."
    };
}

function import_extras()
{
    var folders = get_folders();
    var extras_info = [];
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/extras_info.txt";
        
        if (file_find_first(filename, 0) != "")
        {
            try
            {
                var _buffer = buffer_load(filename);
                var _string = buffer_read(_buffer, buffer_string);
                buffer_delete(_buffer);
                array_push(extras_info, json_parse(_string));
            }
            catch (_exception)
            {
                show_message(string("ERR: {0}'s extras_info.txt file appears to be incorrectly formatted. Data could not be imported.", folders[i]));
                array_push(extras_info, 
                {
                    FULL_NAME: "ERROR",
                    DEV_NOTES: "N/A",
                    DESCRIPTION: "Looks like you're missing the extras_info file."
                });
            }
        }
        else
        {
            array_push(extras_info, 
            {
                FULL_NAME: "ERROR",
                DEV_NOTES: "N/A",
                DESCRIPTION: "Looks like you're missing the extras_info file."
            });
        }
    }
    
    return extras_info;
}

function import_portraits()
{
    var folders = get_folders();
    var portraits = [];
    
    for (var i = 0; i < array_length(folders); i++)
    {
        var filename = working_directory + "addons/" + folders[i] + "/portrait.png";
        var sprite;
        
        if (file_find_first(filename, 0) != "")
            sprite = sprite_add(filename, 1, false, false, 0, 0);
        else
            sprite = sprite_duplicate(sBear5);
        
        if (sprite != -1)
            array_push(portraits, sprite);
    }
    
    return portraits;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_127 = 127,
    Value_201 = 201
}
