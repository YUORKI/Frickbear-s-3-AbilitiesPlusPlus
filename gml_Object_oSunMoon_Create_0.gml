ID = UnknownEnum.Value_70;
SPRITE_Head = skin_sprite(sMoonInWindow, ID, "sprite_01.png");
SPRITE_Poster = skin_sprite(sSunPoster, ID, ["sprite_02.png", "sprite_03.png"]);
SOUND_Sun = skin_sound_generate_array(get_misc_voicelines(ID, "Sun"), ID, "voc_spotsun");
SOUND_Moon = skin_sound_generate_array(get_misc_voicelines(ID, "Moon"), ID, "voc_spotmoon");
SOUND_Scrape = skin_sound(sfxPlushtrapScrape, ID, "sq_scrape");
MoonHead = instance_create_layer(1440, 1070, "Behind_Wall", oOfficeSprite);
MoonHead.sprite_index = SPRITE_Head;
MoonYSpeed = 0;
AnimMode = -1;
WaitForLower = false;
KillTimer = 0;

enum UnknownEnum
{
    Value_70 = 70
}
