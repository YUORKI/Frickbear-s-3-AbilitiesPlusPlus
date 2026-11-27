ID = UnknownEnum.Value_84;
SPRITE_Cameras = skin_sprite(sReagent, ID, get_sprite_filenames(1, 5));
SPRITE_WetFloorSign = skin_sprite(sWetFloorBot, ID, get_sprite_filenames(6, 7));
SPRITE_WetFloorSignAlt = skin_sprite(sWetFloorBot_Dragged, ID, get_sprite_filenames(8, 9));
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Reagent, ID, "camradar.png");
SOUND_Ambience = skin_sound(sfxReagentBubbling, ID, "sq_ambience");
SOUND_Appear = skin_sound(sfxReagentAppear, ID, "sq_appear");
SOUND_Leave = skin_sound(sfxReagentLeave, ID, "sq_leave");
SOUND_Pluck = skin_sound(sfxPluck, ID, "sq_pluck");
SOUND_Place = skin_sound(sfxPizzaSplat, ID, "sq_place");
InHallway = false;
Side = 0;
Randomizer = random_range(0.8, 1.2);
Timer = 0;
VanishTimer = 0;
BubblingSound = -1;
BubblingSound = audio_play_sound(SOUND_Ambience, 6, true);
audio_sound_gain(BubblingSound, 0, 0);

enum UnknownEnum
{
    Value_84 = 84
}
