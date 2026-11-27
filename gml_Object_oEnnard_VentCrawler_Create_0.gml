event_inherited();

function destroy_crawler()
{
    if (Vanishing)
        exit;
    
    Vanishing = true;
    audio_play_sound(oEnnard.SOUND_Clicked, 5, false, 0.75);
}

Dangling = false;
Sprite = sBossSalvage_Wires;
