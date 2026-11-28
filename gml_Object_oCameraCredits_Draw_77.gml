if (audio_is_playing(sfxOMCCountdown))
    exit;
else if (global.Music == undefined)
    global.Music = audio_play_sound(FourLayersDown ? mus_Credits4LD : musCredits, 99, false);

initialize_ui_surface();
YOffset = round(Frame);

if (global.FourLayersDownMode)
    YOffset += 64;

if (FourLayersDown)
{
    draw_clear(c_black);
    shader_set(TransparencyShader);
    draw_tower(TowerPosition, abs(Frame * 3), 152);
    draw_sprite(s4LDCredits_Backing, 0, 272, 0);
    shader_reset();
}

draw_sprite(global.FourLayersDownMode ? s4LD_Logo : sGameTitle, 0, XCenter, YOffset);
YOffset += (130 + (global.FourLayersDownMode * 64));
DrawCredit(0, "DIRECTOR", "");
DrawCredit(0, "PRODUCER", "");
DrawCredit(0, "LEAD PROGRAMMER", "");
DrawCredit(0, "LEAD DESIGNER", "SpookyRick");
DrawCredit(0, "LEAD ARTIST", "");
DrawCredit(0, "LEAD WRITER", "");
DrawCredit(0, "LEAD STOOGE", "");
YOffset += 20;
DrawCredit(0, "ASSISTANT ARTISTS", "Zachary Attackary");
DrawCredit(0, "", "Wyat_t");
DrawCredit(0, "", "TheGrandestGoon");
DrawCredit(0, "", "KirboGamez");
DrawCredit(0, "", "EllisBros");
DrawCredit(0, "", "ThatGoofyGuy");
DrawCredit(0, "", "Ratto");
YOffset += 20;
DrawCredit(0, "ADDITIONAL ARTISTS", "Carmoule");
DrawCredit(0, "", "RainingKetchup");
DrawCredit(0, "", "snootilous");
DrawCredit(0, "", "Fallatious");
YOffset += 20;
DrawCredit(0, "3D MODELERS", "Marco Antonio");
DrawCredit(0, "", "Orca");
YOffset += 20;
DrawCredit(0, "POPUP CONTRIBUTORS", "Cactus Companion");
DrawCredit(0, "", "Zizou");
DrawCredit(0, "", "paige");
DrawCredit(0, "", "Zachary Attackary");
DrawCredit(0, "", "Nixliz");
DrawCredit(0, "", "z0mb3a");
DrawCredit(0, "", "KirboGamez");
DrawCredit(0, "", "G-Zone");
DrawCredit(0, "", "DizzyDitzy");
DrawCredit(0, "", "Krusha");
DrawCredit(0, "", "RainingKetchup");
DrawCredit(0, "", "ryon");
DrawCredit(0, "", "FazieFunbear");
DrawCredit(0, "", "Marco Antonio");
DrawCredit(0, "", "Wyat_t");
DrawCredit(0, "", "RedTV53");
DrawCredit(0, "", "diegoof17");
DrawCredit(0, "", "TheGrandestGoon");
DrawCredit(0, "", "ThatGoofyGuy");
DrawCredit(0, "", "SpookiVX");
YOffset += 20;
DrawCredit(0, "CODE CONTRIBUTORS", "lelo9444");
DrawCredit(0, "", "BubbledDEV");
DrawCredit(0, "", "i-win");
DrawCredit(0, "", "theWAHbox");
YOffset += 20;
DrawCredit(0, "ASSISTANT WRITERS", "Cactus Companion");
DrawCredit(0, "", "CARIO55555");
YOffset += 20;
DrawCredit(0, "ADDITIONAL WRITERS", "RedTv53");
DrawCredit(0, "", "Zachary Attackary");
DrawCredit(0, "", "Nukelear");
DrawCredit(0, "", "G-Zone");
DrawCredit(0, "", "FazieFunbear");
YOffset += 20;

for (var i = 0; i < array_length(VANames); i++)
    DrawCredit(0, (i == 0) ? "VOICE CAST" : "", VANames[i].Name);

