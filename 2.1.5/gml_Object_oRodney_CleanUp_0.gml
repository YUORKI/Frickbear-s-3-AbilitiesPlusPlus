if (CurrentLine != undefined)
    audio_stop_sound(CurrentLine);

sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Neck);
sprite_delete(SPRITE_Body);
skin_sound_delete_array(QuoteLibrary);
skin_sound_delete_array(QuoteLibrary_MinigameFail);
skin_sound_delete_array(QuoteLibrary_Item);
skin_sound_delete_array(QuoteLibrary_Tokens);
