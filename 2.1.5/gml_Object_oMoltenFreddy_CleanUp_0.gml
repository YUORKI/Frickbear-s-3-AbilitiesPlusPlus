audio_stop_sound(SOUND_Approach);

if (variable_instance_exists(self, "CoolEmitter"))
    audio_emitter_free(CoolEmitter);

clear_doorway(ID, Side);
skin_sound_delete_array(SOUND_Approach);
