sprite_delete(SPRITE_Popups);
sprite_delete(SPRITE_Helpy);
sprite_delete(SPRITE_Window);
skin_sound_delete_array(SOUND_Appear);
skin_sound_delete_array(SOUND_AppearRare);
skin_sound_delete_array(SOUND_Closed);
skin_sound_delete_array(SOUND_ClosedRare);
skin_sound_delete_array([SOUND_Popup, SOUND_Clicked]);
instance_destroy(oHelpyPopup);
