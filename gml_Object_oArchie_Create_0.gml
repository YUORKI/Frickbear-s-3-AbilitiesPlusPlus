ID = UnknownEnum.Value_81;
SPRITE_Border = skin_sprite(sArchie_Border, ID, "sprite_01.png");
SPRITE_Machine = skin_sprite(sArchie_Machine, ID, ["sprite_02.png", "sprite_03.png"]);
SPRITE_Grid = skin_sprite(sControlPanel_GridTiles, ID, "sprite_04.png");
SOUND_Select = skin_sound(sfxControlPanel_Select, ID, "sq_select");
SOUND_Open = skin_sound(sfxControlPanel_Open, ID, "sq_open");
SOUND_Close = skin_sound(sfxControlPanel_Close, ID, "sq_close");
SOUND_Selected = skin_sound(sfxControlPanel_TaskDone, ID, "sq_submit");
SOUND_Impact = skin_sound(sfxSparkleImpact, ID, "sq_solved");
SOUND_Cheering = skin_sound(sfxChildrenCheering, ID, "sq_win");
SOUND_Fail = skin_sound(sfxBitExplosion, ID, "sq_fail");
SorterArray = [UnknownEnum.Value_0];
ExclusionList = [];
DataBoxHeight = 48;
GuessingMode = false;
TabletX = 120;
TabletY = 360;
SelectionMenuX = 400;
SelectionMenuY = 0;
GuessesAllowed = 6;
FailFrames = -1;
WonGame = false;

