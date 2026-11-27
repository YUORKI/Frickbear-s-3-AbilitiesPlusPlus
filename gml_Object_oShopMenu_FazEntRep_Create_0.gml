function calculate_value(arg0)
{
    return ((get_animatronic_data(arg0).SalvageValue * 1.5 * (guard_ability(UnknownEnum.Value_10) ? 1.25 : 1) * global.GuardParameters.salvage_bonus_multiplier) / 100) + 5;
}

var PossibleChars = [];

for (var i = 0; i <= 90; i++)
{
    if (!array_contains(global.AllTimeSalvages, i))
        array_push(PossibleChars, i);
}

SorterArray = get_sorter_array(PossibleChars, UnknownEnum.Value_0);
TileSurf = -1;
SelectedTile = 0;
TileValue = calculate_value(0);
SelectedRow = 0;
SelectedColumn = 0;
ViewOffset = 0;
ViewOffsetTarget = 0;
ConfirmHandY = 0;
DescText = "";
DescBoxY = 232;
ConfirmBoxOffset = 180;
WaitForConfirm = false;
ConfirmOption = false;
SelectionBoxOffset = -364;
DisplayedEarnings = global.RunEarnings;
PurchaseMessage = "";
PurchaseTimer = 0;

with (oShopkeepSprite)
    switch_pose(1);

with (oTextBox)
    ExternalPause = true;

input_clear(UnknownEnum.Value_0);