YOffset += 20;
DrawCredit(1, "BOBBIEDOTS VOICES PROVIDED BY TheCappuccino04", "");
YOffset += 20;
DrawCredit(1, "PLAYTESTERS", "");
YOffset += 10;
DrawCredit(0, "PM.SerK", "mini_cocoa");
DrawCredit(0, "TheGrandestGoon", "EllisBros");
DrawCredit(0, "ThatGoofyGuy", "RainingKetchup");
DrawCredit(0, "theWAHbox", "Andi");
DrawCredit(0, "Zekeram12", "SpookiVX");
DrawCredit(0, "Frogger25", "Toadder25");
DrawCredit(0, "Drift", "Wyat_t");
DrawCredit(0, "Zachary Attackary", "Cactus Companion");
DrawCredit(0, "KirboGamez", "FazieFunbear");
DrawCredit(0, "Zizou", "ToasterPower777");
DrawCredit(0, "DizzyDitzy", "zombea");
DrawCredit(0, "Bananagal", "CARIO55555");
YOffset += 20;
DrawCredit(1, "MUSIC BORROWED FROM", "");
YOffset += 10;
DrawCredit(1, "The Jackbox Party Pack 8", "");
DrawCredit(1, "Revelations: Persona", "");
DrawCredit(1, "Persona 2: Innocent Sin", "");
DrawCredit(1, "Gimmick!", "");
DrawCredit(1, "Ufouria", "");
DrawCredit(1, "Journey to Silius", "");
DrawCredit(1, "Gremlins 2", "");
DrawCredit(1, "Wario World", "");
DrawCredit(1, "Freddy in Space 3: Chica in Space", "");
DrawCredit(1, "Candies 'n Curses", "");
DrawCredit(1, "Steven Universe: Save the Light", "");
DrawCredit(1, "Mario Artist: Paint Studio", "");
YOffset += 20;
DrawCredit(1, "Original music composed by RedTV53 and Scrumbo_", "");

if (FourLayersDown)
{
    YOffset += 20;
    DrawCredit(1, "\"If It's a Game\" original song and lyrics written by", "");
    DrawCredit(1, "Patrick McBride and Dana Walden", "");
    YOffset += 10;
    DrawCredit(1, "Arranged, edited and mixed by RecD", "");
    DrawCredit(1, "New lyrics by G-Zone", "");
    DrawCredit(1, "Performed by G-Zone and angelfaise", "");
}

YOffset += 20;
DrawCredit(0, "TUTORIAL SHOUTOUTS", "Sara Spalding");
DrawCredit(0, "", "Peyton Burnham");
DrawCredit(0, "", "DragoniteSpam");
YOffset += 20;
DrawCredit(0, "SPECIAL THANKS", "Secondary Zach (Wife <3)");
DrawCredit(0, "", "Dawko");
DrawCredit(0, "", "Glamrock Dusky");
DrawCredit(0, "", "the ooftroop");
DrawCredit(0, "", "The TPRR Team");
DrawCredit(0, "", "Dawko Again");
DrawCredit(0, "", "Jerrod Sorelli");
DrawCredit(0, "", "Jimmy Thatchroufe");
DrawCredit(0, "", "Murph");
DrawCredit(0, "", "Shigeru Miyamoto");
DrawCredit(0, "", "Curly, Larry & Moe");
DrawCredit(0, "", "The guy behind you right now");
YOffset += 20;
DrawCredit(1, "Sound effects sourced from FNaF series,", "");
DrawCredit(1, "freesounds.org, and zapsplat.com", "");
YOffset += 20;
DrawCredit(1, string("'{0}', '{1}' and '{2}' created by Emil Macko", anon_name(UnknownEnum.Value_44), anon_name(UnknownEnum.Value_80), anon_name(UnknownEnum.Value_176)), "");
YOffset += 10;
DrawCredit(1, string("'{0}', '{1}', '{2}'", anon_name(UnknownEnum.Value_45), anon_name(UnknownEnum.Value_137), anon_name(UnknownEnum.Value_177)), "");
DrawCredit(1, string("and '{0}' created by Kane Carter", anon_name(UnknownEnum.Value_81)), "");
YOffset += 10;
DrawCredit(1, string("'{0}' created by Nikson", anon_name(UnknownEnum.Value_85)), "");
YOffset += 10;
DrawCredit(1, string("'{0}' created by Martin Walls", anon_name(UnknownEnum.Value_82)), "");
YOffset += 10;
DrawCredit(1, string("'{0}' created by FazieFunbear", anon_name(UnknownEnum.Value_178)), "");
YOffset += 20;
DrawCredit(1, "ORIGINAL SERIES CREATED BY SCOTT CAWTHON", "");
YOffset += 30;
DrawCredit(1, "Thanks for playing!", "");

if (FourLayersDown)
{
    YOffset += 30;
    DrawCredit(1, "Rodney Redbird will return in", "");
    DrawCredit(1, "BIG BEAK BURGERS.", "");
}

