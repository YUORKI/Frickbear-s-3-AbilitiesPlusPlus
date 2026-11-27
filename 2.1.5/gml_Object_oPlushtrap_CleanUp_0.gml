if (Head != undefined)
    instance_destroy(Head);

if (EarL != undefined)
    instance_destroy(EarL);

if (EarR != undefined)
    instance_destroy(EarR);

sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Ear);
skin_sound_delete_array([SOUND_Scrape, SOUND_Caught]);
