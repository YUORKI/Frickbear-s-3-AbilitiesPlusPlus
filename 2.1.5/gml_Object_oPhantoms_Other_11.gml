for (var i = 0; i < array_length(CurrentCams); i++)
{
    SubCamera = i;
    
    if (CurrentCams[i] <= AmountOfPhantoms && CurrentCams[i] > 0)
    {
        draw_on_cam(i, function()
        {
            draw_set_alpha(random_range(0.25, 0.5) + (Aggro / 2));
            draw_sprite(SPRITE_Cameras, CurrentCams[SubCamera] - 1, 0, 0);
            draw_set_alpha(1);
        });
    }
}
