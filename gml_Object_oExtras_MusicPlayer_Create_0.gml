function has(arg0)
{
    if (!is_array(arg0))
        return global.UnlockedAnimatronics[arg0];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (!global.UnlockedAnimatronics[arg0[i]])
            return false;
    }
    
    return true;
}

StreamedList = [];
MusicList = [];

function append_custom_music()
{
    get_folders("addons");
    var CustomMusic = [];
    
    for (var i = 4; i < array_length(global.GuardNames); i++)
    {
        CustomMusic = get_guard_music_player(get_guard_property("music_player", [], i), i);
        
        for (var j = 0; j < array_length(CustomMusic); j++)
        {
            array_push(MusicList, CustomMusic[j]);
            array_push(StreamedList, CustomMusic[j].File);
        }
    }
}

MusicList = [
{
    Name: "",
    File: sfxNOTHING,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "",
    OrgGame: ""
}, 
{
    Name: "Title Theme",
    File: musTitleScreen,
    Unlocked: true,
    Loop: true,
    BPM: 95,
    OrgName: "Weapons Drawn: Lobby",
    OrgGame: "Jackbox Party Pack 8"
}, 
{
    Name: "Guard Introduction",
    File: musGuardOpening,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "Weapons Drawn: Guest Introduction",
    OrgGame: "Jackbox Party Pack 8"
}, 
{
    Name: "Night 1",
    File: musNight1,
    Unlocked: true,
    Loop: true,
    BPM: 100,
    OrgName: "Mark's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Night 2",
    File: musNight2,
    Unlocked: true,
    Loop: true,
    BPM: 80,
    OrgName: "Black Market",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Night 3",
    File: musNight3,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "City 1 - School Revisited",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Night 4",
    File: musNight4,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "City 1 - Post Disaster",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Night 5",
    File: musNight5,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "Elly's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Night 6",
    File: musNight6,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_167],
    Loop: true,
    BPM: 125,
    OrgName: "Kama Palace",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Game Over",
    File: sfxWarioLose,
    Unlocked: true,
    Loop: false,
    BPM: 120,
    OrgName: "Game Over",
    OrgGame: "WarioWare: Smooth Moves"
}, 
{
    Name: "6:00 AM",
    File: sfxWarioWin,
    Unlocked: true,
    Loop: false,
    BPM: 120,
    OrgName: "Stage Clear",
    OrgGame: "Wario World"
}, 
{
    Name: "6:00 AM (Night 5)",
    File: sfxWarioWinDeluxe,
    Unlocked: true,
    Loop: false,
    BPM: 120,
    OrgName: "Gold Statue Complete",
    OrgGame: "Wario World"
}, 
{
    Name: "6:00 AM (Night 6)",
    File: sfxWarioWinUltimate,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_167],
    Loop: false,
    BPM: 120,
    OrgName: "Best Ending",
    OrgGame: "Wario World"
}, 
{
    Name: "The Boss's Theme",
    File: musMidnight_TheBoss,
    Unlocked: true,
    Loop: true,
    BPM: 80,
    OrgName: "97 115 99 105 105 10",
    OrgGame: "Freddy in Space 3: Chica in Space"
}, 
{
    Name: "Michael's Theme",
    File: musMidnight_Michael,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_163],
    Loop: true,
    BPM: 70,
    OrgName: "A Wheel of Shadows",
    OrgGame: "Freddy in Space 3: Chica in Space"
}, 
{
    Name: "Vanny's Theme",
    File: musMidnight_Vanny,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_158],
    Loop: true,
    BPM: 46.666666666666664,
    OrgName: "Melting Time Cells",
    OrgGame: "Freddy in Space 3: Chica in Space"
}, 
{
    Name: "Argument Theme",
    File: musMidnight_MissingChild,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_156],
    Loop: true,
    BPM: 70,
    OrgName: "The End of the Tunnel",
    OrgGame: "Freddy in Space 3: Chica in Space"
}, 
{
    Name: "MCI Story",
    File: mus_MCICutscene,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_156],
    Loop: true,
    BPM: 65,
    OrgName: "Dungeon - Ruins",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Salvage Location Opening",
    File: sfxAntonballIntermission,
    Unlocked: true,
    Loop: false,
    BPM: 240,
    OrgName: "Intermissionary",
    OrgGame: "Antonball Deluxe"
}, 
{
    Name: "Salvage Location 1",
    File: musMinigameA,
    Unlocked: true,
    Loop: true,
    BPM: 134,
    OrgName: "Cadbury",
    OrgGame: "Gimmick!"
}, 
{
    Name: "Salvage Location 2",
    File: musMinigameB,
    Unlocked: true,
    Loop: true,
    BPM: 129,
    OrgName: "Lion Heart",
    OrgGame: "Gimmick!"
}, 
{
    Name: "Salvage Location 3",
    File: musMinigameC,
    Unlocked: true,
    Loop: true,
    BPM: 113,
    OrgName: "Hebe in the Cold Area",
    OrgGame: "Ufouria: The Saga"
}, 
{
    Name: "Salvage Location 4",
    File: musMinigameD,
    Unlocked: true,
    Loop: true,
    BPM: 113,
    OrgName: "Stage 2",
    OrgGame: "Journey to Silius"
}, 
{
    Name: "Salvage Location 5",
    File: musMinigameE,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_167],
    Loop: true,
    BPM: 129,
    OrgName: "Ventilation Shaft",
    OrgGame: "Gremlins 2 (NES)"
}, 
{
    Name: "Upgrade Cadet Story",
    File: mus_CandyCadetStory,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_130],
    Loop: true,
    BPM: 150,
    OrgName: "Stage 1 (Medieval)",
    OrgGame: "Bill & Ted's Excellent Adventure (NES)"
}, 
{
    Name: "Music Man's Theme",
    File: musMusicMan,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_31],
    Loop: true,
    BPM: 126,
    OrgName: "Shake That Thing",
    OrgGame: "The Legend of White Whale"
}, 
{
    Name: "LolzHax's Theme",
    File: mus_LolzHax,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_39],
    Loop: false,
    BPM: 190,
    OrgName: "Fine Dierum",
    OrgGame: "Freddy in Space 2"
}, 
{
    Name: "Animdude's Theme",
    File: mus_Animdude,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_41],
    Loop: true,
    BPM: 170,
    OrgName: "Hi-Speed Berliner",
    OrgGame: "There Is No Pause Button!!"
}, 
{
    Name: "Foxy.EXE's Theme",
    File: sfxFoxyEXECountdown,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_89],
    Loop: true,
    BPM: 300,
    OrgName: "Drowning (Composed by RedTv53)",
    OrgGame: "Five Nights at Frickbear's 3"
}, 
{
    Name: "Nightmare: Opening",
    File: mus_BossNightmare_Cutscene,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 78,
    OrgName: "Intro",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: First Stage",
    File: mus_BossNightmare_Opening,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 87,
    OrgName: "Silence",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: Battle (Game)",
    File: mus_BossNightmare_MainAlt,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 180,
    OrgName: "Boss (Curse Crusher Mode)",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: Battle (Office)",
    File: mus_BossNightmare_Main,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 180,
    OrgName: "Boss",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: Final Phase (Game)",
    File: mus_BossNightmare_FinalAlt,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 180,
    OrgName: "Final Boss (Curse Crusher Mode)",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: Final Phase (Office)",
    File: mus_BossNightmare_Final,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 180,
    OrgName: "Final Boss",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Nightmare: Ending",
    File: mus_BossNightmare_Ending,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_121],
    Loop: true,
    BPM: 70,
    OrgName: "Ending",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Salvage: Opening",
    File: mus_BossSalvage_Opening,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_120],
    Loop: false,
    BPM: 120,
    OrgName: "Day Dream 2 + Day Dream 1",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Salvage: Battle",
    File: mus_BossSalvage,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_120],
    Loop: true,
    BPM: 145,
    OrgName: "Battle",
    OrgGame: "Persona 2: Innocent Sin"
}, 
{
    Name: "Fredbear: Opening",
    File: musFredbearIntro,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_126],
    Loop: true,
    BPM: 55,
    OrgName: "Hessonite's Theme",
    OrgGame: "Steven Universe: Save the Light"
}, 
{
    Name: "Fredbear: Battle",
    File: mus_BossFredbear,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_126],
    Loop: true,
    BPM: 130,
    OrgName: "2MUCH2BEAR (Composed by RedTV53)",
    OrgGame: "Five Nights at Frickbear's 3"
}, 
{
    Name: "Cassidy's Theme",
    File: mus_Cassidy,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_156],
    Loop: true,
    BPM: 65,
    OrgName: "Battle - Queen of the Night",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "End Credits",
    File: musCredits,
    Unlocked: true,
    Loop: false,
    BPM: 125,
    OrgName: "Weapons Drawn - Credits",
    OrgGame: "Jackbox Party Pack 8"
}, 
{
    Name: "Custom Night Menu",
    File: musCustomNight,
    Unlocked: true,
    Loop: true,
    BPM: 98,
    OrgName: "Main",
    OrgGame: "Candies n' Curses"
}, 
{
    Name: "Custom Night A",
    File: musNightCustom1,
    Unlocked: true,
    Loop: true,
    BPM: 97,
    OrgName: "1st & 2nd Ward Shopping District",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Custom Night B",
    File: musNightCustom2,
    Unlocked: true,
    Loop: true,
    BPM: 110,
    OrgName: "Nemesis Tower",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Custom Night C",
    File: musNightCustom3,
    Unlocked: true,
    Loop: true,
    BPM: 125,
    OrgName: "Abandoned Factory Underground",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Custom Night D",
    File: musNightCustom4,
    Unlocked: true,
    Loop: true,
    BPM: 144,
    OrgName: "City 2",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Custom Night E",
    File: musNightCustom5,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "Theme of Kandori - Pathos",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Custom Night F",
    File: musNightCustom6,
    Unlocked: true,
    Loop: true,
    BPM: 120,
    OrgName: "Encounter With Pandora",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Chica's Magic Rainbow Challenge",
    File: mus_CMRChallenge,
    Unlocked: global.ClearedChallenges[UnknownEnum.Value_19] > 0,
    Loop: true,
    BPM: 166,
    OrgName: "UN Owen Was Her (MIDI Cover)",
    OrgGame: "Touhou 6: Embodiment of Scarlet Devil"
}, 
{
    Name: "Extras Menu",
    File: musExtras,
    Unlocked: true,
    Loop: true,
    BPM: 75,
    OrgName: "Jellyfish",
    OrgGame: "Mario Artist: Paint Studio"
}, 
{
    Name: "Four Layers Down: Opening",
    File: mus_4LDOpening,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: true,
    BPM: 54,
    OrgName: "Weapons Drawn - Menu",
    OrgGame: "Jackbox Party Pack 8"
}, 
{
    Name: "Four Layers Down: Title",
    File: mus_4LDTitle,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: false,
    BPM: 90,
    OrgName: "Weapons Drawn - Final Scores",
    OrgGame: "Jackbox Party Pack 8"
}, 
{
    Name: "Four Layers Down: Guard Select",
    File: mus_EndlessSelectNEW,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: true,
    BPM: 96,
    OrgName: "2chill2care (Composed by RedTV53)",
    OrgGame: "Five Nights at Frickbear's 3"
}, 
{
    Name: "Four Layers Down: Animatronic Select",
    File: mus_EndlessSelect,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: true,
    BPM: 144,
    OrgName: "City 2 (Another Version)",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Four Layers Down: Victory",
    File: musEndlessWin,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: true,
    BPM: 110,
    OrgName: "1st Ward Shopping District (East Entrance)",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Basic",
    File: musShop_Basic,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_131],
    Loop: true,
    BPM: 96,
    OrgName: "City 1 Tranquility",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Cool",
    File: musShop_Cool,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_132],
    Loop: true,
    BPM: 125,
    OrgName: "Ayase's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Relaxing",
    File: musShop_Chill,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_133],
    Loop: true,
    BPM: 70,
    OrgName: "Maki's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Seedy",
    File: musShop_Seedy,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_135],
    Loop: true,
    BPM: 96,
    OrgName: "Nanjo's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Creepy",
    File: musShop_Creepy,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_138],
    Loop: true,
    BPM: 57,
    OrgName: "Aki's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Shop: Carnie Challenge",
    File: mus_Carnie,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_140],
    Loop: true,
    BPM: 50,
    OrgName: "Doomsday Ride",
    OrgGame: "Five Nights at Freddy's: Help Wanted 2"
}, 
{
    Name: "Eleanor Night",
    File: musNightEleanor,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_138],
    Loop: true,
    BPM: 120,
    OrgName: "Reiji's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Phony Boss",
    File: mus_BossPhony,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_127],
    Loop: false,
    BPM: 150,
    OrgName: "CACO_PHONY (Composed by RedTV53)",
    OrgGame: "Five Nights at Frickbear's 3"
}, 
{
    Name: "Angel's Sanctum",
    File: mus_AngelsSanctum,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    Loop: true,
    BPM: 30,
    OrgName: "Bar Attacked by Harem Queen",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "The Angel's Theme",
    File: mus_Angel,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_179],
    Loop: true,
    BPM: 120,
    OrgName: "Saeko-Sensei's Theme",
    OrgGame: "Revelations: Persona"
}, 
{
    Name: "Four Layers Down: Credits",
    File: mus_Credits4LD,
    Unlocked: global.UnlockedAnimatronics[UnknownEnum.Value_179],
    Loop: false,
    BPM: 108,
    OrgName: "If It's a Game (Cover by G-Zone & Co.)",
    OrgGame: "The PAC-MAN Album"
}, 
{
    Name: "Mod Menu",
    File: mus_ModMenu,
    Unlocked: true,
    Loop: true,
    BPM: 108,
    OrgName: "Shops",
    OrgGame: "Persona (PSP)"
}, 
{
    Name: "100% Completion Reward",
    File: mus_MyWay,
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_42] || global.DevMode,
    Loop: true,
    BPM: 77,
    OrgName: "My Way (The Boss' Rendition)",
    OrgGame: "Frank Sinatra"
}];
Selected = 0;
OptionsSurf = -1;
ScrollOffset = 0;
ScrollClicked = false;
SavedGain = 1;
MusicPlaying = sfxNOTHING;

