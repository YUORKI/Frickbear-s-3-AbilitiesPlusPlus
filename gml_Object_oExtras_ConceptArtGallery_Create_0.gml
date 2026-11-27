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

CurrentMode = 0;
ConceptArt = [];
array_push(ConceptArt, 
{
    Image: sNOTHING,
    Name: "",
    Description: "",
    Unlocked: false,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyMechanics,
    Name: "Early Concepts - Mechanics",
    Description: "The original ideas for the game's animatronic roster and their mechanics before it took a pretty drastic shift in direction. This is some of the first concept art ever drawn up for the game, dating back to around 2022! You can tell because the designs here are much more inline with Frickbear's 2's art style.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyMockup,
    Name: "Early Concepts - Dayshift Mockup",
    Description: "Early mockup for the more Pizzeria Simulator-inspired original vision for the game.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyOverworldSprites,
    Name: "Early Concepts - Dayshift Sprites",
    Description: "Early theoretical overworld sprites for the player character. Originally, your character's face would change depending on your morality.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyTalksprites,
    Name: "Early Concepts - Talksprites",
    Description: "Despite the complete shift in direction after these sprites were made, three of these guys actually wound up sticking around as major characters all the way into the final game! Michael's design went pretty much unchanged, although you can probably notice how much Vanny and Vanessa's changed.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_OldArseScreenshot,
    Name: "Early Concepts - Earliest Screenshot",
    Description: "The earliest known screenshot of the game! Fun fact: The Withered Freddy sprite here was the single oldest asset in the game before it was replaced a mere two weeks before the game's release.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyAnimatronicDesigns,
    Name: "Early Animatronic Designs",
    Description: "These designs date all the way back to 2022! They were originally going to be the basis for this game's animatronics, before they got completely redone in mid-2024. Even if the game was being prototyped in 2022, that point in 2024 was when it REALLY started development.\n\nDrawn by SpookyRick",
    Unlocked: has(UnknownEnum.Value_4),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_OldJumpscares,
    Name: "Early Jumpscare Sprites",
    Description: "SUPER early jumpscare sprites based on the pre-redesign animatronic designs. I only wound up finishing these eight before the stylistic shift occured.\n\nDrawn by SpookyRick",
    Unlocked: has([UnknownEnum.Value_5, UnknownEnum.Value_8, UnknownEnum.Value_9]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BuildingMapEARLY,
    Name: "Building - Early Map",
    Description: "VERY early sketch of the map layout, back when the game was envisioned as more of a Pizzeria Simulator-type game.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BuildingMap,
    Name: "Building - Later Map",
    Description: "The map was pretty much finalized by the third sketch, although the version ingame still saw some small changes to make the camera views more readable.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BuildingExterior,
    Name: "Building - Exterior",
    Description: "The design for the pizzeria in the final game actually wound up being almost 1-to-1 with the concept art, which the exception of the awning which was left out so the sign would be more visisble.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Showstage,
    Name: "Building - Showstage",
    Description: "Sketch for the original layout of the showroom when I was still in the process of modelling it.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_OutsideBuilding,
    Name: "Title Screen Character Concepts",
    Description: "Even though the idea of adding characters to the title screen as you beat the different endings was one we had in mind since super early on in development, the idea wasn't actually implemented until the very last week of development!\n\nDrawn by Cactus Companion.",
    Unlocked: has(UnknownEnum.Value_156),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_CactusGuards,
    Name: "Guards - Early Concepts",
    Description: "Some of the first concepts for the playable guards drawn by Cactus and based on some vague descriptions of what I had in mind for them. These were actually made before Vanessa was even planned for the game.\n\nDrawn by Cactus Companion.",
    Unlocked: has([UnknownEnum.Value_159, UnknownEnum.Value_160, UnknownEnum.Value_161, UnknownEnum.Value_162]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Guards,
    Name: "Guards - Second Pass",
    Description: "And here are my own initial sketches for the four guards! These are a lot closer to the finalized designs.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_159, UnknownEnum.Value_160, UnknownEnum.Value_161, UnknownEnum.Value_162]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BonusNightguards,
    Name: "Guards - Extra Characters",
    Description: "A few other contenders for playable night guards were conceptualized before we settled on the four we have now.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_159, UnknownEnum.Value_160, UnknownEnum.Value_161, UnknownEnum.Value_162]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_GuardExpressions,
    Name: "Guards - Scrapped Expressions",
    Description: "Guards were going to have different expressions based on how intense of a situation they were in. This idea wasn't fully realized since it would've required programming a complex panic meter system, but each guard does still have a special \"scared\" sprite used during boss fights.",
    Unlocked: has([UnknownEnum.Value_161, UnknownEnum.Value_120]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_ClarkFixyOriginal,
    Name: "Clark Fixy - Initial Design",
    Description: "The original design for Clark Fixy, a character who doesn't actually appear in the flesh anywhere in the game, but Cactus had an attatchment to and wanted to design for fun. This version of him does technically appear in the form of a signature on his employee memos.\n\nDrawn by Cactus Companion.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_ClarkFixyZached,
    Name: "Clark Fixy - Zached Design",
    Description: "A redesigned human Clark Fixy more consistent with the other human characters in the game.\n\nDrawn by Zachary Attackary.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_ClarkColored,
    Name: "Clark Fixy - Finalized Design",
    Description: "The third and final pass of the Clark Fixy design.\n\nDrawn by Cactus Companion.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredsweeperFrank,
    Name: "Fredsweeper Frank - Zached Design",
    Description: "Another hypothetical design for a character who only appears through memos in the final game! ...Or does he?\n\nDrawn by Zachary Attackary.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_GuardsRepo,
    Name: "Guard Multiplayer Game Concept 1",
    Description: "Concept art for a REPO-style game starring the Frickbear's guards conceptualized by Cactus. These were made primarily for fun; I don't think we were intending to actually turn these into a full game at any point in this game's development.\n\nDrawn by Cactus Companion.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_GuardsRepo2,
    Name: "Guard Multiplayer Game Concept 2",
    Description: "From right to left, the characters here are meant to be Joe Guard (the scrapped player character from this game's earlier iterations), Fredsweeper Frank, Clark Fixy, and the dishwasher lady William makes reference to in one of the William's Woods memos.\n\nDrawn by Cactus Companion.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MichaelEarly2,
    Name: "Michael - Early Concepts",
    Description: "Some early drawings of Michael's design. Surprisingly, he didn't change much between this and his final version.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_121),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MichaelEarly1,
    Name: "Michael - More Concepts",
    Description: "While Michael's corpse design went pretty much completely unchanged since its conception, his living design wound up getting repurposed as the base for Mike Schmidt.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_121),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_GoodEndscreen,
    Name: "Good Route - Early Endscreen",
    Description: "Original concept for the good route's endscreen. The final version is basically the same general idea, just presented a bit differently.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_121),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Nightmares,
    Name: "Good Route - Nightmares",
    Description: "Before their more plushie-esque designs were decided on, the Nightmares were originally going to look a bit closer to their orignial counterparts.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_121),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass1,
    Name: "'Vannabelle' - First Pass",
    Description: "While at first Vanny was never intended to be seen maskless ingame, this drawing eventually made me change my mind and sneak her into the evil route's endscreen. Her design changed quite a bit before that point though, as you'll see in the next couple images.\n\nDrawn by KaiTheGuy123.",
    Unlocked: has(UnknownEnum.Value_158),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass2,
    Name: "'Vannabelle' - Second Pass",
    Description: "Zach's take on the unmasked Vanny design! This one was meant to be a lot more inline with the general design philosophy for this game's human characters - namely implementing more elements from Vanny's masked self into her unmasked self.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_158),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass3,
    Name: "'Vannabelle' - Third Pass",
    Description: "Finally, my own take! This is the version of the design that wound up appearing in the endscreen.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_158),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass4,
    Name: "'Vannabelle' - Final Pass",
    Description: "One more just for good measure.\n\nDrawn by KaiTheGuy123.",
    Unlocked: global.ClearedEndings[3][UnknownEnum.Value_3] > 0,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_EvilEndscreen,
    Name: "Evil Route - Early Endscreen",
    Description: "Originally, my idea was that the evil route would end with your player character being possessed by Afton and taking over from Vanny after her death, although I eventually went with a different idea. This sketch is a remnant of that original ending.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_158),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_SalvageOLD,
    Name: "Evil Route - Early Salvage",
    Description: "Salvage was always envisioned as a fusion between the four scrap animatronics with a cool cloak, although it took a while for me to settle on a design I was happy with.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_120),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Salvage,
    Name: "Evil Route - Finalized Salvage",
    Description: "These sketches came quite a while later, and at this point I finally had a vision for Salvage's fight I was happy with. Originally you were going to be able to punch him in the face, though this idea never wound up getting used.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_120),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_WilliamOLD,
    Name: "William Afton - OLD Concept",
    Description: "The first sketch for what a hypothetical Frickbear's William Afton could have looked like.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_167]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_William,
    Name: "William Afton - Early Concepts",
    Description: "A couple ideas for what Frickbear's William Afton could have looked like that were ran through before we ultimately settled on one.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_167]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HenryWilliam2,
    Name: "Henry & William",
    Description: "Hypothetical Frickbear's designs for Henry Emily and William Afton. These two designs do both technically appear in the final game, but to a much smaller extent than originally planned.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_167]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HenryWilliam,
    Name: "Henry & William - Photograph",
    Description: "Sketch for a photo that was going to appear alongside the newspaper in the first salvage location.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_167]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Henry_ImOld,
    Name: "Henry - Old",
    Description: "Sketch of what Henry would've probably looked like shortly before the events of the game.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_120, UnknownEnum.Value_121, UnknownEnum.Value_167]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MCMPaper,
    Name: "Scrapped MCM Page",
    Description: "There was originally going to be an additional document found in the Talbert Files referencing MCM, serving as really the only acknowledgement of Secret of the Mimic in the entire game...but then we realized this would be a pretty huge superfluous piece of the FNaF lore to drop at the very end of the game, so it wasn't included in the final game.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_156),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MCI,
    Name: "Missing Children",
    Description: "None of the missing children (with the sole exception of Susie) had any kind of firm design right up until they needed to be given them for the Talbert Files scene.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_156),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Charlie,
    Name: "Charlie",
    Description: "Charlie was actually a very last-minute addition to the game - her design, extras menu page and the little scene involving her were all only finished within the last month of development! This sketch, however, dates back quite a bit further than that.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_157),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearEarly,
    Name: "Fredbear - Early Sketches",
    Description: "It took a while before I settled on a Fredbear design I was happy with; I always knew I wanted him to feel as Off as possible, but I wasn't quite sure how I'd convey that just yet.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearFinalized,
    Name: "Fredbear - Final Sketch",
    Description: "At this point Fredbear's design was pretty much 100% finalized, to the point that this very sketch was the primary reference used when making the model. He's still a little off, but looks way more grounded in reality now. (Arguably, being grounded in reality still makes him look off when everyone else is so cartoony.)\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearStuff2,
    Name: "Fredbear - Misc. Concepts 1",
    Description: "Various concepts for the transition screen during the first part of Fredbear's boss fight.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearStuff1,
    Name: "Fredbear - Misc. Concepts 2",
    Description: "Various concepts for his attacks during the final portion of the boss fight.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment1,
    Name: "Fredbear - Model Development 1",
    Description: "Every self-respecting FNaF fangame extras menu has a model progress section.\n\nModelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment2,
    Name: "Fredbear - Model Development 2",
    Description: "Modelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment3,
    Name: "Fredbear - Model Development 3",
    Description: "Modelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment4,
    Name: "Fredbear - Model Development 4",
    Description: "Modelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment5,
    Name: "Fredbear - Model Development 5",
    Description: "Modelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment6,
    Name: "Fredbear - Model Development 6",
    Description: "Spooky!\n\nModelled by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearAds,
    Name: "Fredbear - Popups",
    Description: "Fredbear's popups were more intended to be reminiscent of those you'd see a malicious computer virus produce, compared to Helpy's which are just basic popup ads.\n\n1-6 made by Cactus Companion. 7 made by SpookyRick. 8 made by RainingKetchup. 9 made by Zachary Attackary. 10 made by FazieFunbear. 11-12 made by Wyat_t. 13 made by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FredbearGameOver,
    Name: "Fredbear - Game Over Screen",
    Description: "I thought the juxtaposition between the realistic implied gore and the goofy \"Oops!\" in big stupid red text would be really funny.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Buddies,
    Name: "Fredbear - Buddies",
    Description: "It's probably pretty obvious but FNAF 1 Remake was actually a huge inspiration for the visual direction for Fredbear!\n\nDrawn by Marco Antonio.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_SpringBonnieFinalized,
    Name: "Spring Bonnie",
    Description: "At one point, Fredbear was meant to come alongside a matching Spring Bonnie in his boss fight, although this was ultimately scrapped - mainly because we couldn't find enough for Spring Bonnie to do to justify a whole extra model to be made.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_PhonyBoss1,
    Name: "Phony Boss - Original Sketch",
    Description: "The design made for RedTV and Ellis' original pitch to include Phony Boss in the game.\n\nDrawn by EllisBros.",
    Unlocked: has(UnknownEnum.Value_127),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PhonyBoss2,
    Name: "Phony Boss - More",
    Description: "Drawn by ThatGoofyGuy.",
    Unlocked: has(UnknownEnum.Value_127),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PhonyPopups,
    Name: "Phony Boss - Popups",
    Description: "Drawn by Marco Antonio, ThatGoofyGuy, EllisBros, Diego, Wyat_t, Zachary Attackary, RedTv53, SpookiVX, Kirbo, TheGrandestGoon & z0mb3a.",
    Unlocked: has(UnknownEnum.Value_127),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FreddyFazbear,
    Name: "Misc - Freddy Fazbear",
    Description: "If Freddy Fazbear was in the game he'd probably look like this.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_0),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FoxyRun,
    Name: "Misc - Scrapped Foxy Run",
    Description: "Foxy WAS supposed to have a running animation at one point, although we quickly realized this would be a lot of work for something players would basically never get to see.\n\nAnimated by Wyat_t.",
    Unlocked: has(UnknownEnum.Value_3),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HelpyAds,
    Name: "Misc - Helpy Ads",
    Description: "1-5 made by SpookyRick. 6-11 made by Cactus Companion. 12-13 made by Zizou. 14 made by paige. 15-18 made by Zachary Attackary. 19-20 made by Ryon. 21-24 made by Krusha. 25 made by nixliz. 26-28 made by zombea. 29 made by DizzyDitzy. 30 made by FazieFunbear. 31 made by Marco Antonio. 32 made by RainingKetchup. 33-34 made by Kirbo. 35 made by G-Zone.",
    Unlocked: has(UnknownEnum.Value_30),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HelpyAdsOLD,
    Name: "Misc - Early Helpy Ads",
    Description: "Only one of these wound up making it into the game unchanged.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_30),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HelpyUnusedRender,
    Name: "Misc - Early Helpy Render",
    Description: "A scrapped version of Helpy's extras menu render, featuring a different pose.\n\nModelled by Orca.",
    Unlocked: has(UnknownEnum.Value_30),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MusicManMinigame,
    Name: "Misc - Music Man Minigame Concept",
    Description: "A couple minigame ideas were tossed around beyond the ones that made it into the final game - one of these was a Music Man-themed rhythm game.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_31),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MusicManiac,
    Name: "Misc - Music Maniac",
    Description: "The scrapped concept of a Music Man minigame WAS actually going to be reimplemented in 4LD - though, tragically, I realized a rhythm minigame would be a lot harder to program and a lot less fun to play during the night than I had originally anticipated, so the idea wound up scrapped a second time.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_31) && global.UnlockedTrophies[UnknownEnum.Value_21],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Lolbit,
    Name: "Misc - Early Lolbit Sketches",
    Description: "A couple early ideas for Lolbit's extras menu portrait before the final one was settled on.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_25),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Manglebit,
    Name: "Misc - Manglebit",
    Description: "Roleswap AU where Mangle is the weird small thing and Lolbit is normal.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_25, UnknownEnum.Value_9]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Humanbit,
    Name: "Misc - Human Lolbit",
    Description: "Concept doodle of what the person behind the Lolbit persona mentioned in Lolbit's extras description could've looked like.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_25),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PaperBidybab,
    Name: "Misc - Paper Bidybab",
    Description: "The raw sprite used for one of the Bidybabs on the left hall camera. The reason  this specific Bidybab is so abstract compared to the others is purely because by the time all the other sprites were done the only space left on that camera was on the wall, so Zach had to get creative.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_26),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxConcept,
    Name: "Misc - Early LolzHax Sketch",
    Description: "At first, the secret animatronics were intended to only be summoned in through LolzHax and not be available on their own, with this portrait reflecting that. However, once they were split off into their own character slots, LolzHax's portrait needed to be changed to match.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_44, UnknownEnum.Value_43, UnknownEnum.Value_42, UnknownEnum.Value_45]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxCar,
    Name: "Misc - LolzHax Concept Art",
    Description: "Concept art.",
    Unlocked: has(UnknownEnum.Value_39),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxDie,
    Name: "Misc - LolzHax Funeral",
    Description: "They got him.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_39),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_JackOs,
    Name: "Misc - The Jack-O's",
    Description: "I wasn't really super interested in including the Jack-O's in the game until I got the idea to go all-in on making them look like actual pumpkins fairly late into the update's development. That being said, I wasn't 100% satisfied with these designs just yet.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_47, UnknownEnum.Value_48]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_JackOsRatto,
    Name: "Misc - Ratto's Jack-O's",
    Description: "THESE sketches eventually served as the main basis for the Jack-O's final designs, especially in regards to Jack-O-Bonnie's head being more gourd-shaped. The idea of making Jack-O-Chica a dullahan came from Wyatt.\n\nDrawn by Ratto.",
    Unlocked: has([UnknownEnum.Value_47, UnknownEnum.Value_48]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Blank,
    Name: "Scrapped - Early Blank Portrait",
    Description: "Blank was originally going to look a lot closer to his original counterpart! I was never SUPER happy with this design for him though, so once I saw Ratto's take on him I felt compelled to try something else.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_80),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_BlankRatto,
    Name: "Misc - Ratto's Blank Portrait",
    Description: "The Ratto take in question! This was actually originally made for theWAHbox's mod before being absorbed into the vanilla game alongside Blank's mechanic. While not one-to-one, this design did serve as the main basis for his final portrait.\n\nDrawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_80),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_VanHelsing,
    Name: "Misc - Van Helsing",
    Description: "Basically all the background incedentals found throughout Vlad & Clara's episodes were designed on the fly by Goon - except for Van Helsing, who I had a very loose idea for and Goon polished into a final design.\n\nDrawn by TheGrandestGoon & SpookyRick.",
    Unlocked: has(UnknownEnum.Value_83),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AdGuys,
    Name: "Misc - Sponsorship Mascots",
    Description: "Vlad & Clara's commercials were a SUPER late addition to the game, and were really only included because we thought they were funny enough to squeeze in last minute. G-Zone did all the audio and RainingKetchup did all the visuals!\n\nDrawn by RainingKetchup.",
    Unlocked: has(UnknownEnum.Value_83),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Electrobab,
    Name: "Misc - Early Electrobab",
    Description: "\n\nDrawn by Cactus Companion.",
    Unlocked: has(UnknownEnum.Value_56),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_GlamChicaUnused,
    Name: "Misc - Unused Glamrock Chica Sprite",
    Description: "An unused sprite from Glamrock Chica's scrapped early mechanic.\n\nAnimated by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_69),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Carter,
    Name: "Misc - Carter Caterpillar",
    Description: "Carter Caterpillar.\n\nDrawn by Wyat_t.",
    Unlocked: has(UnknownEnum.Value_73),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Ralph,
    Name: "Misc - Ratto's Ralph",
    Description: "The original sketch for Ralph that would eventually become the basis for his final design! The phone guts were entirely Ratto's idea.\n\nDrawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_88),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Endoplush,
    Name: "Misc - Endoplush Pitch",
    Description: "Goon and Ellis lobbied VERY hard to have Endoplush included - and they eventually got their way! This was the original idea for his mechanic before the new one was thought up.\n\nDrawn by TheGrandestGoon.",
    Unlocked: has(UnknownEnum.Value_90),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_TrashGang,
    Name: "Scrapped - Trash Gang Sketches",
    Description: "All the members of Trash & the Gang were going to be seperate enemies at one point, before all of them (except Mr. Hugs) were combined into one.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_57),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_No1Crate,
    Name: "Scrapped - No. 1 Crate Portrait",
    Description: "No. 1 Crate was the only member of the Trash Gang who got a full portrait before I decided to lump all of them together.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_57),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PaperPals,
    Name: "Scrapped - Paper Pals",
    Description: "The Paper Pals were briefly considered as enemies at a few points. Their mechanic was going to be that they'd use Mystery Box and turn into a randomly selected animatronic, although they were scrapped when I realized this mechanic kinda sucked.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Burntrap,
    Name: "Scrapped - Burntrap",
    Description: "He was definitely considered for the shortest amount of time out of all the scrapped characters present here, but I did have the idea of Burntrap basically just being an empty shell that was puppeted around by the Blob.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_63),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Endowolf,
    Name: "Scrapped - Endowolf",
    Description: "Endowolf was considered for the game's roster at a few points as well, but was eventually scrapped in favor of other characters I personally thought were a bit cooler. His original mechanic eventually became Hudson's gimmick.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_36, UnknownEnum.Value_175]) && global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Carnies,
    Name: "Misc - Carnie Sketches",
    Description: "Wyatt was in charge of just about everything to do with the shops visually. While they were originally just going to reuse the shopkeepers' extras menu portraits and have basic patterned backgrounds, he took it upon himself to draw custom-made sprites and backgrounds for all of them!\n\nDrawn by Wyat_t.",
    Unlocked: has(UnknownEnum.Value_140),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_ElChip,
    Name: "Misc - El Chip Sketches",
    Description: "This was mainly included to make up for El Chip not making the cut when we were thinking of not including him...but then we changed our minds and included him anyway. Here's his concept art regardless!\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_141),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_ElChipShop,
    Name: "Misc - El Chip Shop",
    Description: "While Wyatt did have a different idea in mind for how El Chip's shop would look, this sketch DID heavily inspire the final background!\n\nDrawn by EllisBros.",
    Unlocked: has(UnknownEnum.Value_141),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FazEntRep,
    Name: "Misc - FazEnt Representative",
    Description: "I was actually struggling quite a bit to capture this guy's Essence in his portrait (seen in the top left sketch), so Wyatt wound up doing the sketch for his face specifically!\n\nDrawn by Wyat_t.",
    Unlocked: has(UnknownEnum.Value_136),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Drinks,
    Name: "Misc - 4LD Drinks",
    Description: "At one point Tipsy's shop was going to offer different drinks that gave you the abilities of other guards. Eventually we decided to just let you recruit those guards instead. Still, these are probably the drinks they'd all order!\n\nDrawn by Wyat_t.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_48],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Elizabeth,
    Name: "Misc - Elizabeth",
    Description: "Elizabeth was added VERY late into development, long after the other 20 guards had long been settled on and finished. She was mainly included to address the fact that she's really the only member of the Afton family who didn't get to do anything cool in the base game.\n\nDrawn by EllisBros.",
    Unlocked: has(UnknownEnum.Value_173),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_NuVanny,
    Name: "Misc - Newer Vanny",
    Description: "Vanny's design in this game has honestly always bugged me a little ever since it was originally included. If I had designed her at the end of 4LD development she probably would've looked a lot more like this.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_164]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_NuVannabelle,
    Name: "Misc - Newer Vannabelle",
    Description: "A newer Vannabelle to match the newer Vanny. A lot less changed about this one! We were actually considering updating all her sprites to look more like this at one point (or at least adding the option as a toggle) but ultimately decided against it.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_164]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_NeoVannySprites,
    Name: "Misc - Newer Vanny Talksprites",
    Description: "While the new design didn't make it in...a few sprites WERE made for it!\n\nTalksprites drawn by RedDrawsStuff, icon by KirboGamez.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_164]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_NuVannabelleBunny,
    Name: "Misc - Bunnibelle",
    Description: "This is what Vannabelle would look like if she was a bunny rabbit.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_164]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_NuMichael,
    Name: "Misc - Newer Michael",
    Description: "I ALSO kinda wanted to update Michael's design if Vanny's sprites got updated to match, though I didn't get nearly as far with his.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_164, UnknownEnum.Value_163]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_ScrappedGuards,
    Name: "Scrapped - Extra Guards",
    Description: "These were all the top contenders for guards to add who unfortunately didn't make the cut. We WERE considering squeezing a couple more in once the base roster of 20 guards was settled on, although we only had the time to include Elizabeth.\n\nDrawn by SpookyRick",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_48],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Stitchwraith,
    Name: "Scrapped - The Stitchwraith",
    Description: "Had they made the cut, I really wanted to do a bit with Andrew where he pretended to be one of William's victims only for it to be revealed that his actual cause of death was that he snapped his neck trying to do a backflip into the ball pit.\n\nDrawn by SpookyRick",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_48],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Dishwasher,
    Name: "Misc - Dishwasher Daniella",
    Description: "Now that Clark and Frank are actually playable, Dishwasher Daniella must carry the torch of being a character who is only ever mentioned in the employee memos and nowhere else.\n\nDrawn by Cactus Companion.",
    Unlocked: has([UnknownEnum.Value_165, UnknownEnum.Value_166]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: s4LDEndingPhoto,
    Name: "Misc - 4LD Endscreen",
    Description: "The full endscreen art!\n\nDrawn by Wyat_t and SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_48],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_OMC,
    Name: "Misc - Old Man Consequences",
    Description: "Some of these sketches actually also predate the release of the base game! I always knew OMC would be a major player in Four Layers Down, although it took a while before I settled on a cool enough design for him.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_179),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_OldSketchCompilation,
    Name: "Misc - Various Character Sketches",
    Description: "Sketches for a bunch of different characters made when I was still trying to figure out what to do for their portraits.\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_40],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_WyattBigPiece,
    Name: "Misc - Big Fat Wyatt Piece",
    Description: "A big piece of all the base game characters Wyatt did shortly after the base game's release.\n\nDrawn by Wyat_t.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_40],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird2,
    Name: "Extra - Tipsy Bird",
    Description: "Early in development, the fourth salvage location was planned to be a lot more expansive, letting you explore not only the house but also the nearby Jr.'s location, which in the Frickbear's universe we decided was a chain of Freddy Fazbear-themed bars. Tragically, this idea being scrapped meant I couldn't include the giant billboard of its sexy bird mascot.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_8, UnknownEnum.Value_30]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird1,
    Name: "Extra - Tipsy Bird 2",
    Description: "While this design didn't get to be used for its original purpose, she does still appear as a Helpy ad in the final game! Another fun tidbit is that Tipsy Bird's design is directly based on my best recollection of a mascot I remember seeing on a billboard while my family was driving to my grandma's as a kid. Unfortunately, I have never seen this billboard since, so I can only assume the sexy chicken is lost media.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_8, UnknownEnum.Value_30, UnknownEnum.Value_46]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird3,
    Name: "Extra - Tipsy Bird 3",
    Description: "One more for good measure. This was technically the first time Frickbear William's design was shown anywhere publicly.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_8, UnknownEnum.Value_30, UnknownEnum.Value_46, UnknownEnum.Value_170]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_RealTipsyBird,
    Name: "Extra - The Real Tipsy Bird",
    Description: "We found her.",
    Unlocked: has([UnknownEnum.Value_8, UnknownEnum.Value_30, UnknownEnum.Value_143]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FizzyBird,
    Name: "Extra - Fizzy Bird",
    Description: "Tipsy if she was non-alcoholic.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_143]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_DrTalbertnuts,
    Name: "Extra - Dr. Talbertnuts",
    Description: "While Dr. Talbert never shows up at any point in the game in the flesh, he'd probably look like this if he did.\n\nDrawn by Wyat_t.\nOriginal design by Keeby10.",
    Unlocked: has(UnknownEnum.Value_167),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_TheBlob,
    Name: "Extra - \"ScrapHeap\"",
    Description: "Rough idea for what the Blob could've looked like had it been adapted into the Frickbear's universe - something like Salvage but if he was bigger and scarier.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_73, UnknownEnum.Value_120]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_MrBurrows,
    Name: "Extra - Mr. Burrows",
    Description: "While he's not even mentioned anywhere in the game, I do imagine Mr. Burrows exists in the Frickbear's universe and is the boss of the Pizzaplex much like in Tales from the Pizzaplex. He'd also probably look like this!\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_161),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Candys,
    Name: "Extra - Candy's Characters",
    Description: "Hypothetical designs for what the rest of the Candy's 1 cast could've looked like had they made the cut!\n\nDrawn by Ratto.",
    Unlocked: has([UnknownEnum.Value_176, UnknownEnum.Value_44, UnknownEnum.Value_80]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Puppeteer,
    Name: "Extra - The Puppeteer",
    Description: "Drawn by Ratto.",
    Unlocked: has([UnknownEnum.Value_176, UnknownEnum.Value_44, UnknownEnum.Value_80]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_IgnitedChica,
    Name: "Extra - Ignited Chica",
    Description: "Drawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_85),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Percys,
    Name: "Extra - Various Percies",
    Description: "Miscellaneous Playtime With Percy characters doodled around the same time I was figuring Sally's design out.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_178),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PAL,
    Name: "Misc - PAL",
    Description: "If this game had a 92nd animatronic slot it probably would've went to him.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_178),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Walteners_Sha,
    Name: "Extra - Sha",
    Description: "While Bon was the only one ever seriously considered for the roster, I did draw portraits for the other Walten Filesers just because I like them.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_82),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Walteners_Boozoo,
    Name: "Extra - Boozoo",
    Description: "While Bon was the only one ever seriously considered for the roster, I did draw portraits for the other Walten Filesers just because I like them.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_82),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Walteners_Banny,
    Name: "Extra - Banny",
    Description: "While Bon was the only one ever seriously considered for the roster, I did draw portraits for the other Walten Filesers just because I like them.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_82),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Walteners_Billy,
    Name: "Extra - Billy",
    Description: "While Bon was the only one ever seriously considered for the roster, I did draw portraits for the other Walten Filesers just because I like them.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_82),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Walteners_Sophie,
    Name: "Extra - Sophie",
    Description: "We DID actually briefly consider the possibility of Sophie as a guard...though this idea didn't get very far once we realized how hard she'd be to write, especially seeing as her story isn't even over yet.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_82),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_TheAngel,
    Name: "Extra - The Angel",
    Description: "Drawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_179),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FreddySoup,
    Name: "Goofs - Freddy Soup",
    Description: "Zach drew this for me when I was sick :D\n\nDrawn by Zachary Attackary.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCover,
    Name: "Goofs - This is FNAF",
    Description: "I'm Freddy Fazbear... I'm gonna get you and I'm gonna make you scared...\n\nDrawn by Wyat_t.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_Plushtrap,
    Name: "Goofs - Plushtrap Lore",
    Description: "This is his lore.\n\nDrawn by Cactus Companion.",
    Unlocked: has(UnknownEnum.Value_21),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BidybabsPackItUp,
    Name: "Goofs - Alright, Bidybabs...",
    Description: "Alright Bidybabs, pack it up...\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_26),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_RKLolz,
    Name: "Goofs - The Lolz",
    Description: "Drawn by RainingKetchup.",
    Unlocked: has([UnknownEnum.Value_39, UnknownEnum.Value_25]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_LolSwap,
    Name: "Goofs - Lolswap AU",
    Description: "Drawn by RainingKetchup.",
    Unlocked: has(UnknownEnum.Value_39),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_IDoNotCareForFiveNightsAtFrickbears3,
    Name: "Goofs - I Do Not Care For Frickbear's 3.",
    Description: "It insists upon itself.\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_46, UnknownEnum.Value_14, UnknownEnum.Value_27, UnknownEnum.Value_128]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: PA_PrideMonth,
    Name: "Goofs - Pride Month Special",
    Description: "Made for Pride Month in 2025.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_160),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FangameBossesPlayingPoker,
    Name: "Goofs - Bosses Playing Poker",
    Description: "The funny thing is that all the notable fangame bosses I could think of at the time this was drawn also happened to all be made by people I know.\n\nGoldenfriedrich created by Ryon.\nPAL created by FazieFunbear.\nBuddy created by Marco Antonio.\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_120),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_BagOfRemnant,
    Name: "Goofs - Bag of Remnant",
    Description: "Based on that one absolutenutcase comic.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_120),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_MedicatedFritz,
    Name: "Goofs - Medicated Fritz",
    Description: "This is what he'd look like.",
    Unlocked: has(UnknownEnum.Value_162),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_FunnertimeFreddy,
    Name: "Goofs - Funnertime Freddy",
    Description: "His backstory!\n\nDrawn by Cactus Companion.",
    Unlocked: has(UnknownEnum.Value_54),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_HudsonConvo,
    Name: "Goofs - Team Meeting",
    Description: "Another early piece of Four Layers Down art; At this point, Aunt Jane was planned as a playable guard.\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_175),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_PregnantFreddy,
    Name: "Goofs - Glamrock Freddy Concept Art",
    Description: "Concept art.\n\nDrawn by RainingKetchup.",
    Unlocked: has(UnknownEnum.Value_66),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FireworkFreddy,
    Name: "Goofs - Firework Freddy",
    Description: "Think about it.\n\nDrawn by RainingKetchup.",
    Unlocked: has(UnknownEnum.Value_66),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_ChildhoodNightmares,
    Name: "Goofs - Your Childhood Nightmares",
    Description: "This was almost too scary to put in the game.\n\nDrawn by EllisBros.",
    Unlocked: has(UnknownEnum.Value_89),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FoxyEXE,
    Name: "Misc - I Miss the Pirate",
    Description: "Drawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_89),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FoxyEXEMinds,
    Name: "Goofs - Minds",
    Description: "Did you know there's a significant overlap in the cast of Sinister Minds and the cast of this game's Immortal & the Restless?\n\nDrawn by Ratto.",
    Unlocked: has([UnknownEnum.Value_89, UnknownEnum.Value_83]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_FriendlyFoeFatbear,
    Name: "Goofs - Friendly Foe Fatbear",
    Description: "Drawn by FlyPlague.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Maryling1,
    Name: "Goofs - Maryling 1",
    Description: "Drawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_176),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Maryling2,
    Name: "Goofs - Maryling 2",
    Description: "Drawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_176),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Maryling3,
    Name: "Goofs - Maryling 3",
    Description: "Drawn by Ratto.",
    Unlocked: has(UnknownEnum.Value_176),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Maryling4,
    Name: "Goofs - Maryling 4",
    Description: "Drawn by Ratto.",
    Unlocked: has([UnknownEnum.Value_176, UnknownEnum.Value_177]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_BreastReductionSurgery,
    Name: "Goofs - Breast Reduction Surgery",
    Description: "This really happened.\n\nDrawn by SpookiVX.",
    Unlocked: has([UnknownEnum.Value_164, UnknownEnum.Value_166, UnknownEnum.Value_142]),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_BabyEdwin,
    Name: "Goofs - Baby Edwin",
    Description: "This is what he'd look like.\n\nDrawn by EllisBros.",
    Unlocked: has(UnknownEnum.Value_171),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_OldManLongsequences,
    Name: "Goofs - Old Man Longsequences",
    Description: "Drawn by G-Zone.",
    Unlocked: has(UnknownEnum.Value_179),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoversRick,
    Name: "Album Covers - Rick",
    Description: "I thought it'd be fun to redraw a few famous album covers with Frickbear's characters for quite some time. While I didn't have the time to draw these out fully during development, I DID at least sketch them out!\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoversKai,
    Name: "Album Covers - Kai",
    Description: "The other developers also joined in on this. See if you can pinpoint what each of these were based on!\n\nDrawn by KaiTheGuy123.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoversWyatt,
    Name: "Album Covers - Wyat_t",
    Description: "Drawn by Wyat_t.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoverDiego,
    Name: "Album Covers - Diego",
    Description: "Drawn by Diego.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoversKirbo,
    Name: "Album Cover - Kirbo",
    Description: "Drawn by KirboGamez.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCoversRK,
    Name: "Album Cover - RainingKetchup",
    Description: "Last one.\n\nDrawn by RainingKetchup.",
    Unlocked: global.UnlockedGuards[UnknownEnum.Value_20] && global.UnlockedAnimatronics[UnknownEnum.Value_126],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePosterPrototype,
    Name: "Promo - Early Key Art",
    Description: "An older concept for the game's key art. I still think this looked pretty cool (and I thought the fact that it kinda sneakily spoils Salvage's design was really cheeky), although I definitely feel like the art we went encapsulates the game's general essence way better. I mean, this one doesn't even have any of the animatronics in it!\n\nDrawn by SpookyRick.",
    Unlocked: has([UnknownEnum.Value_158, UnknownEnum.Value_163]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePoster1,
    Name: "Promo - Key Art Pass 1",
    Description: "The original sketch for the game's cool promotional artwork! The final one's composition is mostly the same, although most of the featured animatronics were swapped out.\n\nDrawn by Carmoule.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePoster2,
    Name: "Promo - Key Art Pass 2",
    Description: "This one was done by me! We decided it'd be good to represent the game's eclectic character roster in the artwork, so most animatronics were swapped out for their quirkier variants.\n\nDrawn by Carmoule and SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePosterFINAL,
    Name: "Promo - Full Key Art",
    Description: "The finished product! A modified version of this artwork is used for the game's GameJolt thumbnail and banner.\n\nDrawn by Carmoule.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_PotentialBanners,
    Name: "Promo - Banner Concepts",
    Description: "Concepts for a potential banner for the game's Gamejolt page. Neither of these got super far before we decided to just use the game's key art instead.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_TrailerStoryboard,
    Name: "Promo - Trailer Storyboards",
    Description: "We were going to make three different variants of the trailer at first, with each having a different nightguard during the animated bit and each being posted to a different social media platform. This was sadly a bit too ambitious, and only the Mike variant of the trailer wound up being made.\n\nDrawn by Wyat_t.",
    Unlocked: has([UnknownEnum.Value_159, UnknownEnum.Value_160, UnknownEnum.Value_161]),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_4LDEarliestKeyArt,
    Name: "4LD - Earliest Key Art Concept",
    Description: "The idea for Four Layers Down actually came about before the base game even released, as did this drawing! While the main idea behind this update was the addition of a rougelike endless mode, the addition of new guards and a whole new story campaign were also big parts of the original idea.\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_KeyArtConcepts,
    Name: "4LD - Key Art Concepts",
    Description: "Once the game actually released and it came time to work on the update, we began scaling things back from my original idea - we were even gonna cut the idea of introducing new playable guards! A couple alternate themes for the update were considered, including theming it around The Boss.\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_LogoConcepts,
    Name: "4LD - Logo Concepts",
    Description: "We went through quite a few ideas for the update's logo before arriving on the final one used in the key art.\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_KeyArt,
    Name: "4LD - Final Key Art",
    Description: "Despite our original plans to scale things back, we slowly began adding more and more stuff to the update (such as the briefly-scrapped playable guards and absurd amount of new animatronics), and before we knew it, wound up pretty much right back at the scope of the original idea.\n\nDrawn by Wyat_t.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_AngelStoryBoard,
    Name: "4LD - Trailer Storyboard",
    Description: "Storyboard for the ending scene of the Four Layers Down trailer.\n\nDrawn by SpookyRick.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Poem,
    Name: "4LD - Laments of Consequence",
    Description: "This was posted in the leadup to the trailer!\n\nWritten by CARIO55555.",
    Unlocked: global.UnlockedTrophies[UnknownEnum.Value_47],
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Update2_2Promo,
    Name: "4LD - Ver. 2.2 Promo",
    Description: "This was drawn to promote the skin modding update! Also features the first instance of Human Lolbit in color. (I dunno why but I always imagined their actual name would be something like Casey.)\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_25),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_JeremyTrain,
    Name: "Collab - Jeremy GIMMIKO Train Sprite",
    Description: "Jeremy's train passenger sprite from GIMMIKO.\n\nDrawn by Zizou.",
    Unlocked: has(UnknownEnum.Value_159),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_DreadbearAirbud,
    Name: "Collab - Dreadbear & Air Budd",
    Description: "There's a lot of overlap in the voice casts of this game and GIMMIKO! Both characters here were voiced by Zach.\n\nDrawn by Zachary Attackary.",
    Unlocked: has(UnknownEnum.Value_38),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_StupidHorseChannelBetters,
    Name: "Collab - Stupid Horse Channel Betters",
    Description: "Icons for four Frickbear's characters who appear as playable betters in Stupid Horse Channel! ...A game which probably will not be out yet by the time this game is. The characters on display here are Fritz, Billy (the protagonist of Frickbear's 1), Clark Fixy, and Dark Fixy.\n\nDrawn by Zizou.",
    Unlocked: has(UnknownEnum.Value_162),
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: PA_Friedrichs,
    Name: "Collab - Friedrich's x Frickbear's",
    Description: "Drawn as part of an art trade I did with ryon, who you may know as the creator of Five Nights at Friedrich's! This drawing was inspired by photos of world leaders shaking hands, and as such a lot of thought was put into who in the picture would be in the front. That sorta thing communicates diplomatic power, you see.\n\nDrawn by ryon and SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: PA_FriedrichPoster,
    Name: "Collab - Friedrich's Poster",
    Description: "The Frickbear's poster that appears as an easter egg in Five Nights at Friedrich's! This poster already appears in THAT game's extras menu, but you get to look at it here too.\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: PA_ManagementWanted,
    Name: "Collab - Management Wanted",
    Description: "I'm better than you are, so I should do the review.\n\nDrawn by SpookyRick, Freddy Frickbear model by the Management Wanted team.",
    Unlocked: true,
    UpdateArt: false
});
array_push(ConceptArt, 
{
    Image: CA_HectorFreddy,
    Name: "Collab - TPRR Collab Announcement",
    Description: "This was the piece made for the initial TPRR collab announcement!\n\nDrawn by ThatSaladGal.",
    Unlocked: true,
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_TPRRSketches,
    Name: "Collab - Frickbear'sified TPRR Originals",
    Description: "Quite a few Frickbear'sified designs for some of TPRR's original characters were made for collab, although these three were the ones I sketched out personally!\n\nDrawn by SpookyRick.",
    Unlocked: true,
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Freddybear,
    Name: "Collab - Freddybear & Fredbear",
    Description: "Drawn by fifleo.",
    Unlocked: has(UnknownEnum.Value_126),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_OvertimeThumbnail,
    Name: "Overtime Thumbnail",
    Description: "Thumbnail for RecD's Overtime - this time without text!\n\nDrawn by SpookyRick.",
    Unlocked: has(UnknownEnum.Value_162),
    UpdateArt: true
});
array_push(ConceptArt, 
{
    Image: CA_Rodney,
    Name: "Rodney's Big Break",
    Description: "Drawn by Kirbo.",
    Unlocked: has(UnknownEnum.Value_179),
    UpdateArt: true
});

for (var i = 0; i < array_length(ConceptArt); i++)
{
    if ((!ConceptArt[i].UpdateArt && !global.UnlockedAnimatronics[UnknownEnum.Value_128]) || (ConceptArt[i].UpdateArt && !global.UnlockedTrophies[UnknownEnum.Value_47]))
        ConceptArt[i].Unlocked = false;
}

while (array_length(global.ExtrasNotifs.ConceptArtNotifs) < array_length(ConceptArt))
    array_push(global.ExtrasNotifs.ConceptArtNotifs, true);

Selected = 0;
OptionsSurf = -1;
PreviousImage = sNOTHING;
ImageSize = 0;
PreviousImageSize = 0;
DefaultImageX = 430;
ImageX = DefaultImageX;
ImageOffsetX = 0;
ImageOffsetY = 0;
ImageOffsetSize = 0;
ViewMode = false;
LastMouseX = 0;
LastMouseY = 0;
OptionsOffset = 0;
OptionsDragged = false;

function switch_page(arg0)
{
    PreviousImage = ConceptArt[Selected].Image;
    PreviousImageSize = ImageSize;
    ImageSize = 0;
    Selected = arg0;
    global.ExtrasNotifs.ConceptArtNotifs[arg0] = false;
    audio_play_sound(sfxBump, 5, false);
}

Active = true;
Frame = 0;
texturegroup_load("ConceptArt");

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_8 = 8,
    Value_9,
    Value_14 = 14,
    Value_20 = 20,
    Value_21,
    Value_25 = 25,
    Value_26,
    Value_27,
    Value_30 = 30,
    Value_31,
    Value_36 = 36,
    Value_38 = 38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_54 = 54,
    Value_56 = 56,
    Value_57,
    Value_63 = 63,
    Value_66 = 66,
    Value_69 = 69,
    Value_73 = 73,
    Value_80 = 80,
    Value_82 = 82,
    Value_83,
    Value_85 = 85,
    Value_88 = 88,
    Value_89,
    Value_90,
    Value_120 = 120,
    Value_121,
    Value_126 = 126,
    Value_127,
    Value_128,
    Value_136 = 136,
    Value_140 = 140,
    Value_141,
    Value_142,
    Value_143,
    Value_156 = 156,
    Value_157,
    Value_158,
    Value_159,
    Value_160,
    Value_161,
    Value_162,
    Value_163,
    Value_164,
    Value_165,
    Value_166,
    Value_167,
    Value_170 = 170,
    Value_171,
    Value_173 = 173,
    Value_175 = 175,
    Value_176,
    Value_177,
    Value_178,
    Value_179
}
