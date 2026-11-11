shader_set(shRecolor);
var Pal = [16777215, 10461087, 1248964, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_set_alpha(BlackAlpha);
draw_rectangle_color(0, 0, 641, 361, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
var ChestY = ChestOffset + ((1 - ChestStretch) * 56) + 180;
shader_set(shFlash);

for (var i = -45; i < 360; i += 45)
    draw_sprite_ext(sRockstarFoxyChest, (RewardSize * 2) + Open, ChestX + round(lengthdir_x(1, i)), ChestY + round(lengthdir_y(1, i)), 1 / ChestStretch, ChestStretch, 0, Pal[0], 1);

shader_reset();
shader_set(shRecolor);
Pal = [16777215, 10461087, 1248964, 0];
replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
draw_sprite_ext(sRockstarFoxyChest, (RewardSize * 2) + Open, ChestX, ChestY, 1 / ChestStretch, ChestStretch, 0, c_white, 1);
ChestStretch += ((1 - ChestStretch) / 8);
ChestX += (((PageUp ? 160 : (FadingOut ? -80 : 320)) - ChestX) / 8);

if (Frame == 60 || Frame == 80)
{
    ChestStretch = 1.2;
    audio_play_sound(sfxBitThud, 5, false);
}

if (Frame == 150)
{
    audio_stop_sound(sfxDrumRoll);
    audio_play_sound(sfxDrumRoll_End, 10, false);
}

if (Frame == 210)
{
    if (array_contains(["Upgrade", "Cartridge", "Consumable"], Reward.Type))
    {
        audio_play_sound(sfxBitCollect, 10, false);
        
        if (RewardSize == 2)
            bitcrush_sound(sfxChildrenCheering);
        
        global.Jumpscare = RewardSize;
    }
    else
    {
        audio_play_sound(sfxBitKnockout, 10, false);
        global.Jumpscare = RewardSize * -1;
    }
    
    Open = true;
    audio_play_sound(sfxBitCrunch, 5, false);
    ChestStretch = 0.75;
    
    switch (Reward.Type)
    {
        case "Nothing":
            break;
        
        case "Upgrade":
            acquire_upgrade(Reward.ID);
            break;
        
        case "Cartridge":
            acquire_cartridge(Reward.ID);
            break;
        
        case "Consumable":
            acquire_consumable(Reward.ID);
            break;
        
        case "Animatronic":
            array_push(global.AllTimeSalvages, Reward.ID);
            global.EndlessInventory.MarkiplierPoints++;
            break;
        
        case "Challenge":
            apply_eleanor_challenge(Reward.ID, 1, UnknownEnum.Value_3, 1);
            break;
        
        case "Bear5":
            with (oShopkeepSprite)
                alarm[0] = 240;
            
            with (instance_create_depth(0, 0, depth - 1, oBear5Jumpscare))
            {
                audio_stop_all();
                audio_play_sound(sfxBitThud, 5, false);
                Delay = 0;
            }
            
            break;
    }
}

if (Frame == 300)
    PageUp = true;

if (Frame >= 300 && !FadingOut && input_check_pressed(UnknownEnum.Value_0))
{
    var TextboxDepth = oTextBox.depth;
    instance_destroy(oTextBox);
    
    with (instance_create_depth(0, 0, TextboxDepth, oTextBox))
        game_text("RockstarFoxyResults");
    
    FadingOut = true;
}

if (PageUp)
    PageOffset -= (PageOffset / 5);
else
    PageOffset += ((360 - PageOffset) / 5);

if (FadingOut)
{
    PageUp = false;
    
    if (round(PageOffset) == 360)
        instance_destroy();
}

BlackAlpha += (((!FadingOut * 0.75) - BlackAlpha) / 5);

if (Open)
    ChestOffset += ((48 - ChestOffset) / 8);

var sprite = sNOTHING;
var img = Reward.ID;

switch (Reward.Type)
{
    case "Nothing":
        sprite = sNOTHING;
        break;
    
    case "Upgrade":
        sprite = sShopItemSalvageIcons;
        break;
    
    case "Cartridge":
        sprite = sMinigameCarts;
        break;
    
    case "Consumable":
        sprite = sShop_ConsumableIcons;
        break;
    
    case "Animatronic":
        sprite = global.IconTiles[Reward.ID];
        img = 2;
        break;
    
    case "Challenge":
        sprite = sEleanorChallengeIcons_Shop;
        break;
}

var spriteXOffset = (sprite_get_width(sprite) / -2) + sprite_get_xoffset(sprite);
var spriteYOffset = (sprite_get_height(sprite) / -2) + (sprite_get_yoffset(sprite) - ChestOffset);

if (Open)
{
    draw_set_font(global.FontSalvageSheet);
    draw_set_halign(fa_left);
    
    if (Reward.Type == "Animatronic")
    {
        draw_outline(Pal[0], sprite, img, ChestX + spriteXOffset, 180 + spriteYOffset);
        shader_set(shRecolor);
        Pal = [16777215, 10461087, 1248964, 0];
        replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
    }
    
    draw_sprite(sprite, img, ChestX + spriteXOffset, 180 + spriteYOffset);
}

var PageX = 320;
draw_sprite(sSalvageSheet, 3, PageX, PageOffset);
draw_text(PageX + 47, PageOffset + 74, Reward.Name);
draw_text_ext(PageX + 47, PageOffset + 74 + 32, Reward.Desc, 16, 256);
Frame++;

enum UnknownEnum
{
    Value_0,
    Value_3 = 3
}
