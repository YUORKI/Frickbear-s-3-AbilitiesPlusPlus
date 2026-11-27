ID = UnknownEnum.Value_53;
SPRITE_Dangler = skin_sprite(sBossSalvage_OfficeWire, ID, "sprite_01.png");
SPRITE_Vents = skin_sprite(sBossSalvage_Wires, ID, get_sprite_filenames(2, 8));
SOUND_Static = skin_sound(sfxSalvageGarble, ID, "sq_static");
SOUND_Squeak = skin_sound(sfxVentSqueak, ID, "sq_squeak");
SOUND_Clicked = skin_sound(sfxMetalImpact, ID, "sq_destroy");
SpawnTimer = 0;
Randomizer = random_range(0.85, 1.15);
WiresSpawned = 0;
LastSpawnPoint = 1;
Static = audio_play_sound(SOUND_Static, 15, true);
audio_sound_gain(Static, 0, 0);

enum UnknownEnum
{
    Value_53 = 53
}
