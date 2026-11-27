ID = UnknownEnum.Value_80;
SPRITE_Templates = skin_sprite_unlimited(sBlank_PaperBG, ID, "sprite_template");
SPRITE_TraceLines = skin_sprite_unlimited(sBlank_Templates, ID, "sprite_tracelines");
SPRITE_Paper = skin_sprite(sBlank_Paper, ID, "sprite_02.png");
SPRITE_PaperStack = skin_sprite(sBlank_PaperPile, ID, "sprite_01.png");
SPRITE_Meter = skin_sprite(sBlank_Meter, ID, "sprite_03.png");
SPRITE_MeterPointer = skin_sprite(sBlank_MeterPointer, ID, "sprite_04.png");
SOUND_SubmitBest = skin_sound(sfxSparkleImpact, ID, "sq_submitbest");
SOUND_SubmitGood = skin_sound(sfxBitCollect, ID, "sq_submitgood");
SOUND_SubmitBad = skin_sound(sfxBitFail, ID, "sq_submitbad");
SOUND_Draw = skin_sound(sfxBitNoise, ID, "sq_draw");
SOUND_Paper = skin_sound(sfxPaperFlip, ID, "sq_paper");
SOUND_Satisfied = skin_sound_generate_array(get_misc_voicelines(UnknownEnum.Value_80, "CompletedGood"), ID, "sq_completegood");
SOUND_Dissatisfied = skin_sound_generate_array(get_misc_voicelines(UnknownEnum.Value_80, "CompletedBad"), ID, "sq_completebad");
UI_surf = -1;
canvas_surf = -1;
sketch_surf = -1;
canvas_buffer = -1;
sketch_buffer = -1;
JunkPageSurf = -1;
mouse_x_previous = mouse_x;
mouse_y_previous = mouse_y;
smooth_x = mouse_x;
smooth_y = mouse_y;
TransitionPercent = 0;
TransitionSpeed = 0;
TotalScore = 50;
VisualScore = 50;
init = false;
rated = false;
rank = -1;
PaperUp = false;
factor = 0.5;
TotalPages = round(6 / global.NightSpeedup);
PagesCompleted = 0;
DrawingOrder = [];

for (var i = 0; i < max(sprite_get_number(SPRITE_Templates), (global.AILevels[ID] == 21) ? 15 : 6); i++)
    array_push(DrawingOrder, i);

if (global.AILevels[ID] == 21)
    TotalPages = 15;

DrawingOrder = array_shuffle(DrawingOrder);

function submit_page()
{
    var PageWidth = 320;
    var PageHeight = 360;
    var CanvasX = 176;
    var CanvasY = 16;
    var BaseY = lerp(460, 0, TransitionPercent);
    shader_set(TransparencyShader);
    surface_set_target(UI_surf);
    draw_surface(sketch_surf, 16, 16);
    draw_surface_ext(canvas_surf, 16, 16, 1, 1, 0, c_black, 1);
    surface_reset_target();
    
    with (instance_create_depth((CanvasX + (PageWidth / 2)) - 16, (CanvasY + (PageHeight / 2) + BaseY) - 16, depth - 1, oBlank_FinishedPaper))
        sprite_index = sprite_create_from_surface(other.UI_surf, 0, 0, PageWidth, PageHeight, false, false, PageWidth / 2, PageHeight / 2);
    
    clean_up_buffers();
    PagesCompleted++;
    shader_reset();
    
    if (PagesCompleted == TotalPages)
    {
        rated = true;
        global.PanelUp = false;
        reverb_sound(choose_from_array((TotalScore >= 50) ? SOUND_Satisfied : SOUND_Dissatisfied), 0, 0, false, 1.25, 0.5, 0.25);
    }
    
    if (global.AILevels[ID] == 21)
    {
        global.Temperature = 0;
        
        if (PagesCompleted == TotalPages)
            global.Timer = max(358, global.Timer);
    }
}

function clean_up_buffers()
{
    if (surface_exists(sketch_surf))
        surface_free(sketch_surf);
    
    if (surface_exists(UI_surf))
        surface_free(UI_surf);
    
    if (surface_exists(canvas_surf))
        surface_free(canvas_surf);
    
    if (buffer_exists(canvas_buffer))
    {
        buffer_delete(canvas_buffer);
        canvas_buffer = -1;
    }
    
    if (buffer_exists(sketch_buffer))
    {
        buffer_delete(sketch_buffer);
        sketch_buffer = -1;
    }
}

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (!rated && global.AILevels[UnknownEnum.Value_80] > 0)
    {
        jumpscare(UnknownEnum.Value_80);
        return true;
    }
    
    return false;
}

PenSound = -1;

enum UnknownEnum
{
    Value_80 = 80
}