function switch_page(arg0)
{
    audio_sound_gain(MusicList[Selected].File, SavedGain, 0);
    Selected = arg0;
    SavedGain = audio_sound_get_gain(MusicList[Selected].File);
    audio_sound_gain(MusicList[Selected].File, 1, 0);
    
    if (audio_is_playing(MusicPlaying))
        audio_stop_sound(MusicPlaying);
    
    MusicPlaying = audio_play_sound(MusicList[arg0].File, 5, false);
    DanceFrame = 0;
    FredSquishSpeed = -0.1;
    Grooving = true;
}

Active = true;
MenuOffset = -224;
Loop = false;
DanceFrame = 0;
FredSquish = 1;
FredSquishSpeed = 0;

with (oLoopingMusicPlayer)
    audio_sound_gain(MusicPlaying, 0, 1000);

Grooving = false;
append_custom_music();
show_debug_message(global.GuardNames);

enum UnknownEnum
{
    Value_19 = 19,
    Value_31 = 31,
    Value_39 = 39,
    Value_41 = 41,
    Value_42,
    Value_47 = 47,
    Value_89 = 89,
    Value_120 = 120,
    Value_121,
    Value_126 = 126,
    Value_127,
    Value_130 = 130,
    Value_131,
    Value_132,
    Value_133,
    Value_135 = 135,
    Value_138 = 138,
    Value_140 = 140,
    Value_156 = 156,
    Value_158 = 158,
    Value_163 = 163,
    Value_167 = 167,
    Value_179 = 179
}
