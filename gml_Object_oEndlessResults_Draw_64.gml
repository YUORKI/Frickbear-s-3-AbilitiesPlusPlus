if (Screenshot)
{
    screen_save(working_directory + "RunResults" + string(floor(date_current_datetime() * 100)) + ".png");
    audio_play_sound(sfxCamSwitch, 10, false);
}
