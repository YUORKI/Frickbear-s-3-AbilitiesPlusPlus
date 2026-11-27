function fuzz_up(arg0 = 0, arg1 = 0)
{
    if (camera_viewed(arg0) || camera_viewed(arg1) || arg0 == 0)
    {
        if (instance_exists(oCameraUI))
        {
            with (oCameraUI)
                FuzzDegree = 1;
        }
    }
}

global.Jumpscare = 0;
global.JumpscareType = 0;

function turnaround_accessible()
{
    return global.TurnedAround && !(global.PanelUp || global.CamUp);
}

function current_frame()
{
    return floor((current_time * 60) / 1000);
}

function anim_frame(arg0, arg1, arg2)
{
    return floor(arg0 / arg1) % arg2;
}

function round_step(arg0, arg1)
{
    return round(arg0 / arg1) * arg1;
}

function guard_name(arg0 = global.Guard)
{
    return global.GuardNames[clamp(arg0, 0, array_length(global.GuardNames) - 1)];
}

function guard_nickname(arg0 = global.Guard)
{
    return no_brackets(guard_name(arg0));
}

function anon_name(arg0)
{
    if (global.UnlockedAnimatronics[arg0])
        return global.Descriptions[arg0][0];
    else
        return "???";
}

function shuffle_mode_unlocked()
{
    return global.UnlockedAnimatronics[UnknownEnum.Value_126] || global.DevMode;
}

function lunatic_unlocked()
{
    return global.UnlockedAnimatronics[UnknownEnum.Value_161] || global.DevMode;
}

function tonights_cabinet_game_raw()
{
    switch (global.Night)
    {
        case 1:
            return UnknownEnum.Value_2;
        
        case 2:
            return UnknownEnum.Value_3;
        
        case 3:
            return UnknownEnum.Value_4;
        
        case 4:
            return UnknownEnum.Value_5;
        
        case 5:
            return UnknownEnum.Value_6;
    }
}

function tonights_cabinet_game()
{
    return global.ShuffleData.Minigames[tonights_cabinet_game_raw()];
}

function force_mask_off()
{
    if (global.MaskDown)
    {
        global.MaskDown = 0;
        audio_bus_main.effects[0] = undefined;
        audio_play_sound(sfxMaskOff, 10, false);
    }
}

function end_office_processes(arg0)
{
    instance_destroy(oAnimatronicParent);
    instance_destroy(oShopItem);
    instance_destroy(oEleanorChallengeIndicator);
    instance_destroy(oPhoneGuy);
    
    if (arg0)
        audio_stop_all();
    
    force_mask_off();
    
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
    
    with (oCamera)
        Freeze = true;
}

function title_screen()
{
    if (room == Opening4LD)
        return room;
    
    if (global.FourLayersDownMode)
        return TitleScreen4LD;
    else
        return TitleScreenMap;
}

function notification(arg0, arg1 = 1)
{
    with (oNotificationWindow)
        YTarget += 24;
    
    with (instance_create_depth(320, -28, -5, oNotificationWindow))
    {
        Text = arg0;
        Alpha = arg1 + 1;
    }
}

function draw_mechanic_box(arg0, arg1 = sWindowBase, arg2 = 224)
{
    var BoxHeight = string_height_ext(arg0, 14, arg2 - 16) + 4;
    var BoxX = global.MouseX;
    var BoxY = global.MouseY;
    
    if (BoxX >= 240)
        BoxX -= arg2;
    
    if (BoxY >= 180)
        BoxY -= BoxHeight;
    
    draw_sprite_stretched(arg1, (arg1 == sWindowBase) ? 0 : 1, BoxX, BoxY, arg2, BoxHeight);
    draw_text_ext(BoxX + 5, BoxY, arg0, 14, arg2 - 16);
}

function get_night_progress()
{
    return global.Progress / global.ProgressToMake;
}

function get_proportional_night_progress()
{
    var ProgressToMake = 360 / global.NightSpeedup;
    var ProgressMade = global.Timer - oCamera.StartTime;
    return ProgressMade / ProgressToMake;
}

function beartrap_notif(arg0, arg1 = true)
{
    audio_play_sound(sfxBlock, 100, false);
    audio_play_sound(sfxBiteOf87, 100, false);
    
    if (arg1)
    {
        if (instance_exists(oShopItemUltra_Beartrap) && !instance_exists(oShopItem_Beartrap))
        {
            with (instance_find(oShopItemUltra_Beartrap, 0))
            {
                deplete_uses();
                
                if (Uses <= 0)
                    instance_destroy();
            }
        }
        else
        {
            instance_destroy(instance_find(oShopItem_Beartrap, 0));
        }
    }
    
    notification(string("Blocked {0}!", global.Descriptions[arg0][0]));
}

function inventory_space()
{
    return has_upgrade(UnknownEnum.Value_50) ? 10 : (has_upgrade(UnknownEnum.Value_49) ? 7 : 5);
}

function has_upgrade(arg0, arg1 = true)
{
    if (eleanor_challenge_active(UnknownEnum.Value_12) && arg1)
        return false;
    
    return array_contains(global.Upgrades, arg0);
}

