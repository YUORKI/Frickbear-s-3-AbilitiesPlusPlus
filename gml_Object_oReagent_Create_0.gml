ID = UnknownEnum.Value_84;
SPRITE_Cameras = sReagent;
InHallway = false;
Side = 0;
Randomizer = random_range(0.8, 1.2);
Timer = 0;
VanishTimer = 0;
BubblingSound = -1;
BubblingSound = audio_play_sound(sfxReagentBubbling, 6, true);
audio_sound_gain(BubblingSound, 0, 0);

enum UnknownEnum
{
    Value_84 = 84
}
