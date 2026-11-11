alarm[0] = 240;
BGFrame = 0;
Surf = -1;
FadeAlpha = 1;
FadingOut = false;
WaterSound = audio_play_sound(sfxRunningWater, 5, true, 1);
audio_sound_gain(WaterSound, 0, 0);
audio_sound_gain(WaterSound, 1, 3000);
GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
