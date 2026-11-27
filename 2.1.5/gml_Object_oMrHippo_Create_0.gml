event_inherited();
ID = UnknownEnum.Value_32;
LureChance = 0.5 + lure_chance_increase();
SOUND_Enter = [sfxNOTHING];
SOUND_Leave = [sfxNOTHING];
MoveSpeed = 1;
YOffset = 512;
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
SPRITE_Office = skin_sprite(sMrHippoOffice, ID, ["sprite_02.png"]);
SOUND_Monologue = skin_sound_generate_array(get_misc_voicelines(ID, "Ramble"), ID, "voc_ramble");
SOUND_BlockedDeathcoin = skin_sound(voc_MrHippo_FakeDeathcoin, ID, "voc_deathcoinblock");

enum UnknownEnum
{
    Value_32 = 32
}
