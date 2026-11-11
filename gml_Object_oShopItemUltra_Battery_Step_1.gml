event_inherited();

if (global.Power <= 0)
{
    global.Power += 30;
    notification("Your Ultra Battery was used up!");
    audio_play_sound(sfxShortCircuit, 5, false);
    deplete_uses();
}
