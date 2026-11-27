var WindowX = 120;
var WindowY = (360 + TabletOffset) - 330;
var Die = false;

if (!instance_exists(oMimic))
{
    if (TabletUp)
    {
        TabletUp = false;
        global.PanelUp = false;
        audio_play_sound(oMimic.SOUND_Close, 3, false, 0.5);
    }
    
    exit;
}

if (!surface_exists(MimicSurf))
    MimicSurf = surface_create(400, 300);

surface_set_target(MimicSurf);
draw_clear_alpha(c_black, 1);
draw_set_halign(fa_left);
draw_set_color(Color);
draw_set_font(global.FontW97White);
draw_sprite_stretched(sDataDiver_Box, 0, -2, 56, 404, 22);
draw_text(5, 57, "Select a suit, then press the confirmation button. Right-click to flag a suit as safe.");
draw_sprite_stretched(sDataDiver_Box, 0, -2, -2, 404, 22);
draw_text(5, -1, $"SELECTION {4 - oMimic.Lives} / {round(3 / global.NightSpeedup)}");
draw_set_halign(fa_right);
draw_text(395, -1, $"TIME REMAINING: {format_as_timer(oMimic.KillTimer, false)}");
var SuitNum = oMimic.TotalSuits;
var TopRowEntries = ceil(SuitNum / 2);
var BottomRowEntries = floor(SuitNum / 2);
var ResetHover = true;

for (var i = 0; i < SuitNum; i++)
{
    var Alpha = 0.25;
    var Row = i >= TopRowEntries;
    var ButtonX = 177 + ((i - (Row * TopRowEntries) - (((Row ? BottomRowEntries : TopRowEntries) - 1) / 2)) * 50);
    var ButtonY = 88 + (Row * 50);
    draw_sprite_stretched(sDataDiver_Box, 0, ButtonX - 2, ButtonY - 2, 52, 52);
    
    if (mouse_in_zone(ButtonX + WindowX, ButtonY + WindowY, 48, 48))
    {
        var Flagged = Flags[i];
        
        if (!Flagged)
            Alpha = 0.5;
        
        if (HoveredSuit != i && !Flagged)
        {
            HoveredSuit = i;
            audio_play_sound(oMimic.SOUND_TaskDone, 2, false, 0.2);
        }
        
        if (mouse_check_button_pressed(mb_left) && !Flagged)
        {
            Choice = (Choice == i) ? -1 : i;
            audio_play_sound(oMimic.SOUND_Select, 2, false);
        }
        
        if (mouse_check_button_pressed(mb_right))
        {
            audio_play_sound(oMimic.SOUND_Flag, 2, false);
            Flags[i] = !Flagged;
            
            if (Choice == i)
                Choice = -1;
        }
        
        ResetHover = false;
    }
    
    if (Choice == i)
        Alpha = 1;
    
    draw_sprite_ext(oMimic.SPRITE_Faces, i, ButtonX, ButtonY, 1, 1, 0, Color, Alpha);
    
    if (Flags[i])
        draw_sprite_ext(oMimic.SPRITE_Faces, 8, ButtonX, ButtonY, 1, 1, 0, Color, 1);
}

if (ResetHover)
    HoveredSuit = -1;

var NameToShow = HoveredSuit;

if (Choice != -1)
    NameToShow = Choice;

draw_set_halign(fa_center);
draw_sprite_stretched(sDataDiver_Box, 0, -2, 192, 404, 22);

if (NameToShow > -1)
    draw_text(200, 193, SuitNames[NameToShow]);

draw_set_alpha((Choice == -1) ? 0.05 : 1);
draw_sprite_stretched(sDataDiver_Box, 0, 151, 222, 98, 22);
var ConfirmButtonHover = mouse_in_zone(151 + WindowX, 222 + WindowY, 98, 22);
draw_set_alpha((Choice == -1) ? 0.05 : (ConfirmButtonHover ? 1 : 0.5));
draw_text(200, 223, "CONFIRM");

if (ConfirmButtonHover && mouse_check_button_pressed(mb_left) && Choice != -1)
{
    if (Choice == oMimic.PossessedSuit)
    {
        with (oMimic)
        {
            Lives--;
            audio_play_sound(oMimic.SOUND_Impact, 20, false);
            
            if (Lives > 0)
            {
                notification(other.MessageMove);
                change_possessed_suit();
            }
            else
            {
                notification(other.MessageDefeat, 2);
                instance_destroy(oMimicSuit);
                Active = false;
                audio_stop_sound(oMimic.SOUND_Static);
            }
        }
        
        Choice = -1;
        global.PanelUp = false;
    }
    else
    {
        Die = true;
    }
    
    mouse_clear(mb_left);
}

draw_set_alpha(1);
draw_set_color(c_white);
surface_reset_target();
set_target_to_ui();
draw_rectangle_color(WindowX, WindowY, WindowX + 400, WindowY + 300, c_black, c_black, c_black, c_black, false);
draw_surface(MimicSurf, WindowX, WindowY);
draw_sprite(oMimic.SPRITE_Border, 0, 320, 360 + TabletOffset);
draw_sprite_ext(oMimic.SPRITE_Border, 0, 320, 360 + TabletOffset, 1, -1, 0, c_white, 1);
surface_reset_target();
TabletOffsetSpeed = lerp(TabletOffsetSpeed, ((TabletUp ? 0 : 400) - TabletOffset) * 0.25, TabletUp ? 0.35 : 1);
TabletOffset += TabletOffsetSpeed;

if (TabletUp && mouse_check_button_pressed(mb_left) && !clicked(WindowX, WindowY, 400, 300) && TabletOffset < 64)
{
    TabletUp = false;
    global.PanelUp = false;
    mouse_clear(mb_left);
    audio_play_sound(oMimic.SOUND_Close, 3, false, 0.5);
}

if (!global.PanelUp && TabletUp)
{
    TabletUp = false;
    audio_play_sound(oMimic.SOUND_Close, 3, false, 0.5);
}

if (Die)
    jumpscare(UnknownEnum.Value_73, 0, oMimic.PossessedSuit);

enum UnknownEnum
{
    Value_73 = 73
}
