set_target_to_ui();
var Ref = oCamera;
var Freeze = Ref.Freeze;
var MaskSprite = Ref.MaskSprite;
var MaskImage = Ref.MaskImage;
var MaskAnimation = Ref.MaskAnimation;
var CamAnimation = Ref.CamAnimation;
var CamAlpha = Ref.CamAlpha;
var FlashlightPower = Ref.FlashlightPower;
var HandheldOffset = Ref.HandheldOffset;
var HandheldUp = Ref.HandheldUp;
var JawLevel = Ref.JawLevel;
var StareFrames = Ref.StareFrames;
var ZapAlpha = Ref.ZapAlpha;
var ShowMalhare = Ref.ShowMalhare;
var InfinitePowerCutoffTime = Ref.InfinitePowerCutoffTime;
var BossTimer = Ref.BossTimer;
var BossMode = Ref.BossMode;
var TokenBoxValue = Ref.TokenBoxValue;
var TokenBoxSpeed = Ref.TokenBoxSpeed;
var TokenBoxOffset = Ref.TokenBoxOffset;
var EntranceAlpha = Ref.EntranceAlpha;
var Freezeframe = Ref.Freezeframe;
var Scared = Ref.Scared;
var FaceSprites = Ref.FaceSprites;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.FontW97Black);

