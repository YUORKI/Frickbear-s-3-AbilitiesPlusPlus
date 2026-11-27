var HoveredText = "";
var BoxX = 0;
var BoxY = 0;
draw_set_font(global.FontW97White);
draw_sprite_stretched(sUIBox_Black, 0, 1, 1, 158, 358);
BoxX = 4;
BoxY = 4;
draw_sprite_stretched(sUIBox_Black, 0, BoxX, BoxY, 22, 22);
draw_sprite(sButtonMini_Icons_White, 0, BoxX + 11, BoxY + 11);

if (clicked(BoxX, BoxY, 22, 22) || input_check_pressed(UnknownEnum.Value_1))
{
    generate_face_tiles();
    save_permanent_data();
    show_debug_message("SKINS: " + string(global.Skins));
    audio_stop_all();
    audio_play_sound(sfxBump, 10, false);
    room_goto(title_screen());
}

BoxX += 24;
draw_sprite_stretched(sUIBox_Black, 0, BoxX, BoxY, 128, 22);
draw_text(BoxX + 6, BoxY + 1, "Reset All");

if (clicked(BoxX, BoxY, 128, 22))
{
    global.Skins = array_create(202, -1);
    global.SkinOffice = -1;
    audio_play_sound(sfxBump, 10, false);
}

BoxX = 15;
BoxY += 35;
draw_sprite_stretched(sUIBox_Black, 2 + ShowAll, BoxX, BoxY, 16, 16);
draw_text(BoxX + 30, BoxY - 2, "Show All Characters");

if (mouse_in_zone(BoxX, BoxY, 16, 16))
{
    HoveredText = "Animatronics without skins will be shown alongside ones that do.";
    
    if (mouse_check_button_pressed(mb_left))
    {
        ShowAll = !ShowAll;
        audio_play_sound(sfxBump, 5, false);
    }
}

BoxY += 24;
draw_sprite_stretched(sUIBox_Black, 2 + global.RandomizeSkins, BoxX, BoxY, 16, 16);
draw_text(BoxX + 30, BoxY - 2, "Randomize Skins");

if (mouse_in_zone(BoxX, BoxY, 16, 16))
{
    HoveredText = "Animatronic skins will be randomized when starting Shuffler Mode and Four Layers Down runs.";
    
    if (mouse_check_button_pressed(mb_left))
    {
        global.RandomizeSkins = !global.RandomizeSkins;
        audio_play_sound(sfxBump, 5, false);
    }
}

BoxY += 24;
draw_sprite_stretched(sUIBox_Black, 2 + global.RandomizeOffice, BoxX, BoxY, 16, 16);
draw_text(BoxX + 30, BoxY - 2, "Randomize Office");

if (mouse_in_zone(BoxX, BoxY, 16, 16))
{
    HoveredText = "Your office's skin will be randomly selected whenever you start a night.";
    
    if (mouse_check_button_pressed(mb_left))
    {
        global.RandomizeOffice = !global.RandomizeOffice;
        audio_play_sound(sfxBump, 5, false);
    }
}

BoxY += 24;
var curTile = 0;
var curOffice = 0;
var nonModTiles = 1;
var curField = 0;
var EntryText = "";
var FieldHeight = 0;

