texturegroup_unload("DeathScreen");

if (!is_undefined(Sound))
{
    if (audio_get_type(Sound))
        audio_destroy_stream(Sound);
}

sprite_delete(CustomDeathscreen);
sprite_delete(GuardSprite);
skin_sound_delete_array(VoiceLineID);
