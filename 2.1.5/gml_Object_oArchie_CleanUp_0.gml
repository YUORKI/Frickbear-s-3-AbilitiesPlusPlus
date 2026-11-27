if (surface_exists(TabletSurf))
    surface_free(TabletSurf);

if (surface_exists(SelectorSurf))
    surface_free(SelectorSurf);

if (surface_exists(GuessesSurf))
    surface_free(GuessesSurf);

instance_destroy(oArchie_Machine);

if (TabletUp)
    global.PanelUp = false;