for (var i = -1; i < CharsWithSkins; i++)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    BoxX = 160;
    BoxY = FieldHeight - ScrollBarOffset;
    var EntryHeight = 64;
    
    if (i == -1)
    {
        if (array_length(OfficeNames) == 0)
            continue;
        
        EntryHeight = 16 + (48 * ceil(array_length(OfficeNames) / 7));
        FieldHeight += EntryHeight;
        draw_sprite_stretched(sUIBox_Black, 0, BoxX + 1, BoxY + 1, 462, EntryHeight - 2);
        EntryText = "Office\n";
        var TileX = BoxX + 120;
        var TileY = BoxY + 8;
        
        for (var t = 0; t < (array_length(OfficeNames) + nonModTiles); t++)
        {
            if ((t % 7) == 0 && t != 0)
            {
                TileX = BoxX + 120;
                TileY += 48;
            }
            
            var Selected = (global.SkinOffice + 1) == t;
            
            if (Selected && t >= nonModTiles)
                EntryText += OfficeNames[t - nonModTiles];
            
            draw_sprite_stretched(sUIBox_Black, 2 + Selected, TileX, TileY, 48, 48);
            
            if (mouse_in_zone(TileX, TileY, 48, 48) && !Selected)
                HoveredText = (t < nonModTiles) ? "Default Office" : OfficeNames[t - nonModTiles];
            
            if (t < nonModTiles)
            {
                draw_sprite_ext(sOfficeIcon, 0, TileX, TileY, 1, 1, 0, c_white, Selected ? 1 : 0.25);
            }
            else
            {
                draw_sprite_ext(OfficeTileSprite, curOffice, TileX, TileY, 1, 1, 0, c_white, Selected ? 1 : 0.25);
                curOffice++;
            }
            
            if (clicked(TileX, TileY, 48, 48))
            {
                audio_play_sound(sfxBump, 5, false);
                global.SkinOffice = t - 1;
            }
            
            TileX += 48;
        }
    }
    else
    {
        if (TilesPerEntry[i] == 0 && !ShowAll)
            continue;
        
        EntryHeight = 16 + (48 * ceil((1 + TilesPerEntry[i]) / 7));
        FieldHeight += EntryHeight;
        draw_sprite_stretched(sUIBox_Black, 0, BoxX + 1, BoxY + 1, 462, EntryHeight - 2);
        EntryText = string("{0}: {1}\n", i + 1, global.Descriptions[i][0]);
        var TileX = BoxX + 120;
        var TileY = BoxY + 8;
        
        for (var t = 0; t < (TilesPerEntry[i] + nonModTiles); t++)
        {
            if ((t % 7) == 0 && t != 0)
            {
                TileX = BoxX + 120;
                TileY += 48;
            }
            
            var Selected = (global.Skins[i] + nonModTiles) == t;
            
            if (Selected && t >= nonModTiles)
                EntryText += ModNames[curTile];
            
            draw_sprite_stretched(sUIBox_Black, 2 + Selected, TileX, TileY, 48, 48);
            
            if (mouse_in_zone(TileX, TileY, 48, 48) && !Selected)
                HoveredText = (t < nonModTiles) ? global.Descriptions[i][0] : ModNames[curTile];
            
            if (t < nonModTiles)
            {
                draw_sprite_ext(get_animatronic_data(i).Tile, 0, TileX, TileY, 1, 1, 0, c_white, Selected ? 1 : 0.25);
            }
            else
            {
                draw_sprite_ext(ModTileSprite, curTile, TileX, TileY, 1, 1, 0, c_white, Selected ? 1 : 0.25);
                curTile++;
            }
            
            if (clicked(TileX, TileY, 48, 48))
            {
                audio_play_sound(sfxBump, 5, false);
                global.Skins[i] = t - nonModTiles;
            }
            
            TileX += 48;
        }
    }
    
    draw_text_ext(BoxX + 60, (BoxY + (EntryHeight / 2)) - 2, EntryText, 15, 112);
    curField++;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
var ScrollBar = scroll_bar(ScrollBarOffset, ScrollBarDragged, 160, 0, 464, 360, FieldHeight, 64, 0, 0, 1);
ScrollBarOffset = ScrollBar[0];
ScrollBarDragged = ScrollBar[1];

if (HoveredText != "")
    draw_mechanic_box(HoveredText, sUIBox_Black);

if (round(TransitionPercent * 180) > 0)
{
    draw_rectangle_color(0, 0, 640, 180 * TransitionPercent, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 360, 640, 360 - (180 * TransitionPercent), c_black, c_black, c_black, c_black, false);
    TransitionPercent *= 0.8;
}

enum UnknownEnum
{
    Value_1 = 1
}
