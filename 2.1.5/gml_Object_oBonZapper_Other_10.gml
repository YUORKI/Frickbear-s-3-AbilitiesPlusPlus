var RelativeMouseX = x - o3DMouse.x;
var RelativeMouseY = y - o3DMouse.y;
var LivesLeft = instance_number(oBonZapper_Life);

if (oBon.ShockTimer > 0 || LivesLeft == 0)
    image_index = 1;
else
    image_index = 0;

if (RelativeMouseX >= -32 && RelativeMouseX < 32 && RelativeMouseY >= 50 && RelativeMouseY < 100 && mouse_check_button_pressed(mb_left) && turnaround_accessible())
{
    mouse_clear(mb_left);
    
    if (image_index == 1)
    {
        audio_play_sound(sfxError, 5, false);
        exit;
    }
    
    with (oBon)
    {
        when_zapped();
        var DrainAmount = round(1 * global.NightSpeedup);
        
        with (instance_create_depth(89, 347, 2, oTextPopup))
            Text = string("-{0}%", DrainAmount);
        
        global.Power -= DrainAmount;
    }
    
    instance_destroy(instance_find(oBonZapper_Life, LivesLeft - 1));
}
