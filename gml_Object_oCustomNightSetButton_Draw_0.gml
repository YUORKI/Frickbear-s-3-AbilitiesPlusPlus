if (ButtonVal == 0 || ButtonVal == 7 || !oCustomNightMenu.ChallengesOpen)
{
    image_index = 0;
    
    if (touching_mouse() && mouse_check_button(mb_left))
    {
        image_index = 1;
        
        if (mouse_check_button_pressed(mb_left))
        {
            audio_play_sound(sfxClick, 1, false);
            
            if (ButtonVal == 0)
            {
                if (mouse_check_button_pressed(mb_left))
                {
                    with (oCustomNightMenu)
                        switch_menus();
                }
            }
            
            for (var i = 0; i < 100; i += 1)
            {
                if (!global.UnlockedAnimatronics[i])
                    continue;
                
                switch (ButtonVal)
                {
                    case 0:
                        global.AILevels[i] = 0;
                    
                    case 1:
                        global.AILevels[i] = 0;
                        break;
                    
                    case 2:
                        global.AILevels[i] = min(global.AILevels[i] + 1, 20);
                        break;
                    
                    case 3:
                        global.AILevels[i] = min(global.AILevels[i] + 5, 20);
                        break;
                    
                    case 4:
                        global.AILevels[i] = 20;
                        break;
                    
                    case 7:
                        break;
                }
            }
        }
    }
    
    if (ButtonVal == 7 && (input_check_pressed(UnknownEnum.Value_0) || (touching_mouse() && mouse_check_button(mb_left))))
    {
        audio_play_sound(sfxClick, 1, false);
        start_night();
    }
    
    if (!mouse_check_button(mb_left))
        ClickFrame = 0;
    else
        ClickFrame += 1;
    
    draw_self();
    var Text = " ";
    
    switch (ButtonVal)
    {
        case 0:
            Text = "Challenges";
            break;
        
        case 1:
            Text = "SET ALL 0";
            break;
        
        case 2:
            Text = "ADD ALL 1";
            break;
        
        case 3:
            Text = "ADD ALL 5";
            break;
        
        case 4:
            Text = "SET ALL 20";
            break;
        
        case 7:
            Text = "START NIGHT";
            break;
    }
    
    draw_text(x + 6, y + 6, Text);
}

enum UnknownEnum
{
    Value_0
}