if (!Freeze || instance_exists(oJumpscarePhantoms))
{
    draw_sprite(sNightmareGameBorder, 0, 320, HandheldOffset);
    
    if (surface_exists(global.MinigameSurface))
    {
        draw_surface_ext(global.MinigameSurface, 160, 36 + (HandheldOffset - 360), 2, 2, 0, c_white, 1);
        var BlurbWindowSize = 80;
        
        if (instance_exists(oHD_Guard) && instance_exists(oHappiestDayDrawer))
        {
            var SurfaceX = (oHD_Guard.x + (80 - (BlurbWindowSize / 2))) - oHappiestDayDrawer.x;
            var SurfaceY = (oHD_Guard.y + (72 - (BlurbWindowSize / 2))) - oHappiestDayDrawer.y;
            SurfaceX = clamp(SurfaceX, 0, 160 - BlurbWindowSize);
            SurfaceY = clamp(SurfaceY, 0, 144 - BlurbWindowSize);
            draw_surface_part(global.MinigameSurface, SurfaceX, SurfaceY, BlurbWindowSize, BlurbWindowSize, 320 - (BlurbWindowSize / 2), (370 - BlurbWindowSize) + (720 - HandheldOffset));
            draw_sprite(sNightmareMinigameMiniWindow, 0, 320 - (BlurbWindowSize / 2), (370 - BlurbWindowSize) + (720 - HandheldOffset));
        }
    }
    
    if (instance_exists(oVanniMask) && CamAlpha == 1)
        draw_sprite_ext(sVanniOverlay, 0, 320, 180, oVanniMask.OverlaySize, oVanniMask.OverlaySize, 0, c_white, (0.6 + (dsin(oVanniMask.Timer * 2) * 0.2)) * oVanniMask.Alpha);
    
    if (global.Temperature > 30)
    {
        var VignettePercent = (global.Temperature - 30) / 10;
        draw_sprite_ext(sBurningVignette, 0, 320, 180, 3 - VignettePercent, 3 - VignettePercent, 0, c_white, VignettePercent / 2);
    }
    
    if (CamAlpha == 1 && JawLevel != 0 && character_active(UnknownEnum.Value_22))
    {
        var FredShift = round(360 * (1 - (JawLevel * 0.6)));
        draw_sprite_ext(oNightmareFredbear.SPRITE_Jaw, 0, 320, 0 - FredShift, 1, 1, 0, -1, 1);
        draw_sprite_ext(oNightmareFredbear.SPRITE_Jaw, 1, 320, 0 + FredShift, 1, 1, 0, -1, 1);
    }
    
    if (ZapAlpha > 0)
    {
        draw_set_alpha(ZapAlpha);
        draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
    
    if (StareFrames > -180)
    {
        if (StareFrames > 0 && !global.CamUp)
        {
            draw_set_alpha(random_range(2, 0));
        }
        else
        {
            if (instance_exists(oWitheredBonnie))
                audio_stop_sound(oWitheredBonnie.SOUND_Stare);
            
            var StareAlpha = (StareFrames + 180) / 180;
            draw_set_alpha(StareAlpha * StareAlpha * StareAlpha * StareAlpha);
        }
        
        draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
}

if (sprite_exists(MaskSprite))
    draw_sprite_ext(MaskSprite, MaskImage + (global.Guard * 2), 320, 180 - ((1 - MaskAnimation) * 480), 1, 1, 0, -1, 1);

if (!Freeze || instance_exists(oJumpscarePhantoms))
{
    if ((guard_ability(UnknownEnum.Value_19) || guard_ability(UnknownEnum.Value_8)) && !instance_exists(oFredbear))
    {
        var ProgressToMake = 360 / global.NightSpeedup;
        var ProgressMade = global.Timer - oCamera.StartTime;
        var BarX = 222;
        var BarY = 336;
        draw_sprite_stretched(sTextBox_Windows, 0, BarX, BarY, 212, 22);
        draw_text(BarX + 6, BarY + 1, "Pts:");
        draw_set_halign(fa_right);
        draw_text(BarX + 68, BarY + 1, string("{0}/{1}", floor(global.Progress), global.ProgressToMake));
        draw_set_halign(fa_left);
        draw_sprite_stretched(sTextBox_Windows, 2, BarX + 71, BarY + 4, 137, 14);
        draw_rectangle_color(BarX + 75, BarY + 8, BarX + 74 + ((128 * floor(max(0, global.Progress))) / global.ProgressToMake), BarY + 8 + 5, c_red, c_red, c_red, c_red, false);
    }
    
    draw_sprite(sOfficeUI, 0, 0, 0);
    var Text = "";
    var TimerHour = floor((global.Timer / 60) + 12) % 12;
    var TimerMinute = floor(global.Timer + 1440) % 60;
    var TimerA;
    
    if (TimerHour == 0)
        TimerA = string("12");
    else
        TimerA = string(TimerHour);
    
    var TimerB;
    
    if (TimerMinute < 10)
        TimerB = string("0") + string(TimerMinute);
    else
        TimerB = string(TimerMinute);
    
    var TimerC;
    
    if ((floor(global.Timer / 720) % 2) == 0)
        TimerC = string(" AM");
    else
        TimerC = string(" PM");
    
    Text = string(TimerA) + string(":") + string(TimerB) + string(TimerC);
    
    if (BossMode != UnknownEnum.Value_0 && BossMode != UnknownEnum.Value_3)
        Text = "Phase " + string(global.BossPhase);
    
    var NightText = "Night " + string(global.Night);
    
    if (is_string(global.Night))
        NightText = string(global.Night);
    
    if (global.Night == "Endless")
        NightText = "Round " + string(global.EndlessRound);
    
    if (global.Night == "Custom" && global.Route != UnknownEnum.Value_0)
        NightText = format_as_timer(BossTimer, true);
    
    draw_text_color(34, 6, Text, c_white, c_white, c_white, c_white, 1);
    draw_text_color(34, 23, NightText, c_white, c_white, c_white, c_white, 1);
    var PowerMeterImg = 0;
    
    if (global.Power < 50)
        PowerMeterImg = floor((50 - global.Power) / 10);
    
    var MeterWidth = min(6 * ceil(global.Power / 5), 120);
    draw_sprite_part(sMeter, PowerMeterImg, 0, 0, MeterWidth, 6, 49, 344);
    
    if (global.Power > 100)
    {
        MeterWidth = min(6 * ceil((global.Power - 100) / 5), 120);
        draw_sprite_part(sMeter, 4, 0, 0, MeterWidth, 6, 49, 344);
    }
    
    if (InfinitePowerCutoffTime > 0 && !(InfinitePowerCutoffTime < 5 && (floor(global.Timer * 4) % 2) == 1))
    {
        MeterWidth = 120;
        draw_sprite_part(sMeter, 5, 0, 0, MeterWidth, 6, 49, 344);
    }
    
    MeterWidth = 6 * clamp(oCamera.Usage, 0, 5);
    draw_sprite_part(sMeter, 4, 0, 0, MeterWidth, 6, 184, 344);
    
    if (guard_ability(UnknownEnum.Value_16) && oCamera.Usage > 1 && floor((current_time * 4) / 1000) % 2)
        draw_sprite(sMarionetteWarning, 1, 220, 336);
    
    MeterWidth = 6 * floor(global.Temperature / 2);
    var MeterColor = floor(global.Temperature / 8) - 1;
    draw_sprite_part(sMeter, MeterColor, 0, 0, MeterWidth, 6, 511, 344);
    
    if (global.Temperature < 0)
    {
        MeterWidth = 6 * abs(floor(global.Temperature / 2));
        draw_sprite_part(sMeter, 5, 0, 0, MeterWidth, 6, 511 + (120 - MeterWidth), 344);
    }
    
    draw_set_halign(fa_left);
    draw_sprite_stretched(sWindowBase, 0, 554, 2 + TokenBoxOffset, 84, 22);
    draw_text_color(560, 3 + TokenBoxOffset, "Tokens: ", c_white, c_white, c_white, c_white, 1);
    draw_set_halign(fa_right);
    draw_text_color(632, 3 + TokenBoxOffset, floor(global.Tokens), c_white, c_white, c_white, c_white, 1);
}

draw_set_alpha(EntranceAlpha);
draw_rectangle_color(0, 0, 640, 360, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_8 = 8,
    Value_16 = 16,
    Value_19 = 19,
    Value_22 = 22
}
