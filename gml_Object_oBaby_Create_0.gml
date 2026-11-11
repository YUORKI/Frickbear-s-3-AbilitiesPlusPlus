Initialize = true;
BidybabsLeft = 0;

if (global.Timer > 348)
    instance_destroy();

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (BidybabsLeft > 0 && global.AILevels[UnknownEnum.Value_26] > 0)
    {
        jumpscare(UnknownEnum.Value_26);
        return true;
    }
    
    return false;
}

SPRITE_Bidybabs = skin_sprite(sBidybabs, UnknownEnum.Value_26, get_sprite_filenames(1, 32));
SPRITE_Counter = skin_sprite(sBidybabCounter, UnknownEnum.Value_26, get_sprite_filenames(33, 45));
SPRITE_Baby = skin_sprite(sCameras_Baby, UnknownEnum.Value_26, ["sprite_46.png"]);
SOUND_Bidybab = skin_sound(sfxBaby, UnknownEnum.Value_26, "sq_baby");
sprite_collision_mask(SPRITE_Bidybabs, true, 0, 0, 0, 400, 300, 0, 0);

enum UnknownEnum
{
    Value_26 = 26
}
