var ID = UnknownEnum.Value_41;
SPRITE_Player = skin_sprite(sAnimdude, ID, get_sprite_filenames(1, 4));
SPRITE_Dragon = skin_sprite(sAnimdude_Dragon, ID, get_sprite_filenames(5, 7));
SPRITE_Floor = skin_sprite(sAnimdude_Floor, ID, "sprite_08.png");
SPRITE_Wall = skin_sprite(sAnimdude_Wall, ID, "sprite_09.png");
SPRITE_Lava = skin_sprite(sAnimdude_Lava, ID, get_sprite_filenames(10, 11));
SPRITE_SpikeShort = skin_sprite(sAnimdude_SpikeTrap2, ID, "sprite_12.png");
SPRITE_SpikeLong = skin_sprite(sAnimdude_SpikeTrap, ID, "sprite_13.png");
SPRITE_SpikeHorizontal = skin_sprite(sAnimdude_SpikeTrap3, ID, "sprite_14.png");
SPRITE_Switch = skin_sprite(sAnimdude_Switch, ID, ["sprite_15.png", "sprite_16.png"]);
SPRITE_Fireball = skin_sprite(sAnimdude_Fireball, ID, get_sprite_filenames(17, 19));
SPRITE_Frame = skin_sprite(sAnimdude_Window, ID, ["sprite_20.png", "sprite_21.png"]);
SPRITE_Trophy = skin_sprite(sAnimdude_Trophy, ID, "sprite_22.png");
SPRITE_Sign = skin_sprite(sAnimdude_Sign, ID, ["sprite_23.png", "sprite_24.png"]);
SOUND_Trap = skin_sound(sfxBitThud, ID, "sq_trap");
SOUND_Fall = skin_sound(sfxBitKnockout, ID, "sq_dragonfall");
SOUND_Victory = skin_sound(sfxBitBoost, ID, "sq_victory");
SOUND_Opening = skin_sound(sfxBitBoost, ID, "sq_opening");
SOUND_Death = skin_sound(sfxBitPunish, ID, "sq_die");
SOUND_Dash = skin_sound(sfxBitDash, ID, "sq_dash");
SOUND_Jump = skin_sound(sfxBitJump, ID, "sq_jump");
SOUND_Pass = skin_sound(sfxBitCollect, ID, "sq_beatlevel");
SOUND_Countdown = skin_sound(sfxBitCountdown, ID, "sq_countdown");
SOUND_Music = skin_sound(mus_Animdude, ID, "sq_music");
Speed = 2;
YVelocity = 0;
Level = 0;
var LevelNum = ceil(lerp(1, 4, 1 / global.NightSpeedup));
LevelQueue = get_animdude_levels(global.AILevels[UnknownEnum.Value_41] == 21);

repeat (4 - LevelNum)
    array_delete(LevelQueue, irandom_range(1, array_length(LevelQueue) - 2), 1);

function generate_level(arg0)
{
    instance_destroy(oAnimdude_Object);
    var CurrentLevel = LevelQueue[arg0];
    
    for (var Y = 0; Y < 5; Y++)
    {
        for (var X = 0; X < 10; X++)
        {
            if (CurrentLevel[Y][X] != -1)
                instance_create_depth(X * 32, Y * 32, 0, CurrentLevel[Y][X]);
        }
    }
}

generate_level(Level);
AnimdudeSurf = -1;
Completed = false;
StartupFrames = 180;
StuckOnWallCounter = 0;
WindowSize = 0;
Lives = 50;
x = 0;
y = 96;
CountdownFont = font_add_sprite_ext(sFontNightOpening, "NECimndlesghtuo1234567890 Pa", true, 4);
audio_play_sound(SOUND_Opening, 10, false);

enum UnknownEnum
{
    Value_41 = 41
}
