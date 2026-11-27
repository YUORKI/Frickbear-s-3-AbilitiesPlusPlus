ID = UnknownEnum.Value_89;
SPRITE_Screen = skin_sprite(sFoxyEXE_Fullscreen, ID, "sprite_01.png");
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_FoxyEXE, ID, "camradar.png");
ATTR_FakeItemText = skin_get_attribute(ID, "ItemDesc", "I AM GOD.");
ATTR_FakeGameText = skin_get_attribute(ID, "GameName", "Foxy.EXE");
ATTR_GlitchText = skin_get_attribute(ID, "GlitchText", ["!?$%?!", "I AM GOD", "RUN AWAY", "DIE", "****", "&3A@!?"]);
SOUND_Countdown = skin_sound(sfxFoxyEXECountdown, ID, "sq_countdown");
SOUND_Glitch = skin_sound(sfxMalhareBlip, ID, "sq_glitch");
SOUND_Static = skin_sound(sfxIgnitedFreddy_Static, ID, "sq_static");
SOUND_Laugh = skin_sound_generate_array([voc_FoxyEXE_Laugh], ID, "voc_laugh");

function destroy_faker()
{
    var StunBonus = 2 - instance_number(oFoxyEXE_FakerParent);
    SpawnTimer -= (StunBonus * 8);
    instance_destroy(oFoxyEXE_FakerParent);
    audio_play_sound(SOUND_Glitch, 10, false);
    audio_play_sound(choose_from_array(SOUND_Laugh), 10, false);
    ScareTimer = 1;
    Aggro = 0;
}

ScareTimer = 0;
SpawnTimer = 10;
TimeToDeath = 0;
StaticSurf = -1;
Aggro = 0;
Static = audio_play_sound(SOUND_Static, 10, true, 0, 0, 1.5);
LastAnomaly = -1;
StaticTimer = 0;

enum UnknownEnum
{
    Value_89 = 89
}
