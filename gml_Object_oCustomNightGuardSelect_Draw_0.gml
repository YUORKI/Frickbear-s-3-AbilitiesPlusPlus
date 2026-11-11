var RelativeMouseX = global.MouseX - x;
var RelativeMouseY = global.MouseY - y;

if (instance_exists(oCustomNightMenu))
    depth = oCustomNightMenu.depth - 1;

image_index = 0;

if (0 < RelativeMouseX && RelativeMouseX < 16 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left))
{
    image_index = 1;
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxTick, 1, false);
        
        do
        {
            global.Guard--;
            
            if (global.Guard < 0)
                global.Guard = global.GuardAmount - 1;
        }
        until (global.Guard >= 21 || (global.Guard == UnknownEnum.Value_3 && lunatic_unlocked()) || global.UnlockedGuards[global.Guard]);
    }
}

if (16 < RelativeMouseX && RelativeMouseX < 32 && 0 < RelativeMouseY && RelativeMouseY < 16 && mouse_check_button(mb_left))
{
    image_index = 2;
    
    if (mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(sfxTick, 1, false);
        
        do
        {
            global.Guard++;
            
            if (global.Guard >= global.GuardAmount)
                global.Guard = 0;
        }
        until (global.Guard >= 21 || (global.Guard == UnknownEnum.Value_3 && lunatic_unlocked()) || global.UnlockedGuards[global.Guard]);
    }
}

var GuardNum = 21 - !global.UnlockedAnimatronics[UnknownEnum.Value_161];

if (global.GuardAmount > 4)
    GuardNum = global.GuardAmount;

global.Guard = (global.Guard + GuardNum) % GuardNum;
draw_self();
draw_sprite(sCustomNightCounter, global.Guard, x + 32, y);
draw_sprite(sTileBase, 0, x, y - 48);
draw_sprite(FaceSprites, global.Guard, x, y - 48);

enum UnknownEnum
{
    Value_3 = 3,
    Value_161 = 161
}