function draw_box(arg0, arg1, arg2, arg3, arg4 = false, arg5 = 64, arg6 = 0.75)
{
    if (arg3 == 16711680)
        arg2 += "\nLower!";
    
    if (arg3 == 8388736)
        arg2 += "\nHigher!";
    
    var Indicator = -1;
    
    switch (arg3)
    {
        case 65280:
            Indicator = 0;
            arg3 = 4309865;
            break;
        
        case 255:
            Indicator = 1;
            arg3 = 1316072;
            break;
        
        case 65535:
            Indicator = 2;
            arg3 = 3918847;
            break;
        
        case 16711680:
            Indicator = 3;
            arg3 = 16735794;
            break;
        
        case 8388736:
            Indicator = 4;
            arg3 = 12325290;
            break;
    }
    
    var BoxWidth = arg5;
    var BoxHeight = arg4 ? 24 : DataBoxHeight;
    draw_set_font(global.FontW97White);
    draw_sprite_stretched_ext(sArchie_Box, 1, arg0, arg1, BoxWidth, BoxHeight, arg3, arg6);
    draw_sprite_stretched_ext(sArchie_Box, 0, arg0, arg1, BoxWidth, BoxHeight, c_white, 1);
    
    if (Indicator >= 0)
        draw_sprite_ext(sArchie_Indicator, Indicator, arg0 + (BoxWidth / 2), arg1 + (BoxHeight / 2), 1, 1, 0, c_white, 0.6);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_ext(arg0 + (BoxWidth / 2), (arg1 + (BoxHeight / 2)) - 2, arg2, 12, arg5 - 4);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

YOffset = 0;
BarDragged = false;
GuessYOffset = 0;
GuessBarDragged = false;
GuessAnimationFrame = 0;
SPMode = global.AILevels[UnknownEnum.Value_81] == 21;

function scroll_bar_archie(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    surface_set_target(TabletSurf);
    var ButtX = 0;
    var ButtY = 0;
    var BarMaxHeight = arg5 - 32;
    var MaxOffset = max(arg6 - arg5, 0);
    ButtX = arg2 + arg4;
    ButtY = arg3;
    var UpButton = in_window(ButtX + TabletX, ButtY + TabletY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(sArchie_Box, UpButton, ButtX, ButtY, 16, 16);
    var BarHeight = BarMaxHeight * min(1, arg5 / arg6);
    var BarY = (MaxOffset == 0) ? 0 : ((BarMaxHeight - BarHeight) * (arg0 / MaxOffset));
    ButtY = arg3 + 16 + BarY;
    var BarClicked = in_window(ButtX + TabletX, ButtY + TabletY, 16, BarHeight) && mouse_check_button(mb_left);
    
    if (BarClicked)
        arg1 = true;
    
    draw_sprite_stretched(sArchie_Box, arg1, ButtX, ButtY, 16, BarHeight);
    
    if (!mouse_check_button(mb_left))
        arg1 = false;
    
    if (arg1 && BarMaxHeight != BarHeight)
    {
        var BarShift = global.MouseY - global.PrevMouseY;
        arg0 += (BarShift * (MaxOffset / (BarMaxHeight - BarHeight)));
    }
    
    ButtX = arg2 + arg4;
    ButtY = (arg3 + arg5) - 16;
    var DownButton = in_window(ButtX + TabletX, ButtY + TabletY, 16, 16) && mouse_check_button(mb_left);
    draw_sprite_stretched(sArchie_Box, DownButton, ButtX, ButtY, 16, 16);
    var ScrollUp = (UpButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2 + TabletX, arg3 + TabletY, arg4 + 16, arg5) && mouse_wheel_up());
    var ScrollDown = (DownButton && mouse_check_button_pressed(mb_left)) || (in_window(arg2 + TabletX, arg3 + TabletY, arg4 + 16, arg5) && mouse_wheel_down());
    arg0 -= ((ScrollUp - ScrollDown) * arg7);
    arg0 = clamp(arg0, 0, MaxOffset);
    surface_reset_target();
    return [arg0, arg1];
}

function draw_selection_menu(arg0, arg1, arg2)
{
    var BoxWidth = (arg0 * 48) + 16;
    var BoxHeight = 264;
    var CharName = "";
    arg2 += 24;
    
    if (!surface_exists(SelectorSurf))
        SelectorSurf = surface_create(BoxWidth, BoxHeight);
    
    surface_set_target(SelectorSurf);
    draw_clear_alpha(c_black, 0);
    
    for (var i = 0; i < array_length(SorterArray); i++)
    {
        var ID = SorterArray[i];
        var TileX = (i % arg0) * 48;
        var TileY = (floor(i / arg0) * 48) - YOffset;
        var Sprite = get_tile(ID);
        var GuessedAlready = array_contains(ExclusionList, ID);
        
        if (mouse_in_zone(TileX + arg1 + TabletX, TileY + arg2 + TabletY, 48, 48) && !GuessedAlready && GuessingMode)
        {
            CharName = global.Descriptions[ID][0];
            draw_outline(16777215, Sprite, 0, TileX, TileY);
            
            if (mouse_check_button_pressed(mb_left))
            {
                make_guess(ID);
                GuessingMode = false;
                mouse_clear(mb_left);
                GuessAnimationFrame = 0;
                audio_play_sound(SOUND_Selected, 5, false);
            }
        }
        
        draw_sprite_ext(Sprite, 0, TileX, TileY, 1, 1, 0, c_white, GuessedAlready ? 0.5 : 1);
    }
    
    surface_reset_target();
    surface_set_target(TabletSurf);
    draw_sprite_stretched_ext(sArchie_Box, 1, arg1 - 1, arg2 - 1, BoxWidth + 2, BoxHeight + 2, c_black, 1);
    draw_surface(SelectorSurf, arg1, arg2);
    draw_sprite_stretched(sArchie_Box, 0, arg1 - 1, arg2 - 1, BoxWidth + 2, BoxHeight + 2);
    arg2 -= 24;
    draw_box(arg1 - 1, arg2, CharName, 0, true, BoxWidth + 2, 1);
    surface_reset_target();
}

function make_guess(arg0)
{
    if (array_length(Guesses) == 0)
    {
        do
            Answer = SorterArray[irandom(array_length(SorterArray) - 1)];
        until (arg0 != Answer);
    }
    
    var MechanicsMatch = true;
    var MechanicsMatchFound = false;
    
    for (var i = 0; i < array_length(Dataset[arg0].Mechanics); i++)
    {
        if (!array_contains(Dataset[Answer].Mechanics, Dataset[arg0].Mechanics[i]))
            MechanicsMatch = false;
        else
            MechanicsMatchFound = true;
        
        if (array_length(Dataset[arg0].Mechanics) != array_length(Dataset[Answer].Mechanics))
            MechanicsMatch = false;
    }
    
    var ColorsMatch = true;
    var ColorsMatchFound = false;
    
    for (var i = 0; i < array_length(Dataset[arg0].Colors); i++)
    {
        if (!array_contains(Dataset[Answer].Colors, Dataset[arg0].Colors[i]))
            ColorsMatch = false;
        else
            ColorsMatchFound = true;
        
        if (array_length(Dataset[arg0].Colors) != array_length(Dataset[Answer].Colors))
            ColorsMatch = false;
    }
    
    array_push(Guesses, 
    {
        ID: arg0,
        GuessCorrectness: [arg0 == Answer, Dataset[arg0].Gender == Dataset[Answer].Gender, ColorsMatch ? true : (ColorsMatchFound ? -1 : 0), MechanicsMatch ? true : (MechanicsMatchFound ? -1 : 0), SPMode ? string_compare(Dataset[arg0].Value, Dataset[Answer].Value) : sign(Dataset[arg0].Value - Dataset[Answer].Value), sign(Dataset[arg0].Debut - Dataset[Answer].Debut)]
    });
    array_push(ExclusionList, arg0);
    GuessesAllowed--;
    
    if (arg0 == Answer)
    {
        WonGame = true;
        audio_play_sound(SOUND_Impact, 15, false);
        audio_play_sound(SOUND_Cheering, 12, false);
        block_tokens(5);
        GamesLeft--;
        
        if (global.DisabledTools.Fan)
            global.Temperature = 0;
        
        if (GamesLeft > 0)
        {
            alarm[0] = 120;
            notification(string("{0} games to go!", GamesLeft));
        }
        else if (global.DisabledTools.Fan)
        {
            global.Timer = max(global.Timer, 358);
        }
    }
    else if (GuessesAllowed == 0)
    {
        audio_play_sound(SOUND_Fail, 15, false);
        FailFrames = 0;
    }
}

function array_to_string(arg0)
{
    var returnString = arg0[0];
    
    for (var i = 1; i < array_length(arg0); i++)
        returnString += ("\n" + arg0[i]);
    
    return returnString;
}

Dataset = [];

for (var i = 0; i <= ((global.AILevels[UnknownEnum.Value_81] == 21) ? UnknownEnum.Value_200 : 90); i++)
{
    var Data = get_animatronic_data(i);
    array_push(Dataset, 
    {
        ID: i,
        Gender: get_animatronic_gender(i),
        Colors: get_animatronic_colors(i),
        Mechanics: SPMode ? get_animatronic_role(i) : Data.DefenseProcedure,
        Value: SPMode ? string_char_at(global.Descriptions[i][0], 1) : (Data.SalvageValue / 100),
        Debut: get_animatronic_debut(i).Year
    });
}

Initialized = false;
GamesLeft = ceil(3 / global.NightSpeedup);

function initialize()
{
    var AI = global.AILevels[UnknownEnum.Value_81];
    var PoolSize = min(ceil(lerp(20, 91, AI / 20) / 5) * 5, 91);
    
    if (AI == 21)
        PoolSize = UnknownEnum.Value_201;
    
    if (!instance_exists(oArchie_Machine))
    {
        with (instance_create_layer(1147, 1208, "OnWall", oArchie_Machine))
        {
            image_xscale = -1;
            sprite_index = other.SPRITE_Machine;
        }
    }
    
    SorterArray = [];
    
    for (var a = 0; a <= ((AI == 21) ? 200 : 90); a++)
    {
        if (global.UnlockedAnimatronics[a])
            array_push(SorterArray, a);
        
        if (array_length(SorterArray) >= PoolSize)
            break;
    }
    
    SorterArray = get_sorter_array(SorterArray, SPMode ? UnknownEnum.Value_0 : UnknownEnum.Value_4);
    Answer = SorterArray[irandom(array_length(SorterArray) - 1)];
    Guesses = [];
    ExclusionList = [];
    WonGame = false;
    GuessesAllowed = 6;
}

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (!WonGame && global.AILevels[UnknownEnum.Value_81] > 0)
    {
        jumpscare(UnknownEnum.Value_81);
        return true;
    }
    
    return false;
}

Answer = 0;
Guesses = [];
show_debug_message(global.Descriptions[Answer][0]);
TabletSurf = -1;
SelectorSurf = -1;
GuessesSurf = -1;
Frame = 0;
TransitionPercent = 0;
TransitionSpeed = 0;
TabletUp = false;

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_81 = 81,
    Value_200 = 200,
    Value_201
}
