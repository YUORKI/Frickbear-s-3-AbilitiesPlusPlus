ID = UnknownEnum.Value_19;
WaitForFlip = false;
CurrentCam = 0;
Exposure = 0;

function get_phantom_list()
{
    if (global.ChallengeTitle == "Ladies' Night")
    {
        global.AILevels[ID] = 20;
        return [3, 5, 6, 0, 0, 0, 0, 0];
    }
    else if (global.ChallengeTitle == "Even a Bear!")
    {
        global.AILevels[ID] = 20;
        return [0, 0, 2, 0, 0, 0, 0, 0];
    }
    else
    {
        return [1, 2, 3, 4, 5, 6, 0, 0];
    }
}

CurrentCams = array_concat([0], array_shuffle(get_phantom_list()));
AmountOfPhantoms = 0;
Aggro = 0;
SPRITE_Cameras = skin_sprite(sCameras_Phantoms, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png", "sprite_05.png", "sprite_06.png"]);
SPRITE_Jumpscare = skin_sprite(sJumpscare_Phantoms, ID, ["jumpscare1_body.png", "jumpscare1_head.png", "jumpscare1_head.png", "jumpscare2_body.png", "jumpscare2_head.png", "jumpscare1_head.png", "jumpscare3_body.png", "jumpscare3_head.png", "jumpscare1_head.png", "jumpscare4_body.png", "jumpscare4_head.png", "jumpscare1_head.png", "jumpscare5_body.png", "jumpscare5_head.png", "jumpscare1_head.png", "jumpscare6_body.png", "jumpscare6_head.png", "jumpscare1_head.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Phantoms, ID, ["camradar_01.png", "camradar_02.png", "camradar_03.png", "camradar_04.png", "camradar_05.png", "camradar_06.png"]);
SOUND_Jumpscare = skin_sound(sfxJumpscarePhantom, ID, "jumpscare");
SubCamera = 0;

enum UnknownEnum
{
    Value_19 = 19
}
