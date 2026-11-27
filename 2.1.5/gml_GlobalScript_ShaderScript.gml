global.UISurface = -1;
global.MinigameSurface = -1;
global.ColorMode = 0;
global.GoGreen = 0;

function initialize_ui_surface()
{
    if (!surface_exists(global.UISurface))
        global.UISurface = surface_create(display_get_gui_width(), display_get_gui_height());
    
    if (surface_get_target() != global.UISurface)
    {
        surface_set_target(global.UISurface);
        draw_clear_alpha(c_black, 0);
        
        if (surface_exists(application_surface))
            draw_surface(application_surface, 0, 0);
    }
}

function set_target_to_ui()
{
    if (!surface_exists(global.UISurface))
        global.UISurface = surface_create(display_get_gui_width(), display_get_gui_height());
    
    surface_set_target(global.UISurface);
    exit;
}

function set_target_to_cam(arg0 = 0)
{
    if (!surface_exists(global.CamSurface))
        global.CamSurface = surface_create(400, 300);
    
    if (!surface_exists(global.CamSurfaceAlt))
        global.CamSurfaceAlt = surface_create(400, 300);
    
    surface_set_target(arg0 ? global.CamSurfaceAlt : global.CamSurface);
    exit;
}

function draw_eleanored_screen()
{
    if (surface_exists(global.UISurface))
    {
        if (eleanor_challenge_active(UnknownEnum.Value_8))
        {
            RFX_init(1, sprite_get_texture(spr_DitherPattern, 0), 100);
            RFX_set_palswap(sprite_get_texture(RFXpalettes_spr, 12));
            RFX_draw_surface(global.UISurface, 0, 0, 1, 1, 0, 16777215, 1);
        }
        else
        {
            draw_surface_ext(global.UISurface, 0, 0, 1, 1, 0, c_white, 1);
        }
    }
}

function draw_filtered_screen(arg0 = 16777215)
{
    if (surface_exists(global.UISurface))
        draw_surface_ext(global.UISurface, 0, 0, 1, 1, 0, arg0, 1);
}

global.FogStart = 0;
global.Fog = 512;

enum UnknownEnum
{
    Value_8 = 8
}
