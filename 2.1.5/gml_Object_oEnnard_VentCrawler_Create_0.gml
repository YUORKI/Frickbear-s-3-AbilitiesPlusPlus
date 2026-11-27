event_inherited();

function destroy_crawler()
{
    if (Vanishing)
        exit;
    
    Vanishing = true;
    audio_play_sound(sfxMetalImpact, 5, false, 0.75);
}

Dangling = false;
