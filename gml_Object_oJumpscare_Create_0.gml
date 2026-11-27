event_inherited();
Frame = 0;
OriginX = 0;
OriginY = -1;
JumpX = 640;
JumpY = 720;
JumpAngle = 0;
SizeBody = 0.25;
SizeHead = 0.01;
Side = 0;
Sprite = sJumpscare_Freddy;
BodyImage = 0;
HeadImage = 0;
Frame = 0;

function jump_origin()
{
    OriginY = get_animatronic_jumpscare_origin(global.Jumpscare, global.JumpscareType);
    OriginX = Side;
    JumpX = 320 + (320 * Side);
    JumpY = 180 - (540 * OriginY);
    SizeBody = 0.25;
    SizeHead = 0.01;
    JumpAngle = Side * 15;
    Frame = 0;
    
    if (global.Settings[2][4] == 3)
    {
        audio_group_set_gain(JumpScreams, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        var JumpSound = choose(sfxJumpscare_Funny_AmongUs, sfxJumpscare_Funny_BigMouth, sfxJumpscare_Funny_Burp, sfxJumpscare_Funny_CarHorn, sfxJumpscare_Funny_Foghorn, sfxJumpscare_Funny_Goofy, sfxJumpscare_Funny_OurTable, sfxJumpscare_Funny_Spongebob, sfxJumpscare_Funny_Tom, sfxJumpscare_Funny_Yodel, sfxJumpscare_Funny_Pingas, sfxJumpscare_Funny_Wega, sfxJumpscare_Funny_Bitch, sfxJumpscare_Funny_Buzzer);
        audio_play_sound(JumpSound, 99, false);
    }
    else
    {
        var Volume = 1;
        
        if (global.Settings[2][4] == 1)
            Volume = 0;
        else if (global.Settings[2][4] == 2)
            Volume = 0.25;
        
        audio_group_set_gain(JumpScreams, (Volume * global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
        var JumpSound = get_animatronic_scream(global.Jumpscare, global.JumpscareType);
        audio_play_sound(JumpSound, 99, false);
    }
}

Active = false;
alarm[0] = 90;
global.TimeOfDeath = global.Timer;
