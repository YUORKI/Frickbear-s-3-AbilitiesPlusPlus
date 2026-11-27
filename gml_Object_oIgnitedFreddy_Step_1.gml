AttackMode = Active && global.TurnedAround && !global.CamUp && !global.PanelUp;

if (AttackMode)
{
    with (oWindowBlinds)
        ForcedOpen = true;
    
    if (!Spooked)
    {
        Spooked = true;
        audio_play_sound(SOUND_Scare, 10, false, 0.8);
    }
}
