var WindowWidth = 546;
draw_set_font(FontNightOpening);
draw_set_halign(fa_center);

if (Victory)
    draw_text(320 + YOffset, 36, "Victory!");

x = ((640 - WindowWidth) / 2) - YOffset;
y = 82 + (30 * Victory);
YOffset -= (YOffset / (Victory ? 10 : 5));
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
draw_sprite_stretched(sprite_index, image_index, x, y, WindowWidth, 196);
draw_sprite(FaceSprites, global.Guard, x + 6, y + 26);
var TileX = 0;
var TileY = 0;
var Entries = array_length(global.AllTimeSalvages);
var EntriesPerRow = max(ceil(Entries / 2), 10);
var EntrySpace = 432 / (EntriesPerRow - 1);
show_debug_message($"Total Entries: {Entries} | Per Row: {EntriesPerRow} | Space: {EntrySpace}");

for (var i = 0; i < Entries; i++)
{
    TileX = (i % EntriesPerRow) * EntrySpace;
    TileY = 48 * floor(i / EntriesPerRow);
    draw_sprite(global.IconTiles[global.AllTimeSalvages[i]], 0, x + 60 + TileX, y + 26 + TileY);
}

shader_set(shRecolor);
var Pal = [16777215, 11316396, 5263440, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
var Tile = 0;
TileX = 0;

for (var i = 0; i < array_length(global.Upgrades); i++)
{
    if (array_length(global.Upgrades) > 12)
        TileX = Tile * 16;
    else
        TileX = Tile * 32;
    
    draw_sprite(sShopItemSalvageIcons, global.Upgrades[i], x + 60 + TileX + 16, y + 128 + 16);
    Tile++;
}

shader_reset();
draw_text(x + 6, y + 75, Victory ? "Lives:" : "Died on:");
draw_text(x + 6, y + 114, "Earnings:");
draw_text(x + 6, y + 153, "Time:");
draw_set_halign(fa_right);
draw_text(x + 57, y + 95, Victory ? string(lives_left()) : ("Round " + string(global.EndlessRound)));
draw_text(x + 57, y + 134, "$" + EarningAmount);
draw_text(x + 57, y + 173, TimeAmount);
var ButtonX = x + 182 + (WindowWidth - 450);
var ButtonY = y + 167;
var ButtonWidth = 128;
var ButtonHeight = 22;
var StickerOffset = 133 * !Victory;
draw_sprite(sEndlessStickers, global.Difficulty, (ButtonX + StickerOffset) - 13, ButtonY + 11);

if (StickersEarned > 0)
    draw_text((ButtonX + StickerOffset) - 26, ButtonY + 1, $"{StickersEarned} new sticker{(StickersEarned == 1) ? "" : "s"} earned!");

draw_set_halign(fa_left);

if (Victory)
{
    draw_sprite_stretched(sTextBox_Windows, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
    draw_text(ButtonX + 6, ButtonY + 1, "Continue to Round 11");
    
    if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && !ChoiceMade)
    {
        ChoiceMade = 2;
        
        with (oBlackBars)
            BlackOut = true;
        
        audio_sound_gain(MusicPlaying, 0, 1000);
        audio_play_sound(sfxClick, 10, false);
        alarm[0] = 90;
    }
}

ButtonX += (ButtonWidth + 5);
draw_sprite_stretched(sTextBox_Windows, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Quit to Menu");

if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && !ChoiceMade)
{
    ChoiceMade = 1;
    
    with (oBlackBars)
        BlackOut = true;
    
    audio_sound_gain(MusicPlaying, 0, 1000);
    audio_play_sound(sfxClick, 10, false);
    alarm[0] = 60;
}

if (VoiceLineStarted && !audio_is_playing(VoiceLine))
{
    VoiceLineStarted = false;
    audio_sound_gain(MusicPlaying, 1, 500);
}

if (VoiceLineStarted && VoiceLine != -1)
{
    if (VoiceLine != undefined)
    {
        if (!audio_is_playing(VoiceLine))
        {
            VoiceLineStarted = false;
            audio_sound_gain(MusicPlaying, 1, 500);
        }
        else if (subtitles_enabled())
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(global.FontW97Black);
            var SubtitleText = no_brackets(global.GuardNames[global.Guard]) + ": " + SubtitleList[SubtitleEntry];
            
            for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
            {
                for (var FontBold = 1; FontBold <= 3; FontBold++)
                    draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 332 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 400);
            }
            
            draw_set_font(global.FontW97White);
            draw_text_ext(320, 332, SubtitleText, 15, 400);
            var SubtitleEndpoint = 999;
            
            if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
                SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
            
            if (audio_sound_get_track_position(VoiceLine) > SubtitleEndpoint)
                SubtitleEntry++;
            
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_font(global.FontW97Black);
        }
    }
}
