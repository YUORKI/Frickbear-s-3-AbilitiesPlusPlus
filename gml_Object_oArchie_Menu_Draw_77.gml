if (!surface_exists(TabletSurf))
    TabletSurf = surface_create(400, 300);

surface_set_target(TabletSurf);
draw_clear_alpha(c_black, 1);
shader_set(TransparencyShader);
draw_sprite_tiled(sControlPanel_GridTiles, 0, Frame, Frame);
var HeaderTitles = ["Character", "Gender", "Main Color", "Mechanics", "Value", "Debut"];
surface_reset_target();
var HeaderOffset = 24 - GuessYOffset;

if (!surface_exists(GuessesSurf))
    GuessesSurf = surface_create(384, 336);

surface_set_target(GuessesSurf);
draw_clear_alpha(c_black, 0);

for (var i = 0; i < 6; i++)
    draw_box(i * 64, HeaderOffset - 24, HeaderTitles[i], 0, true);

var row;

for (row = 0; row < array_length(Guesses); row++)
{
    var CharID = Guesses[row].ID;
    var Data = Dataset[CharID];
    var RowData = [get_tile(CharID), Data.Gender, array_to_string(Data.Colors), array_to_string(Data.Mechanics), "$" + string(Data.Value), string(Data.Debut)];
    draw_box(0, (row * DataBoxHeight) + HeaderOffset, "", Guesses[row].GuessCorrectness[0] ? 65280 : 255);
    draw_outline(16777215, RowData[0], 0, 8 + ((DataBoxHeight - 48) / 2), (row * DataBoxHeight) + HeaderOffset);
    draw_sprite(RowData[0], 0, 8, (row * DataBoxHeight) + HeaderOffset);
    
    for (var i = 1; i < 6; i++)
    {
        var Correct = Guesses[row].GuessCorrectness[i];
        var Color = (Correct == true) ? 65280 : ((Correct == -1) ? 65535 : 255);
        
        if (i >= 4)
            Color = (Correct == -1) ? 8388736 : ((Correct == 1) ? 16711680 : 65280);
        
        draw_box(i * 64, (row * DataBoxHeight) + HeaderOffset, RowData[i], Color);
    }
}

var BoxY = (row * DataBoxHeight) + HeaderOffset;
var HoveringOverGuessMaker = mouse_in_zone(TabletX, TabletY + BoxY, 384, DataBoxHeight) && !GuessingMode;
draw_box(0, BoxY, string("+ NEW GUESS ({0} LEFT)", GuessesAllowed), HoveringOverGuessMaker ? 16777215 : 0, false, 384);

if (HoveringOverGuessMaker && mouse_check_button_pressed(mb_left))
{
    GuessingMode = true;
    mouse_clear(mb_left);
}

surface_reset_target();
surface_set_target(TabletSurf);
draw_surface(GuessesSurf, 0, 0);
surface_reset_target();
var SelectorColumns = 5;
var BoxWidth = (SelectorColumns * 48) + 16;
var BoxHeight = 264;
SelectionMenuX += (((GuessingMode ? ((400 - BoxWidth) / 2) : 400) - SelectionMenuX) / 5);
SelectionMenuY = (300 - (BoxHeight + 24)) / 2;
draw_selection_menu(SelectorColumns, SelectionMenuX, SelectionMenuY);

if (mouse_check_button_pressed(mb_left) && !mouse_in_zone(SelectionMenuX + TabletX, SelectionMenuY + TabletY + 24, BoxWidth, BoxHeight) && GuessingMode)
{
    GuessingMode = false;
    mouse_clear(mb_left);
}

var GuessScrollBar = scroll_bar_archie(GuessYOffset, GuessBarDragged, 0, 0, 384, 300, 48 * (array_length(Guesses) + 1.5), 48);
GuessYOffset = GuessScrollBar[0];
GuessBarDragged = GuessScrollBar[1];
var ScrollBar = scroll_bar_archie(YOffset, BarDragged, SelectionMenuX, SelectionMenuY + 24, BoxWidth - 16, BoxHeight, 48 * ceil(91 / SelectorColumns), 48);
YOffset = ScrollBar[0];
BarDragged = ScrollBar[1];
draw_surface(TabletSurf, TabletX, TabletY);
shader_reset();
Frame++;
GuessAnimationFrame++;
