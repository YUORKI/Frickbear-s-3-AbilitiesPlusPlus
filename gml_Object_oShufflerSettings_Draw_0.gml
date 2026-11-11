var Padding = 10;
var SpaceH = 200;
var SpaceV = 17;
var Columns = 2;
var Rows = ceil(SettingNum / 2);
var Width = (Padding * 2) + (SpaceH * Columns);
var Height = (((Padding * 2) + (SpaceV * Rows)) - 4) + 24;
var ConfirmX = x + 4;
var ConfirmY = (y + Height) - 26;
var ConfirmWidth = Width - 8;
var ConfirmHeight = 22;
var TargY = (360 - Height) / 2;
x = round((640 - Width) / 2);
y += ((TargY - y) / 5);
y = round(y);
draw_sprite_stretched(sWindowBase, 0, x, y, Width, Height);
draw_sprite_stretched(sWindowBase, 0, ConfirmX, ConfirmY, ConfirmWidth, ConfirmHeight);
draw_text(ConfirmX + 6, ConfirmY + 1, "Confirm");
Rows = ceil(SettingNum / 2);

for (var i = 0; i < SettingNum; i++)
{
    var curRow = i % Rows;
    var curCol = floor(i / Rows);
    setting(x + Padding + (curCol * SpaceH), y + Padding + (curRow * SpaceV), Titles[i], i);
}

if (clicked(ConfirmX, ConfirmY, ConfirmWidth, ConfirmHeight))
{
    audio_play_sound(sfxClick, 10, false);
    show_debug_message(global.ShuffleData.Animatronics);
    var StarterGames = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_7];
    var ShopGames = [UnknownEnum.Value_8, UnknownEnum.Value_10, UnknownEnum.Value_9];
    var CabinetGames = [UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_6];
    
    if (!global.ShuffleSettings[UnknownEnum.Value_0])
        restore_animatronic([UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2]);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_1])
        restore_animatronic(UnknownEnum.Value_3);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_2])
        restore_animatronic(UnknownEnum.Value_16);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_3])
        restore_animatronic(UnknownEnum.Value_14);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_4])
        restore_animatronic([UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34]);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_5])
        restore_minigames(StarterGames);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_7])
        restore_minigames(ShopGames);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_6])
        restore_minigames(CabinetGames);
    
    if (!global.ShuffleSettings[UnknownEnum.Value_8])
        global.ShuffleData.Locations = [MinigameMaze_1, MinigameMaze_2, MinigameMaze_3, MinigameMaze_4, MinigameMaze_5];
    
    var Shuffle = global.ShuffleData.Animatronics;
    global.AllTimeSalvages = [Shuffle[UnknownEnum.Value_0], Shuffle[UnknownEnum.Value_1], Shuffle[UnknownEnum.Value_2], Shuffle[UnknownEnum.Value_3], Shuffle[UnknownEnum.Value_16]];
    global.ShuffleSettings[UnknownEnum.Value_10] = true;
    create_save();
    instance_destroy();
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
    Value_14 = 14,
    Value_16 = 16,
    Value_20 = 20,
    Value_33 = 33,
    Value_34,
    Value_35
}
