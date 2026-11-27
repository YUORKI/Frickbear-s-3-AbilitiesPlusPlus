if (ModMode)
{
    for (var i = 0; i < array_length(ExtrasDatabase); i++)
    {
        if (ExtrasDatabase[i].Image != sNOTHING)
            sprite_delete(ExtrasDatabase[i].Image);
        
        for (var j = 0; j < array_length(ExtrasDatabase[i].VoiceLines); j++)
            skin_sound_delete_array(ExtrasDatabase[i].VoiceLines[j].LineID);
        
        if (array_length(ExtrasDatabase[i].Jumpscares) > 0)
            sprite_delete(ExtrasDatabase[i].Jumpscares[0].JumpSprite);
    }
}

audio_sound_gain(musExtras, 1, 1000);
surface_free(OverGUISurf);
texturegroup_unload("FinalBossJumpscare");
