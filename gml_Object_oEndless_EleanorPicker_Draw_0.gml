draw_set_font(global.FontW97White);
var sprite = sUIBox_Black;
draw_set_alpha(TileSize);
var InnerWindowWidth = (48 * max(8, 3)) + 4;
var InnerWindowHeight = 148;
var WindowWidth = InnerWindowWidth + 8;
var WindowHeight = InnerWindowHeight + 56;
var WindowX = (640 - WindowWidth) / 2;
var WindowY = (360 - WindowHeight) / 2;
WindowY -= ((1 - TileSize) * 360);
WindowY += WindowOffset;
draw_sprite_stretched(sprite, 0, WindowX, WindowY, WindowWidth, WindowHeight);
var ButtonX = WindowX + 4;
var ButtonY = WindowY + 4;
var ButtonWidth = 22;
var ButtonHeight = 22;

if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) || input_check_pressed(UnknownEnum.Value_1))
{
    audio_stop_all();
    audio_play_sound(sfxBump, 10, false);
    room_goto(title_screen());
}

draw_sprite_stretched(sprite, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_sprite(sButtonMini_Icons_White, 0, ButtonX + 11, ButtonY + 11);
draw_set_halign(fa_left);
draw_sprite_stretched(sprite, 0, ButtonX + ButtonWidth + 2, ButtonY, WindowWidth - 32, ButtonHeight);
var PicksLeft = SelectedChallenge != -1;
draw_text(WindowX + 33, WindowY + 5, (SelectedChallenge != -1) ? "Click the confirm button to begin." : "Pick a challenge.");
var InnerWindowY = WindowY + (ButtonHeight + 5);
InnerWindowWidth = (48 * OptionAmount) + 4;
var InnerWindowX = (640 - InnerWindowWidth) / 2;
var CharSelectionWindowHeight = 52;
ButtonX = InnerWindowX + 2;
ButtonY = InnerWindowY + 2;
ButtonWidth = 48;
ButtonHeight = 48;
var SelectedData = undefined;
var EntriesPerRow = ceil(OptionAmount);

for (var a = 0; a < array_length(Choices); a++)
{
    var TileX = a % EntriesPerRow;
    var TileY = floor(a / EntriesPerRow);
    ButtonX = InnerWindowX + 2 + (TileX * 48);
    ButtonY = InnerWindowY + 2 + (TileY * 48);
    var Animatronic = Choices[a];
    var Picked = SelectedChallenge == Animatronic;
    var CanClick = !Picked;
    draw_sprite_stretched(sprite, Picked ? 3 : 2, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
    shader_set(shRecolor);
    replace_color(13695200, 7389320, 5662772, 3354368, 16777215, 12632256, 8421504, 0);
    draw_sprite_ext(sEleanorChallengeIcons_Shop, Animatronic, ButtonX + 24, ButtonY + 24, 1, 1, 0, c_white, 1);
    shader_reset();
    
    if (!Selected)
    {
        if (mouse_in_zone(ButtonX, ButtonY, ButtonWidth, ButtonHeight))
        {
            SelectedData = get_eleanor_challenges(Animatronic);
            SelectedPrice = eleanor_challenge_calculate_price(Animatronic, 0.5);
        }
        
        if (clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) && CanClick)
        {
            SelectedChallenge = Animatronic;
            audio_play_sound(sfxBump, 5, false);
        }
    }
}

InnerWindowX = WindowX + 4;
InnerWindowY += CharSelectionWindowHeight;
InnerWindowWidth = (48 * max(8, OptionAmount)) + 4;
InnerWindowHeight = 22;
draw_sprite_stretched(sprite, 0, InnerWindowX, InnerWindowY, InnerWindowWidth, InnerWindowHeight);

if (SelectedData != undefined)
{
    var Text = SelectedData.Name;
    draw_text(InnerWindowX + 6 + 17, InnerWindowY + 1, Text);
    draw_set_halign(fa_right);
    draw_text((InnerWindowX + InnerWindowWidth) - 6, InnerWindowY + 1, "VALUE: $" + string_format(SelectedPrice, 1, 2));
    draw_set_halign(fa_left);
    var ShowShape = true;
    draw_sprite(sEndlessStickers_Gray, 0, InnerWindowX + 6 + 5, InnerWindowY + 11);
}

InnerWindowY += 24;
InnerWindowHeight = 148 - (CharSelectionWindowHeight + 24);
draw_sprite_stretched(sprite, 0, InnerWindowX, InnerWindowY, InnerWindowWidth, InnerWindowHeight);

if (SelectedData != undefined)
    draw_text_ext(InnerWindowX + 6, InnerWindowY + 1, SelectedData.Desc, 14, InnerWindowWidth - 8);

WindowX = (640 - WindowWidth) / 2;
ButtonWidth = 96;
ButtonHeight = 22;
ButtonX = WindowX + 4;
ButtonY = (WindowY + WindowHeight) - (ButtonHeight + 4);
draw_sprite_stretched(sprite, 0, ButtonX, ButtonY, ButtonWidth, ButtonHeight);
draw_text(ButtonX + 6, ButtonY + 1, "Confirm");

if ((clicked(ButtonX, ButtonY, ButtonWidth, ButtonHeight) || input_check_pressed(UnknownEnum.Value_0)) && (Active && SelectedChallenge != -1 && !Selected))
{
    Selected = true;
    audio_play_sound(sfxClick, 5, false);
    apply_eleanor_challenge(SelectedChallenge, SelectedPrice, UnknownEnum.Value_3, 1);
    instance_create_depth(0, 0, depth - 1, oEndless_AnimatronicPicker);
    Active = false;
}

TileSize += ((Active - TileSize) / 5);

if (round(TileSize * 10) == 0 && !Active)
    instance_destroy();

WindowOffset += WindowOffsetSpeed;
WindowOffsetSpeed = lerp(WindowOffsetSpeed, (0 - WindowOffset) * 0.2, 0.25);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_3 = 3
}
