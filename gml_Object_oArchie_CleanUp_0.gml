if (surface_exists(TabletSurf))
    surface_free(TabletSurf);

if (surface_exists(SelectorSurf))
    surface_free(SelectorSurf);

if (surface_exists(GuessesSurf))
    surface_free(GuessesSurf);

instance_destroy(oArchie_Machine);

if (TabletUp)
    global.PanelUp = false;

sprite_delete(SPRITE_Border);
sprite_delete(SPRITE_Machine);
sprite_delete(SPRITE_Grid);
skin_sound_delete_array([SOUND_Select, SOUND_Open, SOUND_Close, SOUND_Selected, SOUND_Impact, SOUND_Cheering, SOUND_Fail]);
