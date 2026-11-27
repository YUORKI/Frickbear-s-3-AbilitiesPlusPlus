var correct_pixels = 0;
var total_pixels = 0;
var goof_ups = 0;

if (keyboard_check_pressed(vk_space) && !rated && PaperUp)
{
    if (surface_exists(sketch_surf) && surface_exists(canvas_surf) && !rated && PaperUp)
    {
        var SurfSize = surface_get_width(sketch_surf) * surface_get_height(sketch_surf) * 4;
        canvas_buffer = buffer_create(SurfSize, buffer_fixed, 1);
        sketch_buffer = buffer_create(SurfSize, buffer_fixed, 1);
        buffer_get_surface(canvas_buffer, canvas_surf, 0);
        buffer_get_surface(sketch_buffer, sketch_surf, 0);
        buffer_seek(canvas_buffer, buffer_seek_start, 0);
        buffer_seek(sketch_buffer, buffer_seek_start, 0);
        
        for (var i = 0; i < SurfSize; i += 4)
        {
            var canvas_alpha = buffer_peek(canvas_buffer, i + 3, buffer_u8);
            var sketch_alpha = buffer_peek(sketch_buffer, i + 3, buffer_u8);
            
            if (sketch_alpha > 0)
            {
                total_pixels++;
                
                if (canvas_alpha > 0)
                    correct_pixels++;
            }
            else if (canvas_alpha > 0)
            {
                goof_ups++;
            }
        }
    }
    
    var accuracy = (correct_pixels / total_pixels) * 100;
    var final_rank = clamp(accuracy - (goof_ups * 0.01), 0, 100);
    var rankMessage = "";
    
    if (final_rank >= 60)
    {
        rankMessage = "Incredible!";
        audio_play_sound(sfxSparkleImpact, 10, false, 1, 0, 1);
        block_tokens(3);
    }
    else if (final_rank >= 40)
    {
        rankMessage = "Nice!";
        audio_play_sound(sfxBitCollect, 10, false, 1, 0, 1);
        block_tokens(2);
    }
    else if (final_rank >= 20)
    {
        rankMessage = "Good Enough!";
        audio_play_sound(sfxBitCollect, 10, false, 1, 0, 1);
        block_tokens(1);
    }
    else if (final_rank >= 5)
    {
        rankMessage = "Lousy...";
        audio_play_sound(sfxBitFail, 10, false, 1, 0, 1);
    }
    else
    {
        rankMessage = "Did you even try!?";
        audio_play_sound(sfxBitFail, 10, false, 1, 0, 1);
    }
    
    if (final_rank < 20 && global.AILevels[ID] == 21)
        TotalScore = 0;
    
    if (final_rank < 20)
        TotalScore -= ((25 - final_rank) * 2);
    else if (final_rank >= 40)
        TotalScore += ((final_rank - 20) / 2);
    
    TotalScore = clamp(TotalScore, 0, 100);
    rankMessage += ("\n" + string(final_rank) + "%");
    
    with (instance_create_depth(90, 180, depth - 2, oTextPopup))
        Text = rankMessage;
    
    submit_page();
}
