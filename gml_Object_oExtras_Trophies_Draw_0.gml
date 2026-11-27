var TopBarOffset = -224 * (1 - TileSize);
var Shrinker = 16;
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, TopBarOffset, 0, 224 - Shrinker, 360);
draw_sprite_stretched(sTextBox_Windows, 1, TopBarOffset + 28, 4, 192 - Shrinker, 22);
var TrophyText = "Trophies: " + string(TrophiesNum) + "/" + string(56) + ((ForbiddenTrophiesNum == 0) ? "" : $" (+{ForbiddenTrophiesNum})");
draw_text(TopBarOffset + 33, 5, TrophyText);
draw_sprite_stretched(sTextBox_Windows, 2, TopBarOffset + 4, 28, 216 - Shrinker, 328);
draw_sprite_stretched(sButtonMini, 0, TopBarOffset + 4, 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, TopBarOffset + 4 + 11, 15);
CurrentX = 0;
CurrentY = 0;
TileSize += ((Active - TileSize) / 5);
var ExtrasEntryAmount = array_length(DisplayTrophies);
var RowAmount = ceil(ExtrasEntryAmount / 7);
var ScrollBar = scroll_bar(ScrollBarOffset, ScrollBarDragged, 224 - (Shrinker * TileSize), 0, 416, 360, (56 * RowAmount) + 24, 56);
ScrollBarOffset = ScrollBar[0];
ScrollBarDragged = ScrollBar[1];
YOffset = (-1 * ScrollBarOffset) + 56;

for (var i = 0; i < ExtrasEntryAmount; i++)
{
    var ID = DisplayTrophies[i];
    var TileX = (CurrentX * 56) + (240 - Shrinker) + ((1 - TileSize) * 24);
    var TileY = ((CurrentY * 56) - 40) + YOffset + ((1 - TileSize) * 24);
    CurrentX++;
    
    if (CurrentX == 7)
    {
        CurrentX = 0;
        CurrentY++;
    }
    
    var CurrentDirection = Timer + ((TileX + TileY) / -2);
    TileX += lengthdir_x(2, CurrentDirection);
    TileY += lengthdir_y(2, CurrentDirection);
    var TileAngle = dsin(CurrentDirection) * 2;
    var Unlocked = global.UnlockedTrophies[ID];
    
    if (mouse_in_zone(TileX, TileY, 48, 48) && Active)
    {
        shader_set(shFlash);
        
        for (var o = -45; o < 360; o += 90)
            draw_sprite_ext(sTileBase, 0, TileX + round(lengthdir_x(TileSize * 4, o)), TileY + round(lengthdir_y(TileSize * 4, o)), TileSize, TileSize, TileAngle, c_white, 1);
        
        shader_reset();
        var Text = global.UnlockedTrophies[ID] ? get_trophy_name(ID) : "???";
        
        switch (Trophies[ID].Type)
        {
            case UnknownEnum.Value_0:
                Text += " (RUBY)";
                break;
            
            case UnknownEnum.Value_1:
                Text += " (TOPAZ)";
                break;
            
            case UnknownEnum.Value_2:
                Text += " (EMERALD)";
                break;
            
            case UnknownEnum.Value_3:
                Text += " (AQUAMARINE)";
                break;
            
            case UnknownEnum.Value_4:
                Text += " (SAPPHIRE)";
                break;
            
            case UnknownEnum.Value_5:
                Text += " (AMETHYST)";
                break;
            
            case UnknownEnum.Value_6:
                Text += " (SPINEL)";
                break;
            
            case UnknownEnum.Value_7:
                Text += " (MOONSTONE)";
                break;
            
            case UnknownEnum.Value_8:
                Text += " (BLOODSTONE)";
                break;
        }
        
        Text += ("\n\n" + ((Trophies[ID].Gamemode == 0) ? "(FRICKBEAR'S 3) - " : ((Trophies[ID].Gamemode == 1) ? "(FOUR LAYERS DOWN) - " : "")));
        Text += ((Trophies[ID].Display || global.UnlockedTrophies[ID]) ? Trophies[ID].Desc : "???");
        draw_text_ext(TopBarOffset + 10, 30, Text, 14, 202 - Shrinker);
        global.ExtrasNotifs.TrophyNotifs[ID] = false;
    }
    
    if (Unlocked)
    {
        draw_sprite_ext(sTrophy_Back, Trophies[ID].Type, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        draw_sprite_ext(sTrophyIcons, ID, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        
        if (global.ExtrasNotifs.TrophyNotifs[ID])
            draw_sprite_ext(sExtrasNotification, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sTrophy_Back, Trophies[ID].Type, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 0.5);
        shader_set(shFlash);
        draw_sprite_ext(sTrophyIcons, ID, TileX, TileY, TileSize, TileSize, TileAngle, c_black, 0.25);
        shader_reset();
    }
}

Timer = (Timer + 4) % 360;
var Quit = clicked(4, 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);

if (Active && Quit && TileSize > 0.5)
{
    audio_play_sound(sfxBump, 5, false);
    Active = false;
    oExtras.Active = true;
}

if (TileSize < 0.01 && oExtras.Active)
    instance_destroy();

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
    Value_8
}
