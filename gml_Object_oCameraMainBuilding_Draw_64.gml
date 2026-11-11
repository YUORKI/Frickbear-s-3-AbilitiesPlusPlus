draw_filtered_screen();

if (keyboard_check_pressed(vk_tab))
{
    screen_save(working_directory + "ScreensCamScreenshot_" + string(ScreenshotsTaken++) + ".png");
    audio_play_sound(sfxCamSwitch, 10, false);
}
