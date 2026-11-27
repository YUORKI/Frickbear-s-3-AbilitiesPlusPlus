CurrentX = 0;
CurrentY = 0;
TileSize += ((Active - TileSize) / 5);
var TopBarOffset = -30 * (1 - TileSize);
var ExtrasEntryAmount = array_length(SorterArray);
var RowAmount = ceil(ExtrasEntryAmount / 10);

if (ModsMenu)
{
    ExtrasEntryAmount = array_length(ModNames);
    RowAmount = ceil(ExtrasEntryAmount / 10);
}

var SelectedName = "";

for (var i = 0; i < array_length(ModsMenu ? ModNames : SorterArray); i++)
{
    var ID = ModsMenu ? i : SorterArray[i];
    var Unlocked = ModsMenu ? true : UnlockedArray[ID];
    var TileX = ((CurrentX * 56) + 44 + ((1 - TileSize) * 24)) - 8;
    var TileY = ((CurrentY * 56) + 8 + ((1 - TileSize) * 24)) - (YOffset - 56);
    var CurrentDirection = Timer + ((TileX + TileY) / -2);
    TileX += lengthdir_x(2, CurrentDirection);
    TileY += lengthdir_y(2, CurrentDirection);
    var TileAngle = dsin(CurrentDirection) * 2;
    
    if (mouse_in_zone(TileX, TileY, 48, 48) && !mouse_in_zone(0, TopBarOffset, 640, 30) && Unlocked && Active)
    {
        shader_set(shFlash);
        
        for (var o = -45; o < 360; o += 90)
            draw_sprite_ext(sTileBase, 0, TileX + round(lengthdir_x(TileSize * 4, o)), TileY + round(lengthdir_y(TileSize * 4, o)), TileSize, TileSize, TileAngle, c_white, 1);
        
        shader_reset();
        SelectedName = ModsMenu ? ModNames[i] : global.Descriptions[ID][0];
        
        if (mouse_check_button_pressed(mb_left))
        {
            Active = false;
            
            with (instance_create_depth(-240, 0, depth - 1, oExtras_AnimatronicGallery))
            {
                CurrentChar = i;
                UnlockedArray = other.ModsMenu ? array_create(array_length(other.ModNames), true) : other.UnlockedArray;
                ModMode = other.ModsMenu;
                generate_extras_descriptions(other.ModsMenu, other.ModsMenu ? array_length(other.ModNames) : 202);
            }
            
            audio_play_sound(sfxClick, 5, false);
        }
    }
    
    var Tile = ModsMenu ? ModTileSprite : get_tile(ID);
    var TileImage = ModsMenu ? ID : 0;
    
    if (Unlocked)
    {
        draw_sprite_ext(sTileBase, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        draw_sprite_ext(Tile, TileImage, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        
        if (!ModsMenu && global.ExtrasNotifs.AnimatronicsNotifs[ID])
            draw_sprite_ext(sExtrasNotification, 0, TileX + (ShowStickers ? 24 : 0), TileY, TileSize, TileSize, TileAngle, c_white, 1);
        
        if (ShowStickers && !ModsMenu && global.EndlessStickers[ID] > -1)
            draw_sprite_ext(sEndlessStickers, global.EndlessStickers[ID], TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
        
        if (ShowStickers && !ModsMenu && (ID >= UnknownEnum.Value_159 && ID <= UnknownEnum.Value_179) && global.EndlessGuardStickers[ID - UnknownEnum.Value_159] > -1)
            draw_sprite_ext(sEndlessStickers, global.EndlessGuardStickers[ID - UnknownEnum.Value_159], TileX, TileY, TileSize, TileSize, TileAngle, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sTileBase, 0, TileX, TileY, TileSize, TileSize, TileAngle, c_white, 0.5);
        shader_set(shFlash);
        draw_sprite_ext(Tile, TileImage, TileX, TileY, TileSize, TileSize, TileAngle, c_black, 0.25);
        shader_reset();
    }
    
    CurrentX++;
    
    if (CurrentX == 10)
    {
        CurrentX = 0;
        CurrentY++;
    }
}

var ScrollBar = scroll_bar(YOffset, BarDragged, 0 - (TileSize * 16), 30, 640, 330, 56 * (RowAmount + 1), 56);
YOffset = ScrollBar[0];
BarDragged = ScrollBar[1];
Timer = (Timer + 4) % 360;
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 0, 0, TopBarOffset, 640, 30);
var Quit = clicked(4, TopBarOffset + 4, 22, 22) || input_check_pressed(UnknownEnum.Value_1);
draw_sprite_stretched(sButtonMini, 0, 4, TopBarOffset + 4, 22, 22);
draw_sprite(sButtonMini_Icons, 0, 15, TopBarOffset + 4 + 11);
draw_sprite_stretched(sTextBox_Windows, !ModsMenu, 28, 4 + TopBarOffset, 120, 22);
draw_text(33, 6 + TopBarOffset, "Vanilla Gallery");
draw_sprite_stretched(sTextBox_Windows, ModsMenu, 148, 4 + TopBarOffset, 120, 22);
draw_text(153, 6 + TopBarOffset, "Mod Gallery");
show_stickers_checkbox(274, 9 + TopBarOffset, "Show Stickers");

if (clicked(33 + (120 * !ModsMenu), TopBarOffset + 4, 120, 22))
{
    audio_play_sound(sfxClick, 10, false);
    ModsMenu = !ModsMenu;
}

draw_set_halign(fa_right);
draw_sprite_stretched(sTextBox_Windows, 1, 456, 4 + TopBarOffset, 180, 22);
draw_text(630, 5 + TopBarOffset, SelectedName);
draw_set_halign(fa_left);

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
    Value_1 = 1,
    Value_159 = 159,
    Value_179 = 179
}
