var ReaperKills = (has_upgrade(UnknownEnum.Value_65) ? 2 : (has_upgrade(UnknownEnum.Value_64) ? 1 : 0)) * (BossMode != UnknownEnum.Value_1);

if (ReaperKills > 0)
{
    Killables = array_shuffle(generate_kill_list());
    audio_play_sound(sfxMetalImpact, 50, false);
    audio_play_sound(sfxBitExplosionAlt, 50, false);
    
    for (var i = 0; i < min(array_length(Killables), ReaperKills); i++)
    {
        var targID = Killables[i];
        notification($"Mini-Reaper removed {global.Descriptions[targID][0]}!", 2);
        instance_destroy(get_animatronic_object(targID));
        play_deathcoin_voiceline(targID);
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_64 = 64,
    Value_65
}
