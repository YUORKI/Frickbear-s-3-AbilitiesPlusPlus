event_inherited();
Direction = -1;
VaccuumSound = -1;
CoolEmitter = audio_emitter_create();
audio_emitter_bus(CoolEmitter, global.AudioBusSPECIAL4);
var _ef_lopass = audio_effect_create(AudioEffectType.LPF2);
var _ef_gain = audio_effect_create(AudioEffectType.Gain);
_ef_lopass.cutoff = 500;
_ef_lopass.bypass = false;
_ef_gain.gain = 0.5;
global.AudioBusSPECIAL4.effects[0] = _ef_lopass;
global.AudioBusSPECIAL4.effects[1] = _ef_gain;

function reset()
{
    WindowPosition = 0;
    Attacking = false;
    FramesWaiting = 0;
    AngleSpeed = 0;
    YOffset = 0;
    YSpeed = 0;
    image_angle = 0;
    sprite_set_offset(sprite_index, 64, 176);
}

function attack(arg0)
{
    DrawDepth = -10;
    Direction = random_sign();
    Speed = 1 / (60 * lerp(8, 4, arg0 / 20));
    HPLeft = round(lerp(2, 5, arg0 / 20));
    AttackFrame = lerp(-120, -60, arg0 / 20);
    VaccuumSound = audio_play_sound_on(CoolEmitter, sfxMrHugsApproach, 15, true, 1);
    Attacking = true;
}

reset();

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