function immune_to_jumpscares()
{
    if (global.Cheats[UnknownEnum.Value_5])
        return true;
    
    if (instance_exists(oShopItemUltra_GiftBox))
    {
        if (oShopItemUltra_GiftBox.Active)
            return true;
    }
    
    return false;
}

function jumpscare(arg0, arg1 = 0, arg2 = 0, arg3 = true, arg4 = true)
{
    var JumpscareImmune = immune_to_jumpscares();
    
    if (!eleanor_challenge_active(UnknownEnum.Value_5) && (instance_exists(oShopItem_Beartrap) || instance_exists(oShopItemUltra_Beartrap) || JumpscareImmune) && (arg0 != -1 && arg0 != UnknownEnum.Value_119))
    {
        beartrap_notif(arg0, !JumpscareImmune);
        
        if (arg0 == UnknownEnum.Value_126 || arg0 == UnknownEnum.Value_127)
        {
            instance_destroy(oFredbearAttack_Parent);
        }
        else
        {
            instance_destroy(get_animatronic_object(arg0));
            
            if (!guard_ability(UnknownEnum.Value_22) && !array_contains(end_of_night_killers(), arg0))
                instance_create_layer(0, 0, "Room", get_animatronic_object(arg0));
        }
        
        with (oCamera)
            play_deathcoin_voiceline(arg0);
    }
    else
    {
        if (arg0 == UnknownEnum.Value_126 || arg0 == UnknownEnum.Value_127)
            texturegroup_load("FinalBossJumpscare");
        
        end_office_processes(arg3);
        
        if (instance_exists(oPhoneGuy))
        {
            with (oPhoneGuy)
            {
                if (TonightsCall != undefined)
                    audio_stop_sound(TonightsCall);
            }
        }
        
        global.Jumpscare = arg0;
        global.JumpscareType = arg2;
        
        if (global.Night == "Endless")
            instance_destroy(oPauser);
        
        with (instance_create_layer(0, 0, "Camera", oJumpscare))
        {
            var JumpscareSprites = ["jumpscare_body.png", "jumpscare_head.png"];
            var JumpscareSpriteNumber = get_jumpscares_per_char(global.Jumpscare);
            
            if (JumpscareSpriteNumber > 1)
            {
                JumpscareSprites = [];
                
                for (var i = 1; i <= JumpscareSpriteNumber; i++)
                {
                    array_push(JumpscareSprites, string("jumpscare{0}_body.png", i));
                    array_push(JumpscareSprites, string("jumpscare{0}_head.png", i));
                    array_push(JumpscareSprites, string("jumpscare{0}_head.png", i));
                }
            }
            
            Side = arg1;
            Sprite = skin_sprite(get_jumpscare(arg0), arg0, JumpscareSprites, 1);
            BodyImage = arg2 * 3;
            HeadImage = (arg2 * 3) + 1;
        }
        
        if (arg0 == -1)
            oJumpscare.alarm[0] = 1;
        
        if (arg0 == -1)
            arg0 = UnknownEnum.Value_19;
        
        if (arg4)
            count_jumpscare(arg0);
        
        save_permanent_data();
    }
}

function count_jumpscare(arg0)
{
    global.DeathRecord[arg0]++;
    
    if (global.DeathRecord[arg0] >= 10)
        get_trophy(UnknownEnum.Value_26);
    
    if (numbered_night())
    {
        global.Deaths[global.Night - 1]++;
        create_save();
    }
    
    var GetEndoTrophy = true;
    
    for (var i = 0; i <= UnknownEnum.Value_127; i++)
    {
        if (global.Descriptions[i][0] == "UNKNOWN")
            continue;
        
        if (global.DeathRecord[i] == 0 && !is_nonlethal(i, false))
        {
            GetEndoTrophy = false;
            show_debug_message(string("MISSING JUMPSCARE FROM: {0}", global.Descriptions[i][0]));
            break;
        }
    }
    
    if (GetEndoTrophy)
        get_trophy(UnknownEnum.Value_34);
}

function numbered_night()
{
    return global.Night != "Custom" && global.Night != "Endless";
}

function wearing_mask()
{
    return global.MaskDown || instance_exists(oVanniMask);
}

function update_boss_scores()
{
    if (boss_fight_night() && global.Route != UnknownEnum.Value_0)
    {
        var SelectedBoss = (global.Route == UnknownEnum.Value_3) ? 0 : ((global.Route == UnknownEnum.Value_2) ? 1 : 2);
        var CurHiScore = global.BossHiScores[SelectedBoss][global.Difficulty];
        var CurTime = oCamera.BossTimer;
        global.ThisBossHiScore = CurTime;
        
        if (global.Route == UnknownEnum.Value_4)
        {
        }
        else if (CurTime < CurHiScore || CurHiScore == 0)
        {
            global.BossHiScores[SelectedBoss][global.Difficulty] = CurTime;
        }
    }
}

function earn_money(arg0)
{
    global.RunEarnings += arg0;
    global.RunEarningsTotal += arg0;
}

