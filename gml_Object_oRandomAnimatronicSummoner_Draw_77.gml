set_target_to_ui();
draw_set_font(global.FontW97Black);
x = 320;

if (Frame == 0)
    y = -32;

SlotSpeed -= 0.2857142857142857;
SlotSpeed = max(SlotSpeed, 0);

if (Frame == 200)
{
    SlotSpeed = 0;
    CurrentImage = floor(CurrentImage);
    reverb_sound(global.SelectionLines[AnimatronicToSummon], 0, 0, false, 1);
    global.AILevels[other.AnimatronicToSummon] = 10;
    array_push(global.SummonedAnimatronics, other.AnimatronicToSummon);
}

CurrentImage = (CurrentImage + (SlotSpeed / 60)) % 11;
draw_sprite(sRandomAnimatronicBack, 0, x, y);
var CurID = PossibleItems[floor(CurrentImage)];
draw_sprite(global.IconTiles[CurID], 0, x - 24, y - 24);

if (Frame >= 200 && Frame < 360)
{
    var Text = $"{global.Descriptions[AnimatronicToSummon][0]} has been summoned!";
    draw_set_halign(fa_center);
    var BoxWidth = string_width_ext(Text, 14, 180) + 14;
    var BoxHeight = string_height_ext(Text, 14, 180) + 10;
    draw_sprite_stretched(sTextBox_Windows, 0, x - (BoxWidth / 2), (y + 36) - 3, BoxWidth, BoxHeight);
    draw_text_ext(x, y + 36, Text, 14, 180);
}
else if (Frame >= 360)
{
    y -= ((50 - y) / 5);
    
    if (y < -56)
        instance_destroy();
}
else
{
    y += ((48 - y) / 10);
}

Frame++;
surface_reset_target();