if (UltimateMode)
{
    var PhotoLength = 10;
    var PhotoAmount = array_length(PhotoCaptions);
    var CreditsLength = round(YOffset - round(Frame)) + 480;
    var CreditPosition = round(CreditsLength - YOffset);
    var CreditPercent = CreditPosition / CreditsLength;
    var CreditSqueeze = 0.2;
    CreditPercent = (CreditPercent * (1 + CreditSqueeze)) - (CreditSqueeze / 2);
    show_debug_message(CreditPercent);
    CreditPercent *= (PhotoLength * PhotoAmount);
    var CurrentPhotoPosition = CreditPercent % PhotoLength;
    var CurrentPhoto = floor(CreditPercent / PhotoLength);
    
    if (CurrentPhotoPosition < 1)
        PhotoAlpha = CurrentPhotoPosition;
    else if (CurrentPhotoPosition < (PhotoLength - 1))
        PhotoAlpha = 1;
    else
        PhotoAlpha = PhotoLength - CurrentPhotoPosition;
    
    if (0 <= CurrentPhoto && CurrentPhoto < PhotoAmount)
    {
        shader_set(TransparencyShader);
        draw_set_alpha(PhotoAlpha);
        
        if (PhotoCaptions[CurrentPhoto] == "")
        {
            draw_sprite(EndingPhotos, CurrentPhoto, display_get_gui_width() * 0.75, 180);
        }
        else
        {
            if (CurrentPhoto == (PhotoAmount - 1))
                draw_sprite(EndingPhotos, CurrentPhoto + guard_id_conversion(global.Guard), display_get_gui_width() * 0.75, 148);
            else
                draw_sprite(EndingPhotos, CurrentPhoto, display_get_gui_width() * 0.75, 148);
            
            draw_set_valign(fa_middle);
            draw_set_halign(fa_center);
            draw_text_ext(display_get_gui_width() * 0.75, 318, PhotoCaptions[CurrentPhoto], 15, 306);
            shader_reset();
        }
        
        draw_set_alpha(1);
    }
}

if (FourLayersDown)
{
    var PhotoLength = 10;
    var PhotoOnscreen = 0.7;
    var PhotoAmount = 7;
    var CreditsLength = round(YOffset - round(Frame)) + 480;
    var CreditPosition = round(CreditsLength - YOffset);
    var CreditPercent = CreditPosition / CreditsLength;
    var CreditSqueeze = 0.1;
    CreditPercent = (CreditPercent * (1 + CreditSqueeze)) - (CreditSqueeze / 2);
    CreditPercent *= (PhotoLength * PhotoAmount);
    var CurrentPhotoPosition = CreditPercent % PhotoLength;
    var CurrentPhoto = floor(CreditPercent / PhotoLength);
    CurrentPhotoPosition = (PhotoLength / 2) + ((1 / PhotoOnscreen) * (CurrentPhotoPosition - (PhotoLength / 2)));
    
    if (CurrentPhotoPosition < 1)
        PhotoAlpha = CurrentPhotoPosition;
    else if (CurrentPhotoPosition < (PhotoLength - 1))
        PhotoAlpha = 1;
    else
        PhotoAlpha = PhotoLength - CurrentPhotoPosition;
    
    show_debug_message(CurrentPhotoPosition);
    
    if (0 <= CurrentPhoto && CurrentPhoto < PhotoAmount)
    {
        shader_set(TransparencyShader);
        draw_set_alpha(PhotoAlpha);
        draw_sprite(sCreditsPhotos4LD, CurrentPhoto, display_get_gui_width() * 0.25, 180);
        draw_set_alpha(1);
    }
}

MaxHeight = max(MaxHeight, abs(YOffset));

if (input_check(UnknownEnum.Value_0) && CanSkip)
{
    Frame -= 5;
    TowerPosition -= ((5 / MaxHeight) * 1.65);
}
else
{
    Frame -= (1/3);
    TowerPosition -= ((1 / (MaxHeight * 3)) * 1.65);
}

if (FourLayersDown && VoiceLineStarted && global.Music != undefined)
{
    if (!audio_is_playing(global.Music))
    {
        VoiceLineStarted = false;
    }
    else if (subtitles_enabled())
    {
        draw_set_halign(fa_center);
        draw_set_font(global.FontW97Black);
        var SubtitleText = SubtitleList[SubtitleEntry];
        
        for (var FontDirection = 0; FontDirection < 360; FontDirection += 15)
        {
            for (var FontBold = 1; FontBold <= 4; FontBold++)
                draw_text_ext(320 + round(lengthdir_x(FontBold, FontDirection)), 332 + round(lengthdir_y(FontBold, FontDirection)), SubtitleText, 15, 500);
        }
        
        draw_set_font(global.FontW97White);
        var Col = SubtitleColorList[SubtitleEntry];
        draw_text_ext_color(320, 332, SubtitleText, 15, 500, Col, Col, Col, Col, 1);
        var SubtitleEndpoint = 999;
        
        if (SubtitleEntry < (array_length(SubtitleTimingList) - 1))
            SubtitleEndpoint = SubtitleTimingList[SubtitleEntry + 1];
        
        if (audio_sound_get_track_position(global.Music) > SubtitleEndpoint)
            SubtitleEntry++;
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(global.FontW97Black);
    }
}

if (YOffset <= 0 && !instance_exists(oResultsWindow))
{
    if (instance_exists(oExtras_Credits) && !oExtras_Credits.Transitioning)
    {
        with (oExtras_Credits)
            transition_out_of_credits();
    }
    else if (!instance_exists(oExtras_Credits))
    {
        room_goto(FourLayersDown ? EndingPhoto_4LD : RunResults);
    }
}

surface_reset_target();

enum UnknownEnum
{
    Value_0,
    Value_44 = 44,
    Value_45,
    Value_80 = 80,
    Value_81,
    Value_82,
    Value_85 = 85,
    Value_137 = 137,
    Value_176 = 176,
    Value_177,
    Value_178
}
