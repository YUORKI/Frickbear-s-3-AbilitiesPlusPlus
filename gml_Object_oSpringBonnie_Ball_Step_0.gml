if (Frame < 1)
{
    Frame++;
    exit;
}

image_index = Image;
depth = -1;
Collectible = global.Cam == Camera && global.MonitorSystem == "Cameras" && oCamera.CamAlpha == 0;

if (Collectible && !Collected && point_distance(x + 640 + 240, y + 0 + 32, oMouseHitbox.x, oMouseHitbox.y) < 24)
{
    with (oSpringBonnie)
        Ballz++;
    
    audio_play_sound(oSpringBonnie.SOUND_Collect, 3, false, 0.75, 0, 0.8);
    audio_play_sound(oSpringBonnie.SOUND_Pluck, 4, false, 0.6);
    Collected = true;
}

if (Collected)
    Dissipation += ((1 - Dissipation) / 5);

var Size = lerp(1, 1.5, Dissipation);
image_xscale = Size;
image_yscale = Size;