function win_night()
{
    var TargetSurf = application_surface;
    
    if (surface_exists(global.UISurface))
        TargetSurf = global.UISurface;
    
    global.ItemPayout = 0;
    
    with (oCamera)
        global.Freezeframe = sprite_create_from_surface(TargetSurf, 0, 0, surface_get_width(TargetSurf), surface_get_height(TargetSurf), 0, 1, 0, 0);
    
    for (var i = 0; i < array_length(global.AILevels); i++)
    {
        if (array_contains(global.AllTimeSalvages, i) || global.AILevels[i] > 0)
            global.UnlockedAnimatronics[i] = true;
    }
    
    if (has_upgrade(UnknownEnum.Value_42) || has_upgrade(UnknownEnum.Value_43))
    {
        for (var i = 0; i < instance_number(oShopItem); i++)
        {
            var instance = instance_find(oShopItem, i);
            
            if (!variable_instance_exists(instance, "Uses"))
                global.ItemPayout += (instance.Value / 10);
        }
    }
    
    if (is_numeric(global.Night))
    {
        var Earnings = max(round(global.Power * 0.1 * 100) / 100, 0) + (round(global.Tokens * 0.1 * 10) / 10);
        
        if (!(guard_ability(UnknownEnum.Value_6) || guard_ability(UnknownEnum.Value_12)))
            earn_money(Earnings);
        
        global.StartRoom = MidnightCutscnes;
        global.SavedTime = global.RunTime;
        create_save();
    }
    else if (global.Night == "Custom" && global.Challenge != undefined)
    {
        global.ClearedChallenges[global.Challenge] = max(1 + oCamera.Itemless, global.ClearedChallenges[global.Challenge]);
        Cleared = 0;
        ClearedNDC = 0;
        ClearedNPU = 0;
        NonExpertNDC = 0;
        
        for (var i = 0; i < 32; i++)
        {
            if (global.ClearedChallenges[i] > 0)
            {
                Cleared++;
                
                if (global.ClearedChallenges[i] > 1)
                {
                    ClearedNDC++;
                    
                    if (global.ClearedChallenges[i] > 2)
                        ClearedNPU++;
                }
            }
        }
        
        if (Cleared >= 32)
            get_trophy(UnknownEnum.Value_37);
        
        if (ClearedNDC >= 32)
            get_trophy(UnknownEnum.Value_38);
        
        if (ClearedNPU >= 32)
            get_trophy(UnknownEnum.Value_44);
        
        if (ClearedNDC >= 20)
            get_trophy(UnknownEnum.Value_32);
        
        if (ClearedNPU >= 10)
            get_trophy(UnknownEnum.Value_16);
        
        if (global.ChallengeTitle == "Infernal 47")
            get_trophy(UnknownEnum.Value_43);
    }
    else if (global.Night == "Endless")
    {
        if (global.Tokens >= 150)
            unlock_guard(UnknownEnum.Value_8);
        
        var Earnings = max(round(global.Power * 0.1 * 100 * (1 / lerp(global.NightSpeedup, 1, 0.5))) / 100, 0) + (round(global.Tokens * 0.1 * 10) / 10);
        
        if (!(guard_ability(UnknownEnum.Value_6) || guard_ability(UnknownEnum.Value_12)))
            earn_money(Earnings);
        
        instance_destroy(oAnimatronicParent);
        audio_stop_all();
        room_goto(NightClear_Endless);
        exit;
    }
    
    save_permanent_data();
    instance_destroy(oAnimatronicParent);
    audio_stop_all();
    audio_sound_gain(sfx6AM, 1, 0);
    audio_play_sound(sfx6AM, 999, false);
    room_goto(NightClear);
}

function powerdown()
{
    global.Power = -999;
    audio_play_sound(sfxPowerDown, 99, false);
    disable_camera(9999);
    disable_flashlight(9999);
    disable_fan(9999);
    disable_doors(9999);
    audio_sound_gain(sfxAmbience, 1, 100);
    audio_stop_sound(global.Music);
}

function error()
{
    audio_play_sound(sfxError, 10, false);
}

function disable_doors(arg0)
{
    global.Tools.Doors = [arg0 * 60, arg0 * 60];
    
    if (global.Doors[0])
    {
        global.Doors[0] = 0;
        simple_sound(sfxDoor, -400, 0, false, 1);
    }
    
    if (global.Doors[1])
    {
        global.Doors[1] = 0;
        simple_sound(sfxDoor, 400, 0, false, 1);
    }
}

function disable_camera(arg0)
{
    global.Tools.Camera = max(global.Tools.Camera, arg0 * 60);
    
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
}

function disable_mask(arg0)
{
    global.Tools.Mask = max(global.Tools.Mask, arg0 * 60);
}

function disable_flashlight(arg0)
{
    global.Tools.Flashlight = max(global.Tools.Flashlight, arg0 * 60);
}

function disable_fan(arg0)
{
    global.Tools.Fan = max(global.Tools.Fan, arg0 * 60);
    
    if (global.Fan)
    {
        global.Fan = 0;
        audio_stop_sound(sfxFan);
    }
}

function disable_audiolure(arg0, arg1 = false)
{
    global.Tools.AudioLure[arg1] = max(global.Tools.AudioLure[arg1], arg0 * 60);
    
    if (!arg1)
    {
        global.AudioLureX = -99;
        global.AudioLureY = -99;
    }
    else
    {
        global.AudioLureAltX = -99;
        global.AudioLureAltY = -99;
    }
}

function clear_window(arg0)
{
    if (global.WindowOccupant == arg0)
        global.WindowOccupant = -1;
}