function draw_everything()
{
    shader_set(shRecolor);
    var Pal = [16777215, 10461087, 1248964, 0];
    replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
    var BoxX = SelectionBoxOffset;
    var BoxY = 2;
    var BoxesPerRow = 8;
    var BoxWidth = BoxesPerRow * 48;
    var BoxHeight = 220;
    SelectionBoxOffset += ((8 - SelectionBoxOffset) / 10);
    var ConfirmBoxX = 448;
    var ConfirmBoxY = 68 + ConfirmBoxOffset;
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(global.FontHanddrawn);
    draw_sprite_ext(sTextBox, 0, ConfirmBoxX, ConfirmBoxY, 2, 1.5, 0, c_white, 1);
    draw_text_color(ConfirmBoxX + 48, ConfirmBoxY + 16, "Yes", #002F33, #002F33, #002F33, #002F33, 1);
    draw_text_color(ConfirmBoxX + 48, ConfirmBoxY + 48, "No", #002F33, #002F33, #002F33, #002F33, 1);
    ConfirmHandY += (((32 * ConfirmOption) - ConfirmHandY) / 2);
    draw_sprite(sSelectionHand, 0, ConfirmBoxX + 28, ConfirmBoxY + 32 + ConfirmHandY);
    draw_rectangle_color(0, 240, 640, 360, #002F33, #002F33, #002F33, #002F33, false);
    draw_sprite_stretched(sTextBox, 1, BoxX, BoxY, BoxWidth + 20, BoxHeight + 20);
    
    if (!surface_exists(TileSurf))
        TileSurf = surface_create(BoxWidth, BoxHeight);
    
    surface_set_target(TileSurf);
    draw_clear_alpha(c_black, 0);
    var ListLength = array_length(SorterArray);
    var RowCount = ceil(ListLength / BoxesPerRow);
    var HorizontalShift = input_check_pressed(UnknownEnum.Value_5) - input_check_pressed(UnknownEnum.Value_3);
    var VerticalShift = input_check_pressed(UnknownEnum.Value_4) - input_check_pressed(UnknownEnum.Value_2);
    
    if (WaitForConfirm)
    {
        if (VerticalShift != 0)
            ConfirmOption = !ConfirmOption;
        
        ConfirmBoxOffset += ((0 - ConfirmBoxOffset) / 5);
        DescBoxY += ((232 - DescBoxY) / 5);
        
        if (input_check_pressed(UnknownEnum.Value_0))
        {
            WaitForConfirm = false;
            audio_play_sound(sfxCamSwitch, 5, false);
            input_clear(UnknownEnum.Value_0);
            
            if (!ConfirmOption)
            {
                global.EndlessInventory.MarkiplierPoints++;
                earn_money(TileValue);
                global.Jumpscare = SelectedTile;
                array_push(global.AllTimeSalvages, SelectedTile);
                
                with (oShopkeepSprite)
                {
                    purchase_made();
                    
                    if (string_pos("Chica", global.Descriptions[global.Jumpscare][0]) != 0)
                        bitcrush_sound(voc_FazEntRep_BuyChica);
                    else
                        purchase_voiceclip();
                }
                
                audio_play_sound(sfxRegister, 10, false);
                var TextboxDepth = oTextBox.depth;
                instance_destroy(oTextBox);
                
                with (instance_create_depth(0, 0, TextboxDepth, oTextBox))
                {
                    game_text("Shop_Conclusion");
                    CurrentTextboxY = 232;
                }
                
                instance_destroy();
            }
        }
    }
    else
    {
        ConfirmBoxOffset += ((180 - ConfirmBoxOffset) / 5);
        DescBoxY += ((360 - DescBoxY) / 5);
        SelectedColumn = (SelectedColumn + HorizontalShift + BoxesPerRow) % BoxesPerRow;
        SelectedRow = (SelectedRow + VerticalShift + RowCount) % RowCount;
        
        if ((SelectedColumn + (SelectedRow * BoxesPerRow)) >= ListLength)
            SelectedRow = 0;
    }
    
    shader_reset();
    var AnimName = global.UnlockedAnimatronics[SelectedTile] ? global.Descriptions[SelectedTile][0] : "???";
    
    for (var i = 0; i < ListLength; i++)
    {
        var TileX = (i % BoxesPerRow) * 48;
        var TileY = floor(i / BoxesPerRow) * 48;
        var ID = SorterArray[i];
        
        if ((SelectedColumn + (SelectedRow * BoxesPerRow)) == i)
        {
            SelectedTile = ID;
            ViewOffsetTarget = clamp((BoxHeight / 2) - (TileY + 24), BoxHeight - (RowCount * 48), 0);
            
            if (input_check_pressed(UnknownEnum.Value_0))
            {
                WaitForConfirm = true;
                audio_play_sound(sfxCamSwitch, 5, false);
                DescText = string("Recruit {0} for ${1}?", AnimName, string_format(TileValue, 1, 2));
                ConfirmOption = false;
            }
        }
        
        draw_outline(((SelectedColumn + (SelectedRow * BoxesPerRow)) == i) ? 1316072 : 5662772, global.IconTiles[SorterArray[i]], 2, TileX, TileY + ViewOffset);
        
        if (!global.UnlockedAnimatronics[ID])
        {
            shader_set(shFlash);
            draw_sprite_ext(global.IconTiles[SorterArray[i]], 2, TileX, TileY + ViewOffset, 1, 1, 0, #002F33, 1);
        }
        else
        {
            draw_sprite(global.IconTiles[SorterArray[i]], 2, TileX, TileY + ViewOffset);
        }
        
        shader_reset();
        TileX += 48;
        
        if (((i + 1) % BoxesPerRow) == 0)
        {
            TileX = BoxX + 10;
            TileY += 48;
        }
    }
    
    if (HorizontalShift != 0 || VerticalShift != 0)
    {
        TileValue = calculate_value(SelectedTile);
        audio_play_sound(sfxBump, 5, false);
    }
    
    ViewOffset += ((ViewOffsetTarget - ViewOffset) / 5);
    shader_set(shRecolor);
    replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
    surface_reset_target();
    draw_surface(TileSurf, BoxX + 10, BoxY + 10);
    BoxY += (BoxHeight + 20);
    var Text = string("{0} (${1})", string_upper(AnimName), string_format(TileValue, 1, 2));
    draw_sprite_stretched(sTextBox, 1, BoxX, BoxY, BoxWidth + 20, 116);
    draw_set_font(global.FontW97White);
    draw_sprite(sEndlessStickers_Gray, global.EndlessStickers[SelectedTile] + 1, BoxX + 6 + 5 + 8, BoxY + 1 + 8 + 10);
    draw_text_ext_color(BoxX + 6 + 16 + 9, BoxY + 1 + 8, Text, 15, BoxWidth - 10, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    Text = global.Descriptions[SelectedTile][1];
    draw_text_ext_color(BoxX + 6 + 8, BoxY + 1 + 8 + 30, Text, 15, BoxWidth - 10, #E0F8D0, #E0F8D0, #E0F8D0, #E0F8D0, 1);
    show_debug_message(string("{0},{1},{2}", SelectedColumn, SelectedRow, ViewOffsetTarget));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(global.FontHanddrawn);
    draw_sprite_ext(sTextBox, 0, 0, DescBoxY, 10, 2, 0, c_white, 1);
    draw_text_ext_color(16, DescBoxY + 16, DescText, 32, 544, #002F33, #002F33, #002F33, #002F33, 1);
    
    if (input_check_pressed(UnknownEnum.Value_1) && !WaitForConfirm)
    {
        with (oTextBox)
        {
            ExternalPause = false;
            CurrentTextboxY = other.DescBoxY;
        }
        
        instance_destroy();
    }
    
    shader_reset();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_10 = 10
}
