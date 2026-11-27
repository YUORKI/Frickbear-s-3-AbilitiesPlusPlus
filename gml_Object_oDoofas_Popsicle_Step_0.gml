Size += ((1 - Size) / 5);

if (place_meeting(x, y, oDoofas))
{
    instance_destroy();
    audio_play_sound(oDoofas.SOUND_Collect, 2, false);
}

image_xscale = Size;
image_yscale = Size;
image_index = Image;

if (PopsicleTimer <= 0)
{
    var DrainAmount = 5;
    
    if (global.AILevels[UnknownEnum.Value_40] == 21)
        DrainAmount = 25;
    
    with (instance_create_depth(x, y, depth - 2, oTextPopup))
        Text = $"-{DrainAmount}%";
    
    drain_power(DrainAmount);
    instance_destroy();
    audio_play_sound(choose_from_array(oDoofas.SOUND_Miss), 10, false);
    audio_play_sound(oDoofas.SOUND_Fail, 10, false);
}

PopsicleTimer--;

enum UnknownEnum
{
    Value_40 = 40
}
