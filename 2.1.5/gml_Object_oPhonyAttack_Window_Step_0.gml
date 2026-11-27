if (SeqTimer < 0)
{
    SeqTimer += 0.016666666666666666;
    
    if (SeqTimer == -3)
        audio_play_sound(sfxPhoneRing, 10, true);
    
    if (SeqTimer == -1.5)
    {
        audio_play_sound(sfxPhonePickup, 10, false);
        audio_stop_sound(sfxPhoneRing);
    }
    
    if (SeqTimer == 0)
    {
        global.Music = audio_play_sound(mus_BossPhony, 50, false, 0.8);
        var Sound = voc_PhonyBoss_Intro;
        audio_play_sound(Sound, 50, false);
        
        with (oCamera)
            Scared = true;
    }
}

x = 1163;
y = 585;

if (SeqTimer < 0)
    Frame = 0;
else
    Frame = (audio_sound_get_track_position(global.Music) * 60) - 90;

image_index = floor(Frame / 2);

if (Frame < 0)
    image_index = 0;

if ((Frame / 2) == 100)
    audio_sound_gain(mus_BossPhony, 0.3, 3000);

if ((Frame / 2) >= 123)
    instance_destroy();

if (image_index > 25 && image_index < 60)
    Shakitude += ((0.5 - Shakitude) / 5);
else
    Shakitude *= 0.9;

oCamera.ShakeX = random_range(Shakitude * -1, Shakitude);
oCamera.ShakeY = random_range(Shakitude * -1, Shakitude);
