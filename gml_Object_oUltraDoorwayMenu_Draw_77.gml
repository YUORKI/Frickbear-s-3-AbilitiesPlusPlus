set_target_to_ui();

with (oEndless_ShopPickerRoom)
    DoorwayFreeze = true;

var OptionAmount = array_length(Choices);
var InnerWindowWidth = (48 * max(8, OptionAmount / RowCount)) + 4;
var InnerWindowHeight = (48 * (RowCount + 1)) + 4;
var WindowWidth = InnerWindowWidth + 8;
var WindowHeight = InnerWindowHeight + 56;
var WindowX = (640 - WindowWidth) / 2;
var WindowY = (360 - WindowHeight) / 2;
WindowY -= ((1 - TileSize) * 360);
draw_sprite_stretched(sTextBox_Windows, 0, WindowX, WindowY, WindowWidth, WindowHeight);
var ButtonX = WindowX + 4;
var ButtonY = WindowY + 4;
var ButtonWidth = 22;
var ButtonHeight = 22;
draw_set_halign(fa_left);
draw_sprite_stretched(sTextBox_Windows, 1, ButtonX + 2, ButtonY, WindowWidth - 10, ButtonHeight);
draw_text(WindowX + 11, WindowY + 5, "Select a shop!");
var InnerWindowY = WindowY + (ButtonWidth + 6);
InnerWindowWidth = ((48 * OptionAmount) / RowCount) + 4;
var InnerWindowX = (640 - InnerWindowWidth) / 2;
var CharSelectionWindowHeight = (48 * RowCount) + 4;
draw_sprite_stretched(sTextBox_Windows, 2, InnerWindowX, InnerWindowY, InnerWindowWidth, CharSelectionWindowHeight);
ButtonX = InnerWindowX + 2;
ButtonY = InnerWindowY + 2;
ButtonWidth = 48;
ButtonHeight = 48;
var SelectedData = undefined;
var SelectedPrice = 0;

for (var a = 0; a < OptionAmount; a++)
{
    var Hovered = false;
    draw_sprite_stretched(sButtonMini, !Available[a], ButtonX, ButtonY, ButtonWidth, ButtonHeight);
    
    if (Available[a])
    {
        if (mouse_in_zone(ButtonX, ButtonY, ButtonWidth, ButtonHeight))
        {
            Hovered = true;
            SelectedData = Choices[a].ID;
        }
        
        if (!global.UnlockedAnimatronics[Choices[a].ID])
        {
            shader_set(shFlash);
            var Color = Hovered ? 0 : 8421504;
            draw_sprite_ext(global.IconTiles[Choices[a].ID], 0, ButtonX, ButtonY, 1, 1, 0, Color, 1);
            shader_reset();
        }
        else
        {
            draw_sprite(global.IconTiles[Choices[a].ID], !Hovered, ButtonX, ButtonY);
        }
    }
    
    if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && Hovered)
    {
        global.Shop = Choices[a].ShopID;
        global.RepeatPrevention.Shops = array_concat([Choices[a].ShopID], global.RepeatPrevention.Shops);
        
        with (oEndless_ShopPickerRoom)
        {
            PickedShops[2] = global.Shop;
            TransitionSideLock = 0;
            TransitioningOut = true;
            FlashTimer = 30;
            audio_play_sound(sfxDoor, 10, false);
        }
        
        Active = false;
    }
    
    ButtonX += 48;
    
    if ((a + 1) == (OptionAmount / RowCount))
    {
        ButtonX = InnerWindowX + 2;
        ButtonY += 48;
    }
}

InnerWindowX = WindowX + 4;
InnerWindowY += CharSelectionWindowHeight;
InnerWindowWidth = (48 * max(8, OptionAmount / RowCount)) + 4;
InnerWindowHeight = 22;
draw_sprite_stretched(sTextBox_Windows, 1, InnerWindowX, InnerWindowY, InnerWindowWidth, InnerWindowHeight);

if (SelectedData != undefined)
{
    var Text = global.UnlockedAnimatronics[SelectedData] ? global.Descriptions[SelectedData][0] : "???";
    draw_text(InnerWindowX + 6, InnerWindowY + 1, Text);
}

InnerWindowY += 24;
InnerWindowHeight = ((48 * (RowCount + 1)) + 4) - CharSelectionWindowHeight;
draw_sprite_stretched(sTextBox_Windows, 1, InnerWindowX, InnerWindowY, InnerWindowWidth, InnerWindowHeight);

if (SelectedData != undefined)
    draw_text_ext(InnerWindowX + 6, InnerWindowY + 1, global.Descriptions[SelectedData][1], 14, InnerWindowWidth - 8);

TileSize += ((Active - TileSize) / 5);
surface_reset_target();
