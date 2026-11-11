x = 160;
y += ((20 - y) / 5);
draw_set_alpha(BackgroundDarkness);
draw_rectangle_color(0, 0, 641, 361, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
var XTarget = (SelectedSeat == -1 && !Leaving) ? 16 : (Leaving ? -32 : (40 + (SelectedSeat * 32)));

if (!surface_exists(TipsySurf))
    TipsySurf = surface_create(160, 96);

surface_set_target(TipsySurf);
draw_clear_alpha(c_black, 1);
var GuardImage = floor(WalkFrame) % 4;

switch (GuardImage)
{
    case 0:
    case 2:
        GuardImage = 0;
        break;
    
    case 1:
        GuardImage = 1;
        break;
    
    case 3:
        GuardImage = 2;
        break;
}

var XSpeed = clamp((XTarget - GuardX) / 10, -1, 1);
GuardX += XSpeed;
WalkFrame += abs(XSpeed / 6);

if (SelectedSeat != -1 && !Sitting && !Leaving && abs(XSpeed) < 0.1)
{
    YSpeed = -3;
    Sitting = true;
    YTarget -= 9;
    audio_play_sound(sfxBitJump, 0, false);
    alarm[0] = 60;
}

if ((GuardY + YSpeed) >= YTarget && YSpeed > 0)
{
    GuardY = YTarget;
    
    if (YSpeed > 0.5)
        audio_play_sound(sfxBitCrunch, 5, false);
    
    YSpeed = 0;
}

if (YSpeed == 0 && Sitting)
    GuardImage = 0;

if (YSpeed != 0)
    GuardImage = 3;

GuardY += YSpeed;
YSpeed += 0.25;

if (abs(XSpeed) < 0.25)
    WalkFrame = 0;

if (Leaving && abs(XSpeed) < 0.1 && instance_exists(oTextBox))
    oTextBox.ExternalPause = false;

draw_sprite(sTipsyShop_BG, 0, 0, 0);
draw_sprite_part_ext(sTipsyBird_BarSprite, (floor(Frame * 4) % 2) * 2, 0, 0, 16, 13, 160, 51, -1, 1, c_white, 1);

for (var i = 0; i < min(array_length(Patrons), 3); i++)
{
    if (i == SelectedSeat && Leaving)
        continue;
    
    draw_sprite_ext(GuardSprite, (Patrons[i] * 4) + ((floor((Frame * 2) + i) % 2 || TalkingChar == i) ? 0 : 1), 56 + (i * 32), 63, (TalkingChar == i) ? -1 : 1, 1, 0, c_white, 1);
}

draw_sprite_ext(GuardSprite, (global.Guard * 4) + GuardImage, GuardX, GuardY, GuardDirection, 1, 0, c_white, 1);

if (Leaving && SelectedSeat > -1 && SelectedSeat < 3)
    draw_sprite_ext(GuardSprite, (Patrons[SelectedSeat] * 4) + GuardImage, GuardX + 16, GuardY, GuardDirection, 1, 0, c_white, 1);

surface_reset_target();

if (!instance_exists(oTextBox))
{
    shader_set(shRecolor);
    replace_color(13695200, 7389320, 5662772, 3354368, 16777215, 10461087, 1248964, 0);
}

draw_sprite(sTipsyShop_Window, 0, x, y);
draw_surface_ext(TipsySurf, x, y, 2, 2, 0, c_white, 1);

if (!instance_exists(oTextBox))
    shader_reset();

draw_set_halign(fa_left);
draw_set_font(CostFont);

if (SelectedSeat > -1 && SelectedSeat < min(3, array_length(Patrons)))
{
    var PageX = 160;
    var XOffset = 47;
    var SelectedGuy = Patrons[SelectedSeat];
    draw_sprite(sSalvageSheet, 3, PageX, PageOffset);
    draw_text(PageX + XOffset, PageOffset + 74, global.GuardNames[SelectedGuy]);
    draw_text_ext(PageX + XOffset, PageOffset + 74 + 32, get_guard_description(SelectedGuy), 16, 256);
    
    if (!DescUpdated)
    {
        set_guard_parameters(SelectedGuy);
        DescUpdated = true;
    }
}

PageOffset += PageOffsetSpeed;
PageOffsetSpeed = lerp(PageOffsetSpeed, ((!PageUp * 360) - PageOffset) * 0.2, PageUp ? 1 : 1);
BackgroundDarkness += ((0.5 - BackgroundDarkness) / 5);
Frame += 0.016666666666666666;
