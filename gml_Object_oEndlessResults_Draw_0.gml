draw_outline(16777215, BigFaceSprites, global.Guard * 2, lerp(-480, 0, TransitionPercent), 0);
draw_sprite(BigFaceSprites, global.Guard * 2, lerp(-480, 0, TransitionPercent), 0);
BoxX = lerp(640, 342, TransitionPercent);
BoxY = 2;
shader_set(shRecolor);
var Pal = [16777215, 11316396, 5263440, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_menu_box(0, 0, 296, 356, 0);
var LivesCount = min(array_length(global.Lives), 7);
draw_menu_box(4, 4, 288 - (LivesCount * 24), 22, 1, Victory ? "Victory!" : "GAME OVER", "", global.Difficulty);

if (Victory)
{
    for (var i = 0; i < LivesCount; i++)
    {
        ButtX = 270 - (i * 24);
        draw_menu_box(ButtX, 4, 22, 22, 5);
        
        if (i < array_length(global.Lives))
            draw_sprite(GuardSprite, global.Lives[i] * 4, BoxX + ButtX + 11, BoxY + 4 + 11);
    }
}

draw_menu_box(4, 28, 288, 144, 5);
var EntriesPerRow = max(ceil(array_length(global.AllTimeSalvages) / 3), 6);
var EntrySpace = 240 / (EntriesPerRow - 1);

for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
{
    var TileX = round(((i % EntriesPerRow) * EntrySpace) + (4 + BoxX));
    var TileY = round((floor(i / EntriesPerRow) * 48) + (28 + BoxY));
    draw_sprite(global.IconTiles[global.AllTimeSalvages[i]], Colorful ? 0 : 2, TileX, TileY);
}

draw_menu_box(4, 174, 288, 36, 5);
EntriesPerRow = array_length(global.Upgrades);
EntrySpace = min(252 / (EntriesPerRow - 1), 38);

for (var i = 0; i < array_length(global.Upgrades); i++)
    draw_sprite(sShopItemSalvageIcons, global.Upgrades[i], BoxX + 4 + (i * EntrySpace) + 18, BoxY + 174 + 18);

var ExtraButtonSpace = !ShowAngelButton * 24;
draw_menu_box(4, 212, 288, 92 + ExtraButtonSpace, 1);
var BoxHeight = 0;

if (Victory)
{
    draw_menu_box(4, 212 + BoxHeight, 288, 22, -1, "Earnings:", "$" + EarningAmount);
    BoxHeight += 15;
    draw_menu_box(4, 212 + BoxHeight, 288, 22, -1, "Time:", TimeAmount);
    BoxHeight += 15;
    
    if (StickersEarned > 0)
        draw_menu_box(4, (304 + ExtraButtonSpace) - 22, 288, 22, -1, "New Stickers:", string(StickersEarned), global.Difficulty);
}
else
{
    draw_menu_box(4, 212 + BoxHeight, 288, 22, -1, "Died on:", string("Round {0}", global.EndlessRound));
    BoxHeight += 15;
    draw_menu_box(4, 212 + BoxHeight, 288, 22, -1, "Died to:", (global.Jumpscare == -1) ? "Overheat" : global.Descriptions[global.Jumpscare][0]);
    BoxHeight += 15;
}

if (ShowAngelButton && Victory)
{
    draw_menu_box(4, 306, 143, 22, 5, ButtonTitles[0]);
    draw_menu_box(149, 306, 143, 22, 5, ButtonTitles[1]);
}

if (Victory)
    draw_menu_box(4, 330, 143, 22, 5, ButtonTitles[2]);

draw_menu_box(149, 330, 143, 22, 5, ButtonTitles[3]);
var ButtX = 2;
var ButtY = 336;
Screenshot = clicked(ButtX, ButtY, 22, 22);

if (Screenshot)
{
    ScreenshotTime = 120;
    audio_play_sound(sfxCamSwitch, 10, false);
}

draw_sprite_stretched(sUIBox_Black, Screenshot * 5, ButtX, ButtY, 22, 22);
draw_sprite(sButtonMini_Icons_White, 5, ButtX + 11, ButtY + 11);
ButtY += ScreenshotOffset;
draw_set_font(global.FontW97White);
draw_sprite_stretched(sUIBox_Black, Screenshot, ButtX + 24, ButtY, 314, 22);
draw_text(ButtX + 30, ButtY + 1, "Screenshot saved to AppData/Local/Frickbears3 folder!");

if (ScreenshotTime > 0)
{
    ScreenshotOffset += ((0 - ScreenshotOffset) / 5);
    ScreenshotTime--;
}
else
{
    ScreenshotOffset += ((24 - ScreenshotOffset) / 5);
}

shader_reset();

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

TransitionPercent += ((1 - TransitionPercent) / 5);
check_reset();
