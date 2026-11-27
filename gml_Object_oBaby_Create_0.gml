ID = UnknownEnum.Value_26;
Initialize = true;
BidybabsLeft = 0;

if (global.Timer > 348)
    instance_destroy();

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (BidybabsLeft > 0 && global.AILevels[ID] > 0)
    {
        jumpscare(ID);
        return true;
    }
    
    return false;
}

SPRITE_Bidybabs = skin_sprite(sBidybabs, ID, get_sprite_filenames(1, 32));
SPRITE_Counter = skin_sprite(sBidybabCounter, ID, get_sprite_filenames(33, 45));
SPRITE_Baby = skin_sprite(sCameras_Baby, ID, ["sprite_46.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Baby, ID, ["camradar_01.png", "camradar_02.png"]);
SOUND_Bidybab = skin_sound(sfxBaby, ID, "sq_baby");
sprite_collision_mask(SPRITE_Bidybabs, true, 0, 0, 0, 400, 300, 0, 0);

enum UnknownEnum
{
    Value_26 = 26
}
