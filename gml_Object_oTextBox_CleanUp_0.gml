for (var i = 0; i < array_length(CustomTalksounds); i++)
{
    if (audio_get_type(CustomTalksounds[i]))
        audio_destroy_stream(CustomTalksounds[i]);
}
