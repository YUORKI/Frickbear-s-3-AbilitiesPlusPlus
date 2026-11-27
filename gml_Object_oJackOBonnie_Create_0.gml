ID = UnknownEnum.Value_47;
Frame = 0;
Reset = true;
Attacking = false;
Side = 0;
WaitTime = 99;
ClatterGain = 0;
CoolEmitter = audio_emitter_create();
audio_emitter_bus(CoolEmitter, global.AudioBusSPECIAL3);
var _ef_reverb = audio_effect_create(AudioEffectType.Reverb1);
var _ef_gain = audio_effect_create(AudioEffectType.Gain);
_ef_reverb.size = 1;
_ef_reverb.mix = 0.2;
_ef_gain.gain = 0;
global.AudioBusSPECIAL3.effects[0] = _ef_reverb;
global.AudioBusSPECIAL3.effects[1] = _ef_gain;
DoorClosedTime = 0;
SPRITE_Head = skin_sprite(sJackOBonnie_Head, ID, ["sprite_01.png"]);
SPRITE_Arm = skin_sprite(sJackOBonnie_Arm, ID, ["sprite_02.png"]);
SPRITE_LowerEar = skin_sprite(sJackOBonnie_LowerEar, ID, ["sprite_03.png", "sprite_04.png"]);
SPRITE_UpperEar = skin_sprite(sJackOBonnie_UpperEar, ID, ["sprite_05.png", "sprite_06.png"]);
SOUND_Approach = skin_sound(sfxJackOBonnieRun, ID, "sq_approach");
SOUND_Blocked = skin_sound(sfxFireImpact, ID, "sq_blocked");
SOUND_Scare = skin_sound(sfxWindowScare, ID, "sq_scare");

enum UnknownEnum
{
    Value_2 = 2,
    Value_5 = 5,
    Value_47 = 47
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