function window_available()
{
    return global.WindowOccupant == -1;
}

function clear_doorway(arg0, arg1)
{
    if (global.DoorOccupant[sign_to_binary(arg1)] == arg0)
        global.DoorOccupant[sign_to_binary(arg1)] = -1;
}

function doorway_available(arg0, arg1 = true)
{
    if (global.Doors[sign_to_binary(arg0)] && !arg1)
        return false;
    
    return global.DoorOccupant[sign_to_binary(arg0)] == -1;
}

function occupy_doorway(arg0, arg1)
{
    global.DoorOccupant[sign_to_binary(arg1)] = arg0;
}

function find_available_doorway(arg0 = false)
{
    var side = random_sign();
    
    if (!doorway_available(side, arg0))
        side *= -1;
    
    if (!doorway_available(side, arg0))
        return false;
    
    return side;
}

function doorway_occupant(arg0)
{
    return global.DoorOccupant[sign_to_binary(arg0)];
}

function camera_viewed(arg0, arg1 = -1)
{
    switch (arg1)
    {
        case -1:
            return camera_viewed(arg0, 0) || camera_viewed(arg0, 1) || camera_viewed(arg0, 2);
        
        case 0:
            return global.CamUp && global.Cam == arg0;
        
        case 1:
            return !global.CamUp && global.TVCam[0] == arg0 && (has_upgrade(UnknownEnum.Value_52) || has_upgrade(UnknownEnum.Value_53) || guard_ability(UnknownEnum.Value_9));
        
        case 2:
            return !global.CamUp && global.TVCam[1] == arg0 && (has_upgrade(UnknownEnum.Value_52) || guard_ability(UnknownEnum.Value_9));
    }
}

function draw_on_cam(arg0, arg1)
{
    if (camera_viewed(arg0, 0) || camera_viewed(arg0, 1))
    {
        set_target_to_cam(false);
        arg1();
        surface_reset_target();
    }
    
    if (camera_viewed(arg0, 2))
    {
        set_target_to_cam(true);
        arg1();
        surface_reset_target();
    }
}

function touching_mouse()
{
    return mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_x < bbox_right && mouse_y < bbox_bottom;
}

function mouse_in_zone(arg0, arg1, arg2, arg3)
{
    return arg0 <= global.MouseX && (arg0 + arg2) > global.MouseX && arg1 <= global.MouseY && (arg1 + arg3) > global.MouseY;
}

function mouse_in_minigame_zone(arg0, arg1, arg2, arg3)
{
    var mouseX = minigame_mouse_x();
    var mouseY = minigame_mouse_y();
    return arg0 <= mouseX && (arg0 + arg2) > mouseX && arg1 <= mouseY && (arg1 + arg3) > mouseY;
}

function in_window(arg0, arg1, arg2, arg3)
{
    return arg0 <= global.MouseX && (arg0 + arg2) > global.MouseX && arg1 <= global.MouseY && (arg1 + arg3) > global.MouseY;
}

function custom_in_window(arg0, arg1, arg2, arg3, arg4, arg5)
{
    return arg0 <= arg4 && (arg0 + arg2) > arg4 && arg1 <= arg5 && (arg1 + arg3) > arg5;
}

function clicked(arg0, arg1, arg2, arg3)
{
    return mouse_check_button_pressed(mb_left) && in_window(arg0, arg1, arg2, arg3);
}

function format_as_timer(arg0, arg1 = false)
{
    var TimerSeconds = floor(arg0) % 60;
    var TimerMinutes = floor(arg0 / 60) % 60;
    var TimerHours = floor(floor(arg0 / 60) / 60);
    
    if (TimerSeconds < 10)
        TimerSeconds = "0" + string(TimerSeconds);
    
    TimerSeconds = string(TimerSeconds);
    
    if (TimerHours > 0)
    {
        TimerHours = string(TimerHours) + ":";
        
        if (TimerMinutes < 10)
            TimerMinutes = "0" + string(TimerMinutes);
    }
    else
    {
        TimerHours = "";
    }
    
    TimerMinutes = string(TimerMinutes);
    
    if (arg1)
    {
        var TimerDecimal = floor((arg0 % 1) * 100);
        
        if (TimerDecimal >= 100)
            TimerDecimal -= 100;
        
        if (TimerDecimal < 10)
            TimerDecimal = "0" + string(TimerDecimal);
        else
            TimerDecimal = string(TimerDecimal);
        
        TimerSeconds += ("." + TimerDecimal);
    }
    
    return TimerHours + TimerMinutes + ":" + TimerSeconds;
}

function add_tokens(arg0)
{
    add_tokens_silently(arg0);
    audio_play_sound(sfxBitCollect, 1, false);
}

function add_tokens_silently(arg0)
{
    if (room == Office)
    {
        arg0 *= global.GuardParameters.minigame_token_multiplier;
        
        if (guard_ability(UnknownEnum.Value_7))
            arg0 *= 1.5;
        
        if (guard_ability(UnknownEnum.Value_19))
            oCamera.MinigameCompletionPoints += arg0;
        
        global.Power += (arg0 * global.GuardParameters.minigame_power_gain);
        
        if (has_upgrade(UnknownEnum.Value_5))
            global.Tokens += (arg0 * 2);
        else if (has_upgrade(UnknownEnum.Value_4))
            global.Tokens += (arg0 * 1.5);
        else if (has_upgrade(UnknownEnum.Value_3))
            global.Tokens += (arg0 * 1.25);
        else
            global.Tokens += arg0;
    }
}

