clear_doorway(ID, -1);
clear_doorway(ID, 1);
clear_window(ID);

if (HandL != -1)
{
    instance_destroy(HandL);
    HandL = -1;
}

if (HandR != -1)
{
    instance_destroy(HandR);
    HandR = -1;
}

if (Head != -1)
{
    instance_destroy(Head);
    Head = -1;
}

instance_destroy(oDJMusicMan_RhythmBar);
audio_stop_sound(SOUND_Beat);
audio_stop_sound(SOUND_BeatEnd);
audio_sound_gain(global.Music, SavedMusicLevel, 1000);
sprite_delete(SPRITE_Head);
sprite_delete(SPRITE_Hand);
sprite_delete(SPRITE_Bar);
sprite_delete(SPRITE_Notes);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_Left);
skin_sound_delete_array(SOUND_Right);
skin_sound_delete_array(SOUND_YourTurn);
skin_sound_delete_array(SOUND_Win);
skin_sound_delete_array([SOUND_Cue, SOUND_Pass, SOUND_Fail, SOUND_Creak, SOUND_Slam, SOUND_Beat, SOUND_BeatEnd, SOUND_NotePlace, SOUND_NotePlay]);
