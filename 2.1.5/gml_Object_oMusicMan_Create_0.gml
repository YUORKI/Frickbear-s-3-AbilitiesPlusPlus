ID = UnknownEnum.Value_31;
SPRITE_Head = skin_sprite_unlimited(sMusicManHead, ID, "sprite_01");
SOUND_Fakeout = skin_sound_generate_array([sfxJumpscare_Funny_Pingas], ID, "sq_fakeout");
SOUND_Laugh = skin_sound_generate_array([voc_MusicMan_Chuckle], ID, "voc_laugh");
UseCustomSounds = skin_get_attribute(ID, "CustomCues", false);
Chuckle = voc_MusicMan_Chuckle;
Frame = 0;
SoundLibrary = [];

function add_sound(arg0, arg1, arg2, arg3)
{
    array_push(SoundLibrary, 
    {
        ChosenSound: arg0,
        AudioLength: arg1,
        AudioPitch: arg2,
        AudioGain: arg3
    });
}

if (!UseCustomSounds)
{
    add_sound(sfxPhoneRing, 2, 0.95, 1);
    add_sound(sfxSteps, 2, 1.2, 1.5);
    add_sound(sfxGrowl, 2.5, 0.9, 1);
    add_sound(sfxEndoCreak, 1, 0.95, 0.5);
    add_sound(sfxFoxyRun, 1.2, 0.9, 1);
    add_sound(sfxFreddyLaugh2, 2, 0.95, 1);
    add_sound(sfxGoldenFreddyGiggle, 2, 0.92, 1);
    add_sound(sfxFan, 3, 0.96, 1);
    add_sound(sfxBlock, 0.5, 0.85, 1);
    add_sound(sfxKnocking, 1.25, 1, 1);
    add_sound(sfxDiscordPing, 0.5, 1, 1);
    add_sound(voc_ToyBonnie_OhSecurityGuy, 1.5, 0.98, 1);
    add_sound(voc_BB_Hi, 0.5, 0.98, 1);
    add_sound(voc_JJ_Hello, 1, 0.98, 1);
    add_sound(sfxMoltenFreddyClatter, 2, 0.92, 0.5);
    add_sound(sfxClatter, 2, 0.9, 0.5);
    add_sound(sfxWindowScare, 1, 0.95, 0.8);
}
else
{
    for (var i = 0; i < array_length(SOUND_Fakeout); i++)
        add_sound(SOUND_Fakeout[i], audio_sound_length(SOUND_Fakeout[i]) - 0.1, 1, 1);
}

SoundMax = array_length(SoundLibrary) - 1;
PlayingSound = undefined;
AudioLength = 1;
Silencer = audio_effect_create(AudioEffectType.Bitcrusher);
Silencer.gain = 1;
Silencer.resolution = 8;
Silencer.factor = 256;
Silencer.mix = 1;
Head = instance_create_layer(0, 0, "InFrontOf_Wall", oOfficeSprite);
HeadYOffset = -128;
HeadYSpeed = 0;
HeadDown = false;

enum UnknownEnum
{
    Value_0,
    Value_31 = 31
}

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
