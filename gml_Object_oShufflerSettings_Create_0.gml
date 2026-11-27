while (array_length(global.ShuffleSettings) < 11)
    array_push(global.ShuffleSettings, false);

if (!(global.Night == 1 && global.ShuffleMode) || global.ShuffleSettings[UnknownEnum.Value_10])
{
    instance_destroy();
    exit;
}

SettingNum = UnknownEnum.Value_10;

function setting(arg0, arg1, arg2, arg3)
{
    draw_sprite(sCheckbox, global.ShuffleSettings[arg3], arg0, arg1);
    
    if (clicked(arg0, arg1, 13, 13))
    {
        global.ShuffleSettings[arg3] = !global.ShuffleSettings[arg3];
        audio_play_sound(sfxBump, 5, false);
    }
    
    draw_text(arg0 + 19, arg1 - 3, arg2);
}

Titles = [];
Titles[UnknownEnum.Value_0] = "Shuffle Freddy, Bonnie & Chica";
Titles[UnknownEnum.Value_1] = "Shuffle Foxy";
Titles[UnknownEnum.Value_2] = "Shuffle Marionette";
Titles[UnknownEnum.Value_3] = "Shuffle BB";
Titles[UnknownEnum.Value_4] = "Shuffle Evil Route Animatronics";
Titles[UnknownEnum.Value_5] = "Shuffle Starter Minigames";
Titles[UnknownEnum.Value_6] = "Shuffle Cabinet Minigames";
Titles[UnknownEnum.Value_7] = "Shuffle Shop Minigames";
Titles[UnknownEnum.Value_8] = "Shuffle Location Order";
Titles[UnknownEnum.Value_9] = "Skip Story Cutscenes";

function restore_animatronic(arg0)
{
    if (!is_array(arg0))
        arg0 = [arg0];
    
    for (var el = 0; el < array_length(arg0); el++)
    {
        var ThisID = arg0[el];
        var i = 0;
        
        while (global.ShuffleData.Animatronics[i] != ThisID && i < array_length(global.ShuffleData.Animatronics))
            i++;
        
        show_debug_message($"Searching for {ThisID} , found {global.ShuffleData.Animatronics[i]} at {i}");
        var temp = global.ShuffleData.Animatronics[i];
        global.ShuffleData.Animatronics[i] = global.ShuffleData.Animatronics[ThisID];
        global.ShuffleData.Animatronics[ThisID] = temp;
    }
}

function restore_minigames(arg0)
{
    if (!is_array(arg0))
        arg0 = [arg0];
    
    for (var el = 0; el < array_length(arg0); el++)
    {
        var ThisID = arg0[el];
        var i = 0;
        
        while (global.ShuffleData.Minigames[i] != ThisID && i < array_length(global.ShuffleData.Minigames))
            i++;
        
        show_debug_message($"Searching for {ThisID} , found {global.ShuffleData.Minigames[i]} at {i}");
        var temp = global.ShuffleData.Minigames[i];
        global.ShuffleData.Minigames[i] = global.ShuffleData.Minigames[ThisID];
        global.ShuffleData.Minigames[ThisID] = temp;
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
    Value_10
}
