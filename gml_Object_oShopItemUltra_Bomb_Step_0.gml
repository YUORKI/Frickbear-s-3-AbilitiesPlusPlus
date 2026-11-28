image_index = UnknownEnum.Value_11;

if (Hovered && mouse_check_button_pressed(mb_left))
{
    Active = true;
    audio_play_sound(sfxClick, 10, false);
    Killables = array_shuffle(generate_kill_list());
    audio_play_sound(sfxMetalImpact, 50, false);
    audio_play_sound(sfxBitExplosionAlt, 50, false);
    
    for (var i = 0; i < min(array_length(Killables), 3); i++)
    {
        var targID = Killables[i];
        notification(string("{0} has been removed!", global.Descriptions[targID][0]), 2);
        instance_destroy(get_animatronic_object(targID));
        play_deathcoin_voiceline(targID);
    }
    
    deplete_uses();
}

enum UnknownEnum
{
    Value_11 = 11
}
