if (!global.CamUp && Text != "Heater (HOLD)")
    exit;

var Clicked = (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left)) && global.CamUp;

if (Clicked)
    image_index = 1;
else
    image_index = 0;

var MusicButtonVisible = (global.Cam == UnknownEnum.Value_6 && character_active(UnknownEnum.Value_16)) && global.MonitorSystem == "Cameras";
var ShockButtonVisible = ((global.Cam == UnknownEnum.Value_8 && character_active(UnknownEnum.Value_35)) || (character_active(UnknownEnum.Value_43) || instance_exists(oMicrogame_Sparky)) || instance_exists(oFredbearAttack_PowerOut) || character_active(UnknownEnum.Value_71) || (character_active(UnknownEnum.Value_45) && (global.Cam == UnknownEnum.Value_2 || global.Cam == UnknownEnum.Value_3 || global.Cam == UnknownEnum.Value_7 || global.Cam == UnknownEnum.Value_8)) || (instance_exists(oSalvage) && (global.Cam == UnknownEnum.Value_6 || global.Cam == UnknownEnum.Value_3 || global.Cam == UnknownEnum.Value_7 || global.Cam == UnknownEnum.Value_8))) && global.MonitorSystem == "Cameras";
var WiringButtonAvailable = character_active(UnknownEnum.Value_56) && global.MonitorSystem == "Cameras" && global.Cam == oElectrobab.TargetCam && oElectrobab.WiresToSolve > 0;

if (Text == "Reset Music")
{
    if (MusicButtonVisible)
        y = BaseY;
    else
        y = BaseY + 360;
    
    if (Clicked)
    {
        with (oMarionette)
        {
            if (MusicTimer <= 10)
                fuzz_up(UnknownEnum.Value_6);
            
            MusicTimer = MusicMax;
        }
        
        audio_play_sound(sfxClick, 10, false);
    }
}

if (Text == "Heater (HOLD)")
{
    if (Clicked)
    {
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxHeater, 3, true);
        global.Heater = true;
    }
    
    image_index = global.Heater;
    
    if (!(place_meeting(x, y, oMouseHitbox) && mouse_check_button(mb_left) && global.CamUp))
    {
        audio_stop_sound(sfxHeater);
        global.Heater = false;
    }
    
    if (global.Heater)
        global.Temperature += ((HeaterSpeed * 2) / 60);
    
    if (global.MonitorSystem == "Vents")
        y = BaseY;
    else
        y = BaseY + 360;
}

if (Text == "Repair Wiring")
{
    if (!WiringButtonAvailable)
    {
        y = BaseY + 360;
    }
    else
    {
        y = BaseY;
        x = BaseX + (119 * (ShockButtonVisible + MusicButtonVisible));
        image_index = oElectrobab.PanelOpen;
        
        if (image_index == 0 && Clicked)
        {
            oElectrobab.PanelOpen = true;
            audio_play_sound(oElectrobab.SOUND_Open, 5, false);
        }
    }
}

if (Text == "Controlled Shock")
{
    if (ShockButtonVisible)
        y = BaseY;
    else
        y = BaseY + 360;
    
    if (MusicButtonVisible)
        x = BaseX + 115 + 4;
    else
        x = BaseX;
    
    var CanZapBaby = false;
    var CanZapSparky = false;
    var CanZapPopgoes = false;
    var CanZapSalvage = false;
    var CanZapFredbear = false;
    var CanZapMXES = false;
    
    if (instance_exists(oScrapBaby) && oScrapBaby.Active && global.Cam == UnknownEnum.Value_8 && oScrapBaby.ShockTimer <= 0)
        CanZapBaby = true;
    
    if (instance_exists(oSparky) && global.Cam == oSparky.CurrentCam && oSparky.Active)
        CanZapSparky = true;
    
    if (instance_exists(oPopgoes) && global.Cam == oPopgoes.CurrentCam && oPopgoes.Active)
        CanZapPopgoes = true;
    
    if (instance_exists(oSalvage) && (global.Cam == oSalvage.SiphonCam || (array_contains([UnknownEnum.Value_3, UnknownEnum.Value_6, UnknownEnum.Value_7, UnknownEnum.Value_8], oSalvage.CurrentCam) && global.Cam == oSalvage.CurrentCam)))
        CanZapSalvage = true;
    
    if (instance_exists(oFredbearAttack_PowerOut) && global.Cam == oFredbearAttack_PowerOut.CurrentCam && oFredbearAttack_PowerOut.Active)
        CanZapFredbear = true;
    
    if (instance_exists(oMXES) && global.Cam == oMXES.InfectedCamera)
        CanZapMXES = true;
    
    var ZapAvailable = CanZapBaby || CanZapSparky || CanZapPopgoes || CanZapSalvage || CanZapFredbear || CanZapMXES;
    
    if (!ZapAvailable)
        image_index = 1;
    
    if (Clicked)
    {
        if (ZapAvailable)
        {
            audio_play_sound(sfxClick, 10, false);
            audio_play_sound(sfxZap, 25, false);
        }
        
        if (CanZapBaby)
        {
            with (oScrapBaby)
            {
                ShockTimer = 3;
                Timer = 0;
                RandomValue = random_range(0.8, 1.2);
                block_tokens();
            }
        }
        
        if (CanZapSparky)
        {
            with (oSparky)
            {
                audio_play_sound(oSparky.SOUND_Zapped, 10, false);
                ShockTimer = 3;
                ShakeSpeed = 180;
                KillTimer = 999;
                block_tokens();
            }
        }
        
        if (CanZapPopgoes)
        {
            with (oPopgoes)
            {
                ShockTimer = 3;
                PreviousTargetCam = TargetCam;
                block_tokens();
            }
        }
        
        if (CanZapMXES)
        {
            with (oMXES)
            {
                zap_behavior();
                block_tokens();
            }
        }
        
        if (CanZapSalvage)
        {
            with (oSalvage)
                when_zapped();
        }
        
        if (CanZapFredbear)
        {
            with (oFredbearAttack_PowerOut)
                zap_behavior();
        }
        
        if (!ZapAvailable)
            audio_play_sound(sfxError, 10, false);
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_6 = 6,
    Value_7,
    Value_8,
    Value_16 = 16,
    Value_35 = 35,
    Value_43 = 43,
    Value_45 = 45,
    Value_56 = 56,
    Value_71 = 71
}
