if (any_challenge_active())
{
    var Data = get_eleanor_challenges(global.EleanorChallenge.ID, 2);
    Desc = string_upper(Data.Name) + ": " + Data.Desc;
    var DescAddon = "$" + string_format(global.EleanorChallenge.Value, 1, 2);
    
    if (global.EleanorChallenge.Reward == UnknownEnum.Value_0)
        DescAddon = get_upgrades(global.EleanorChallenge.Value).Name;
    
    if (global.EleanorChallenge.Reward == UnknownEnum.Value_1)
        DescAddon = get_shop_minigames(global.EleanorChallenge.Value).Name;
    
    if (global.EleanorChallenge.Reward == UnknownEnum.Value_2)
        DescAddon = get_consumables(global.EleanorChallenge.Value).Name;
    
    Desc += (" (REWARD: " + DescAddon + ")");
}
else
{
    instance_destroy();
}

function draw_everything()
{
    if (room != NightClear_Endless)
    {
        x = 520;
        
        if (room != Office)
            x -= 34;
        else if (character_active(UnknownEnum.Value_72))
            x -= 15;
    }
    
    image_index = global.EleanorChallenge.ID;
    y += ((2 - y) / 5);
    var Mousey = false;
    
    if (x <= global.MouseX && (x + sprite_width) > global.MouseX && y <= global.MouseY && (y + sprite_height) > global.MouseY && room != NightClear_Endless)
    {
        draw_outline(16777215);
        Mousey = true;
    }
    
    draw_sprite(sprite_index, image_index, x, y);
    draw_sprite(sprite_index, image_index, x, y);
    
    for (var l = 0; l < (global.EleanorChallenge.RoundsLeft - 1); l++)
        draw_sprite(sConsumableLife, 0, (x + 32) - (l * 6), y + 32);
    
    if (Mousey)
    {
        draw_set_font(global.FontW97Black);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_mechanic_box(Desc);
    }
}

if (!variable_global_exists("ChallengeIconPosition"))
    global.ChallengeIconPosition = [x, y];

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_72 = 72
}
