with (oOffice_TV)
    VladMode = false;

if (Active)
    turn_off_tv();

sprite_delete(SPRITE_Animations);
skin_sound_delete_array(SOUND_Episodes);
skin_sound_delete_array(SOUND_Ads);
skin_sound_delete_array([SOUND_Activate]);
