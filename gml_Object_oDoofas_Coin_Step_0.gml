Size += ((1 - Size) / 5);

if (place_meeting(x, y, oDoofas))
{
    instance_destroy();
    audio_play_sound(sfxDoofas_Collect, 2, false);
    block_tokens();
}

image_xscale = Size;
image_yscale = Size;
image_index = floor(PopsicleTimer / 10);

if (PopsicleTimer <= 0)
    instance_destroy();

PopsicleTimer -= 2;
