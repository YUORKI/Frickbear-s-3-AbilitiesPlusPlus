ShopkeepX = 320;
ShopkeepY = 640;
YSpeed = 0;
Pose = 0;
SwitchbackTimer = 0;
BPM = 96;
ID = UnknownEnum.Value_131;
audio_listener_position(0, 0, 0);

function entrance_voiceclip(arg0)
{
    ID = arg0;
    var Voiceclip = choose_from_array(get_misc_voicelines(arg0, "Enter"));
    return bitcrush_sound(Voiceclip, 0, 0, false, 1.5, 6);
}

function purchase_voiceclip()
{
    var Voiceclip = choose_from_array(get_misc_voicelines(ID, "Buy"));
    return bitcrush_sound(Voiceclip, 0, 0, false, 1.5, 6);
}

function pick_sprite()
{
    switch (global.Shop)
    {
        case UnknownEnum.Value_0:
            entrance_voiceclip(UnknownEnum.Value_131);
            return sShopkeep_RockstarFreddy;
        
        case UnknownEnum.Value_1:
            entrance_voiceclip(UnknownEnum.Value_132);
            return sShopkeep_RockstarBonnie;
        
        case UnknownEnum.Value_2:
            entrance_voiceclip(UnknownEnum.Value_133);
            return sShopkeep_RockstarChica;
        
        case UnknownEnum.Value_3:
            entrance_voiceclip(UnknownEnum.Value_134);
            return sShopkeep_RockstarFoxy;
        
        case UnknownEnum.Value_6:
            entrance_voiceclip(UnknownEnum.Value_139);
            return sShopkeep_Bobbiedots;
        
        case UnknownEnum.Value_5:
            entrance_voiceclip(UnknownEnum.Value_135);
            return sShopkeep_Browboy;
        
        case UnknownEnum.Value_9:
            entrance_voiceclip(UnknownEnum.Value_137);
            return sShopkeep_Morse;
        
        case UnknownEnum.Value_4:
            entrance_voiceclip(UnknownEnum.Value_142);
            return sShopkeep_Dollie;
        
        case UnknownEnum.Value_10:
            entrance_voiceclip(UnknownEnum.Value_136);
            return sShopkeep_FazEntRep;
        
        case UnknownEnum.Value_11:
            entrance_voiceclip(UnknownEnum.Value_143);
            return sShopkeep_TipsyBird;
        
        case UnknownEnum.Value_7:
            entrance_voiceclip(UnknownEnum.Value_140);
            return sShopkeep_Carnie;
        
        case UnknownEnum.Value_8:
            entrance_voiceclip(UnknownEnum.Value_138);
            return sShopkeep_Eleanor;
        
        case UnknownEnum.Value_12:
            entrance_voiceclip(UnknownEnum.Value_141);
            return sShopkeep_ElChip;
        
        default:
            return sShopkeep_RockstarFreddy;
    }
}

function switch_pose(arg0)
{
    Pose = arg0;
    YSpeed = 8;
}

function purchase_made()
{
    switch_pose(0);
    
    switch (global.Shop)
    {
        case UnknownEnum.Value_0:
            oShopMenu.PurchaseMessage = "Thank you kindly!";
            break;
        
        case UnknownEnum.Value_1:
            oShopMenu.PurchaseMessage = "Rock on, mate.";
            break;
        
        case UnknownEnum.Value_2:
            oShopMenu.PurchaseMessage = "Yee-haw! Thank you kindly!";
            break;
        
        default:
            oShopMenu.PurchaseMessage = " ";
            break;
    }
    
    oShopMenu.PurchaseTimer = 2;
}

function get_shop_music()
{
    switch (global.Shop)
    {
        case UnknownEnum.Value_1:
        case UnknownEnum.Value_6:
        case UnknownEnum.Value_9:
            BPM = 125;
            return musShop_Cool;
        
        case UnknownEnum.Value_2:
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_11:
            BPM = 92;
            return musShop_Chill;
        
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_5:
            BPM = 70;
            return musShop_Seedy;
        
        case UnknownEnum.Value_8:
        case UnknownEnum.Value_7:
        case UnknownEnum.Value_10:
            BPM = 57;
            return musShop_Creepy;
        
        case UnknownEnum.Value_0:
        case UnknownEnum.Value_12:
        default:
            BPM = 96;
            return musShop_Basic;
    }
}

global.Music = play_music(get_shop_music(), 0.75);
sprite_index = pick_sprite();
depth = 50;
DanceFrame = 0;
DanceOffset = 0;
BGSprite = (global.Shop == UnknownEnum.Value_10) ? sShopkeepBG_PatternFazEntRep : sShopkeepBG_Pattern;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_131 = 131,
    Value_132,
    Value_133,
    Value_134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_139,
    Value_140,
    Value_141,
    Value_142,
    Value_143
}