function block_tokens(arg0 = 1)
{
    if (room == Office)
    {
        arg0 *= global.GuardParameters.blocked_token_multiplier;
        
        if (guard_ability(UnknownEnum.Value_7))
            exit;
        
        if (guard_ability(UnknownEnum.Value_18))
            global.Temperature += 4;
        
        if (has_upgrade(UnknownEnum.Value_35))
            global.Tokens += (arg0 * 2);
        else if (has_upgrade(UnknownEnum.Value_34))
            global.Tokens += (arg0 * 1.5);
        else
            global.Tokens += arg0;
    }
}

function drain_power(arg0)
{
    global.Power -= arg0;
}

function delete_shop_item(arg0)
{
    with (oCamButtonShopItem)
    {
        if (Text == arg0)
            instance_destroy();
    }
}

function delete_shop_item_all()
{
    with (oCamButtonShopItem)
    {
        if (Text != "Pickles" && Text != "High-Quality Lumber")
            instance_destroy();
    }
}

function mouse_in_minigame_window()
{
    var MouseX = global.MouseX - global.MinigameWindowX;
    var MouseY = global.MouseY - global.MinigameWindowY;
    return MouseX >= 0 && MouseX < 320 && MouseY >= 0 && MouseY < 288;
}

function minigame_mouse_x()
{
    return (global.MouseX - global.MinigameWindowX) / global.MinigameWindowScale;
}

function minigame_mouse_y()
{
    return (global.MouseY - global.MinigameWindowY) / global.MinigameWindowScale;
}

function random_sign()
{
    return (irandom_range(0, 1) * 2) - 1;
}

function binary_to_sign(arg0)
{
    return (arg0 * 2) - 1;
}

function sign_to_binary(arg0)
{
    return (1 + arg0) / 2;
}

function check_reset()
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}

global.SummonedAnimatronics = [];

function clear_summons()
{
    if (array_length(global.SummonedAnimatronics) == 0)
        exit;
    
    for (var a = 0; a < array_length(global.SummonedAnimatronics); a++)
        global.AILevels[global.SummonedAnimatronics[a]] = 0;
    
    global.SummonedAnimatronics = [];
}

function nonlethal_characters_only()
{
    var a = global.AILevels;
    
    for (var i = 0; i < array_length(global.AILevels); i++)
    {
        if (is_nonlethal(i, true))
            continue;
        
        if (a[i] > 0)
            return false;
    }
    
    return true;
}

function is_nonlethal(arg0, arg1 = false)
{
    var Data = get_animatronic_data(arg0);
    var Lethal = "Negligible";
    
    if (!variable_struct_exists(Data, "Lethality"))
        return true;
    
    Lethal = Data.Lethality;
    return Lethal == "Negligible" || (arg0 == UnknownEnum.Value_14 && arg1);
}

function end_of_night_killers()
{
    return [UnknownEnum.Value_6, UnknownEnum.Value_26, UnknownEnum.Value_42, UnknownEnum.Value_62, UnknownEnum.Value_73, UnknownEnum.Value_72, UnknownEnum.Value_80, UnknownEnum.Value_81];
}

function character_active(arg0)
{
    return (global.AILevels[arg0] > 0 || (global.Night != "Custom" && array_contains(global.AllTimeSalvages, arg0))) && instance_exists(get_animatronic_object(arg0));
}

function approach_factor(arg0, arg1)
{
    return 1 - power(1 - arg0, arg1);
}

function get_location(arg0)
{
    var CharacterOrder = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_2, UnknownEnum.Value_3, UnknownEnum.Value_16, UnknownEnum.Value_14, UnknownEnum.Value_10, UnknownEnum.Value_11, UnknownEnum.Value_12, UnknownEnum.Value_13, UnknownEnum.Value_4, UnknownEnum.Value_5, UnknownEnum.Value_20, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8, UnknownEnum.Value_9, UnknownEnum.Value_15, UnknownEnum.Value_18, UnknownEnum.Value_33, UnknownEnum.Value_17, UnknownEnum.Value_19, UnknownEnum.Value_30, UnknownEnum.Value_32, UnknownEnum.Value_31, UnknownEnum.Value_37, UnknownEnum.Value_35, UnknownEnum.Value_21, UnknownEnum.Value_22, UnknownEnum.Value_23, UnknownEnum.Value_24, UnknownEnum.Value_36, UnknownEnum.Value_38, UnknownEnum.Value_34, UnknownEnum.Value_25, UnknownEnum.Value_26, UnknownEnum.Value_27, UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_42, UnknownEnum.Value_43, UnknownEnum.Value_44, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_118];
    var i = 0;
    
    repeat (array_length(CharacterOrder) - 1)
    {
        if (arg0 == CharacterOrder[i])
            return i;
        
        i++;
    }
    
    return arg0;
}

global.SortByLocation = function(arg0, arg1)
{
    return get_location(arg0) - get_location(arg1);
};

function skip_cutscenes()
{
    return false;
    return global.Settings[3][UnknownEnum.Value_0];
}

function set_audio_volumes()
{
    audio_group_set_gain(mus_CandyCadetStory, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
    audio_group_set_gain(voc_Marionette_WindUpTheBox, (global.Settings[2][0] * global.Settings[2][2]) / 100, 0);
    audio_group_set_gain(voc_Springtrap_Pathetic, (global.Settings[2][0] * global.Settings[2][1]) / 100, 0);
    audio_group_set_gain(voc_WitheredChica_HaventYouHeard, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(voc_Helpy_BuyBuyBuy, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(sfxMontyWhistle, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    audio_group_set_gain(voc_ToyFreddy_HardlyGaming, (global.Settings[2][0] * global.Settings[2][3]) / 100, 0);
    
    if (global.Settings[2][5] == 1 || global.Settings[2][5] == 2 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_WitheredChica_HaventYouHeard, 0, 0);
    
    if (global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_Helpy_BuyBuyBuy, 0, 0);
    
    if (global.Settings[2][5] == 2 || global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(sfxMontyWhistle, 0, 0);
    
    if (global.Settings[2][5] == 2 || global.Settings[2][5] == 3 || global.Settings[2][5] == 4)
        audio_group_set_gain(voc_ToyFreddy_HardlyGaming, 0, 0);
    
    if (global.Settings[2][3] == 0)
    {
    }
}

function get_item_amount(arg0 = true, arg1 = false)
{
    var Num = instance_number(oShopItem);
    
    if (!arg1)
        Num -= (instance_number(oShopItem_DistortionClock) + instance_number(oShopItem_RewindClock));
    
    if (!arg0)
        Num -= instance_number(oShopItem_KingsPrize);
    
    return Num;
}

function get_current_time()
{
    var dt = date_current_datetime();
    var hour = string_format(date_get_hour(dt), 2, 0);
    var minute = string_format(date_get_minute(dt), 2, 0);
    var second = string_format(date_get_second(dt), 2, 0);
    var AMorPM = "AM";
    
    if (hour >= 12)
        AMorPM = "PM";
    
    hour = hour % 12;
    
    if (hour == 0)
        hour = 12;
    
    return string("{0}:{1} {2}", hour, minute, AMorPM);
}

function get_current_date()
{
    var dt = date_current_datetime();
    var year = date_get_year(dt);
    var month = string_format(date_get_month(dt), 2, 0);
    var day = string_format(date_get_day(dt), 2, 0);
    var MonthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return string("{0} {1}, {2}", MonthNames[month - 1], day, year);
}

function scroll_bar(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 = 0, arg9 = 0, arg10 = 0)
{
    var ButtX = 0;
    var ButtY = 0;
    var Box = arg10 ? sUIBox_Black : sButtonMini;
    var Icons = arg10 ? sButtonMini_Icons_White : sButtonMini_Icons;
    var Img_NotClicked = arg10 ? 2 : 0;
    var Img_Clicked = arg10 ? 3 : 1;
    var BarMaxHeight = arg5 - 32;
    var MaxOffset = max(arg6 - arg5, 0);
    ButtX = arg2 + arg4;
    ButtY = arg3;
    var OffsetButtX = ButtX - arg8;
    var OffsetButtY = ButtY - arg9;
    var UpButton = in_window(OffsetButtX, OffsetButtY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(Box, UpButton ? Img_Clicked : Img_NotClicked, ButtX, ButtY, 16, 16);
    draw_sprite(Icons, 3, ButtX + 8, ButtY + 8);
    
    if (!arg10)
        draw_sprite_stretched(sScrollBarBG, 0, ButtX, ButtY + 16, 16, BarMaxHeight);
    
    var BarHeight = BarMaxHeight * min(1, arg5 / arg6);
    var BarY = (MaxOffset == 0) ? 0 : ((BarMaxHeight - BarHeight) * (arg0 / MaxOffset));
    ButtY = arg3 + 16 + BarY;
    OffsetButtX = ButtX - arg8;
    OffsetButtY = ButtY - arg9;
    var BarClicked = in_window(OffsetButtX, OffsetButtY, 16, BarHeight) && mouse_check_button(mb_left);
    
    if (BarClicked)
        arg1 = true;
    
    draw_sprite_stretched(Box, arg1 ? Img_Clicked : Img_NotClicked, ButtX, ButtY, 16, BarHeight);
    
    if (!mouse_check_button(mb_left))
        arg1 = false;
    
    if (arg1 && BarMaxHeight != BarHeight)
    {
        var BarShift = global.MouseY - global.PrevMouseY;
        arg0 += (BarShift * (MaxOffset / (BarMaxHeight - BarHeight)));
    }
    
    ButtX = arg2 + arg4;
    ButtY = (arg3 + arg5) - 16;
    OffsetButtX = ButtX - arg8;
    OffsetButtY = ButtY - arg9;
    var DownButton = in_window(OffsetButtX, OffsetButtY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(Box, DownButton ? Img_Clicked : Img_NotClicked, ButtX, ButtY, 16, 16);
    draw_sprite(Icons, 4, ButtX + 8, ButtY + 8);
    var ScrollUp = (UpButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2 - arg8, arg3 - arg9, arg4 + 16, arg5) && mouse_wheel_up());
    var ScrollDown = (DownButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2 - arg8, arg3 - arg9, arg4 + 16, arg5) && mouse_wheel_down());
    arg0 -= ((ScrollUp - ScrollDown) * arg7);
    arg0 = clamp(arg0, 0, MaxOffset);
    return [arg0, arg1];
}

function has_been_good()
{
    if (!is_numeric(global.Night))
        return false;
    
    for (var n = 0; n < min(global.Night - 2, 3); n++)
    {
        if (global.SalvagedMasks[n] <= 0)
            return false;
    }
    
    return true;
}

function currently_good()
{
    if (!is_numeric(global.Night))
        return false;
    
    return global.SalvagedMasks[clamp(global.Night - 2, 0, 3)];
}

function has_been_evil()
{
    if (!is_numeric(global.Night))
        return false;
    
    for (var n = 0; n < min(global.Night - 2, 3); n++)
    {
        if (global.SalvagedScraps[n] <= 0)
            return false;
    }
    
    return true;
}

function currently_evil()
{
    if (!is_numeric(global.Night))
        return false;
    
    return global.SalvagedScraps[clamp(global.Night - 2, 0, 3)];
}

function has_been_ultimate()
{
    return has_been_good() * has_been_evil();
}

function currently_ultimate()
{
    return currently_good() * currently_evil();
}

function subtitles_enabled()
{
    return !global.Settings[2][6];
}

function check_flag(arg0)
{
    return array_contains(global.UnlockFlags, arg0);
}

function add_flag(arg0)
{
    if (!array_contains(global.UnlockFlags, arg0))
        array_push(global.UnlockFlags, arg0);
}

function count_up(arg0, arg1 = false, arg2 = 9999, arg3 = 0)
{
    var Total = 0;
    
    for (var i = arg3; i < min(arg3 + arg2, array_length(arg0)); i++)
        Total += (arg1 ? min(1, arg0[i]) : arg0[i]);
    
    return Total;
}

function count_up_stickers(arg0, arg1 = true, arg2 = 91, arg3 = 0)
{
    var Total = 0;
    
    for (var i = arg3; i < min(arg3 + arg2, array_length(arg0)); i++)
        Total += (arg1 ? (arg0[i] > -1) : (arg0[i] + 1));
    
    return Total;
}

function string_compare(arg0, arg1)
{
    if (arg0 < arg1)
        return -1;
    
    if (arg0 > arg1)
        return 1;
    
    return 0;
}

function end_microgame()
{
    with (oFredbearManager)
        MicrogameTimer = min(MicrogameTimer, 1);
}

function in_salvage_location()
{
    return array_contains([MinigameMaze_1, MinigameMaze_2, MinigameMaze_3, MinigameMaze_4, MinigameMaze_5], room);
}

function ultimate_route_unlocked()
{
    return global.UnlockedTrophies[UnknownEnum.Value_30] && global.UnlockedTrophies[UnknownEnum.Value_29] && global.UnlockedTrophies[UnknownEnum.Value_31] && global.UnlockedTrophies[UnknownEnum.Value_15];
}

function boss_fight_night()
{
    return (global.Night == 6 || global.Night == "Custom") && (global.Route != UnknownEnum.Value_0 && global.Route != UnknownEnum.Value_1);
}

function draw_outline(arg0, arg1 = undefined, arg2 = undefined, arg3 = x, arg4 = y, arg5 = 1)
{
    if (arg1 == undefined)
        arg1 = sprite_index;
    
    if (arg2 == undefined)
        arg2 = image_index;
    
    shader_set(shFlash);
    
    for (var i = -45; i < 360; i += 45)
        draw_sprite_ext(arg1, arg2, arg3 + round(lengthdir_x(arg5, i)), arg4 + round(lengthdir_y(arg5, i)), image_xscale, image_yscale, 0, arg0, 1);
    
    shader_reset();
}

function calc_price(arg0)
{
    var GuardDiscount = global.GuardParameters.shop_discount;
    
    if (guard_ability(UnknownEnum.Value_6))
        GuardDiscount = 0.8;
    
    if (guard_ability(UnknownEnum.Value_24))
        GuardDiscount = 0.6;
    
    if (guard_ability(UnknownEnum.Value_25))
        GuardDiscount = 1.8;
    
    return round(2 * arg0 * (guard_ability(UnknownEnum.Value_12) ? 1 : (((global.Difficulty - 1) * 0.25) + 1)) * GuardDiscount) / 2;
}

function get_heal_price(arg0 = 1)
{
    return calc_price((20 + (10 * global.TimesHealed)) * arg0);
}

function kill_mendo()
{
    return eleanor_challenge_active(UnknownEnum.Value_0) || (global.BossPhase == 5 && oCamera.BossMode == UnknownEnum.Value_2) || oCamera.BossMode == UnknownEnum.Value_3;
}

function set_relative_depth(arg0)
{
    depth = layer_get_depth(layer) + arg0;
}

function lives_left()
{
    return array_length(global.Lives);
}

function has_two_tvs()
{
    return has_upgrade(UnknownEnum.Value_53) || guard_ability(UnknownEnum.Value_9);
}

function has_mods(arg0 = false)
{
    if (array_length(get_folders("addons")) > 0 && !arg0)
        return true;
    
    if (array_length(get_folders("skins")) > 0)
        return true;
    
    if (array_length(get_folders("offices")) > 0)
        return true;
    
    return false;
}

function reset_challenge_alterations(arg0 = true, arg1 = true)
{
    if (arg0)
    {
        global.Cheats = array_create(10, false);
        global.Cheats[UnknownEnum.Value_0] = true;
    }
    
    global.CustomNightUpgrades = [];
    global.CustomNightGuardAbility = functional_guard_id(global.Guard);
    global.DisabledTools = 
    {
        Camera: false,
        Doors: false,
        Fan: false,
        Mask: false,
        Flashlight: false,
        AudioLure: false
    };
    global.Route = UnknownEnum.Value_0;
    
    if (arg1)
        global.EleanorChallenge = -1;
}

function spawn_item(arg0)
{
    switch (arg0)
    {
        case "Battery Pack":
            global.Power += 10;
            break;
        
        case "Distortion Clock":
            instance_create_depth(0, 0, 0, oShopItem_DistortionClock);
            break;
        
        case "Deathcoin":
            with (instance_create_depth(0, 0, 0, oShopItem_DeathCoin))
                Value = other.AlteredPrice;
            
            break;
        
        case "Snowcone":
            with (instance_create_depth(0, 0, 0, oShopItem_Snowcone))
                Value = other.AlteredPrice;
            
            break;
        
        case "Golden Cupcake":
            with (instance_create_depth(0, 0, 0, oShopItem_GoldenCupcake))
            {
                Value = other.AlteredPrice;
                OriginalValue = other.AlteredPrice;
            }
            
            break;
        
        case "Beartrap":
            with (instance_create_depth(0, 0, 0, oShopItem_Beartrap))
                Value = other.AlteredPrice;
            
            break;
        
        case "Laser Doors":
            with (instance_create_depth(0, 0, 0, oShopItem_LaserDoors))
                Value = other.AlteredPrice;
            
            break;
        
        case "King's Prize":
            instance_create_depth(320, -32, 0, oShopItem_KingsPrize);
            break;
        
        case "Rewind Clock":
            instance_create_depth(0, 0, 0, oShopItem_RewindClock);
            break;
        
        case "AR Mask":
            with (instance_create_depth(0, 0, 0, oShopItem_ARMask))
                Value = other.AlteredPrice;
            
            break;
        
        case "Pickles":
            with (instance_create_layer(1150 + (48 * instance_number(oPickles)), 750, "OnWall", oPickles))
            {
                sprite_index = sPickles;
                get_trophy(UnknownEnum.Value_19);
                audio_play_sound(sfxChildrenCheering, 10, false);
                OriginalY = 750;
            }
            
            break;
    }
}

function get_call_speaker(arg0)
{
    switch (arg0)
    {
        case vocPhoneGuy1:
            return "PHONE GUY";
        
        case vocPhoneGuy2:
            return "PHONE GEEK";
        
        case vocPhoneGuy3:
            return "PHONE GAL";
        
        case vocPhoneGuy4:
        case vocPhoneGuy5:
            return "PHONE GOON";
        
        case vocPhoneGuy6:
            return "THE BOSS";
        
        case voc_PhonyCall:
            return "THE BOSS?";
        
        default:
            return "???";
    }
}

function get_call_id(arg0)
{
    var Calls = voiceline_database(UnknownEnum.Value_128).ShuffleCalls;
    
    for (var i = 0; i < array_length(Calls); i++)
    {
        if (arg0 == Calls[i])
            return i;
    }
    
    return -1;
}

function fully_turned_around()
{
    if (!instance_exists(oCamera))
        return false;
    
    return abs(angle_difference(oCamera.CameraRotation, 90)) > 90;
}

function generate_kill_list(arg0 = false, arg1 = false)
{
    var Killables = [];
    var SorterArray = get_sorter_array(countup_array(90));
    
    for (var i = 0; i < array_length(SorterArray); i++)
    {
        var ID = SorterArray[i];
        show_debug_message(global.Descriptions[ID][0]);
        
        if (global.AILevels[ID] > 20)
            continue;
        
        if (array_contains(global.GuardParameters.unkillable_animatronics, ID))
            continue;
        
        if ((!arg0 && character_active(ID)) || (arg0 && array_contains(global.AllTimeSalvages, ID)))
            array_push(Killables, ID);
    }
    
    if (arg1 && instance_exists(oSalvage))
        array_push(Killables, UnknownEnum.Value_120);
    
    return Killables;
}

global.Challenge = undefined;
global.ChallengeTitle = "None";
global.NightSpeedup = 1;
global.CustomNightMusic = undefined;
global.MicrogameSpeed = 1;
global.MicrogameLevel = 0;
global.MicrogameWin = true;

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
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_49 = 49,
    Value_50,
    Value_52 = 52,
    Value_53,
    Value_62 = 62,
    Value_72 = 72,
    Value_73,
    Value_80 = 80,
    Value_81,
    Value_118 = 118,
    Value_119,
    Value_120,
    Value_126 = 126,
    Value_127,
    Value_128,
    Value_161 = 161
}
