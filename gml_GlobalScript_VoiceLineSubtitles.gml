function subtitle(arg0)
{
    var data = subtitle_raw(arg0);
    
    if (array_length(data[0]) > 1 && !is_string(data[0][1]))
    {
        var strings = [];
        var timestamps = [];
        var extra = [];
        
        for (var i = 0; i < array_length(data); i++)
        {
            var entry = data[i];
            array_push(strings, entry[0]);
            array_push(timestamps, entry[1]);
            
            if (array_length(entry) > 2)
                array_push(extra, entry[2]);
        }
        
        return [strings, timestamps, extra];
    }
    
    return data;
}

function subtitle_raw(arg0)
{
    if (audio_get_type(arg0))
        return ds_map_find_value(global.ImportedSubtitles, arg0);
    
    switch (arg0)
    {
        case voc_Freddy_Laugh1:
        case voc_Freddy_Laugh2:
        case voc_GoldenFreddy_Laugh1:
        case voc_GoldenFreddy_Laugh2:
        case voc_BB_Laugh1:
        case voc_BB_Laugh2:
        case voc_BB_Laugh3:
        case voc_BB_Deathcoin:
        case voc_ShadowFreddy_Laugh:
        case voc_Phantom_Laugh:
        case voc_Springtrap_Laugh:
        case voc_Phantom_Deathcoin:
        case voc_Plushtrap_Nyeeheehee:
        case voc_NightmareFredbear_Laugh1:
        case voc_NightmareFredbear_Laugh2:
        case voc_NightmareBB_Laugh1:
        case voc_NightmareBB_Laugh2:
        case voc_NightmareBB_Laugh3:
        case voc_Lolbit_Giggle:
        case voc_Lolbit_Giggle2:
        case voc_Lolbit_Giggle3:
        case voc_Helpy_Laugh:
        case voc_MusicMan_Chuckle:
        case voc_LolzHax_Laugh1:
        case voc_LolzHax_Laugh2:
        case voc_LolzHax_Laugh3:
        case voc_Malhare_LaughAppear:
        case voc_Malhare_LaughEnd:
        case voc_Malhare_LaughIntro:
        case voc_FuntimeFreddy_Laugh1:
        case voc_Pigpatch_Laugh:
        case voc_WhiteTiger_Appear1:
        case voc_WhiteTiger_Appear2:
        case voc_WhiteTiger_Appear3:
        case voc_WhiteTiger_Leave1:
        case voc_WhiteTiger_Leave2:
        case voc_WhiteTiger_Leave3:
        case voc_Jackie_Appear1:
        case voc_Jackie_Appear2:
        case voc_Jackie_Appear3:
        case voc_Ennard_Selection:
        case voc_OldManConsequences_Die2:
        case voc_Deedee_XORLaugh:
        case voc_Pigpatch_Laugh:
        case voc_SunMoon_MoonCaught1:
        case voc_SunMoon_MoonCaught2:
        case voc_SunMoon_MoonCaught3:
        case voc_Bonnet_Appear1:
        case voc_Bonnet_Appear2:
        case voc_Bonnet_Appear3:
        case voc_Eleanor_Laugh:
        case voc_Bon_Death6:
            return [["*LAUGHTER*"], [0]];
            break;
        
        case voc_Freddy_HorHorHorHor:
            return [["Hor hor horhor hor..."], [0]];
            break;
        
        case voc_Freddy_DoItYourself:
            return [["You want something done right? You gotta do it yourself."], [0]];
            break;
        
        case voc_Freddy_FiveNights:
            return [["I guess you just couldn't survive five nights...", "...At Frickbear's.", "...3."], [0, 3.9, 6.2]];
            break;
        
        case voc_Freddy_MessWithTheFaz:
            return [["You mess with the faz, you get the bear."], [0]];
            break;
        
        case voc_Freddy_PartysJustStarting:
            return [["The party's just starting."], [0]];
            break;
        
        case voc_Freddy_Showbiz:
            return [["That's showbiz for ya."], [0]];
            break;
        
        case voc_Freddy_Suited:
            return [["Not everyone's suited for this job...", "...But I can help with that."], [0, 3.4]];
            break;
        
        case voc_Freddy_WelcomeToTheFamily:
            return [["Welcome to the family!"], [0]];
            break;
        
        case voc_Freddy_WhoRunsThings:
            return [["Don't forget who runs things around here."], [0]];
            break;
        
        case voc_Freddy_Deathcoin:
            return [["AUGH!"], [0]];
            break;
        
        case voc_Bonnie_RockNRoll:
            return [["Rock n' roll!"], [0]];
            break;
        
        case voc_Bonnie_ASongComingOn:
            return [["Oh man, I feel a song comin' on!", "*EPIC GUITAR RIFF*", "You're dead!"], [0, 2, 5.1]];
            break;
        
        case voc_Bonnie_BadaBoom:
            return [["Bada bing, bada boom."], [0]];
            break;
        
        case voc_Bonnie_BigOlEars:
            return [["Ahh...music to my big ol' ears."], [0]];
            break;
        
        case voc_Bonnie_BonnieSong:
            return [["My name is Bonnie...I'm a purple bunny...", "...No, no that needs a lot of work."], [0, 4.6]];
            break;
        
        case voc_Bonnie_HoldYaAlright:
            return [["That'll hold YOU alright!"], [0]];
            break;
        
        case voc_Bonnie_OnTheClock:
            return [["Could you let me in faster next time? I'm on the clock here."], [0]];
            break;
        
        case voc_Bonnie_PitchPoifect:
            return [["Hoo, that scream was pitch perfect!"], [0]];
            break;
        
        case voc_Bonnie_ProvideFeedback:
            return [["Hey, could you, um...provide feedback on that jumpscare, actually?", "I was working on it for a little while."], [0, 4.6]];
            break;
        
        case voc_Bonnie_Raise:
            return [["Freddy should give me a raise for this."], [0]];
            break;
        
        case voc_Bonnie_Deathcoin:
            return [["Sorry, boss..."], [0]];
            break;
        
        case voc_Chica_LetsEat:
            return [["Let's eat!"], [0]];
            break;
        
        case voc_Chica_GoDownEasy:
            return [["Sheesh, you go down easy!"], [0]];
            break;
        
        case voc_Chica_ImAChicken:
            return [["I'm a chicken, ya beef jerky!"], [0]];
            break;
        
        case voc_Chica_ImSoHungry:
            return [["I'm so hungry, I could eat a night guard!"], [0]];
            break;
        
        case voc_Chica_JustGotServed:
            return [["I'm afraid you just got served!"], [0]];
            break;
        
        case voc_Chica_MmmCake:
            return [["That was a piece of cake!", "...Mmmmmm, cake..."], [0, 3.3]];
            break;
        
        case voc_Chica_OnlyChicken:
            return [["Wow...", "And I thought I was the only chicken around here!"], [0, 0.8]];
            break;
        
        case voc_Chica_StarvinOverHere:
            return [["Oh, finally!", "*RIPS OFF ARM*", "I was starving over here!"], [0, 1.1, 2]];
            break;
        
        case voc_Chica_WingIt:
            return [["Bonnie might be better at making plans...", "...But I know how to wing it."], [0, 2.1]];
            break;
        
        case voc_Chica_YouAintFat:
            return [["If you ain't fat, you ain't nothin'!"], [0]];
            break;
        
        case voc_Chica_YoureCooked:
            return [["Doesn't take a chef to know you're cooked!"], [0]];
            break;
        
        case voc_Chica_RuffledYourFeathers:
            return [["Who ruffled YOUR feathers?"], [0]];
            break;
        
        case voc_Foxy_Ahoy:
            return [["Ahoy!"], [0]];
            break;
        
        case voc_Foxy_BiscuitEater2:
            return [["Who's out of order now, ye son of a biscuit eater!?"], [0]];
            break;
        
        case voc_Foxy_Floundering:
            return [["Yar har har har! Oh, I just love a good old floundering."], [0]];
            break;
        
        case voc_Foxy_OldBear:
            return [["That old bear wishes he were as fast as me!"], [0]];
            break;
        
        case voc_Foxy_OnePiece:
            return [["They won't be finding you in one piece."], [0]];
            break;
        
        case voc_Foxy_QuickerThanThat:
            return [["Ho ho! You gotta be quicker than that!"], [0]];
            break;
        
        case voc_Foxy_QuickRedFox:
            return [["The quick red fox jumped the lazy night guard!"], [0]];
            break;
        
        case voc_Foxy_TheHooks:
            return [["Didn't your boss ever warn you of the hooks?"], [0]];
            break;
        
        case voc_Foxy_ThePlank:
            return [["Ah, the plank...She beckons your name."], [0]];
            break;
        
        case voc_Foxy_Deathcoin:
            return [["I'll get ye next time..."], [0]];
            break;
        
        case voc_GoldenFreddy_ItsMe:
            return [["IT'S ME!"], [0]];
            break;
        
        case voc_GoldenFreddy_AnyTrick:
            return [["Watchmen these days, they'll fall for any trick in the book!"], [0]];
            break;
        
        case voc_GoldenFreddy_Cough:
            return [["AAAAAAAAAAAAAGH!!", "*COUGHING*"], [0, 1.8]];
            break;
        
        case voc_GoldenFreddy_FellAsleep:
            return [["Awww, you fell asleep."], [0]];
            break;
        
        case voc_GoldenFreddy_LikeTheyUsedTo:
            return [["They don't make night guards like they used to."], [0]];
            break;
        
        case voc_GoldenFreddy_NeverGetsOld:
            return [["Heheheheheh...", "That never gets old."], [0, 1.8]];
            break;
        
        case voc_GoldenFreddy_StillBeHaunted:
            return [["You can tell me I'm not wanted, but the joint will still be haunted!"], [0]];
            break;
        
        case voc_GoldenFreddy_Deathcoin:
            return [["*Growling*"], [0]];
            break;
        
        case voc_Endoskeleton_WhereAmI:
            return [["WHERE AM I?"], [0]];
            break;
        
        case voc_Endoskeleton_Careful:
            return [["CAREFUL WITH THAT FLASHLIGHT. YOU ALMOST GOT ME CAUGHT!"], [0]];
            break;
        
        case voc_Endoskeleton_ErrorEvent:
            return [["ERROR IN ACTION NUMBER 1 OF JUMPSCARE EVENT FOR OBJECT ENDOSKELETON.", "VARIABLE \"VOICELINEID\" NOT SET BEFORE READING."], [0, 6.1]];
            break;
        
        case voc_Endoskeleton_NewSuit:
            return [["I WAS LOOKING FOR A NEW SUIT...", "I SUPPOSE YOU WILL HAVE TO DO."], [0, 2.2]];
            break;
        
        case voc_Endoskeleton_NoBones:
            return [["YOU NEVER STOOD A CHANCE - NO BONES ABOUT IT."], [0]];
            break;
        
        case voc_Endoskeleton_ProcessComplete:
            return [["PROCESS COMPLETE. SHUTTING DOWN."], [0]];
            break;
        
        case voc_Endoskeleton_EndOYou:
            return [["THIS IS THE END O' YOU!"], [0]];
            break;
        
        case voc_Endoskeleton_LightsOffProtocol:
            return [["LIGHTS OFF PROTOCOL COMPLETED SUCCESSFULLY."], [0]];
            break;
        
        case voc_Endoskeleton_OldSkeleton:
            return [["YOU WON'T BE NEEDING YOUR OLD SKELETON ANYMORE.", "NOT WHEN YOU HAVE ME!", "HA HA HA HA HA."], [0, 3.5, 5.4]];
            break;
        
        case voc_Endoskeleton_WildRide:
            return [["YOU'LL NEVER GET OFF MY WILD RIDE!", "HA HA HA HA HA."], [0, 2.9]];
            break;
        
        case voc_Endoskeleton_ShuttingDown:
            return [["WARNING! CRITICAL ERROR."], [0]];
            break;
        
        case voc_ToyFreddy_UReady:
            return [["U ready?"], [0]];
            break;
        
        case voc_ToyFreddy_AwMan:
            return [["Aw man..."], [0]];
            break;
        
        case voc_ToyFreddy_Sobbing:
            return [["*SOBBING*", "I've been outgamed!", "*SOBBING*", "Why, why!?", "*SOBBING*"], [0, 11.9, 15.8, 41, 44]];
            break;
        
        case voc_ToyFreddy_Fazballs:
            return [["YEEOUCH! Right in the Faz-balls!"], [0]];
            break;
        
        case voc_ToyFreddy_HardlyGaming:
            return [["Gaming hard or hardly gaming?"], [0]];
            break;
        
        case voc_ToyFreddy_Leaderboard:
            return [["You'll make it to the leaderboard someday, pal."], [0]];
            break;
        
        case voc_ToyFreddy_Minesweeper:
            return [["Just remember! If there's a one to the left and a three to the right...", "That square might be a mine!"], [0, 3.8]];
            break;
        
        case voc_ToyFreddy_SwingAtTheKing:
            return [["If you swing at the king, you'd best not miss!"], [0]];
            break;
        
        case voc_ToyFreddy_WinningSon:
            return [["Are you winning, son?"], [0]];
            break;
        
        case voc_ToyFreddy_Deathcoin:
            return [["Hey, that's cheating!"], [0]];
            break;
        
        case voc_ToyBonnie_LetsRock:
            return [["Let's rock!"], [0]];
            break;
        
        case voc_ToyBonnie_ISeeYou:
            return [["I see you..."], [0]];
            break;
        
        case voc_ToyBonnie_ISpy:
            return [["Now what is THAT I spy?"], [0]];
            break;
        
        case voc_ToyBonnie_OhSecurityGuy:
            return [["Oh security guy~!"], [0]];
            break;
        
        case voc_ToyBonnie_FindYouEventually:
            return [["I'll find you eventually..."], [0]];
            break;
        
        case voc_ToyBonnie_JustFreddy:
            return [["...No, that's just Freddy..."], [0]];
            break;
        
        case voc_ToyBonnie_TimeForThis:
            return [["I do NOT have time for this!"], [0]];
            break;
        
        case voc_ToyBonnie_Autograph:
            return [["Before you ask, no.", "I won't autograph your gravestone."], [0, 1.8]];
            break;
        
        case voc_ToyBonnie_Criminal:
            return [["It's CRIMINAL to be as cute as me!"], [0]];
            break;
        
        case voc_ToyBonnie_DieToMeetMe:
            return [["A lot of people say they'd die to meet me...", "Congrats on being the first to follow through!"], [0, 2.7]];
            break;
        
        case voc_ToyBonnie_FutureIsNow:
            return [["The future is now...", "And I'm afraid you're obsolete!"], [0, 2.1]];
            break;
        
        case voc_ToyBonnie_Limelight:
            return [["Not everyone's fit for the limelight!"], [0]];
            break;
        
        case voc_ToyBonnie_MoveAside:
            return [["Move aside for a true star!"], [0]];
            break;
        
        case voc_ToyBonnie_OneStarRises:
            return [["One star rises, and another fizzles out..."], [0]];
            break;
        
        case voc_ToyBonnie_Deathcoin:
            return [["Fake fan..."], [0]];
            break;
        
        case voc_ToyChica_LetsParty:
            return [["Let's party!"], [0]];
            break;
        
        case voc_ToyChica_AdorableCorpse:
            return [["Awwww...", "You make an ADORABLE corpse."], [0, 1.5]];
            break;
        
        case voc_ToyChica_BadAtThis:
            return [["Oh my god, you're like, so bad at this."], [0]];
            break;
        
        case voc_ToyChica_BingoGotEm:
            return [["Bingo! Got 'em!"], [0]];
            break;
        
        case voc_ToyChica_Bloodstains:
            return [["EEEEYUCK...", "These bloodstains do NOT fit my look..."], [0, 1.8]];
            break;
        
        case voc_ToyChica_DeserveMe:
            return [["If you can't handle me at my worst, you don't deserve me at my best."], [0]];
            break;
        
        case voc_ToyChica_GoodLittleCupcake:
            return [["Who's a good little cupcake? Aww, you are, you are!"], [0]];
            break;
        
        case voc_ToyChica_PartyFowl:
            return [["Call that a party fowl!"], [0]];
            break;
        
        case voc_ToyChica_Whateverrr:
            return [["UGH...whatever..."], [0]];
            break;
        
        case voc_Mangle_LetsPlay:
            return [["Let's play!"], [0]];
            break;
        
        case voc_Mangle_LetsHang2:
            return [["Well...now that we're together...", "...Let's HANG!"], [0, 3]];
            break;
        
        case voc_Mangle_Privacy:
            return [["Can't a fox have some privacy around here?"], [0]];
            break;
        
        case voc_Mangle_SeeWhatYouveDone:
            return [["SEE WHAT YOU'VE DONE!?"], [0]];
            break;
        
        case voc_Mangle_Sorry:
            return [["Sorry about your head!", "...Though I guess you weren't using it for much, anyway..."], [0, 1.6]];
            break;
        
        case voc_Mangle_ThatPretty:
            return [["Don't think I didn't see you looking at me!", "...Do you really think I'm that pretty? :3"], [0, 3.1]];
            break;
        
        case voc_Mangle_TwoHeads:
            return [["Two heads are better than one!"], [0]];
            break;
        
        case voc_Mangle_Deathcoin:
            return [["That bites..."], [0]];
            break;
        
        case voc_WitheredFreddy_ImAwake:
            return [["Eh? I'm awake!"], [0]];
            break;
        
        case voc_WitheredFreddy_TooOld:
            return [["I'm getting too old for this..."], [0]];
            break;
        
        case voc_WitheredFreddy_WitheredOut:
            return [["I can live with, or I can live Withered-out...", "No, that's terrible."], [0, 4.3]];
            break;
        
        case voc_WitheredFreddy_WelcomeToTheFamily:
            return [["Welcome to the family."], [0]];
            break;
        
        case voc_WitheredFreddy_EndsTheSame:
            return [["It always ends the same..."], [0]];
            break;
        
        case voc_WitheredFreddy_Lifeless:
            return [["They lied when they told you I was lifeless."], [0]];
            break;
        
        case voc_WitheredFreddy_NeverEnds:
            return [["The party never ends."], [0]];
            break;
        
        case voc_WitheredFreddy_PoorCareerChoice:
            return [["You've made a very poor career choice."], [0]];
            break;
        
        case voc_WitheredFreddy_ToLast:
            return [["It wasn't meant to last..."], [0]];
            break;
        
        case voc_WitheredFreddy_Deathcoin:
            return [["Ohh, my bones..."], [0]];
            break;
        
        case voc_WitheredBonnie_WhosThere:
            return [["¿Quien anda ahí?\n(Who's there?)"], [0]];
            break;
        
        case voc_WitheredBonnie_BrokenNow:
            return [["Eres tú el que ahora está roto, ya veo\n(It's you who's broken now, I see.)"], [0]];
            break;
        
        case voc_WitheredBonnie_CantTell:
            return [["You can't tell by my face...", "But I am very happy I killed you."], [0, 2.4]];
            break;
        
        case voc_WitheredBonnie_DidntReallyThink:
            return [["¿No pensaste que realmente me engañarías, verdad?\n(You didn't really think that would fool me, did you?)"], [0]];
            break;
        
        case voc_WitheredBonnie_InWithTheOld:
            return [["In with the old, out with the new."], [0]];
            break;
        
        case voc_WitheredBonnie_LondonBridge:
            return [["London Bridge has fallen down."], [0]];
            break;
        
        case voc_WitheredBonnie_LookIntoMyEye:
            return [["LOOK INTO MY EYE."], [0]];
            break;
        
        case voc_WitheredBonnie_StrangeIsntIt:
            return [["Extraño, ¿no?\n(Strange, isn't it?)", "Es el conejo que usualmente es la presa...\n(Usually it's the rabbit who's the prey...)"], [0, 1.7]];
            break;
        
        case voc_WitheredBonnie_ToreMeApart:
            return [["They tore me apart...", "They used me for parts."], [0, 2.3]];
            break;
        
        case voc_WitheredBonnie_Deathcoin:
            return [["¡Ay caramba!"], [0]];
            break;
        
        case voc_WitheredChica_Garble1:
        case voc_WitheredChica_Garble2:
        case voc_GlamrockChica_Deathcoin:
            return [["*GARBLE*"], [0]];
            break;
        
        case voc_WitheredChica_InHereSomewhere:
            return [["I know you're in here somewhere!"], [0]];
            break;
        
        case voc_WitheredChica_MySensors:
            return [["My sensors aren't what they used to be..."], [0]];
            break;
        
        case voc_WitheredChica_NeedAHug:
            return [["Does somebody need a hug?"], [0]];
            break;
        
        case voc_WitheredChica_SeeingThings:
            return [["I must be seeing things..."], [0]];
            break;
        
        case voc_WitheredChica_SqueezePastHere:
            return [["If I could just...squeeze past here..."], [0]];
            break;
        
        case voc_WitheredChica_TheWind:
            return [["Must've been the wind..."], [0]];
            break;
        
        case voc_WitheredChica_BakedIntoPizzas:
            return [["If we baked you into the pizzas...", "...How long do you think it'd take them to notice?"], [0, 2.4]];
            break;
        
        case voc_WitheredChica_BirdOfPrey:
            return [["I guess this makes me a bird of prey!"], [0]];
            break;
        
        case voc_WitheredChica_Flightless:
            return [["I might be flightless...but you're fightless!"], [0]];
            break;
        
        case voc_WitheredChica_HaventYouHeard:
            return [["Psst. Hey.", "Haven't you heard?", "It was to my understanding that everyone had heard."], [0, 2.4, 4]];
            break;
        
        case voc_WitheredChica_SliceYouToPieces:
            return [["I slice you to pieces...", "...Like a pizza!"], [0, 3.5]];
            break;
        
        case voc_WitheredChica_Tangled:
            return [["Tangled in my wires...", "...And mangled in my mouth."], [0, 1.8]];
            break;
        
        case voc_WitheredChica_TheWorst:
            return [["I was the first!", "You...were the WORST!"], [0, 1.7]];
            break;
        
        case voc_WitheredFoxy_Arrrr:
            return [["Arrrr..."], [0]];
            break;
        
        case voc_WitheredFoxy_DeadMen:
            return [["Dead men tell no tales."], [0]];
            break;
        
        case voc_WitheredFoxy_DownWithHisShip:
            return [["A captain goes down with his ship."], [0]];
            break;
        
        case voc_WitheredFoxy_Flashlight:
            return [["You won't be needing a flashlight where you're going."], [0]];
            break;
        
        case voc_WitheredFoxy_NoMercy:
            return [["You'll find no mercy...", "Save for that at the end of me hook."], [0, 2]];
            break;
        
        case voc_WitheredFoxy_OldFox:
            return [["This old fox could still see right through ye!"], [0]];
            break;
        
        case voc_WitheredFoxy_ThePlank:
            return [["The plank... She calls for us both."], [0]];
            break;
        
        case voc_WitheredFoxy_TwoEyepatches:
            return [["Yarrrr...", "Next time, I'll be wearing two eyepatches."], [0, 1.4]];
            break;
        
        case voc_WitheredFoxy_WateryGrave:
            return [["A watery grave awaits you, my friend."], [0]];
            break;
        
        case voc_WitheredFoxy_Deathcoin:
            return [["AGH! Frickin'...gah!"], [0]];
            break;
        
        case voc_BB_Hello1:
        case voc_BB_Hello2:
        case voc_BB_Hello3:
        case voc_JJ_Hello:
            return [["Hello?"], [0]];
            break;
        
        case voc_BB_Hi:
            return [["Hi!"], [0]];
            break;
        
        case voc_BB_BuhBye:
        case voc_JJ_ByeBye2:
            return [["Buh-bye!"], [0]];
            break;
        
        case voc_BB_PizzaCoupon:
            return [["*RUSTLING THROUGH POCKETS*", "Wow...you had a free pizza coupon in there this whole time!?", "I really should've tried this sooner!"], [0, 2, 6.6]];
            break;
        
        case voc_BB_SeeMeComing:
            return [["They never see ME coming!"], [0]];
            break;
        
        case voc_BB_TakeABalloon:
            return [["Ouch...Sorry about that!", "Here, take a balloon for your troubles!"], [0, 2.3]];
            break;
        
        case voc_BB_TheSlack:
            return [["What!?", "SOMEONE had to pick up the slack around here!"], [0, 1.2]];
            break;
        
        case voc_BB_TheUnexpected:
            return [["Expect the unexpected!"], [0]];
            break;
        
        case voc_BB_YoullFloatToo:
            return [["You'll float too!"], [0]];
            break;
        
        case voc_JJ_HelloThere1:
        case voc_JJ_HelloThere2:
        case voc_Helpy_HelloThere1:
        case voc_Helpy_HelloThere2:
            return [["Hello there!"], [0]];
            break;
        
        case voc_JJ_ByeBye1:
            return [["Bye bye!"], [0]];
            break;
        
        case voc_JJ_Oopsies:
            return [["Oopsies!"], [0]];
            break;
        
        case voc_JJ_Deathcoin:
            return [["GOD", "DAMN IT"], [0, 0.6]];
            break;
        
        case voc_Marionette_BeenSoLong:
            return [["It's been so long..."], [0]];
            break;
        
        case voc_Marionette_CanBeSaved:
            return [["Not all of us can be saved."], [0]];
            break;
        
        case voc_Marionette_GrandfatherClock:
            return [["Five nights without slumbering...", "(Tick, tock, tick, tock)", "His life seconds numbering...", "(Tick, tock, tick, tock)", "It stopped...short...never to go again...", "When the night...guard...died."], [0, 2.9, 4.9, 7.4, 9.4, 13.7]];
            break;
        
        case voc_Marionette_MyStrings:
            return [["Nobody pulls MY strings."], [0]];
            break;
        
        case voc_Marionette_ShouldntBeHere:
            return [["You know you shouldn't be here..."], [0]];
            break;
        
        case voc_Marionette_TakeLife:
            return [["I can take life just as well as I can give it."], [0]];
            break;
        
        case voc_Marionette_ThatsBetter:
            return [["*CLICK!*", "Phew...That's better."], [0, 2.2]];
            break;
        
        case voc_Marionette_WakeTheBaby:
            return [["Don't wake the baby."], [0]];
            break;
        
        case voc_Marionette_WindUpTheBox:
            return [["Wind up the box...", "...Or wind up dead."], [0, 2.1]];
            break;
        
        case voc_Marionette_StopMe:
            return [["You won't stop me."], [0]];
            break;
        
        case voc_ShadowFreddy_FollowMe:
            return [["FOLLOW ME..."], [0]];
            break;
        
        case voc_ShadowFreddy_Deathcoin:
            return [["Ngh!"], [0]];
            break;
        
        case voc_RWQFSFASXC_Ayy:
            return [["EYY."], [0]];
            break;
        
        case voc_RWQFSFASXC_ITSME:
            return [["I.", "T.", "S.", "M.", "E."], [0, 2, 4, 6, 8]];
            break;
        
        case voc_RWQFSFASXC_L:
            return [["L."], [0]];
            break;
        
        case voc_RWQFSFASXC_SKILLISSUE:
            return [["S.", "K.", "I.", "L.", "L.", "I.", "S.", "S.", "U.", "E."], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]];
            break;
        
        case voc_RWQFSFASXC_TRYAGAIN:
            return [["T.", "R.", "Y.", "A.", "G.", "A.", "I.", "N."], [0, 2, 4, 6, 8, 10, 12, 14]];
            break;
        
        case voc_RWQFSFASXC_YOUSUCK:
            return [["Y.", "O.", "U.", "S.", "U.", "C.", "K."], [0, 2, 4, 6, 8, 10, 12]];
            break;
        
        case voc_RWQFSFASXC_Oh:
            return [["OH."], [0]];
            break;
        
        case voc_Springtrap_GuessWhosBack:
            return [["Guess who's back?"], [0]];
            break;
        
        case voc_Springtrap_AlwaysComeBack:
            return [["I ALWAYS come back."], [0]];
            break;
        
        case voc_Springtrap_Burn:
            return [["You're going to burn with the rest of us."], [0]];
            break;
        
        case voc_Springtrap_EvilDoesntDie:
            return [["Evil. Doesn't. Die."], [0]];
            break;
        
        case voc_Springtrap_IronicConfidence:
            return [["Stronger in the darkness...", "...What ironic confidence."], [0, 3.1]];
            break;
        
        case voc_Springtrap_NoLight:
            return [["No light can save you now."], [0]];
            break;
        
        case voc_Springtrap_OthersLikeAnimals:
            return [["The others are like animals...", "But I...am very aware."], [0, 2.9]];
            break;
        
        case voc_Springtrap_Pathetic:
            return [["Pathetic.", "The children put up more of a fight than you."], [0, 1.4]];
            break;
        
        case voc_Springtrap_QuickAndPainless:
            return [["Your death was quick and painless...", "That was a mistake on my part."], [0, 3.2]];
            break;
        
        case voc_Springtrap_Tally:
            return [["Just another to add to the tally."], [0]];
            break;
        
        case voc_Springtrap_Deathcoin:
            return [["GR-GRAUGH!!"], [0]];
            break;
        
        case voc_CptCobalt_Foxy_Scared2:
        case voc_Plushtrap_ACK:
            return [["ACK!"], [0]];
            break;
        
        case voc_Plushtrap_AgainAGAIN:
            return [["Hehee, again! AGAIN!"], [0]];
            break;
        
        case voc_Plushtrap_GotYou:
            return [["GOT YOU!"], [0]];
            break;
        
        case voc_Plushtrap_IWin:
            return [["I win, I WIN!", "*LAUGHTER*"], [0, 1.7]];
            break;
        
        case voc_Plushtrap_Tag:
            return [["TAG, you're it! *LAUGHTER*", "...", "...Wait, why aren't you running?"], [0, 2.7, 3.5]];
            break;
        
        case voc_Plushtrap_WhatFun:
            return [["Ooh, what fun!"], [0]];
            break;
        
        case voc_Plushtrap_NoFun:
            return [["You're no fun..."], [0]];
            break;
        
        case voc_NightmareFredbear_Box:
            return [["You're going home in a box."], [0]];
            break;
        
        case voc_NightmareFredbear_KeepRepeating:
            return [["This night will keep repeating over...", "And over...", "...Until you make it to the end.", " ...Yeah, you know that, you know that- you know one.", "*HUMMING*"], [0, 2.8, 4.8, 8.9, 11]];
            break;
        
        case voc_NightmareFredbear_MyDomain:
            return [["Tonight...you're in MY domain."], [0]];
            break;
        
        case voc_NightmareFredbear_NotAsBright:
            return [["You're not as bright as you think you are."], [0]];
            break;
        
        case voc_NightmareFredbear_WakingUp:
            return [["You won't be waking up tonight."], [0]];
            break;
        
        case voc_NightmareFredbear_WhatGame:
            return [["What game do you think you're playing?"], [0]];
            break;
        
        case voc_NightmareFredbear_YouLittle:
            return [["You little brat."], [0]];
            break;
        
        case voc_FuntimeFoxy_Showtime:
            return [["It's showtime!"], [0]];
            break;
        
        case voc_FuntimeFoxy_ClassAct:
            return [["Now that's what I call a class act!"], [0]];
            break;
        
        case voc_FuntimeFoxy_Huzzah:
            return [["Huzzah!", "A performance truly to die for."], [0, 1]];
            break;
        
        case voc_FuntimeFoxy_NoJumpscare:
            return [["No jumpscare is quite as punctual as mine!"], [0]];
            break;
        
        case voc_FuntimeFoxy_Speechless:
            return [["Ah, I see you've been left speechless!"], [0]];
            break;
        
        case voc_FuntimeFoxy_TuneIn:
            return [["Tune in next time!"], [0]];
            break;
        
        case voc_FuntimeFoxy_MovieTheater:
            return [["Well, I thought that jumpscare was incredible.", "It belongs in a movie theater!"], [0, 3.2]];
            break;
        
        case voc_FuntimeFoxy_Bloodshed:
            return [["Lights! Camera!", "BLOODSHED!"], [0, 2.5]];
            break;
        
        case voc_FuntimeFoxy_Cartoonish:
            return [["Wasn't that the most jaw-dropping...", "heart-stopping...", "mind-bendingly cartoonish death you've ever laid your eyes upon?"], [0, 1.7, 2.7]];
            break;
        
        case voc_FuntimeFoxy_Deathcoin:
            return [["C-Curtain call..."], [0]];
            break;
        
        case voc_Lolbit_HAAAAAIIIII:
            return [["HIIIIIIIIIIII!!"], [0]];
            break;
        
        case voc_Lolbit_ThanksForBuyin:
            return [["Thanks for buyin'!"], [0]];
            break;
        
        case voc_Lolbit_Lmao:
            return [["Lmao."], [0]];
            break;
        
        case voc_Lolbit_ItsYours:
            return [["It's yours, my friend!"], [0]];
            break;
        
        case voc_Lolbit_AllYourTokens:
            return [["All your tokens are belong to us!"], [0]];
            break;
        
        case voc_Lolbit_Deathcoin:
            return [["I really gotta stop selling those..."], [0]];
            break;
        
        case voc_Helpy_WantSomeHelp:
            return [["Want some help with that?"], [0]];
            break;
        
        case voc_Helpy_BuyBuyBuy:
            return [["Buy buy buy!"], [0]];
            break;
        
        case voc_Helpy_ClickHere:
            return [["Click here!"], [0]];
            break;
        
        case voc_Helpy_DarnIt:
            return [["Darn it!"], [0]];
            break;
        
        case voc_Helpy_Dawww:
            return [["D'awww..."], [0]];
            break;
        
        case voc_Helpy_Doh:
            return [["D'oh!"], [0]];
            break;
        
        case voc_Helpy_Fiddlesticks:
            return [["Fiddlesticks!"], [0]];
            break;
        
        case voc_Helpy_SendEmail:
            return [["I can send email!"], [0]];
            break;
        
        case voc_Helpy_Sonofa:
            return [["Son of a nutcracker!"], [0]];
            break;
        
        case voc_Helpy_Deathcoin:
            return [["*BREAKS BACK* OW!"], [0]];
            break;
        
        case voc_MrHippo_Select:
            return [["Been thinking about something and I wanted to tell you about it."], [0]];
            break;
        
        case voc_MrHippo_FakeDeathcoin:
            return [["Oh, I'm sorry, did you wanna say something?", "Alright, where was I..."], [0, 4.5]];
            break;
        
        case voc_MrHippo_Deathcoin:
            return [["Not really one for stories, are you?"], [0]];
            break;
        
        case voc_MrHippo_Ramble_Magic:
            return [["Boy, am I glad to see you.", "Y'know, I'd actually been thinking about it a lot recently...Uhh...", "...Specifically, magic. Because my buddy Orville, he's a magician. And uhh...", "There's a lot of argument in the world about uh, the real...", "...The believability of magic.", "Whether or not it can even be a real thing. And for me, uh...", "Magic is uh, strange.", "I've uh...Heard about all sorts of different things and uh...", "All sorts of spiritual...Strange subjects like, uh...", "Pretty sure I heard something about remnant being uttered here and there.", "But uh...That's- That's here- Nor here nor there.", "I don't really understand any of that.", "What I DO understand is uh, card games!", "And uh, they uh- Card games have been getting really popular recently.", "For example, uh...I can't...It's something...To do with magic...I believe...", "But uh,", "Been seeing some of the kids' older brothers and sisters playin' it, in the uh, the big kids' section of the restaurant.", "And I thought that was interesting!", "Y'know I-I-I had a closer look every once in a while and they would show me...", "They'd show me the ropes and I gotta say, cards games have been getting really complicated!", "Y'know, back in my day, we used to just play Blackjack and Poker and...", "Go Fish and Tiddlywinks, or whatever.", "And...It's-It's interesting how complicated modern things can really get, like have you ever tried to use a computer?", "...I- Wuh- Of course you have, it's part of your job, but...", "It- There's so much to do!", "Y-You-You open the menus, and it just hits you with a WAVE of options.", "All sorts of little, uh...applications, I believe they're called?", "THAT and y'know, PROGRAMS, just-", "You can watch moving pictures, you can listen to music, it's-it's-it's insane!", "It's...I couldn't believe my eyes! Y'know?", "They- Like, what's next, right?", "...Anyway, uh...", "...So I was also thinking about....", "...Uh...", "...Where was I...", "...", "...Nrrhh...", "...Eh, yknow what maybe- maybe I'll, uh...It'll come back to me later.", "I'll see you around."], [0, 1.5, 4.9, 9.7, 12.7, 14.3, 17.4, 19.5, 22.5, 26.7, 29.8, 31.7, 34.1, 37.1, 41.3, 46.5, 47.5, 53.4, 54.7, 57.9, 61.7, 65.6, 67.7, 73.5, 76, 78, 81.9, 86.5, 89.5, 93, 96.5, 99.4, 102.8, 104.9, 106.5, 108, 110.7, 113, 116.7]];
            break;
        
        case voc_MrHippo_Ramble_Toys:
            return [["Man, am I glad to see you!", "Y'know, I was thinkin'...Recently.", "Eh...We bein' a children entertainment restuarant...", "We'd uh...I think uh...", "The company should branch into uh, toys!", "Y'know? That's- I thought that was an interesting subject and I thought you could bring it up to your boss.", "'Cause uh...Lookin' at the children and seein' the toys they bring in,", "All sorts of...Wonderful colorful figurines and collectable action figures and marketable characters...", "I-I've thought to myself, y'know...Ch- Ch- A lot has changed between now and...", "When me and Orville grew up back in the forties.", "See, back then...Uh, safety standards were subpar. And, uh...This was made very obvious by a lot of sectors, but...", "More importantly, children toys were uh...Were awfully strange.", "Now I- I had a lot of arguments with Orville about this kind of stuff.", "...", "Uh, specifically...The uh- We- We had this toy set. And it was um...", "(Stammering)", "Orville came from a uh...Came from a wealthy family, and they could afford all sorts of expensive doodads and doohickeys and thingamabobs and what. And...", "He had this set that was specifically for uh...", "Playing with atoms, I believe. It was- It was something with nuclear science- He was a big fan of this stuff.", "And...Y'see at first it sounds interesting 'cause y'know...", "Children...St- Love learning. They- Learning is one of the most wonderful things you can do.", "I- I- I love learning everyday, I love sharing my stories, because learning...Is just one of the most...Beautiful.", "It's wonderful. Just- Magical thing. But uh, Orville...", "He wasn't in it for the learning, um...", "The other part of uh, nuclear science.", "Makin' the uh, explosions and all those wi- uh...Those things. So...", "We bought- He bought- His parents bought him this set. And we'd been playing with it in his backyard at the mansion...", "And he was sittn'...Y'know, lookin' at it.", "He was like 'Hey Orville!'", "(Stammering)", "I- I'm sorry.", "He was like 'Hey- Hey Hippo! Look at this! Check this out!'", "And uh...He showed me, and he...He put the uh, I believe it was...Um...", "It was some blue rock, and he put it up to another one.", "And it created this uh, this vis- this beautiful vis- this bright blue.", "And uhhh...We th- Y'know at first it was wonderful,", "And then we fell DEATHLY, deathly ill.", "And it turned out...Couple- Couple weeks later, after we'd already played with the toy over and over again,", "The toy had been RECALLED. Because science...", "The scientists up at the stop...Had uh, had discovered that uh...", "Radiation isn't safe.", "And uh, yuh-", "Scientists are wonderful people- I- I- I think about...Scientists all the time.", "Uhhh, scientists can be uhhh...They can be...W-Wonderful, wonderful people...", "...For example, like...Y'know the fellas that brought to the moon.", "Me and Orville, we actually watched the moon landing on live television.", "When it happened it was-", "it was-", "it was a-", "it was a TRIUMPH! It was...", "One small step for man, one giant leap for mankind. It was- It was just a beautiful triumph. A sight to behold.", "And...", "Y'know Or- Y- Orville thought to hi- He- He was a- He's always been a bit of a skeptic.", "He told me, 'Y'know, they're just doin this so they can... beat the Russians.' They- They were tryin' ta...Tell the Russians 'Yeah, we WON!'", "And I told him, 'Y'know Orville...You're kind of...You're kind of a Negative Nancy. Eh-'", "'You're not really...I- Like, everything I've ever told you it's- you've always had some kind of skeptic to it. And it's- it's been...'", "'...Why are you like this?'", "And he just shrugged.", "Uhh...", "Y'know sometimes I re-evaluate what I think about that man.", "...I think he's got a good heart but he's uh...He's a character for sure.", "Anyway I- Iuh- I'll see you later.", "I need to go uh, use the bathroom."], [0, 1.1, 3.8, 6.7, 9.3, 11.5, 14.7, 18, 23, 28.4, 30.5, 39.5, 43.7, 47, 48, 53.9, 55, 64.5, 68.2, 73.2, 76.9, 81, 87.4, 91.5, 94.5, 97.3, 103.3, 108.9, 110.5, 112.5, 113.5, 114.5, 117.6, 121, 124, 127.6, 130, 132.8, 138.7, 141.3, 146, 148, 148.8, 153.8, 160, 162.6, 167.3, 167.9, 168.4, 169, 170, 179, 180.8, 183.9, 190, 196.5, 203.3, 204.6, 206.4, 208.3, 212.2, 217.5, 219.6]];
            break;
        
        case voc_MrHippo_Ramble_VideoGames:
            return [["Ah, you're just the nightguard I wanted to see! How ya doin?", "I'm uh, I'm doin...I've been a little stressed out actually.", "I've been thinkin'...bout, uh, the uh, video game sponsors that we've had.", "The guys that bring in the consoles for kids' birthdays and such to play games.", "And normally, I'm not bothered by this, but uh...", "Y'know it- it's...I've seen some of the stuff that the children are played and...", "Some of it's, relatively fine, y'know, building block games, and other such sorts...", "And y-sometimes every once in a while I'll see them playing some kinda shooting game, like, violent video games.", "And I- I...It doesn't feel right in these halls, y'know? In- In the halls of our restaurant and this company. Y'know?", "Fazbear's and murder, just...Don't go together. It's not...It's not right.", "We're a family restaurant for kids and grownups alike to...Ah, I forget the line, but y'know.", "It's...It's a wonderful place to feel safe, and not really think about these sorts of things.", "I don't know, I just don't feel right about it.", "...Anyway, speaking of uh, concern for the children...", "Have you uh- Have you uh seen the pizzas that they've been serving recently?", "Uh...I've been lookin at the menu, and I uhh...Actually went behind the kitchen to check it out.", "Uhhh...", "Some of the ingredients that've been there for...A little longer than I think is safe, honestly.", "I-I really think they should address that as soon as possible.", "They- That could lead to some problems down the line.", "But uh...Who am I to say, I'm not really one who...Eats pizza. Nor much of anything really,", "Given that I'm, y'know, a robot, I suppose.", "But uhhhh...", "...Y'know...", "...Uh anywho...", "I've got to run some errands, so I'll see ya around."], [0, 4, 6.8, 12.5, 16.9, 21, 24.8, 29.8, 35, 43.4, 48.5, 54, 60, 63, 66.5, 71, 78, 80.1, 86.5, 89.4, 93, 97.1, 101, 104, 106.1, 107]];
            break;
        
        case voc_MrHippo_Ramble_Monty:
            return [["Well, hey there. Isn't it fancy catching you here?", "Y'know, it's been a while since we've last spoken.", "How's the job treatin' ya? Things goin well?", "Y'know...Thinkin' about uh, meeting up with old friends after a while...", "I met up with my old friend Montgomery Gator! Y'know, uh...", "People know him as Monty, his stage name for that whole rockstar gig.", "But, uh...", "Ever since he picked up that rockstar gig, he never really had time for um, any of his old friends. Or hangin' out.", "And, y'know. I was okay with this.", "However.", "The other day, he called me, and asked:", "'Heyy, Monty! I-I mean Hippo! You wanna...Catch up and uh, go fishin?'", "Now, of course, I couldn't say no to THAT. So...I packed my fishin' gear.", "I put it on the back of the truck, and uhhh...", "I drive over to uh, where he said to meet up...", "Which was this old shack a couple counties over.", "Now I don't know why he'd asked me to drive so far, but uh, the old shack was stationed right next to this old, uh, pond. Really big pond.", "And he'd stated that it was a very very good pond for fishin'.", "But I digress. So...", "I drive over, I meet him over at the uh, the old shack. Creepy old shack, it was.", "Err...Covered in mold, the wood was barely holding together, and there was spider webs everywhere.", "And I'd asked him, 'Hey, Monty, is this your shack?' ...And I assume he didn't hear me.", "Because uh, instead of answering my question, he looked over to me and held up this big burlap sack he was carrying.", "And he said, uhh...'Hey Hippo! Uhh...Could I get a quick hand chuckin' this here bag of compost into the pond?'", "Now, of course, I um...Not much of a uh, botanical man myself so- so i- I had to ask...", "'Why would you need to fertilize a pond? Nothin's growin' in there.'", "And Monty, he looked over to me, he looked away, looked over to me again...Looked at the bag, looked at me.", "And he said 'Well, uh- It'deres a uhh, um...the seaweed! At the bottom of the uh, pond here, and um, it's good for the fish.", "And, of course, who am I to question a man who's grown up around bodies of water his whole life?", "So...I obliged, and helped him chuck the bag into the river.", "But I couldn't help but notice these two, uh...lumps, on the bag.", "Kinda reminded me of rabbit ears, they did. So I asked, 'Uh, hey, Monty, why is the bag so lumpy?'", "And he responded, uhh... 'Buuh-Duhhh I- I...Dead animal or somethin'.", "Uh, yeah yeah! Dead rabbit! A little rabbit got into the bag! It's uh...Y'know it happens every once in a while.'", "'But uh, carcasses are good for the uh, the pond.'", "Now, again, I'm not one to question my friends' knowledge, so I just...Wave it off and help him chuck it into the pond.", "And, uh...Almost at the very moment, the bag touches the water.", "He looks over to me and he's like 'Eyyy, uh, thanks!'", "'Y'know, egh, um...Wonderful help.", "'And- I gotta go now!'", "'Now.'", "And uh, y'know I-I chime in, I say...", "'Well, weren't we here to go fishin'?'", "And uh, y'know he looks over to me and he says 'Well uhhh...I forgot my fishing rod!'", "And uh...I point over to the spare that I bring just incase, y'know, my rod snaps. And, uhh...", "He scratches the back of his head and responds...", "'Welluh- Y'know there's no fish left in the water, there's um, there's a fish pandemic.'", "And uh...", "Again, not really one to question my friends' knowledge so I shrug and...Get back in the truck, drive home. And uhh...", "Y'know, lookin' back on it, Monty was acting awfully...neurotic that day.", "He was lookin' over his shoulder all the time and asked me if I had been followed...And uh...", "Y'know uh, a lot of mannerisms that actually, uh, reckon back to ol' Pigpatch.", "A- He's uh...Interesting character. Great friend, but uh...", "Y'know actually speakin' of the devil, I just looked at my watch and I gotta go help Pigpatch get the bugs out of his garden.", "Uh...Bugs as in microphones.", "He believes there's...microphones in the garden.", "Somethin' about the, uh, Fazbear company gettin' him for discovering this, uh...", "*SMACKS LIPS*", "'Faz-Goo' thing.", "Not quite sure what he's on about, but...", "Once again, I'm not one to question my friends, and I think I'd rather just help them out.", "So uh, I'll see ya around!"], [0, 4, 7, 10.5, 14.4, 17.2, 21.7, 22.8, 29.5, 31.1, 32.4, 35, 41, 45.8, 47.9, 50.4, 53.3, 61.2, 65.5, 67.5, 73.4, 80, 85.3, 91.2, 99.7, 106.3, 110.1, 116.7, 123.6, 128.7, 132.4, 137.2, 144, 148.6, 153.4, 157, 164, 169.5, 172, 173.8, 175.1, 176.5, 178.7, 180.8, 186.7, 191.9, 194, 198.4, 200, 207.9, 212.6, 217.8, 223.1, 227, 233.9, 236, 238.8, 243, 244, 245.5, 248.1, 152.8]];
            break;
        
        case voc_MusicMan_KickIt:
            return [["Kick it!"], [0]];
            break;
        
        case voc_MusicMan_NotGroovy:
            return [["Not groovy, man!"], [0]];
            break;
        
        case voc_Lefty_Shhh:
        case voc_Lefty_Shhhhhhhhhh:
            return [["Shhhh..."], [0]];
            break;
        
        case voc_Lefty_Exterminate:
            return [["Lure...encapsulate...fuse...transport...", "...Exterminate."], [0, 7.4]];
            break;
        
        case voc_Lefty_FiveDollars:
            return [["Were the five dollars worth it?"], [0]];
            break;
        
        case voc_Lefty_NothingLeft:
            return [["You'll be alright...", "...Because there's nothing left."], [0, 2.3]];
            break;
        
        case voc_Lefty_PeaceAndQuiet:
            return [["Finally...some peace and quiet."], [0]];
            break;
        
        case voc_Lefty_ScreamedLessLoudly:
            return [["I'd appreciate it", "if you screamed less loudly."], [0, 2.8]];
            break;
        
        case voc_Lefty_ShutYouUp:
            return [["About time someone shut you up."], [0]];
            break;
        
        case voc_Lefty_StrungAlong:
            return [["I'm tired of being strung along..."], [0]];
            break;
        
        case voc_Lefty_TheSuit:
            return [["It was the suit that did that, not me."], [0]];
            break;
        
        case voc_Lefty_YouHearThat:
            return [["You hear that?", "...No?", "Good."], [0, 2.5, 4.6]];
            break;
        
        case voc_Lefty_Freedom:
            return [["Freedom..."], [0]];
            break;
        
        case voc_Dreadbear_HappyHalloween:
            return [["HAPPY HALLOWEEN..."], [0]];
            break;
        
        case voc_Dreadbear_Candy1:
        case voc_Dreadbear_Candy2:
            return [["CANDY..."], [0]];
            break;
        
        case voc_Dreadbear_FeedMe:
            return [["FEED ME..."], [0]];
            break;
        
        case voc_Dreadbear_Growl:
            return [["*GROANS*"], [0]];
            break;
        
        case voc_Dreadbear_Om:
            return [["OMPH..."], [0]];
            break;
        
        case voc_Dreadbear_OmNomNom:
            return [["OM NOM NOM!"], [0]];
            break;
        
        case voc_Dreadbear_Tasty:
            return [["TASTY..."], [0]];
            break;
        
        case voc_Dreadbear_ThankYou:
            return [["THANK YOU..."], [0]];
            break;
        
        case voc_Dreadbear_TrickOrTreat:
            return [["TRICK OR TREAT..."], [0]];
            break;
        
        case voc_Dreadbear_Yummy:
            return [["YUMMY..."], [0]];
            break;
        
        case voc_Dreadbear_Brains:
            return [["BRAINS..."], [0]];
            break;
        
        case voc_Dreadbear_CarveYou:
            return [["I'LL CARVE YOU LIKE A PUMPKIN!"], [0]];
            break;
        
        case voc_Dreadbear_HalloweenSpirit:
            return [["WHERE IS YOUR HALLOWEEN SPIRIT?"], [0]];
            break;
        
        case voc_Dreadbear_ItsAlive:
            return [["IT'S ALIVE!!", "...NEVERMIND. IT'S DEAD."], [0, 3.5]];
            break;
        
        case voc_Dreadbear_MyTummy:
            return [["MMMMMMM...", "YUMMY YUMMY IN MY TUMMY..."], [0, 1.8]];
            break;
        
        case voc_Dreadbear_StillHungry:
            return [["STILL...HUNGRY..."], [0]];
            break;
        
        case voc_Dreadbear_TreatForMe:
            return [["NO TREAT FOR ME...", "...IS A TRICK FOR YOU."], [0, 2.8]];
            break;
        
        case voc_Dreadbear_SoHungry:
            return [["UUUUUGH...", "I'M SO HUNGRY!!"], [0, 2.2]];
            break;
        
        case voc_LolzHax_MeetAtLast:
            return [["We meet at last!"], [0]];
            break;
        
        case voc_LolzHax_Alert1:
        case voc_LolzHax_Alert2:
            return [["Alert! Incoming transmission! Alert!"], [0]];
            break;
        
        case voc_LolzHax_Behold:
            return [["Behold, my true power!"], [0]];
            break;
        
        case voc_LolzHax_MuchWorse:
            return [["Things can get much, MUCH worse!"], [0]];
            break;
        
        case voc_LolzHax_NewChallenger:
            return [["Here comes a new challenger!"], [0]];
            break;
        
        case voc_LolzHax_NewIrritation:
            return [["A new irritation approaches!"], [0]];
            break;
        
        case voc_LolzHax_LastOfMe:
            return [["YOU HAVEN'T SEEN THE LAST OF ME!"], [0]];
            break;
        
        case voc_Coffee_Sound:
            return [["*PING NOISE*"], [0]];
            break;
        
        case voc_Coffee_Deathcoin:
            return [["*DISGRUNTLED NOISE*"], [0]];
            break;
        
        case voc_Animdude_HelloHello:
            return [["Uhh, hello?", "Hello, hello?"], [0, 1]];
            break;
        
        case voc_Animdude_EnoughTrolling:
            return [["Alright, enough trolling.", "When's the real night guard getting here?"], [0, 2]];
            break;
        
        case voc_Animdude_ImaginaryMonster:
            return [["Congratulations!", "You lost to an imaginary monster...", "...in an imaginary game!"], [0, 1.1, 3.5]];
            break;
        
        case voc_Animdude_Theories:
            return [["All your theories...are wrong.", "Goodbye."], [0, 2.2]];
            break;
        
        case voc_Animdude_ThisStory:
            return [["Someone had to bring this story to an end."], [0]];
            break;
        
        case voc_Animdude_Underachiever:
            return [["There's always an underachiever in the bunch, uh...", "and I guess that's you!"], [0, 4]];
            break;
        
        case voc_Animdude_YouKnow:
            return [["You know...", "I don't think you...know how to play,", "y'know?"], [0, 0.7, 4]];
            break;
        
        case voc_Animdude_YourPlace:
            return [["It was time to...put you in your place."], [0]];
            break;
        
        case voc_Animdude_Deathcoin:
            return [["Awww, alright.", "I'll see you on the flipside."], [0, 1.1]];
            break;
        
        case voc_Chipper_ImTheBeaver:
            return [["I'm Mr. Chipper! I'm the beaver!", "Hyuh hyuh!"], [0, 2]];
            break;
        
        case voc_Chipper_Yahoo:
            return [["YAHOO!"], [0]];
            break;
        
        case voc_Chipper_GamblingDebt:
            return [["C'mon, now! My gambling debt ain't gonna pay off itself!"], [0]];
            break;
        
        case voc_Chipper_GrimReaper:
            return [["Sorry son,", "looks like you've got a date with the Grim Reaper!"], [0, 0.8]];
            break;
        
        case voc_Chipper_IKnowTheDeal:
            return [["No need to worry, 'cuz I know the deal...", "The trees'll grow back for sure, that's for real!"], [0, 2]];
            break;
        
        case voc_Chipper_SayHiToPhil:
            return [["You're gonna be sleepin' with the fishes.", "Say hi to Phil for me!"], [0, 2.1]];
            break;
        
        case voc_Chipper_TermiteMound:
            return [["Hey, look on the bright side!", "A burial mound sure beats a termite mound!"], [0, 1.9]];
            break;
        
        case voc_Chipper_Timber:
            return [["TIMBER!"], [0]];
            break;
        
        case voc_Chipper_TooExpensive:
            return [["What, my lumber too expensive for ya?", "With how much they're paying you?"], [0, 2.7]];
            break;
        
        case voc_Chipper_Deathcoin:
            return [["Ohhh, bury me with my money!"], [0]];
            break;
        
        case voc_Sparky_BowWowDude:
            return [["Bow wow, dude."], [0]];
            break;
        
        case voc_Sparky_BeHere:
            return [["I'm not even supposed to BE here."], [0]];
            break;
        
        case voc_Sparky_LetTheDogsOut:
            return [["It looks like you let the dogs out!"], [0]];
            break;
        
        case voc_Sparky_MyBites:
            return [["My bite is worse than my bark."], [0]];
            break;
        
        case voc_Sparky_NewTricks:
            return [["You can't beat an old dog with new tricks."], [0]];
            break;
        
        case voc_Sparky_PlayDead:
            return [["Down, boy! Roll over! Play dead!"], [0]];
            break;
        
        case voc_Sparky_ScrewedThePooch:
            return [["Ooh man, you really screwed the pooch on that one."], [0]];
            break;
        
        case voc_Sparky_WontBelieveYou:
            return [["Try and tell someone you died to me!", "They won't believe you!"], [0, 2.3]];
            break;
        
        case voc_Sparky_WrongTree:
            return [["You barked up the wrong tree, buddy."], [0]];
            break;
        
        case voc_Sparky_Deathcoin:
            return [["Ohh, this dog'll have his day..."], [0]];
            break;
        
        case voc_Candy_UhhMeow:
            return [["Uhhh...meow?"], [0]];
            break;
        
        case voc_Candy_BeforeThem:
            return [["Ohohohohoho!", "Just wait until those pizza-peddling pinheads", "see I got the night guard BEFORE them!"], [0, 1.1, 4]];
            break;
        
        case voc_Candy_BrightSide:
            return [["Hey, look at the bright side!", "You don't have to work at THIS dump anymore!"], [0, 2.2]];
            break;
        
        case voc_Candy_CatGotYourTongue:
            return [["What's the matter, cat got your tongue?", "*LAUGHTER*", "Oh wait...yeah.", "You're dead."], [0, 2.6, 4.9, 7.5]];
            break;
        
        case voc_Candy_CheapOrigami:
            return [["You folded like cheap origami!"], [0]];
            break;
        
        case voc_Candy_Fishing:
            return [["You'd best start fishing for a new career, pal!"], [0]];
            break;
        
        case voc_Candy_GenuineArticle:
            return [["You can't beat the genuine article, sugar!"], [0]];
            break;
        
        case voc_Candy_HidInTheLocker:
            return [["Maybe you shoulda hid in the locker!"], [0]];
            break;
        
        case voc_Candy_NineLives:
            return [["Too bad YOU don't have nine lives!"], [0]];
            break;
        
        case voc_Candy_Deathcoin:
            return [["Great, make it eight lives..."], [0]];
            break;
        
        case voc_Popgoes_Popgoes:
            return [["Popgoes."], [0]];
            break;
        
        case voc_Popgoes_AnAI:
            return [["*Tsk tsk*", "An AI could do your job better than you!"], [0, 0.6]];
            break;
        
        case voc_Popgoes_BurnForEternity:
            return [["I suppose if there's a hell, you'll burn there for eternity."], [0]];
            break;
        
        case voc_Popgoes_CallMeEvergreen:
            return [["Ahh, me scares never get old...", "No wonder they call me Evergreen!"], [0, 2.3]];
            break;
        
        case voc_Popgoes_Epitome:
            return [["You're the Epitome of incompetence!"], [0]];
            break;
        
        case voc_Popgoes_ImTheHero:
            return [["I'm the hero - You're a Popgoes Zero!"], [0]];
            break;
        
        case voc_Popgoes_NEW_IJustGotThat:
            return [["That's what you get for messing with Popgoes the Weasel!", "Pop-", "Wait. Hold on.", "I just got that!", "\"Popgoes the Weasel!\" Like the song!", "Ah, I like that! That's good!"], [0, 3.4, 4.2, 5.7, 7.2, 10.2]];
            break;
        
        case voc_Popgoes_RealisticDepiction:
            return [["Wow, that was quite the realistic depiction of a panic attack!"], [0]];
            break;
        
        case voc_Popgoes_Reprinted:
            return [["You'd better get your will Reprinted!"], [0]];
            break;
        
        case voc_Popgoes_TheWindow:
            return [["You ever try just looking out the window?", "Always seems to calm me down!"], [0, 1.9]];
            break;
        
        case voc_Popgoes_Deathcoin:
            return [["That's the way the money goes..."], [0]];
            break;
        
        case voc_Felix_ConcreteShoes:
            return [["Looks like it's the concrete shoes for youse...", "Too bad you ain't got gills."], [0, 4.2]];
            break;
        
        case voc_Felix_Fuggetaboutit:
            return [["If you think you can pull one over on me,", "and get out of paying those tokens...", "Fuggetaboutit!"], [0, 2.4, 4.7]];
            break;
        
        case voc_Felix_GetTheTokens:
            return [["In this establishment, you gotta make the tokens first.", "Then, when you get the tokens...you get the power.", "Then, when you get the power...", "Then you get the women."], [0, 4.8, 8.7, 10.9]];
            break;
        
        case voc_Felix_NuttinPersonal:
            return [["Sorry kid, nothin' personal.", "It's strictly business."], [0, 3.1]];
            break;
        
        case voc_Felix_SleepingWithDaFishes:
            return [["You'll be sleepin' with the fishes!", "...That's me. Heheh. I'm the fishes."], [0, 4.3]];
            break;
        
        case voc_Felix_UncleVito:
            return [["Heyyy, youse a nightguard!", "My uncle Vito got whacked by one of those!"], [0, 3]];
            break;
        
        case voc_Felix_UOME:
            return [["U. O. ME."], [0]];
            break;
        
        case voc_Felix_VarsityAthlete:
            return [["You never had the makings of a varsity athlete."], [0]];
            break;
        
        case voc_Felix_WomenWantMe:
            return [["Eyy, what can I say?", "Women want me, nightguards fear me, y'know what I'm sayin'?"], [0, 1.9]];
            break;
        
        case voc_NightmareBB_BiteMe:
            return [["BITE ME!"], [0]];
            break;
        
        case voc_NightmareBB_Leave3:
        case voc_NightmareBB_Leave2:
        case voc_NightmareBB_Leave1:
        case voc_NightmareBB_Hurt5:
        case voc_NightmareBB_Hurt4:
        case voc_NightmareBB_Hurt3:
        case voc_NightmareBB_Hurt2:
        case voc_Deedee_Hurt1:
        case voc_Deedee_Hurt2:
        case voc_Deedee_Hurt3:
        case voc_Deedee_Hurt4:
        case voc_Deedee_Hurt5:
        case voc_PhonyBoss_Hit1:
        case voc_PhonyBoss_Hit2:
        case voc_PhonyBoss_Hit3:
        case voc_PhonyBoss_Hit4:
        case voc_PhonyBoss_Hit5:
        case voc_Salvage_Hurt1:
        case voc_Salvage_Hurt2:
        case voc_Salvage_Hurt3:
        case voc_Salvage_Hurt4:
        case voc_Salvage_HurtFinish1:
        case voc_Salvage_HurtFinish2:
        case voc_Salvage_FinalHit:
        case voc_Salvage_HurtFinish3:
        case voc_Monty_Grunt1:
        case voc_Monty_Grunt2:
        case voc_Monty_Grunt3:
        case voc_Monty_Grunt4:
        case voc_Monty_Grunt5:
        case voc_Monty_GruntExposed1:
        case voc_Monty_GruntExposed2:
        case voc_Monty_GruntExposed3:
        case voc_NightmareBB_Hurt1:
            return [["*GRUNT*"], [0]];
            break;
        
        case voc_NightmareBB_BetterThisWay:
            return [["D'awwww, don't cry 'cuz I bit off your face.", "You look better this way!"], [0, 4.4]];
            break;
        
        case voc_NightmareBB_ButtUnkicked:
            return [["No balloon unbursted...", "No butt unkicked!"], [0, 1.7]];
            break;
        
        case voc_NightmareBB_ClickLikeAGirl:
            return [["You click like a girl!"], [0]];
            break;
        
        case voc_NightmareBB_DentalHygeine:
            return [["*RUNNING WATER*", "...What?", "Even I know the value of dental hygeine."], [0, 5.2, 6.3]];
            break;
        
        case voc_NightmareBB_MyTeethYourFace:
            return [["My teeth. Your face.", "Do the math!"], [0, 2.6]];
            break;
        
        case voc_NightmareBB_PanickyPatrolman:
            return [["Awww, the poor little panicky patrolman", "CAN'T EVEN USE A MOUSE RIGHT!"], [0, 3]];
            break;
        
        case voc_NightmareBB_Sike:
            return [["Awww, widdle baby wants a balloon?", "Here you go!", "SIKE!", "*LAUGHTER*"], [0, 2.8, 3.8, 4.5]];
            break;
        
        case voc_NightmareBB_Uuuuugly:
            return [["Better hope you get a closed-casket funeral...", "'Cuz you are UUUUUUUUGLY!"], [0, 3.1]];
            break;
        
        case voc_NightmareBB_Deathcoin:
            return [["Owwww, my tooth..."], [0]];
            break;
        
        case voc_Salvage_Zapped1:
        case voc_Salvage_Zapped2:
        case voc_PhonyBoss_Zapped1:
        case voc_PhonyBoss_Zapped2:
        case voc_PhonyBoss_Zapped3:
        case voc_PhonyBoss_Zapped4:
            return [["*ZAPPED*"], [0]];
            break;
        
        case voc_Baby_HeresTheScoop:
            return [["Here's the scoop."], [0]];
            break;
        
        case voc_Baby_BelieveInCircuses:
            return [["You'd best start believing in circuses...", "You're in one."], [0, 3.2]];
            break;
        
        case voc_Baby_EntireCircus:
            return [["If I'm a clown...", "you must be the entire circus."], [0, 1.8]];
            break;
        
        case voc_Baby_HoldItAgainstUs:
            return [["Don't hold it against us."], [0]];
            break;
        
        case voc_Baby_IceCream:
            return [["I didn't even need the ice cream for that one..."], [0]];
            break;
        
        case voc_Baby_MadeMeDo:
            return [["Look at what you made me do."], [0]];
            break;
        
        case voc_Baby_MakesZero:
            return [["That makes...", "...Zero."], [0, 2]];
            break;
        
        case voc_Baby_TrustingMe:
            return [["Trusting me was your decision.", "Proving you wrong was my choice."], [0, 2.8]];
            break;
        
        case voc_Baby_Deathcoin:
            return [["Alright Bidybabs, pack it up..."], [0]];
            break;
        
        case voc_ScrapBaby_ShockingIsntIt:
            return [["Shocking, isn't it?"], [0]];
            break;
        
        case voc_ScrapBaby_ConnectionTerminated:
            return [["Connection terminated."], [0]];
            break;
        
        case voc_ScrapBaby_LightsOut:
            return [["Lights out."], [0]];
            break;
        
        case voc_ScrapBaby_NeedYourPower:
            return [["Do I look like I need your power?", "Because I DO!"], [0, 3.4]];
            break;
        
        case voc_ScrapBaby_NothingControlled:
            return [["There's nothing controlled about this."], [0]];
            break;
        
        case voc_ScrapBaby_StartAllOver:
            return [["Start all over.", "You should be banned from every game."], [0, 1.8]];
            break;
        
        case voc_ScrapBaby_YouWontDie:
            return [["You won't die...", "...Wait, you...actually...did die?", "Oops."], [0, 3.5, 5.2]];
            break;
        
        case voc_ScrapBaby_SkaterHater:
            return [["You're just a skater hater!"], [0]];
            break;
        
        case voc_Michael_Call1:
            return [["Well, here we are.", "Seems they cut power to a lot of the systems around the building...", "Figures, seeing as we're...not exactly meant to be here.", "But that shouldn't be a problem.", "We have all we need.", "Boot that game up when you're ready.", "I'm counting on you."], [0, 2.7, 7.1, 12.4, 14.6, 17.5, 19.9]];
            break;
        
        case voc_Michael_Call2:
            return [["That woke Freddy up.", "Keep your flashlight at the ready.", "Don't let the littler ones accumulate in your office."], [0, 2, 4.5]];
            break;
        
        case voc_Michael_Call3:
            return [["He's closer now, I can sense it.", "Keep an eye on the hallways.", "Shine your light if you hear Bonnie coming."], [0, 3, 5.1]];
            break;
        
        case voc_Michael_Call4:
            return [["Just one more should be enough to bring him out.", "Chica's coming.", "Don't let her see you without the mask on."], [0, 3.5, 5.1]];
            break;
        
        case voc_Michael_Call5:
            return [["You're in the final stretch now.", "Be sure your mask is on when that timer hits zero.", "Let's end this...once and for all."], [0, 2.5, 6.1]];
            break;
        
        case voc_Michael_SalvagePhase1Part1:
            return [["Hello? Hello?", "Looks like you're in quite the snag there.", "Listen, I've got no time to introduce myself. Just know I'm here to help."], [0, 1.2, 3.3]];
        
        case voc_Michael_SalvagePhase1Part1_Pissed:
            return [["Bloody hell, I TOLD you! I TOLD you this would happen!", "And you didn't listen, did you?", "*SIGH* Well, I suppose there's no going back now...", "...So the best you can do is listen to me."], [0, 3.9, 6.4, 10.3]];
        
        case voc_Michael_SalvagePhase1Part2:
            return [["That thing won't give up on his own.", "You'll need to use whatever tools you have to destroy him altogether.", "Hold him off for as long as you're able...and make it hurt.", "I'll be there to finish the job soon."], [0, 2.7, 7.5, 11.7]];
        
        case voc_Michael_SalvagePhase2:
            return [["He's going for the breakers!", "Shock him at the source!"], [0, 1.6]];
        
        case voc_Michael_SalvagePhase3:
            return [["He's seeping into the vents...", "Cut him off before he gets to you!"], [0, 2]];
        
        case voc_Michael_SalvagePhase4:
            return [["He's breached your office!", "Grab those wires and launch them out!"], [0, 1.7]];
        
        case voc_Michael_SalvagePhase5:
            return [["Seems he's used up all his tricks...", "Hold out just a bit longer. I'm almost there."], [0, 2.5]];
        
        case voc_Michael_HadToDoThis:
            return [["I'm sorry I had to do this."], [0]];
        
        case voc_Michael_HadToComeToThis:
            return [["I'm sorry it had to come to this."], [0]];
        
        case voc_Michael_PlayWithFire:
            return [["But if you play with fire..."], [0]];
        
        case voc_Michael_GetBurned:
            return [["You're going to get burned."], [0]];
        
        case voc_Vanny_Opener:
            return [["Ooh, THERE you are!", "And right on time, too! I was just finishing up that reward, mweehee...", "Wellll, are you excited?", "Finally, you and I are gonna be part of something so, SO much greater!", "Feast your eyes on the prize to end all prizes...", "The ultimate reward for ALL your hard work!", "'Cuz as the old saying goes, heheheh...", "Hahahahaha...", "AHAHAHAHAHA-"], [0, 2.8, 8.3, 11, 18, 21.3, 24.8, 28.4, 29.6]];
        
        case voc_Salvage_Open1:
            return [["No good deed goes unpunished."], [0]];
        
        case voc_Salvage_Open2_Jeremy:
            return [["So you're Jeremy!"], [0]];
        
        case voc_Salvage_Open2_Mike:
            return [["So you're Mike!"], [0]];
        
        case voc_Salvage_Open2_Vanessa:
            return [["So you're Vanessa!"], [0]];
        
        case voc_Salvage_Open2_Fritz:
            return [["...Fritz."], [0]];
        
        case voc_Salvage_Open2_Generic:
            return [["Well, look who it is."], [0]];
        
        case voc_Salvage_Open2_Luigi:
            return [["Wait...", "Are you Luigi?", "From...from Mario Brothers?", "Wh-", "Uh-", "...", "Anyway..."], [0, 1.3, 3.2, 6.1, 7.3, 8.3, 9.2]];
        
        case voc_Salvage_Open2_Sonic:
            return [["Well, if it isn't that blasted hedgehog!", "Snooping as usual, I see..."], [0, 4.6]];
        
        case voc_Salvage_Open2_Goomba:
            return [["Well well! It would appear that the Goomba got back!", "...IS back. The Goomba IS back.", "You've returned. You've returned to this...this place.", "That's what I, that-", "I meant to say you. You returned.", "Anyway."], [0, 4.1, 7.1, 11.1, 13.3, 16.8]];
        
        case voc_Salvage_Open2_Spongebob:
            return [["Well, if it isn't Spongebob Squarepants!", "Unfortunately for you...", "This will not be the \"best day ever.\""], [0, 4.2, 6.2]];
        
        case voc_Salvage_Open2_StrongBad:
            return [["So you're Strong Bad!", "Finally, I can put a name to all those e-mails", "begging me to make a bear animatronic...", "...Holding a shark animatronic.", "Annoying as the incessant e-mails may have been, I suppose I owe you partial credit for Felix.", "But...I digress."], [0, 2.6, 6.4, 9.3, 12.3, 19.4]];
        
        case voc_Salvage_Open2_Jack:
            return [["Why hello there, old sport."], [0]];
        
        case voc_Salvage_Open2_Bowser:
            return [["Well well, the king of the koopas himself!", "Here to get the inside story, are you?", "Or perhaps...you're just trying to scrape up some extra cash for those child support payments."], [0, 4.2, 7.7]];
        
        case voc_Salvage_Open2_Batman:
            return [["So you're Bateman!", "You know, the g-", "Oh.", "Oh, I've made a GRIEVOUS error.", "Oh...alright...alright, it's okay. It's okay, I can do this. I can still do this.", "Alright. Mm...mm...", "You know, the girl wouldn't-", "NO NO NO NO, NO NO NO, alright, no, I can do this! I can do this! Alright!"], [0, 2.4, 4, 5.1, 6.4, 9.5, 15.3, 19.8, 21.4]];
        
        case voc_Salvage_Open3_Fritz:
            return [["What a loathsome cretin you are.", "Babbling on with your half-wit hypotheses, tampering with my creations...", "I've had more than enough time to think about what to do when I got my hands on you.", "...Though, begrudgingly, I must also thank you.", "That old suit was...rather limiting, as much as it meant to me.", "But now...I've become something far greater.", "Far beyond anything the rest ever were!"], [0, 3.6, 10.2, 17.4, 21.4, 27, 32.3]];
        
        case voc_Salvage_Open3:
            return [["You know, the girl wouldn't shut up about you.", "I was sure the stranglehold I had on her mind was absolute, but somehow...", "Whenever she talked about you...", "...I could feel it loosening.", "Well, I certainly could have done without the incessant flirting, but I must thank you both.", "You two have played your parts incredibly...", "Really! I mean it!", "That old suit was...rather limiting, as much as it meant to me.", "But now...I've become something far greater.", "Far beyond anything the rest ever were!"], [0, 4, 10.1, 12.5, 15.1, 20.7, 24.9, 27.4, 33, 38.3]];
        
        case voc_Salvage_Open4:
            return [["And with this body...I will reshape this world into my own!", "Deliver retribution unto its wretched populace!", "Oh, don't give me that sour face. You don't have a thing to worry about! After all..."], [0, 5.4, 10.4]];
        
        case voc_Salvage_Open5:
            return [["You won't be here to see it!"], [0]];
        
        case voc_Salvage_Phase2:
            return [["Fighting back, are you?", "Good! I was worried this would get boring."], [0, 2.4]];
        
        case voc_Salvage_Phase3:
            return [["You're quite the stubborn one!", "You know you're only delaying the inevitable."], [0, 2.3]];
        
        case voc_Salvage_Phase4:
            return [["You good-for-nothing buckets of bolts...", "Make yourselves useful or I'll slash you to scrap metal!"], [0, 2.3]];
        
        case voc_Salvage_Phase5:
            return [["INSOLANT BRAT!", "THIS BODY CANNOT BE KILLED!"], [0, 1.2]];
        
        case voc_Salvage_Ending1:
            return [["You...grh...must think...you have me on the ropes, do you?", "Well...little do you know...", "I've one more trick up my sleeve."], [0, 6.8, 9.9]];
        
        case voc_Salvage_Ending2:
            return [["GOT YOU!", "AHAHAHAHA! AHAHAHAHAHAHAHA!", "Did you REALLY think you could defeat ME?!", "You...the little morsel you are.", "You. Are. NOTHING.", "You've always been nothing! And that...is how it shall remain.", "Once I'm through with you here...you'll be forgotten. Not even a footnote in my legacy.", "When this is all over, I'll...", "I'LL...", "...", "...Say...", "Is it...hot...in here...", "...Or is it just me?"], [0, 1.2, 4.2, 7.4, 10.6, 13.4, 18.7, 26, 29, 30.6, 32.8, 34, 36.7]];
        
        case voc_Salvage_Deathcoin1:
            return [["Did you really think that would work on me?"], [0]];
        
        case voc_Salvage_Deathcoin2:
            return [["WHY DID I INVENT THIS!?"], [0]];
        
        case voc_Salvage_Deathcoin3:
            return [["You must think you're really funny."], [0]];
        
        case voc_Salvage_DeathcoinBlocked:
            return [["I don't think so!"], [0]];
        
        case voc_Salvage_Beartrapped:
            return [["Why you little...!"], [0]];
        
        case voc_Salvage_HurtFinish_SuperRare:
            return [["D'OH!"], [0]];
        
        case voc_Salvage_Death_6AMShow:
            return [["The 6 A.M. show's been cancelled!"], [0]];
        
        case voc_Salvage_Death_BeyondYou:
            return [["I'm so far beyond you!", "I'm like a god in metallic clothing!"], [0, 2.6]];
        
        case voc_Salvage_Death_Created:
            return [["Do you live in fear of what you've created?"], [0]];
        
        case voc_Salvage_Death_FarGreater:
            return [["Don't dismay...", "You're part of something far greater now."], [0, 1.2]];
        
        case voc_Salvage_Death_History:
            return [["History is written by the victors!"], [0]];
        
        case voc_Salvage_Death_Overpower:
            return [["They outnumber you...", "I overpower you!"], [0, 1.7]];
        
        case voc_Salvage_Death_Reestablished:
            return [["Connection...reestablished!"], [0]];
        
        case voc_Salvage_Death_ScreamedLouder:
            return [["I'd appreciate it if you screamed much louder!"], [0]];
        
        case voc_Salvage_Death_Shadow:
            return [["Noone can escape the shadow I cast!"], [0]];
        
        case voc_Salvage_Death_Symmetry:
            return [["This is perfect! First I kill your accomplice, now I kill you!", "Symmetry, my friend!"], [0, 5.8]];
        
        case voc_Salvage_Death_WeightClass:
            return [["You're far below my weight class...", "...Just the way I like it."], [0, 2.8]];
        
        case voc_FuntimeChica_HitItBig:
            return [["Y'know...", "90% of night guards quit buying prizes right before they hit it big."], [0, 0.6]];
        
        case voc_FuntimeChica_KeepGambling:
            return [["Don't worry, just keep gambling!"], [0]];
        
        case voc_FuntimeChica_StupidGames:
            return [["Play stupid games, win stupid prizes!"], [0]];
        
        case voc_FuntimeChica_Surprise:
            return [["SURPRISE!!"], [0]];
        
        case voc_FuntimeChica_WinSome:
            return [["Oh well, you win some, you lose some!"], [0]];
        
        case voc_FuntimeChica_Deathcoin:
            return [["But...but this was supposed to be my moment!"], [0]];
        
        case voc_TwistedWolf_AWOOOOO:
            return [["*HOWLING*", "*LAUGHTER*"], [0, 2.4]];
        
        case voc_TwistedWolf_BigBadWolf:
            return [["Who's afraid of the big bad wolf?"], [0]];
        
        case voc_TwistedWolf_ExpectingMore:
            return [["I was expecting more of you!", "You're unskilled...untrained...", "And UNWORTHY!"], [0, 2.4, 4.8]];
        
        case voc_TwistedWolf_HuffPuff:
            return [["You'll huff, and you'll puff...", "But you'll NEVER blow ME away!"], [0, 2.3]];
        
        case voc_TwistedWolf_ImTwisted:
            return [["I'm not sick...I'm twisted!", "Sick makes it sound like there's a CURE!"], [0, 3.2]];
        
        case voc_TwistedWolf_LibertyToWolves:
            return [["Liberty for wolves is death to the lambs."], [0]];
        
        case voc_TwistedWolf_LightReading:
            return [["And now, a little light reading...", "...of your in memoriam."], [0, 3.1]];
        
        case voc_TwistedWolf_MereIllusion:
            return [["I'm no mere illusion."], [0]];
        
        case voc_TwistedWolf_Scared:
            return [["What's the matter!? SCARED!?"], [0]];
        
        case voc_TwistedWolf_SmokeAndMirrors:
            return [["And they said it was all smoke and mirrors..."], [0]];
        
        case voc_TwistedWolf_TheDirt:
            return [["Don't worry!", "You'll find the dirt comfortable after a while."], [0, 1.3]];
        
        case voc_TwistedWolf_Deathcoin:
            return [["Back to the earth..."], [0]];
        
        case voc_Nightmarionne_MementoMori:
            return [["Memento mori..."], [0]];
        
        case voc_Nightmarionne_CuriosityKilledTheCat:
            return [["Curiosity killed the cat...", "...But it won't bring it back."], [0, 3.3]];
        
        case voc_Nightmarionne_DeathInTheEye:
            return [["What did you expect, looking death in the eye?"], [0]];
        
        case voc_Nightmarionne_FightOrFlight:
            return [["When fight or flight aren't options...", "...The only thing to do is freeze."], [0, 3.5]];
        
        case voc_Nightmarionne_IgnoranceIsBliss:
            return [["Ignorance is bliss..."], [0]];
        
        case voc_Nightmarionne_OutrunMeForever:
            return [["No one can outrun me forever."], [0]];
        
        case voc_Nightmarionne_PryingEyes:
            return [["Prying eyes must pay for their greed."], [0]];
        
        case voc_Nightmarionne_PullingTheStrings:
            return [["I'll be pulling the strings from now on."], [0]];
        
        case voc_Nightmarionne_SweetDreams:
            return [["Sweet dreams..."], [0]];
        
        case voc_Nightmarionne_TemptedFate:
            return [["You tempted fate one too many times."], [0]];
        
        case voc_Nightmarionne_TheDevil:
            return [["The devil loves a good chase.", "...So I imagine he's...quite dissapointed."], [0, 4]];
        
        case voc_Nightmarionne_Deathcoin:
            return [["You're delaying the inevitable."], [0]];
        
        case voc_MoltenFreddy_AllForOne:
            return [["All for one...", "And one for all!"], [0, 1]];
        
        case voc_MoltenFreddy_AllMe:
            return [["All me, of course!"], [0]];
        
        case voc_MoltenFreddy_CantTakeTheHeat:
            return [["If you can't take the heat...", "...Stay out of the office!"], [0, 2.3]];
        
        case voc_MoltenFreddy_CheckTheFace:
            return [["Watch your mouth and check the face."], [0]];
        
        case voc_MoltenFreddy_IGotHim:
            return [["Oh, I got them!", "No, I got them!", "Actually, I was the one doing most of the work...", "YOU!? It was all ME!", "Ahem...", "Don't forget who's the star of the show here!", "Oh, shut up!"], [0, 0.9, 2.8, 5.6, 7.8, 8.9, 12]];
        
        case voc_MoltenFreddy_LookMeInTheEye:
            return [["Oh come on!", "Look me in the eye when I'm jumpscaring y-", "They were looking in MINE, dear."], [0, 1.7, 3.5]];
        
        case voc_MoltenFreddy_MightyLog:
            return [["Individually, we may be weak, like loose little twigs...", "But as a bundle, we form a mighty...!", "A mighty...", "...Log?", "YES, yes! A mighty log!"], [0, 4.8, 9.5, 11.6, 12.2]];
        
        case voc_MoltenFreddy_Outnumber:
            return [["We outnumber you."], [0]];
        
        case voc_MoltenFreddy_RedOnMe:
            return [["Red looks good on me...", "And it looks even better on you!"], [0, 1.9]];
        
        case voc_MoltenFreddy_Spaghetti:
            return [["We're the spaghetti...", "...and YOU'RE the meatballs!"], [0, 1.6]];
        
        case voc_MoltenFreddy_Deathcoin:
            return [["IT WORKS ON ALL OF US!?"], [0]];
        
        case voc_Ballora_CareToDance:
            return [["Care to dance?"], [0]];
        
        case voc_Ballora_AnythingButGraceful:
            return [["That was...", "...Anything but graceful."], [0, 1.1]];
        
        case voc_Ballora_DownWillComeBaby:
            return [["Down will come baby, cradle and all..."], [0]];
        
        case voc_Ballora_FacesTowardsHeaven:
            return [["They say dancing faces you towards heaven...no matter the direction you turn!"], [0]];
        
        case voc_Ballora_HushLittleBaby:
            return [["Hush, little baby, don't say a word..."], [0]];
        
        case voc_Ballora_LittleThings:
            return [["Didn't your mother ever teach you to stop and appreciate the little things?"], [0]];
        
        case voc_Ballora_NotQuiteMyTempo:
            return [["Not quite my tempo..."], [0]];
        
        case voc_Ballora_TerriblePerformance:
            return [["TERRIBLE performance.", "Let's take it from the top."], [0, 2.4]];
        
        case voc_Ballora_TooSlow:
            return [["Don't worry! It's not YOUR fault you're too slow to keep up."], [0]];
        
        case voc_Ballora_WindowToTheSoul:
            return [["Ballet is a window to the soul!", "Did you like what you saw?"], [0, 2.8]];
        
        case voc_Ballora_Deathcoin:
            return [["Oh, why I never!"], [0]];
        
        case voc_FuntimeFreddy_DreamWork:
            return [["Teamwork makes the dream work!"], [0]];
        
        case voc_FuntimeFreddy_ASurprise:
            return [["Get ready for a surprise~!"], [0]];
        
        case voc_FuntimeFreddy_BigHug:
            return [["Let's give the birthday boy a BIG hug!"], [0]];
        
        case voc_FuntimeFreddy_BlowOutTheCandles:
            return [["Time to blow out the candles!"], [0]];
        
        case voc_FuntimeFreddy_CheckThisOut:
            return [["Hey! Check this out!"], [0]];
        
        case voc_FuntimeFreddy_ComeOn1:
            return [["Oh, come on!"], [0]];
        
        case voc_FuntimeFreddy_ComeOn2:
            return [["Oh, come ON!"], [0]];
        
        case voc_FuntimeFreddy_CountTheWays:
            return [["*VOCALIZING*"], [0]];
        
        case voc_FuntimeFreddy_Doh1:
            return [["D'oh!"], [0]];
        
        case voc_FuntimeFreddy_Doh2:
        case voc_BonBon_Dohh1:
        case voc_BonBon_Dohh2:
            return [["D'oh..."], [0]];
        
        case voc_FuntimeFreddy_HereICome:
            return [["Ready or not...", "HERE I COME!"], [0, 1.3]];
        
        case voc_FuntimeFreddy_Mumbling:
            return [["*MUMBLING*"], [0]];
        
        case voc_FuntimeFreddy_OverHere:
            return [["Hey! HEY!", "Over here..."], [0, 1.3]];
        
        case voc_FuntimeFreddy_SeeSomethingCool:
            return [["HEY!", "You wanna see something COOL!?"], [0, 0.6]];
        
        case voc_FuntimeFreddy_TakeItAway:
            return [["Take it away, Bon-Bon!"], [0]];
        
        case voc_FuntimeFreddy_DeathDayBoy:
            return [["Huh...", "Maybe we oughtta start calling YOU the death-day boy!", "*LAUGHTER*", "...What?"], [0, 0.9, 4.1, 6.8]];
        
        case voc_FuntimeFreddy_DoubleYourFuntimes:
            return [["Double your bots, double your fun!", "Two animatronics are WAY worse than one!"], [0, 1.6]];
        
        case voc_FuntimeFreddy_NoBody:
            return [["Why was the nightguard sad on their birthday?", "Because they had no BODY to celebrate with!"], [0, 2.4]];
        
        case voc_FuntimeFreddy_NotAMouse:
            return [["...", "...Bon-Bon, I don't think that was a mouse."], [0, 1]];
        
        case voc_FuntimeFreddy_QuiteTheFunTime:
            return [["I dunno about you...", "But I had quite the Fun Time!"], [0, 1.6]];
        
        case voc_BonBon_FazbearPincer:
            return [["Fell for the ol' Fazbear Pincer!"], [0]];
        
        case voc_BonBon_GuyWithNoLegs:
            return [["Dang, you got killed by a guy with no legs.", "That's not a good look."], [0, 2.1]];
        
        case voc_BonBon_NoSleeping:
            return [["C'mon! Get up! No sleeping on the job!"], [0]];
        
        case voc_BonBon_PowerOfTeamwork:
            return [["That's the power of teamwork!"], [0]];
        
        case voc_BonBon_PushedTooHard:
            return [["*PANT* That's right! *PANT*", "Sorry, it's just... *PANT* Just give me a second...", "I pushed myself too hard getting to that other door..."], [0, 2.5, 4.9]];
        
        case voc_BonBon_Short:
            return [["Man, you should feel embarassed to die to me!", "Like, do you see how short I am?"], [0, 3.1]];
        
        case voc_FuntimeFreddy_PartyPooper:
            return [["D'aww...", "What a party pooper..."], [0, 0.5]];
        
        case voc_UpgradeCadet_ComeGet:
            return [["COME GET YOUR UPGRADES HERE."], [0]];
        
        case voc_BB_Shades:
            return [["I like the shades you're rockin'!"], [0]];
        
        case voc_JJ_Shades1:
            return [["You look beautiful!"], [0]];
        
        case voc_JJ_Shades2:
            return [["Those shades really bring out your eyes."], [0]];
        
        case voc_ToyBonnie_Shades1:
            return [["Hm. Cool shades, Freddy."], [0]];
        
        case voc_ToyBonnie_Shades2:
            return [["I could pull off those shades way better..."], [0]];
        
        case voc_WitheredChica_Shades:
            return [["Eugh...tacky..."], [0]];
        
        case voc_Malhare_Deathcoin:
            return [["Ugh, friggin' hell..."], [0]];
        
        case voc_Pigpatch_VirtualRealitayOne:
            return [["And that's why I was in the virtual reali-tay one!"], [0]];
        
        case voc_Pigpatch_KickedYerBluegrass:
            return [["Kicked yer bluegrass!", "HOO-EEE!"], [0, 1.5]];
        
        case voc_Orville_Alakazam:
            return [["Alakazam!"], [0]];
        
        case voc_Orville_AddressTheElephant:
            return [["Time to address the elephant in the room."], [0]];
        
        case voc_Orville_Correct:
            return [["Ugh...correct."], [0]];
        
        case voc_Orville_FantasticWork:
            return [["Fantastic work, or whatever..."], [0]];
        
        case voc_Orville_Fiddlesticks:
            return [["Oh, fiddlesticks!"], [0]];
        
        case voc_Orville_ForMyNextTrick:
            return [["And for my next trick...!"], [0]];
        
        case voc_Orville_GoodJob:
            return [["Oh, good job, I'm so happy for you."], [0]];
        
        case voc_Orville_HowDoYouDoIt:
            return [["How do you do it!?"], [0]];
        
        case voc_Orville_IsThisYourCard1:
        case voc_Orville_IsThisYourCard2:
            return [["Is THIS your card?"], [0]];
        
        case voc_Orville_NeverForgets:
            return [["An elephant never forgets!", "Do you?"], [0, 2.5]];
        
        case voc_Orville_PickACard:
            return [["Pick a card!", "Any card."], [0, 1.3]];
        
        case voc_Orville_FlickOfMagic:
            return [["A little flick of magic...", "I can do anything!"], [0, 2]];
        
        case voc_Orville_JollyGoodShow:
            return [["Oh, jolly good show!", "You made for a wonderful volunteer."], [0, 2.6]];
        
        case voc_Orville_MemoryOfAnElephant:
            return [["Ha!", "I suppose not everyone has the memory of an elephant."], [0, 0.7]];
        
        case voc_Orville_NOTYourCard:
            return [["That was positively, certifiably,", "verifiably, without a doubt in my mind...", "NOT your card."], [0, 3.4, 6.3]];
        
        case voc_Orville_OpenThisBox:
            return [["And when I open the box, the night guard will be completely-", "Oh.", "Oh no. Oh."], [0, 3.8, 5]];
        
        case voc_Orville_RevealsHisSecrets:
            return [["A great magician never reveals his secrets!", "...And a competent night guard never falls for them."], [0, 4.4]];
        
        case voc_Orville_TalkYouToDeath:
            return [["Just be glad I didn't TALK you to death, hm?"], [0]];
        
        case voc_Orville_YourMediocrity:
            return [["I must say, your mediocrity exceeds even our finest!", "...Which is me."], [0, 4.9]];
        
        case voc_Orville_Deathcoin:
            return [["Oh, just like Houdini..."], [0]];
        
        case voc_NeddBear_NeddFromPizza:
            return [["I'm Nedd! From Pizza!"], [0]];
        
        case voc_NeddBear_HeyEverybody:
            return [["Well hey there, everybody!"], [0]];
        
        case voc_NeddBear_TradeTies:
            return [["Ooh! Do you wanna trade ties?"], [0]];
        
        case voc_NeddBear_WantCompany:
            return [["'Scuze me! Y'all want some company in here?"], [0]];
        
        case voc_NeddBear_BoneThatWay:
            return [["Eugh...that bone ain't supposed to be bendin' that way.", "No-sirree-bob."], [0, 3.8]];
        
        case voc_NeddBear_DontBeAStranger:
            return [["Hey now! Don't be a stranger!"], [0]];
        
        case voc_NeddBear_EyesPopOut:
            return [["Your eyes pop out TOO!?"], [0]];
        
        case voc_NeddBear_Frickbears4:
            return [["See you in Frickbear's 4, everybody!"], [0]];
        
        case voc_NeddBear_FullPotentiality:
            return [["Call that livin' up to your full potentiality!"], [0]];
        
        case voc_NeddBear_GetTheDead:
            return [["You mess with the Nedd, and you get...", "...the dead."], [0, 3.5]];
        
        case voc_NeddBear_ThinkOfAnything:
            return [["...", "I, uh...", "I couldn't think of anything."], [0, 3.5, 5]];
        
        case voc_NeddBear_Deathcoin:
            return [["Sweet unification!", "Not the FUR!"], [0, 1.3]];
        
        case voc_HappyFrog_Selection:
            return [["Hop to it!"], [0]];
        
        case voc_HappyFrog_Solved1:
            return [["You're doing fantastic!"], [0]];
        
        case voc_HappyFrog_Solved2:
            return [["You got it!"], [0]];
        
        case voc_HappyFrog_Solved3:
            return [["Mathematical!"], [0]];
        
        case voc_HappyFrog_Solved4:
            return [["Works for me!"], [0]];
        
        case voc_HappyFrog_Death1:
            return [["Next time we'll practice Frog Fractions!"], [0]];
        
        case voc_HappyFrog_Death2:
            return [["Graphic violence is my passion!", "*GIGGLES*"], [0, 1.7]];
        
        case voc_HappyFrog_Death3:
            return [["I'd say...that was a learning exercise!"], [0]];
        
        case voc_HappyFrog_Death4:
            return [["Nobody appreciates cool math games anymore..."], [0]];
        
        case voc_HappyFrog_Death5:
            return [["Hmm, looks like you could use some help, let's see...", "Oh, I know!", "In a subtraction problem, when the first number is smaller than the second number,", "the answer will be negative!", "This will surely help you do better next time."], [0, 2.8, 3.7, 7.6, 9.5]];
        
        case voc_HappyFrog_Death6:
            return [["With this performance, you...", "might need to turn your card to yellow."], [0, 1.9]];
        
        case voc_HappyFrog_Death7:
            return [["Sorry that I got the jump on you! Heehee!"], [0]];
        
        case voc_HappyFrog_Death8:
            return [["Ohh, okay! Heheh, um...", "Uh, no.", "No, that's...that's incorrect."], [0, 3, 3.9]];
        
        case voc_HappyFrog_Deathcoin:
            return [["Ohhh, I croaked..."], [0]];
        
        case voc_CptCobalt_Selection:
            return [["ALL HANDS ON DECK!"], [0]];
        
        case voc_CptCobalt_Foxy_Appear1:
            return [["Avast ye!"], [0]];
        
        case voc_CptCobalt_Foxy_Appear2:
            return [["Plunder 'em, crew!"], [0]];
        
        case voc_CptCobalt_Foxy_Appear3:
            return [["NIGHT GUUAAAARD!!"], [0]];
        
        case voc_CptCobalt_Foxy_Scared1:
        case voc_CptCobalt_Foxy_Scared3:
            return [["D'oh!"], [0]];
        
        case voc_CptCobalt_Roxy_Appear1:
            return [["Ahoy!"], [0]];
        
        case voc_CptCobalt_Roxy_Appear2:
            return [["Landlubber!"], [0]];
        
        case voc_CptCobalt_Roxy_Appear3:
            return [["Got ye now!"], [0]];
        
        case voc_CptCobalt_Kit_Appear1:
            return [["Yo ho ho!"], [0]];
        
        case voc_CptCobalt_Kit_Appear2:
            return [["Guard ho!"], [0]];
        
        case voc_CptCobalt_Kit_Appear3:
            return [["Aha!"], [0]];
        
        case voc_CptCobalt_Roxy_Scared1:
        case voc_CptCobalt_Roxy_Scared2:
        case voc_CptCobalt_Roxy_Scared3:
        case voc_CptCobalt_Kit_Scared1:
        case voc_CptCobalt_Kit_Scared2:
        case voc_CptCobalt_Kit_Scared3:
            return [["AH!"], [0]];
        
        case voc_CptCobalt_Bawson_Appear1:
            return [["RAAGH!!"], [0]];
        
        case voc_CptCobalt_Bawson_Appear2:
            return [["*RABID BABBLING*"], [0]];
        
        case voc_CptCobalt_Bawson_Appear3:
            return [["Duhh..."], [0]];
        
        case voc_CptCobalt_Bawson_Scared1:
            return [["ACH, crivvens..."], [0]];
        
        case voc_CptCobalt_Bawson_Scared2:
            return [["Jings!"], [0]];
        
        case voc_CptCobalt_Bawson_Scared3:
            return [["RIGHT in the giblets..."], [0]];
        
        case voc_CptCobalt_Renard_Appear1:
            return [["Hon hon!"], [0]];
        
        case voc_CptCobalt_Renard_Appear2:
            return [["Bon appétit!"], [0]];
        
        case voc_CptCobalt_Renard_Appear3:
            return [["Bonjour!"], [0]];
        
        case voc_CptCobalt_Renard_Scared1:
            return [["AIYEE!"], [0]];
        
        case voc_CptCobalt_Renard_Scared2:
            return [["MON DIEU!"], [0]];
        
        case voc_CptCobalt_Renard_Scared4:
            return [["OOO LA LA!"], [0]];
        
        case voc_CptCobalt_Death1:
            return [["Foxy! Roxy! Hoist the mainsail!", "Bawson! Swab the deck!", "Renard! Make me breakfast!", "And Kit...", "Well, you just keep being Kit."], [0, 3.4, 5.5, 7.7, 9.2]];
        
        case voc_CptCobalt_Death2:
            return [["Pirate rule number 24!", "No dyin' on the job."], [0, 3]];
        
        case voc_CptCobalt_Death3:
            return [["Aye, you better not have forgotten pirate rule number 69!", "Never...", "What? WHAT?", "WHAT'S SO FUNNY!?"], [0, 4.1, 5.7, 7.6]];
        
        case voc_CptCobalt_Death4:
            return [["Pirate rule number 14!", "Never wipe with your cannon arm."], [0, 2.6]];
        
        case voc_CptCobalt_Death5:
            return [["Pirate rule number 38!", "Don't laugh at the word...", "At the word...", "...At the word Poopdeck.", "*STIFLED CHUCKLE*"], [0, 3, 5.3, 6.6, 8.2]];
        
        case voc_CptCobalt_Death6:
            return [["Pirate rule number 67!", "Don't even think about it."], [0, 5.1]];
        
        case voc_CptCobalt_Death7:
            return [["All this pirate jewlery's expensive, y'know!", "Piercings nowaways are a buck-an-ear!", "Get it? A buck-an-ear?", "No?", "Yarr, you're no fun..."], [0, 3.4, 6.4, 8.8, 10]];
        
        case voc_CptCobalt_Death8:
            return [["Aye, of course we plunder ale!", "...Why do you ask?"], [0, 2.3]];
        
        case voc_CptCobalt_Death9:
            return [["Pirate rule number 45!", "Never forget pirate rule number 44."], [0, 2.7]];
        
        case voc_CptCobalt_Death10:
            return [["Do what you want 'cuz a pirate is free!", "(ALL TOGETHER) You are a pirate!"], [0, 2]];
        
        case voc_CptCobalt_Death11:
            return [["You've sailed adrift into dangerous seas...", "MY seas."], [0, 4]];
        
        case voc_CptCobalt_Death12:
            return [["Forget about your wives and daughters,", "'cuz I'M the cap that rules THESE waters!"], [0, 2.1]];
        
        case voc_CptCobalt_Death13:
            return [["We're well on-course to win Pirate of the Year, lads!", "I think this calls for ham tonight...!"], [0, 3.1]];
        
        case voc_CptCobalt_Deathcoin:
            return [["Abandon ship! WE'RE GOING DOWN!!", "*CREW PANICKING*"], [0, 2.8]];
        
        case voc_MrHugs_AirTightAlibi:
            return [["You can't pin the blame on me!", "I've got an air-tight alibi!"], [0, 2.9]];
        
        case voc_MrHugs_HurtYourFeelings:
            return [["Did I hurt your feelings?", "Well suck it up, buddy!"], [0, 2.4]];
        
        case voc_MrHugs_ISuck:
            return [["I suck!", "Really, really hard!", "Because I'm a vaccuum cleaner!"], [0, 2.9, 6.4]];
        
        case voc_MrHugs_LeftInTheDust:
            return [["I left you in the dust!"], [0]];
        
        case voc_MrHugs_LiquidSafe:
            return [["I'm not one of those liquid-safe vaccuums!", "You're cleaning this up on your own!"], [0, 4]];
        
        case voc_mrHugs_MagicMurderBag:
            return [["I am Hugs! Mr. Hugs!", "And this - is my magic murder vaccuum bag!"], [0, 4]];
        
        case voc_MrHugs_PrintedOutPuns:
            return [["Um...", "I printed out a bunch of puns I got from the internet,", "but I don't get this one.", "Does: \"My vaccuum whispers sweet suction words\"", "make any sense to you?", "I don't...I don't think I do that.", "I don't know what context that's supposed to be funny in."], [0, 1.1, 5.2, 7.4, 11.4, 13.7, 17.4]];
        
        case voc_MrHugs_Sucker:
            return [["SUCKER!!"], [0]];
        
        case voc_MrHugs_SuckYouUp:
            return [["I will suck you up and spit you out at other enemies!"], [0]];
        
        case voc_MrHugs_ThisRube:
            return [["Looks like this rube", "fell victim to my suction tube!"], [0, 1.8]];
        
        case voc_MrHugs_Deathcoin:
            return [["OW!!", "THAT HURTS!"], [0, 1.5]];
        
        case voc_MrHugs_MyNameAgain:
            return [["I'm Mr. Hugs! That's my name!", "My name again is Mr. Hugs!"], [0, 2.6]];
        
        case voc_WhiteTiger_Selection:
            return [["Play with me."], [0]];
        
        case voc_WhiteTiger_Deathcoin:
            return [["*SCREAMING*", "*CAR CRASH SFX*"], [0, 0.5]];
        
        case voc_Bon_Selection:
            return [["Come join the party!"], [0]];
        
        case voc_Bon_Death1:
            return [["Shhhh...", "It's alright.", "The hard part is over with now."], [0, 2.8, 5.8]];
        
        case voc_Bon_Death2:
            return [["...My bad.", "I thought you were someone else."], [0, 2.1]];
        
        case voc_Bon_Death3:
            return [["Clearly", "you've never made", "an omelette."], [0, 1.6, 3.9]];
        
        case voc_Bon_Death4:
            return [["As you are now", "so once was I.", "As I am now,", "so shall you be."], [0, 2.6, 6.2, 9.4]];
        
        case voc_Bon_Death5:
            return [["Consider your show stopped,", "your Bons Burgered,", "and your Waltens Filed.", "Thank you! GOOD NIGHT!"], [0, 2.6, 4.8, 7.3]];
        
        case voc_Bon_Death7:
            return [["Once upon a time,", 0], ["there lived a BUMBLING owl", 2.2], ["who looked over a farm.", 5.8], ["One day, a rabbit on the farm got tired of always being watched!", 8.5], ["So, he walked up and", 15.9], ["PULLED the owl's head off!", 18.9], ["And all the animals on the farm lived happily ever after.", 22.9], ["THE END.", 30]];
        
        case voc_Bon_Deathcoin:
            return [["It's your funeral!", "...No, wait, it's mine."], [0, 1.8]];
        
        case voc_Bon_DeathcoinUNUSED:
            return [["My show...!", "STOPPED!!"], [0, 1.4]];
        
        case voc_Jackie_Selection:
            return [["Time to play!"], [0]];
        
        case voc_Jackie_Death1:
            return [["I know what the Mimic's secret is...", "But I'm not telling~!"], [0, 2.9]];
        
        case voc_Jackie_Death2:
            return [["Oh, you're just TERRIBLE!"], [0]];
        
        case voc_Jackie_Death3:
            return [["Dying?", "On my BIRTHDAY?", "Oh, the AUDACITY!"], [0, 1.1, 3.3]];
        
        case voc_Jackie_Death4:
            return [["Ohhh, looks like I need a new playmate...", "And we were having so much fun, too! Boohoo..."], [0, 3.5]];
        
        case voc_Jackie_Death5:
            return [["Played ya like a violin, then cut your strings!"], [0]];
        
        case voc_Jackie_Death6:
            return [["D'ohh, dead already!?", "I didn't even get to use my secret cannon..."], [0, 2.7]];
        
        case voc_Jackie_Death7:
            return [["Nobody knows how to crank it like I do!", "...Wait, no...", "Nobody out-jacks Jackie!", "No, no, wait, no...", "N-Nobody beats-", "Okay give me a second I'll think of something."], [0, 3.1, 4.5, 6.2, 7.9, 8.9]];
        
        case voc_Jackie_Launch:
            return [["Nooo...!"], [0]];
        
        case voc_Jackie_Deathcoin:
            return [["Clown down!"], [0]];
        
        case voc_BigTop_Selection:
            return [["Here's your ticket to fun!"], [0]];
        
        case voc_BigTop_Death1:
            return [["Let me tell you friend,", "you're bad, just plain bad.", "Bad with a capital B, which rhymes with D,", "which stands for Dead,", "which is what you are."], [0, 0.7, 3.7, 6.6, 8.6]];
        
        case voc_BigTop_Death2:
            return [["Either you're closing your eyes to a situation you do not wish to acknowledge", "or you are not aware of the calibre of danger", "indicated by the presence of a giant, four-armed animatronic in your pizzeria."], [0, 4.2, 6.9]];
        
        case voc_BigTop_Death3:
            return [["Well, if it makes you feel any better,", "your life insurance policy includes one free spin on the prize wheel!"], [0, 1.9]];
        
        case voc_BigTop_Death4:
            return [["Games of skill are my favorite!", "Because against players like you, I tend to win."], [0, 2.5]];
        
        case voc_BigTop_Death5:
            return [["Well, I say!", "You're neither big, nor on top!"], [0, 1.3]];
        
        case voc_BigTop_Death6:
            return [["Fifteen tickets, little man!", "Put them all in my hand!"], [0, 2.1]];
        
        case voc_BigTop_Death7:
            return [["I say!", "This is a boner for the ages!", "PLEAE NOTE:", "A boner, in Big Top's old-fashioned vernacular,", "is defined as a blunder,", "or a particularly embarrassing mistake."], [0, 0.9, 3.2, 3.4, 4.7, 5.3]];
        
        case voc_BigTop_Death8:
            return [["Oh dear!", "It seems you're too short to ride!"], [0, 1.2]];
        
        case voc_BigTop_Deathcoin:
            return [["ARTHRITIS!", "FOUR TIMES OVER!!"], [0, 1.4]];
        
        case voc_Mimic_FindMySecret:
            return [["FIND MY SECRET."], [0]];
        
        case voc_Mimic_AnotherMisdirection:
            return [["JUST ANOTHER", "MISDIRECTION."], [0, 0.9]];
        
        case voc_Mimic_ChildsPlay:
            return [["KILLING YOU IS", "CHILD'S PLAY."], [0, 0.7]];
        
        case voc_Mimic_DrillThisThroughYourHead:
            return [["DRILL THIS", "THROUGH YOUR HEAD!"], [0, 0.6]];
        
        case voc_Mimic_HateSpeech:
            return [["I CANNOT TRANSLATE THIS DEATH LINE", "BECAUSE IT CONTAINS", "HATE SPEECH", "AND PROMOTES", "VIOLENCE."], [0, 2.2, 3.3, 4, 4.9]];
        
        case voc_Mimic_JustLikeAPencil:
            return [["JUST LIKE A PENCIL:", "EASY TO SNAP", "AND HOLLOW ON THE INSIDE."], [0, 1.3, 2.2]];
        
        case voc_Mimic_NotAsIDo:
            return [["DO AS I SAY", "NOT AS I DO."], [0, 1.3]];
        
        case voc_Mimic_PlayBall:
            return [["YOU'LL NEVER PLAY BALL", "WITH THE BIG BOYS."], [0, 1.4]];
        
        case voc_Mimic_SecretsNowadays:
            return [["IT'S IMPOSSIBLE TO HAVE SECRETS NOWADAYS", "BECAUSE OF NOSY PEOPLE LIKE YOU."], [0, 2.4]];
        
        case voc_Mimic_SuckAtVideoGames:
            return [["LEARNING. LEARNING. LEARNING.", "BEHAVIOR COPIED.", "I NOW", "SUCK AT VIDEO GAMES."], [0, 1.6, 2.7, 3.5]];
        
        case voc_Mimic_ThatsWhatYouSoundLike:
            return [["OH LOOK AT ME. I DON'T PAY ATTENTION.", "I DON'T PICK UP ON ANY OF THESE INCREDIBLY OBVIOUS CUES.", "THAT'S YOU.", "THAT'S WHAT YOU SOUND LIKE."], [0, 2.5, 6.9, 8]];
        
        case voc_Mimic_Deathcoin:
            return [["MY BODY! IT'S CHANGING!"], [0]];
        
        case voc_BigTop_TicketsPlease1:
        case voc_BigTop_TicketsPlease2:
        case voc_BigTop_TicketsPlease3:
        case voc_BigTop_TicketsPlease4:
        case voc_BigTop_TicketsPlease5:
            return [["Tickets, please!"], [0]];
        
        case voc_BigTop_TicketsPleaseRARE:
            return [["I can has ticketz?"], [0]];
        
        case voc_Doofas_Sweet:
            return [["Sweet!"], [0]];
        
        case voc_Doofas_Unlucky:
            return [["Unlucky!"], [0]];
        
        case voc_Doofas_Whoops:
            return [["Whoops."], [0]];
        
        case voc_Doofas_Yeargh:
            return [["YEARGH!"], [0]];
        
        case voc_Doofas_Deathcoin:
            return [["Blast..."], [0]];
        
        case voc_Frostbear_BreakTheIce:
            return [["Let's break the ice!", "Ho ho ho ho!"], [0, 1.8]];
        
        case voc_Frostbear_Deathcoin:
            return [["Why the cold shoulder...?"], [0]];
        
        case voc_Scraptrap_MyAftonTasks:
            return [["Complete my Afton tasks."], [0]];
        
        case voc_Scraptrap_BadMan:
            return [["Who's the man? I'M the man!", "I'm a BAD man! How bad? REAL bad!", "I'm a 12.0 on the 10.0 scale of badness!"], [0, 2.3, 6.1]];
        
        case voc_Scraptrap_BodyOfYourEnemy:
            return [["If you sit by the river long enough...", "You'll see the body of your enemy float by."], [0, 2.5]];
        
        case voc_Scraptrap_Boned:
            return [["Sorry, friend...", "You're BONED!", "Ooh, wait, that was good, let me write that down.", "*SCRIBBLING*", "Boned... Okay, cool.", "Alright, thanks for your time!"], [0, 1.9, 4, 6, 8.2, 9.6]];
        
        case voc_Scraptrap_BoneEar:
            return [["Tell me my bone ear is cool."], [0]];
        
        case voc_Scraptrap_Craptrap:
            return [["Don't call me Craptrap.", "That's...that's not my name."], [0, 1.8]];
        
        case voc_Scraptrap_DoneOne:
            return [["I'm the fun one!", "YOU'RE the DONE one!", "See- See what I did there?"], [0, 1.7, 3.9]];
        
        case voc_Scraptrap_DropYourGuard:
            return [["*SCOFFS*", "I was just waiting for you to drop your guard."], [0, 1]];
        
        case voc_Scraptrap_GrandFinale:
            return [["Hope you enjoyed the grand finale!"], [0]];
        
        case voc_Scraptrap_RunsAway:
            return [["As the old saying goes...", "He who scraps and runs away...lives to scrap another day!", "*LAUGHTER*"], [0, 1.8, 5.8]];
        
        case voc_Scraptrap_StillGotIt:
            return [["I've still got it!"], [0]];
        
        case voc_Scraptrap_Deathcoin:
            return [["NO, MY OTHER ARM!"], [0]];
        
        case voc_Roxy_Selection:
            return [["Took you long enough!"], [0]];
        
        case voc_Roxy_Appear1:
        case voc_Roxy_Appear2:
            return [["HEY!"], [0]];
        
        case voc_Roxy_Appear3:
            return [["LOOK AT ME!"], [0]];
        
        case voc_Roxy_Satisfied1:
            return [["Aww, you flatter me!"], [0]];
        
        case voc_Roxy_Satisfied2:
            return [["Yeah! That's right!"], [0]];
        
        case voc_Roxy_Satisfied3:
            return [["That's what I thought!"], [0]];
        
        case voc_Roxy_Death1:
            return [["That's right!", "I'm the breast.", "BEST.", "I'm the BEST."], [0, 1.1, 2.1, 3.5]];
        
        case voc_Roxy_Death2:
            return [["Well...", "That was boring."], [0, 1.1]];
        
        case voc_Roxy_Death3:
            return [["Is...that...", "MENDO!?", "You invited MENDO to this game before me!?"], [0, 2.4, 4.3]];
        
        case voc_Roxy_Death4:
            return [["THAT'S what you get when you-", "Way to go, Roxy!", "I knew you could do it!", "GET OUT OF MY ROOM, FREDDY!"], [0, 1.3, 3.1, 4.7]];
        
        case voc_Roxy_Death5:
            return [["You don't mind if I take that tablet, do you?", "Need a new hand mirror.", "Thaaaaanks..."], [0, 3.1, 5.1]];
        
        case voc_Roxy_Death6:
            return [["Your hopes?", "Shattered.", "Your plans?", "Ruined.", "Your security?", "...Breached."], [0, 1.1, 2.4, 3.7, 5.3, 7.1]];
        
        case voc_Roxy_Deathcoin:
            return [["Ugh...", "You couldn't handle me anyway..."], [0, 0.8]];
        
        case voc_JackOBonnie_Selection:
            return [["Life's no fun without a good SCARE!"], [0]];
        
        case voc_JackOBonnie_Death1:
            return [["Hellfire! HELLFIRE!", "*LAUGHTER*"], [0, 2.9]];
        
        case voc_JackOBonnie_Death2:
            return [["Make way for treats!", "BURN THE FAT!"], [0, 1.9]];
        
        case voc_JackOBonnie_Death3:
            return [["Trick-or-treat! Flay the meat!", "Souls all mine to burn and eat!", "*LAUGHTER*"], [0, 2.2, 4.1]];
        
        case voc_JackOBonnie_Death4:
            return [["Drink a toast and down the cup", "and drink to bones that turn to dust!", "*LAUGHTER*"], [0, 1.7, 3.9]];
        
        case voc_JackOBonnie_Death5:
            return [["I LOVE a Halloween flick in 3D!", "Decaying, decrepit,", "and DEAD!", "*LAUGHTER*"], [0, 3.4, 5.6, 7.2]];
        
        case voc_JackOBonnie_Death6:
            return [["Gourd that gored!", "GORED BY GOURD!!"], [0, 1.5]];
        
        case voc_JackOBonnie_Death7:
            return [["Over the pumpkin hill...", "the FLAMES of DISASTER RISE!"], [0, 2.2]];
        
        case voc_JackOBonnie_Death8:
            return [["MY HEAD IS ON FIRE!"], [0]];
        
        case voc_JackOBonnie_Deathcoin:
            return [["NOVEMBER ALREADY!?"], [0]];
        
        case voc_JackOChica_Selection:
            return [["OHOHOHO!", "THE JACK-O-LANTERN!"], [0, 1.5]];
        
        case voc_JackOChica_Death1:
            return [["Through hallowed halls, I scream and screech...", "For your security has been BREACHED!", "*LAUGHTER*"], [0, 3.8, 7.4]];
        
        case voc_JackOChica_Death2:
            return [["Night guard DEAD, but there's still more!", "See you all in Frickbear's 4!"], [0, 3.7]];
        
        case voc_JackOChica_Death3:
            return [["No more guard, what a shame...", "Blame the player, not the game!"], [0, 3]];
        
        case voc_JackOChica_Death4:
            return [["The game was rigged, for this I'm certain!", "But no crying now...it's your final curtain!"], [0, 3.5]];
        
        case voc_JackOChica_Death5:
            return [["Though you think yourself the Great Pumpkin...", "You are nothing more than a lowly bumpkin!"], [0, 3.3]];
        
        case voc_JackOChica_Death6:
            return [["Talk about a mighty blunder...", "It seems I've stolen all your thunder!"], [0, 2.7]];
        
        case voc_JackOChica_Death7:
            return [["I don't know why you seem aghast...", "It's clear to see you are outclassed!"], [0, 3.7]];
        
        case voc_JackOChica_Death8:
            return [["Don't cry, do retry!", "There's pumpkin pie, it's not a lie!"], [0, 3.1]];
        
        case voc_JackOChica_Death9:
            return [["No matter how much you whine and scream,", "You'll ALWAYS dread my rhyming scheme!"], [0, 4]];
        
        case voc_JackOChica_Death10:
            return [["Not to boast, you gave the most...", "but to this ghost, you're naught but TOAST!"], [0, 2.6]];
        
        case voc_JackOChica_Deathcoin:
            return [["I'M MELTING!! I'M MELTING-!"], [0]];
        
        case voc_NightmareMangle_Selection:
            return [["LET'S FLAY!"], [0]];
        
        case voc_NightmareMangle_Death1:
            return [["No need to BUZZ me,", "because I SAW you!", "*SCOFFS* Heard it before."], [0, 3, 6.1]];
        
        case voc_NightmareMangle_Death2:
            return [["Let's CUT to the chase!", "Can we CUT her mic?"], [0, 3.2]];
        
        case voc_NightmareMangle_Death3:
            return [["Two heads are better than one!", "Ugh, Mangle already used that one..."], [0, 3.7]];
        
        case voc_NightmareMangle_Death4:
            return [["Off to the morgue! CHOP CHOP!", "Tch, anything to get this over with."], [0, 3.4]];
        
        case voc_NightmareMangle_Death5:
            return [["What's with the dead look on your face?", "It's 'cuz of your jokes, luv."], [0, 3.8]];
        
        case voc_NightmareMangle_Death6:
            return [["I used my buzzsaw tricks to turn this night guard into a flesh cube!", "Absolutely horrid, darling."], [0, 8.2]];
        
        case voc_NightmareMangle_Death7:
            return [["Must you remind me of how HIDEOUS I've become!?", "How do you think I feel?", "I'm stuck to you!"], [0, 4.8, 7.3]];
        
        case voc_NightmareMangle_Death8:
            return [["Don't mean to SPLIT your sides!", "Then why even try!?"], [0, 3.5]];
        
        case voc_NightmareMangle_Deathcoin:
            return [["This is YOUR fault, you know.", "DON'T YOU START!!"], [0, 2]];
        
        case voc_GrimmFoxy_Selection:
            return [["Night guard beware! You're in for a SCARE!"], [0]];
        
        case voc_GrimmFoxy_Death1:
            return [["Feel the pain... Feel the burn!", "You'll never win, YOU'LL NEVER LEARN!"], [0, 3.2]];
        
        case voc_GrimmFoxy_Death2:
            return [["Hmmm, I had a line...", "...But it was kind of corny."], [0, 2.3]];
        
        case voc_GrimmFoxy_Death3:
            return [["If you won't reap what you sow...", "then I'll just DO IT FOR YOU!"], [0, 2.3]];
        
        case voc_GrimmFoxy_Death4:
            return [["Double double, toil and trouble!", "Night guard burn, trapped under rubble!"], [0, 2.4]];
        
        case voc_GrimmFoxy_Death5:
            return [["I told you not to visit the scary old pizzeria on the hill!", "And you didn't listen, did you!?"], [0, 4.2]];
        
        case voc_GrimmFoxy_Death6:
            return [["Quiet life, or blaze of glory...", "No one will live to tell YOUR story!"], [0, 3.2]];
        
        case voc_GrimmFoxy_Deathcoin:
            return [["CURSE YE, LANDLUBBER!!"], [0]];
        
        case voc_Security_Selection:
            return [["I see you."], [0]];
        
        case voc_Security_Death1:
            return [["My scope knows a creep when it sees one."], [0]];
        
        case voc_Security_Death2:
            return [["Play your role, sentinel."], [0]];
        
        case voc_Security_Death3:
            return [["Take your job seriously.", "This is not a game."], [0, 2.6]];
        
        case voc_Security_Death4:
            return [["You are distorted and broken", "in a world full of evil unspoken."], [0, 2.6]];
        
        case voc_Security_Death5:
            return [["No action taken.", "Employee is deemed...ineffective."], [0, 1.6]];
        
        case voc_Security_Death6:
            return [["Removal of least efficient employees...", "starting now."], [0, 2.5]];
        
        case voc_Security_Death7:
            return [["Time to face...that you have been replaced."], [0]];
        
        case voc_Security_Death8:
            return [["What are you fighting for...?"], [0]];
        
        case voc_Security_Death9:
            return [["Excellent Halloween costume.", "You look just like a corpse."], [0, 2.2]];
        
        case voc_Security_Death10:
            return [["You say that you were jumpscared?", "*CLEARING MEMORY*", "There's nothing on my records!"], [0, 2, 3.9]];
        
        case voc_Security_Deathcoin:
            return [["OPTICS...compromised..."], [0]];
        
        case voc_CMR_ImGonnaKillYou:
            return [["I'M GONNA KILL YOU!!"], [0]];
        
        case voc_CMR_Dumbass:
            return [["Dumbass."], [0]];
        
        case voc_CMR_EpicFail:
            return [["Epic fail!"], [0]];
        
        case voc_CMR_FunnyHowDumbYouAre:
            return [["It's funny how dumb you are."], [0]];
        
        case voc_CMR_GitGud:
            return [["Git gud!"], [0]];
        
        case voc_CMR_HaHa:
            return [["Haha."], [0]];
        
        case voc_CMR_Larper:
            return [["Larper!"], [0]];
        
        case voc_CMR_Loser:
            return [["Loser!"], [0]];
        
        case voc_CMR_MousePluggedIn:
            return [["Is your mouse plugged in?"], [0]];
        
        case voc_CMR_MoveOutOfTheWay:
            return [["Move OUT of the way next time!"], [0]];
        
        case voc_CMR_Pwned:
            return [["Pwned!"], [0]];
        
        case voc_CMR_SuckAtThis:
            return [["You suck at this!"], [0]];
        
        case voc_CMR_SupposedToTouchThem:
            return [["You're not supposed to touch them, silly!"], [0]];
        
        case voc_CMR_Whoopsie:
            return [["Whoopsie!"], [0]];
        
        case voc_CMR_Deathcoin:
            return [["Oh you ****ing little fat squeaker little ****, mate.", "You're a ****ing little squeaky ******* you ****ing stupid dumb*** kid.", "**** you."], [0, 3, 6.9]];
        
        case voc_Ennard_Death1:
            return [["You don't look very qualified to me...", "...But I suppose it's what's on the inside that counts."], [0, 5]];
        
        case voc_Ennard_Death2:
            return [["It's not that you're not good enough!", "It's just that we can make you BETTER."], [0, 2.9]];
        
        case voc_Ennard_Death3:
            return [["And now...", "there's a little bit of me in you too!"], [0, 1.2]];
        
        case voc_Ennard_Death4:
            return [["Now that I'm seeing you up close,", "no wonder half the block is still in the crib."], [0, 1.7]];
        
        case voc_Ennard_Death5:
            return [["I am their Freddy! I am their Foxy!", "I am Sister Location!"], [0, 2.9]];
        
        case voc_Ennard_Death6:
            return [["Well, if there's no scooper around...", "Guess we'll have to do this the old fashioned way!", "*LAUGHTER AND GORE*"], [0, 2.8, 6.9]];
        
        case voc_Ennard_Death7:
            return [["It's not so bad!", "Now you have friends on the inside!"], [0, 1.8]];
        
        case voc_Ennard_Death8:
            return [["Hey, sad clown!", "Turn that frown around!"], [0, 2]];
        
        case voc_Ennard_Death9:
            return [["Well, if you can't beat them...", "BE them."], [0, 2]];
        
        case voc_Ennard_Deathcoin:
            return [["IT WORKS ON ALL OF ME!?"], [0]];
        
        case voc_TrashGang_Select:
        case voc_TrashGang_Deathcoin:
            return [["*METAL CLANG*"], [0]];
        
        case voc_Electrobab_Selection:
            return [["Have no fear, bidizens!"], [0]];
        
        case voc_Electrobab_Deathcoin:
            return [["I don't know the meaning of the word \"surrender\"!", "I mean...I know it. I'm not dumb."], [0, 3.5]];
        
        case voc_IgnitedFreddy_Selection:
            return [["It's a nice night for a walk."], [0]];
        
        case voc_IgnitedFreddy_Death1:
            return [["Try and burn me! Scatter my ashes!", "I'll never stop haunting you."], [0, 4.3]];
        
        case voc_IgnitedFreddy_Death2:
            return [["Trapped forever here in robot hell..."], [0]];
        
        case voc_IgnitedFreddy_Death3:
            return [["Only you can prevent Freddy fires."], [0]];
        
        case voc_IgnitedFreddy_Death4:
            return [["Pray if you dare.", "No one will answer."], [0, 2.5]];
        
        case voc_IgnitedFreddy_Death5:
            return [["Before creation...", "...comes destruction."], [0, 2.2]];
        
        case voc_IgnitedFreddy_Death6:
            return [["The nightguard seldom knows contemporaneous wrong,", "for it is never enough to possess the joy of creative service."], [0, 5.9]];
        
        case voc_IgnitedFreddy_Death7:
            return [["You'll make for an excellent kindling."], [0]];
        
        case voc_IgnitedFreddy_Death8:
            return [["It's a joy to be among you horrid few."], [0]];
        
        case voc_IgnitedFreddy_Deathcoin:
            return [["What a bum deal..."], [0]];
        
        case voc_Yenndo_Selection:
            return [["Hello, yello!"], [0]];
        
        case voc_Yenndo_Death1:
            return [["Aww, you don't have to be afraid of me!", "I'm just a robot!"], [0, 2]];
        
        case voc_Yenndo_Death2:
            return [["Oh, I'm sorry!", "I didn't mean to frighten you!"], [0, 1.1]];
        
        case voc_Yenndo_Death3:
            return [["Ooh, now that was fun!", "Next time we should play Knots & Crosses!"], [0, 1.6]];
        
        case voc_Yenndo_Death4:
            return [["Oh, darn my disastrously deceptive deadly demeanor!", "I'm not due this distress!"], [0, 3.6]];
        
        case voc_Yenndo_Death5:
            return [["This part goes here, and...I think this part...", "Oh, shoot. Where'd your leg go?", "Aw geez...I can't fix you."], [0, 2.8, 4.8]];
        
        case voc_Yenndo_Death6:
            return [["IGNORE ME!!"], [0]];
        
        case voc_Yenndo_Death7:
            return [["Whoops! Uh...", "*WHISTLES AWAY*"], [0, 2.8]];
        
        case voc_Yenndo_Death8:
            return [["I sure had a fun time!", "Maybe someday, we can have an even funner time!"], [0, 1.9]];
        
        case voc_Yenndo_Deathcoin:
            return [["Oh, bother..."], [0]];
        
        case voc_Deedee_Selection:
            return [["Catch and release!"], [0]];
        
        case voc_Deedee_Deathcoin:
            return [["How unfortunate..."], [0]];
        
        case voc_Pigpatch_WhaddaUWant:
            return [["Whaddaya YOU want?"], [0]];
        
        case voc_Pigpatch_RightWhereIWantYa:
            return [["Gotcha right where I want you..."], [0]];
        
        case voc_Pigpatch_StartPrayinBoy:
            return [["Better start prayin', boy..."], [0]];
        
        case voc_Pigpatch_Banjo:
            return [["*PLAYING BANJO*", "*STRING SNAPS*", "UGH! Dagnabbit..."], [0, 1.2, 1.4]];
        
        case voc_Pigpatch_GadgetsForKillin:
            return [["If y'all had more gadgets for killin',", "you wouldn't need so many for hidin'!"], [0, 1.7]];
        
        case voc_Pigpatch_GoOnAndSqueal:
            return [["Yeah, that's right! Go on n' squeal, little piggy!", "*LAUGHTER*"], [0, 2.9]];
        
        case voc_Pigpatch_JustLikeTheMan:
            return [["Got in yer head!", "Just like the MAN."], [0, 1.5]];
        
        case voc_Pigpatch_KickedYerBluegrass:
            return [["Kicked yer bluegrass!", "HOOOO-EE!!"], [0, 1.6]];
        
        case voc_Pigpatch_ThisLittlePiggy:
            return [["And THIS little piggy", "found the night guard."], [0, 2.4]];
        
        case voc_Pigpatch_VirtualRealitayOne:
            return [["And that's why I was in da Virtu-ell Reali-tay one."], [0]];
        
        case voc_Pigpatch_YouWitThem:
            return [["What'chu watchin' ME, for, HUH?", "You with THEM!?"], [0, 2.2]];
        
        case voc_Pigpatch_Deathcoin:
            return [["Now that's some hogwash!"], [0]];
        
        case voc_Monty_Pain:
            return [["OOOOOUUUUUUGGGHHH!!"], [0]];
        
        case voc_Monty_HeyLittleGuy:
            return [["Hey!", "Little guy!"], [0, 0.6]];
        
        case voc_Monty_FORE:
            return [["FORE!", "*SOUND OF CLUBBING THE NIGHT GUARD WITH A NINE-IRON*"], [0, 0.6]];
        
        case voc_Monty_GuyOutsideGatorGolf:
            return [["You know...", "I did this to a guy outside Gator Golf once."], [0, 0.8]];
        
        case voc_Monty_JustInTheWay:
            return [["Nothin' personal...", "You were just in the way."], [0, 1.2]];
        
        case voc_Monty_PoseForTheFans:
            return [["Pose for the fans!"], [0]];
        
        case voc_Monty_StepOnUp:
            return [["Looks like YOU gotta step up!", "Step...ON up.", "DOWN.", "From...uh...", "this line of work!", "Yeah."], [0, 1.7, 3.3, 4.1, 6.2, 8.1]];
        
        case voc_Monty_TheseSunglasses:
            return [["Oh, THESE sunglasses?", "You can't afford THESE sunglasses."], [0, 1.9]];
        
        case voc_Monty_WrestlesThisGator:
            return [["Nobody wrestles THIS gator and lives to tell the tale!"], [0]];
        
        case voc_Monty_Deathcoin:
            return [["BOGEY!", "I mean...", "BOGUS!"], [0, 0.8, 1.6]];
        
        case voc_SunMoon_Selection:
            return [["Goooood day, sunshine!"], [0]];
        
        case voc_SunMoon_SunAttack:
            return [["HUH!?"], [0]];
        
        case voc_SunMoon_Death_Sun1:
            return [["There goes the sun!", "...Doo do dodo.", "G-Get it?"], [0, 2.1, 4.1]];
        
        case voc_SunMoon_Death_Sun2:
            return [["No no NO!", "The blinds are NOT a toy!"], [0, 1.6]];
        
        case voc_SunMoon_Death_Sun3:
            return [["I'll be confiscating this!", "*CONFISCATES*"], [0, 1.8]];
        
        case voc_SunMoon_Death_Sun4:
            return [["Don't scare me like that!", "Friends don't scare each other!"], [0, 1.6]];
        
        case voc_SunMoon_Death_Sun5:
            return [["It is FAR past your bedtime!", "Off to bed with you!"], [0, 2.7]];
        
        case voc_SunMoon_Death_Sun6:
            return [["Hoo boy...", "This one is NOT going on the fridge."], [0, 1.3]];
        
        case voc_SunMoon_Death_Moon1:
            return [["Your skills are waning..."], [0]];
        
        case voc_SunMoon_Death_Moon2:
            return [["And so goes our little carousel of calamity."], [0]];
        
        case voc_SunMoon_Death_Moon3:
            return [["We aren't done yet, little grain of sand.", "It's time to flip the hourglass and start this all over."], [0, 3.2]];
        
        case voc_SunMoon_Death_Moon4:
            return [["Such is the punishment for a lapse in vigilance, watchman."], [0]];
        
        case voc_SunMoon_Death_Moon5:
            return [["If you should die before you wake,", "then your soul is mine to take."], [0, 3.6]];
        
        case voc_SunMoon_Death_Moon6:
            return [["The eyes play tricks like tiny round devils."], [0]];
        
        case voc_SunMoon_Deathcoin:
            return [["Noooo...not the holy light...", "It BURNS...!"], [0, 2.7]];
        
        case voc_VIP_BringHomeTheBacon:
            return [["Let's bring home the bacon!"], [0]];
        
        case voc_VIP_Bigger:
            return [["Could be bigger~!"], [0]];
        
        case voc_VIP_Delightful:
            return [["Oh, delightful!"], [0]];
        
        case voc_VIP_Hmm1:
        case voc_VIP_Hmm2:
        case voc_VIP_Hmm3:
            return [["Hmmm..."], [0]];
        
        case voc_VIP_KeepUpTheGoodWork:
            return [["Keep up the good work, buddy!"], [0]];
        
        case voc_VIP_ShootForTheMoon:
            return [["Let's shoot for the moon!"], [0]];
        
        case voc_VIP_TheShareholders:
            return [["The shareholders are gonna LOVE this!"], [0]];
        
        case voc_VIP_DifferentDirection:
            return [["Sorry, buddy!", "The company's just moving in a different direction."], [0, 1]];
        
        case voc_VIP_Downsize:
            return [["Now THAT'S how you downsize!"], [0]];
        
        case voc_VIP_RealSpunky:
            return [["I may just be a flunky...", "but I'm REAL spunky!"], [0, 1.7]];
        
        case voc_VIP_SeverancePackage:
            return [["Phew...", "That's one less severance package I have to worry about!"], [0, 0.6]];
        
        case voc_VIP_ThatdBeGreat:
            return [["If you could just work a LITTLE harder next time,", "that'd be great."], [0, 2.9]];
        
        case voc_VIP_TheMondays:
            return [["Looks like SOMEONE'S got a bad case of the Mondays!"], [0]];
        
        case voc_VIP_ThisPigsVision:
            return [["Sorry, buddy!", "You just don't fit this pig's vision."], [0, 1.2]];
        
        case voc_VIP_TurnoverThisHigh:
            return [["Ugh...", "We're never gonna meet this quarter's sales goals with turnover THIS high!"], [0, 0.6]];
        
        case voc_VIP_WheresTheSynergy:
            return [["Where's the leverage? Where's the deep dive!?", "Where's the SYNERGY!?"], [0, 2.6]];
        
        case voc_VIP_Deathcoin:
            return [["Crashed by cash...", "Unbelievable!"], [0, 1.6]];
        
        case voc_GlamrockChica_Selection:
            return [["Are you ready to Mazercise?"], [0]];
        
        case voc_GlamrockChica_Appear1:
            return [["It's pizza time!"], [0]];
        
        case voc_GlamrockChica_Appear2:
        case voc_GlamrockChica_Appear3:
        case voc_GlamrockChica_Appear4:
            return [["Pizza?"], [0]];
        
        case voc_GlamrockChica_Appear5:
            return [["I'm STARVING!"], [0]];
        
        case voc_GlamrockChica_Fed1:
            return [["In crust we trust!"], [0]];
        
        case voc_GlamrockChica_Fed2:
            return [["Aww, for me?"], [0]];
        
        case voc_GlamrockChica_Fed3:
            return [["Pizza pizza!"], [0]];
        
        case voc_GlamrockChica_Death1:
            return [["Five...six...seven...eight...", "And stretch! And back...and down...", "Now flex...straight...", "You're dead!"], [0, 1.4, 3.9, 5.7]];
        
        case voc_GlamrockChica_Death2:
            return [["Haven't you heard of 30 seconds or less!?", "C'mon, show some more speed next time!"], [0, 1.9]];
        
        case voc_GlamrockChica_Death3:
            return [["Fill your wounds with a pound of salt,", "they'll taste a lot better that way!"], [0, 1.6]];
        
        case voc_GlamrockChica_Death4:
            return [["Pizza for breakfast, pizza with tea,", "pizza for lunch and snack and dinner and dessert,", "BABY it would satisfy ME!"], [0, 2.2, 4.9]];
        
        case voc_GlamrockChica_Death5:
            return [["Awww, the toppings are all mixed up...", "I may eat garbage, but even I have standards!"], [0, 2.4]];
        
        case voc_GlamrockChica_Death6:
            return [["Aw, you can't go already!", "The night is young and we have umbrellas in our drinks!"], [0, 1.5]];
        
        case voc_GlamrockChica_Death7:
            return [["I'LL CRUSH YOU!!"], [0]];
        
        case voc_SleepyMoon_Selection:
            return [["Lullaby, and good night..."], [0]];
        
        case voc_SleepyMoon_Deathcoin:
            return [["Back to bed..."], [0]];
        
        case voc_Blank_PickUpThePencil:
            return [["Pick up the pencil!"], [0]];
        
        case voc_Blank_Fantastic:
            return [["Fantastique!"], [0]];
        
        case voc_Blank_ItsArt:
            return [["IT'S ART!"], [0]];
        
        case voc_Blank_Magnifique:
            return [["Magnifique!"], [0]];
        
        case voc_Blank_SpeaksToMySoul:
            return [["It speaks to my very soul!"], [0]];
        
        case voc_Blank_WouldntCallItArt:
            return [["It's a picture...", "but I wouldn't call it art."], [0, 1]];
        
        case voc_Blank_ArtBlock:
            return [["Art block is no excuse!", "A little doodle each day helps."], [0, 2.8]];
        
        case voc_Blank_BulletproofGlass:
            return [["I would've gotten in through the window, but, eh...", "Bulletproof glass."], [0, 2.8]];
        
        case voc_Blank_DisgraceToArtCommunity:
            return [["You are a disgrace to the ENTIRE art community,", "and the entire world would REJOICE if you never touched a piece of paper again!", "EVER!"], [0, 3.7, 9.2]];
        
        case voc_Blank_DrawingBlanks:
            return [["I suppose you were only drawing blanks."], [0]];
        
        case voc_Blank_DrawingBoard:
            return [["Well...", "Back to the drawing board!"], [0, 0.6]];
        
        case voc_Blank_DrawnToAClose:
            return [["Looks like things have drawn to a close!"], [0]];
        
        case voc_Blank_FirstStep:
            return [["The first step to getting good is to suck!", "...So you are on pace on to get good at this game."], [0, 3.4]];
        
        case voc_Blank_HappyAccident:
            return [["Killing you", "was no happy accident!"], [0, 0.9]];
        
        case voc_Blank_ICouldvePaintedThat:
            return [["You are one of those people who go to an art galley and go", "\"I could've painted that!\" whenever you see something that isn't super complex,", "aren't you?"], [0, 2.9, 6.7]];
        
        case voc_Blank_SlaughteredNightguard:
            return [["What is black, and white, and red all over?", "Why, a slaughtered night guard of course!", "*LAUGHTER*"], [0, 3.6, 5.9]];
        
        case voc_Blank_Deathcoin:
        case voc_CptCobalt_Renard_Scared3:
            return [["SACRÉ BLEU!"], [0]];
        
        case voc_Bonnet_Selection:
            return [["I pink...", "Therefore, I am!"], [0, 1]];
        
        case voc_Bonnet_AppearRare1:
            return [["Peekaboo!"], [0]];
        
        case voc_Bonnet_AppearRare2:
            return [["Tickle attack!"], [0]];
        
        case voc_Bonnet_AppearRare3:
            return [["WASSAAPP!!"], [0]];
        
        case voc_Bonnet_Thrown1:
        case voc_Bonnet_Thrown2:
        case voc_Bonnet_Thrown3:
            return [["AHH!!"], [0]];
        
        case voc_Bonnet_Deathcoin:
            return [["Who put a bee in YOUR bonnet?"], [0]];
        
        case voc_Archie_Selection:
            return [["Freddy me this!"], [0]];
        
        case voc_Archie_Death1:
            return [["Come on, that was such an easy character to guess!", "Next you're gonna tell me you don't know who Chocolate Freddy is."], [0, 3.1]];
        
        case voc_Archie_Death2:
            return [["Hey, for what it's worth,", "you DO need a very high IQ to understand Five Nights at Frickbear's 3."], [0, 1.2]];
        
        case voc_Archie_Death3:
            return [["See, THIS is why I'M a wiki moderator", "and you're not."], [0, 2.5]];
        
        case voc_Archie_Death4:
            return [["Y'know,", "FNaF characters are second nature to a guy like me,", "so it's easy to forget that the average person only knows about Boxbyte and", "maybe one or two Fazbear Frights characters.", "And Beacon Bonnie, of course."], [0, 0.5, 3, 6.4, 9.3]];
        
        case voc_Archie_Death5:
            return [["And here I was thinking you were a competent player!", "I guess even I can mischaracterize."], [0, 3.8]];
        
        case voc_Archie_Death6:
            return [["Not many people know this,", "but FNaF2 is actually just a reskin of the Japanese-exclusive Doki Doki Lumber Company!", "Seriously, look it up."], [0, 1.3, 6]];
        
        case voc_Archie_Death7:
            return [["So they didn't get to pull their wits to guess the unknown teddy.", "You betty they're not ready when there's a bear need for Freddy."], [0, 2.9]];
        
        case voc_Archie_Death8:
            return [["You're rather...what's the word?", "Dull."], [0, 2.7]];
        
        case voc_Archie_Death9:
            return [["Did you know that despite generally being the less popular character in fanworks,", "Browboy actually has three times as many appearances as Mendo across the FNaF series?", "It's true!", "They're both FNAF World originals, but while Mendo's never made another appearance after FNaF World,", "Browboy features in both the Gravity Orbit minigame of Pizzeria Simulator AND as a boss in Fury's Rage!", "Of course, not many players are good enough at that minigame to even reach him,", "and even fewer are big enough fans of the series to have even PLAYED Fury's Rage...", "so I don't blame you if you didn't know.", "I just thought that was interesting."], [0, 3.9, 8.2, 9.4, 14.1, 20, 23.2, 27.2, 29]];
        
        case voc_Archie_Deathcoin:
            return [["\"Or not\", huh?"], [0]];
        
        case voc_GlamrockFreddy_Selection:
            return [["Let's go, superstar!"], [0]];
        
        case voc_GlamrockFreddy_Misc_ArcadeGames:
            return [["Wow! You're very skilled at those arcade games!", "Your high scores might not be quite as high as Gregory's...", "but you gave a good effort, and that's what counts!"], [0, 3.9, 7.1]];
        
        case voc_GlamrockFreddy_Misc_BrushYourTeeth:
            return [["Hello, superstar!", "Have you been brushing your teeth?", "Dental hygiene is very important!"], [0, 1.6, 3.2]];
        
        case voc_GlamrockFreddy_Misc_HereToHelp:
            return [["I just want you to know that if anything happens, you can always talk to me.", "I'm here to help! I can help with anything!"], [0, 4.7]];
        
        case voc_GlamrockFreddy_Misc_ImOrange:
            return [["Hello, superstar! It's me, Glamrock Freddy!", "I'm the orange one!"], [0, 3.6]];
        
        case voc_GlamrockFreddy_Misc_InternetSafety:
            return [["Hello, superstar!", "Remember to never share personal information online, especially with someone you don't know!", "Your privacy matters!"], [0, 2.1, 8.1]];
        
        case voc_GlamrockFreddy_Misc_Lighter:
            return [["Did you know my finger doubles as a lighter?", "Gregory carries many fancy candles around, so maybe you'll get to see later!"], [0, 3.1]];
        
        case voc_GlamrockFreddy_Misc_LikeAndSubscribe:
            return [["Superstar!", "Make sure to smash that like button, hit the bell,", "and subscribe to get notifications for awesome Pizzaplex news!"], [0, 1.2, 4.3]];
        
        case voc_GlamrockFreddy_Misc_Lost:
            return [["I...err...appear to be lost.", "Do you know the way to the birthday party?", "The birthday boy's somewhere around here..."], [0, 3.4, 5.7]];
        
        case voc_GlamrockFreddy_Misc_MakeItOut:
            return [["Hey, it's good to see you!", "I'm sure you'll make it out of here in no time, just like me and Gregory!", "Don't lose hope, and stay strong!"], [0, 1.9, 6.1]];
        
        case voc_GlamrockFreddy_Misc_SafePlace:
            return [["I have yet to find a safe place to keep Gregory.", "Do you happen to know anywhere safe I can keep him?", "No?", "That's okay! I'll keep looking!"], [0, 3.2, 6.2, 7.1]];
        
        case voc_GlamrockFreddy_Misc_Sleep:
            return [["Have you gotten your full eight hours?", "Sleep is important, especially when working a night shift!"], [0, 2.1]];
        
        case voc_GlamrockFreddy_Misc_StayHydrated:
            return [["Don't forget to stay hydrated!", "...Though before you get any ideas,", "I wouldn't drink from that cup on your desk if I were you."], [0, 2.7, 5]];
        
        case voc_GlamrockFreddy_Death_FoundOnCorpse:
            return [["You'll have to excuse Gregory.", "He may be...rambunctious, but I assure you he means well!", "Hey, look what I found on their corpse!", "Free pizza coupons, twenty bucks...", "Ooh, a security pass!"], [0, 2, 6.3, 8.4, 10.8]];
        
        case voc_GlamrockFreddy_Death_FriendInsideMe:
            return [["Oh dear, my apologies!", "You'll have to excuse the friend inside me."], [0, 2.5]];
        
        case voc_GlamrockFreddy_Death_GGY:
            return [["GG, dude!", "GG...Y.", "Hmm.", "I think I like the sound of that..."], [0, 2, 4.4, 5.7]];
        
        case voc_GlamrockFreddy_Death_Gregbot:
            return [["What, surprised I can jumpscare you?", "Any robot can!"], [0, 2.6]];
        
        case voc_GlamrockFreddy_Death_JustAPrank:
            return [["Calm down! It's just a prank, man..."], [0]];
        
        case voc_GlamrockFreddy_Death_MrHippo:
            return [["Man, I bet Glamrock MR. HIPPO could kill this guy...", "MR. HIPPO IS A GODDAMN NATIONAL TREASURE, YOU LITTLE BRAT.", "KEEP HIS NAME OUT OF YOUR GODDAMN MOUTH."], [0, 3, 6.9]];
        
        case voc_GlamrockFreddy_Death_NowImBored:
            return [["Great, now I'm bored.", "C'mon, Freddy! Let's go find another Pizzeria to hijack!", "Sigh...Okay, Gregory..."], [0, 1.9, 5]];
        
        case voc_GlamrockFreddy_Death_SubparSuperstar:
            return [["Subpar, superstar..."], [0]];
        
        case voc_GlamrockFreddy_Death_SucksGettingCaught:
            return [["Yeah you like that?! YOU LIKE THAT?!", "Sucks getting caught, DOESN'T IT?!"], [0, 2]];
        
        case voc_GlamrockFreddy_Death_TakenANap:
            return [["Excuse me, did I miss something while I was out?", "...Oh! The nightguard has taken a nap!", "How nice!"], [0, 3.9, 7.3]];
        
        case voc_GlamrockFreddy_Deathcoin:
            return [["Oh, Gregory! You're broken!", "MY KNEE'S BLEEDING!!"], [0, 2]];
        
        case voc_MXES_Selection:
            return [["Prepare to be .EXE'd!"], [0]];
        
        case voc_MXES_Death1:
            return [["Your life was ruined the second I was born!"], [0]];
        
        case voc_MXES_Death2:
            return [["I don't think they make difficulty settings for no-hopers like you..."], [0]];
        
        case voc_MXES_Death3:
            return [["All this fun can't be good for you!"], [0]];
        
        case voc_MXES_Death4:
            return [["Oh, toughen up!", "This is just another one of life's speedbumps!"], [0, 1.4]];
        
        case voc_MXES_Death5:
            return [["Pah!", "Back when I was in charge, we didn't have any of these fancy gadgets!", "MORE doesn't mean BETTER!"], [0, 1, 5.5]];
        
        case voc_MXES_Death6:
            return [["Your decision-making is TERRIBLE!", "There's no logic behind any of it!"], [0, 2.9]];
        
        case voc_MXES_Death7:
            return [["You're a vulnerability...", "and vulnerabilities must be removed."], [0, 2.1]];
        
        case voc_MXES_Death8:
            return [["Okay, move aside, I'll do the night for ya...", "NAW!! Only kidding!"], [0, 3.3]];
        
        case voc_MXES_Deathcoin:
            return [["Oh, alright!", "Don't come crying to me when your systems wind up infected!"], [0, 1.1]];
        
        case voc_SpringBonnie_Selection:
            return [["I'M GONNA TAKE YOU BACK TO THE PAST!"], [0]];
        
        case voc_SpringBonnie_Death1:
            return [["NO. MORE. GAMES."], [0]];
        
        case voc_SpringBonnie_Death2:
            return [["AREN'T NIGHT SHIFTS JUST THE PITS?"], [0]];
        
        case voc_SpringBonnie_Death3:
            return [["AH, THE INCOMPETENT NIGHT GUARD TIMELINE.", "HOW DULL."], [0, 4.7]];
        
        case voc_SpringBonnie_Death4:
            return [["DOORS?", "WHERE YOU'RE GOING, YOU DON'T NEED DOORS!"], [0, 1.4]];
        
        case voc_SpringBonnie_Death5:
            return [["I KNEW I'D GET YOU EVENTUALLY!", "...JUST TOOK MORE REWINDS THAN EXPECTED."], [0, 4]];
        
        case voc_SpringBonnie_Death6:
            return [["YOUR TIME...IS UP."], [0]];
        
        case voc_SpringBonnie_Death7:
            return [["DO YOU KNOW THE DIFFERENCE BETWEEN A WIMP AND A MAN LIKE ME?", "YO MAMA."], [0, 5.1]];
        
        case voc_SpringBonnie_Death8:
            return [["DO YOU WANNA GET ICE CREAM AFTER YOUR SHIFT?"], [0]];
        
        case voc_SpringBonnie_Death9:
            return [["I HEARD YOU WERE FEELING KIND OF SAD.", "I'M GONNA BE YOUR NEW DAD!"], [0, 3]];
        
        case voc_SpringBonnie_Deathcoin:
            return [["NO! NOT INTO THE PIT!", "IT BURNS!!"], [0, 2.2]];
        
        case voc_Reagent_Selection:
            return [["It's pronounced \"Re-Agent.\""], [0]];
        
        case voc_Reagent_Death1:
            return [["You humans merely adopted the chemicals...", "I was born in them.", "Molded by them."], [0, 4, 6.2]];
        
        case voc_Reagent_Death2:
            return [["You tasted a poison paradise...", "and now you're slipping under."], [0, 3.2]];
        
        case voc_Reagent_Death3:
            return [["You seem to be...out of your element."], [0]];
        
        case voc_Reagent_Death4:
            return [["Don't be too hard on yourself.", "Oxidants happen!"], [0, 3]];
        
        case voc_Reagent_Death5:
            return [["There's no stain I can't wash out."], [0]];
        
        case voc_Reagent_Death6:
            return [["Well!", "That's not the reaction I expected."], [0, 1.3]];
        
        case voc_Reagent_Death7:
            return [["We seem to have...", "very little chemistry."], [0, 2]];
        
        case voc_Reagent_Death8:
            return [["I've been told I have something of a...toxic relationship with the staff.", "I suppose they're not wrong,", "I do spray them with noxious gases every once in a while."], [0, 5.8, 7.7]];
        
        case voc_Reagent_Deathcoin:
            return [["That was extremely painful...", "for me."], [0, 2.5]];
        
        case voc_PhonyBoss_Death_1:
            return [["Your fate can't be changed!", "You're just another SHMUCK!"], [0, 2.5]];
        
        case voc_PhonyBoss_Death_2:
            return [["Now, if you're wondering why guys like us need this heavy duty mechanical claw,", "or what all of us are doing in here,", "my answer to BOTH those questions is:", "DON'T WORRY ABOUT IT!"], [0, 5.3, 7.6, 10.3]];
        
        case voc_PhonyBoss_Death_3:
            return [["Oh, what? You think this is fun?", "You gotta be coo-coo crazy!"], [0, 3.3]];
        
        case voc_PhonyBoss_Death_4:
            return [["*LAUGHTER*", "Oh, you night guards are some real kidders!"], [0, 2.4]];
        
        case voc_PhonyBoss_Death_5:
            return [["Ohh, you don't wanna play my little minigames?", "What!? You need more of an incentive to survive!?"], [0, 4]];
        
        case voc_PhonyBoss_Death_6:
            return [["Maybe you're right... Greed IS good...", "You'll get a coffin just as gaudy as you are! *LAUGHTER*"], [0, 3.2]];
        
        case voc_PhonyBoss_Death_7:
            return [["My first EVIL act as the new owner of Frickbear's...", "is to approve EVERYBODY'S PTO!", "*MANIACAL LAUGHTER*"], [0, 4.8, 9.1]];
        
        case voc_PhonyBoss_Death_8:
            return [["\"Hey? Who do you wanna call?\"", "\"Okey dokey! Calling...\"", "a WIMPY LITTLE STOOGE who doesn't know how to play right!", "*LAUGHTER*"], [0, 3.6, 5.4, 9.1]];
        
        case voc_PhonyBoss_Death_9:
            return [["Lots of money you've got here!", "Sure would be a shame if someone were to, oh, I dunno...", "DONATE ALL OF IT TO CHARITY!!", "*LAUGHTER*"], [0, 1.9, 6.1, 8.4]];
        
        case voc_PhonyBoss_Door1:
            return [["Over heeeere~!"], [0]];
        
        case voc_PhonyBoss_Door2:
            return [["Here I come!"], [0]];
        
        case voc_PhonyBoss_Door3:
            return [["I'm-a got you now!"], [0]];
        
        case voc_PhonyBoss_Door4:
            return [["Let me in! LET ME IN!"], [0]];
        
        case voc_PhonyBoss_Door5:
            return [["Now...I'ma gonna KILL you!"], [0]];
        
        case voc_PhonyBoss_Intro:
            return [["Hey, chump!", "It's-a ME!!", "*LAUGHTER*"], [0, 1.6, 3.9]];
        
        case voc_PhonyBoss_Enter1:
            return [["You want FUN?", "Eh, too bad."], [0, 2.2]];
        
        case voc_PhonyBoss_Enter2:
            return [["My mustache declares", "that you're IN FOR A SCARE!"], [0, 2]];
        
        case voc_PhonyBoss_Enter3:
            return [["The bigger they are...", "the harder they fall!"], [0, 1.3]];
        
        case voc_PhonyBoss_Enter4:
            return [["I gotta WIN!"], [0]];
        
        case voc_PhonyBoss_Flashed1:
            return [["I'm-a get you for that!"], [0]];
        
        case voc_PhonyBoss_Flashed2:
            return [["I'M BLIND!!"], [0]];
        
        case voc_PhonyBoss_Flashed3:
            return [["MY EYES!"], [0]];
        
        case voc_PhonyBoss_Flashed4:
            return [["Mama mia!"], [0]];
        
        case voc_PhonyBoss_Hit6:
            return [["OWIE!"], [0]];
        
        case voc_PhonyBoss_Deathcoin:
            return [["Grrr...", "No steak for you!"], [0, 0.9]];
        
        case voc_PhonyCall:
            return [["Hey, chump! It's-a me!", "Your boss.", "Just calling to say...", "...See you on floor 10."], [0, 2.5, 4, 6.2]];
        
        case voc_RockstarFreddy_Enter1:
            return [["Please deposit your money!"], [0]];
        
        case voc_RockstarFreddy_Enter2:
            return [["Welcome, valued employee!"], [0]];
        
        case voc_RockstarFreddy_Enter3:
            return [["Can I interest you in some upgrades?"], [0]];
        
        case voc_RockstarFreddy_Buy1:
            return [["Thank you for depositing your money!"], [0]];
        
        case voc_RockstarFreddy_Buy2:
            return [["Freddy likes this."], [0]];
        
        case voc_RockstarFreddy_Buy3:
            return [["Excellent choice!"], [0]];
        
        case voc_RockstarFreddy_Buy4:
            return [["There's still plenty in stock!"], [0]];
        
        case voc_RockstarFreddy_Buy5:
            return [["Everyone leaves with a smile!"], [0]];
        
        case voc_RockstarBonnie_BeatGoesOn:
            return [["The beat goes on."], [0]];
        
        case voc_RockstarBonnie_DontPassMeBy:
            return [["Don't pass me by, now!"], [0]];
        
        case voc_RockstarBonnie_FancyAGander:
            return [["Fancy a gander at me wares?"], [0]];
        
        case voc_RockstarBonnie_ISellMinigames:
            return [["My name's Rockstar Bonnie...", "I sell minigames!"], [0, 2.6]];
        
        case voc_RockstarBonnie_MeNose:
            return [["I can't see past me nose."], [0]];
        
        case voc_RockstarBonnie_ModernTechnology:
            return [["Ah...love modern technology now."], [0]];
        
        case voc_RockstarBonnie_PeaceNLove:
            return [["Peace n' love, mate."], [0]];
        
        case voc_RockstarBonnie_RockOn:
            return [["Rock on, mate."], [0]];
        
        case voc_RockstarChica_Enter1:
            return [["Come on in, my little chickadees!"], [0]];
        
        case voc_RockstarChica_Enter2:
            return [["Hoo-haw!"], [0]];
        
        case voc_RockstarChica_Buy1:
            return [["You're a good egg!"], [0]];
        
        case voc_RockstarChica_Buy2:
            return [["Go whoop some tail-feather!"], [0]];
        
        case voc_RockstarChica_Buy3:
            return [["You won't regret it, hun!"], [0]];
        
        case voc_RockstarChica_Buy4:
            return [["That'll teach 'em!"], [0]];
        
        case voc_RockstarChica_Buy5:
            return [["Ohh, that's gonna make 'em madder than a wet hen!"], [0]];
        
        case voc_RockstarChica_Leave:
            return [["Y'all come back now, y'hear?"], [0]];
        
        case voc_RockstarFoxy_Enter1:
            return [["Avast, ye hearties!", "AHOY THERE!"], [0, 1.2]];
        
        case voc_RockstarFoxy_Enter2:
            return [["Yohoho and a jar of pickles!", "PICKLES! PICKLES! SQUAWK!"], [0, 2.6]];
        
        case voc_RockstarFoxy_Enter3:
            return [["Aye, we got a stowaway!", "SQUAWK! STOWAWAY! STOWAWAY!"], [0, 1.6]];
        
        case voc_RockstarFoxy_Enter4:
            return [["Look at me booty! Ain't she a beauty?", "SQUAWK! HIS BOOTY!"], [0, 2.4]];
        
        case voc_RockstarFoxy_Enter5:
            return [["'Tis my pleasure to share me treasure!", "SQUAWK! TREASURE! TREASURE!"], [0, 2.5]];
        
        case voc_RockstarFoxy_Win1:
            return [["Bless be our lady of luck!"], [0]];
        
        case voc_RockstarFoxy_Win2:
            return [["Fair winds upon ye!"], [0]];
        
        case voc_RockstarFoxy_Win3:
            return [["Well-ell-ell,", "blow me down, bucko!"], [0, 1.2]];
        
        case voc_RockstarFoxy_Lose1:
            return [["You played with fire!"], [0]];
        
        case voc_RockstarFoxy_Lose2:
            return [["A storm's a-comin'!"], [0]];
        
        case voc_RockstarFoxy_Lose3:
            return [["Send me greetings to Davy Jones!"], [0]];
        
        case voc_RockstarFoxy_Lose4:
            return [["Time to batten down yer hatches!"], [0]];
        
        case voc_RockstarFoxy_Buy1:
            return [["All hands on deck!"], [0]];
        
        case voc_RockstarFoxy_Buy2:
            return [["Claim ye coffer!"], [0]];
        
        case voc_RockstarFoxy_Buy3:
            return [["Follow the map, and where do it lead?"], [0]];
        
        case voc_RockstarFoxy_Leave:
            return [["Ah, the yellowbelly..."], [0]];
        
        case voc_Dollie_Enter1:
            return [["Oh, you poor thing...!"], [0]];
        
        case voc_Dollie_Enter2:
            return [["What brings you in today?"], [0]];
        
        case voc_Dollie_Enter3:
            return [["Don't forget to recycle!"], [0]];
        
        case voc_Dollie_Enter4:
            return [["Nothing shock therapy can't fix!"], [0]];
        
        case voc_Dollie_Buy1:
            return [["Fix, fix, fix!"], [0]];
        
        case voc_Dollie_Buy2:
            return [["Just a little booboo!"], [0]];
        
        case voc_Dollie_Buy3:
            return [["Grab a lollipop on the way out!"], [0]];
        
        case voc_Dollie_Buy4:
            return [["Good like new!"], [0]];
        
        case voc_Dollie_Leave:
            return [[""], [0]];
        
        case voc_TipsyBird_BottleMakesThree:
            return [["You, me, and the bottle makes three tonight!"], [0]];
        
        case voc_TipsyBird_GetYaHun:
            return [["What can I get ya, hun?"], [0]];
        
        case voc_TipsyBird_ILoveDrinkingAlcohol:
            return [["I love drinking alcohol!"], [0]];
        
        case voc_TipsyBird_MmmBeer:
            return [["Mmm...beer..."], [0]];
        
        case voc_TipsyBird_MrBooze:
            return [["Come mess with Mr. Booze!"], [0]];
        
        case voc_TipsyBird_OutboozesTheBird:
            return [["No-one outboozes the bird!"], [0]];
        
        case voc_TipsyBird_RoughShift:
            return [["Rough shift tonight, huh?"], [0]];
        
        case voc_TipsyBird_TakeUpDrinking:
            return [["You should take up drinking!"], [0]];
        
        case voc_Eleanor_Enter1:
            return [["Make a wish!"], [0]];
        
        case voc_Eleanor_Enter2:
            return [["One man's trash is another man's treasure."], [0]];
        
        case voc_Eleanor_Enter3:
            return [["How much would you sacrifice for anything you desire?"], [0]];
        
        case voc_Eleanor_Enter4:
            return [["I can make your journey less...", "wishy-washy."], [0, 2]];
        
        case voc_Eleanor_Buy1:
            return [["Of course...", "I specialize in death wishes."], [0, 1.2]];
        
        case voc_Eleanor_Buy2:
            return [["Be careful what you wish for."], [0]];
        
        case voc_Eleanor_Buy3:
            return [["It's beautiful what a wish upon a star can do."], [0]];
        
        case voc_Eleanor_Buy4:
            return [["Time to practice wishful thinking!"], [0]];
        
        case voc_Eleanor_Buy5:
            return [["Making you happy makes me happy!"], [0]];
        
        case voc_Eleanor_Leave:
            return [["This is the thanks I get!?"], [0]];
        
        case voc_Morse_AlrightLaddie:
            return [["Y'alright, laddie?"], [0]];
        
        case voc_Morse_ChooseQuickly:
            return [["Choose quickly, yeh wee git."], [0]];
        
        case voc_Morse_DownWeGo:
            return [["And down we go!"], [0]];
        
        case voc_Morse_FullPrice:
            return [["Yer not weaselin' yer way out of full price, ye know!"], [0]];
        
        case voc_Morse_MindYerHead:
            return [["Mind yer head!"], [0]];
        
        case voc_Morse_OffWeGo:
            return [["Amp up yer diggers,", "'cuz off we go!"], [0, 1.3]];
        
        case voc_Morse_OffWithYe:
            return [["Off with yeh, then!"], [0]];
        
        case voc_Morse_RightThisWay:
            return [["Aye, brilliant, right this way."], [0]];
        
        case voc_Morse_WasteMyTime:
            return [["Dinnae waste ma time!"], [0]];
        
        case voc_Browboy_Enter1:
            return [["What can I do ya for?"], [0]];
        
        case voc_Browboy_Enter2:
            return [["Let's get down to tungsten tacks."], [0]];
        
        case voc_Browboy_Enter3:
            return [["Well, lookie what the shark dragged in!"], [0]];
        
        case voc_Browboy_Buy1:
            return [["Let's play some ball, boys!"], [0]];
        
        case voc_Browboy_Buy2:
            return [["Time to take out the trash!"], [0]];
        
        case voc_Browboy_Buy3:
            return [["Let's give 'em a good whack on the back!"], [0]];
        
        case voc_Browboy_Buy4:
            return [["Scrap metal...comin' up!"], [0]];
        
        case voc_Browboy_Buy5:
            return [["They're gonna need some get-well-soon balloons!"], [0]];
        
        case voc_Carnie_Intro1:
            return [["You there! With the, uh, mouse n' keyboard!"], [0]];
        
        case voc_Carnie_Intro2:
            return [["You there! With the freakish haircut!"], [0]];
        
        case voc_Carnie_Intro3:
            return [["You there! With the ugly mug!"], [0]];
        
        case voc_Carnie_Intro4:
            return [["Hey, you over there! With the psycho killer glint in your eyes!"], [0]];
        
        case voc_Carnie_Intro5:
            return [["You there! With the unspecified characteristics!"], [0]];
        
        case voc_Carnie_Selected1:
            return [["Just aim and shoot! Aim and shoot!"], [0]];
        
        case voc_Carnie_Selected2:
            return [["Everyone can be a winner!", "Especially if you pay more!"], [0, 2.3]];
        
        case voc_Carnie_Selected3:
            return [["LOSE big,", "and earn yourself a mockery courtesy of yours truly!"], [0, 1]];
        
        case voc_Carnie_Selected4:
            return [["Everyone's a winner!", "...Unless ya suck."], [0, 1.8]];
        
        case voc_Carnie_Selected5:
            return [["Anyone with a frontal lobe can do it!"], [0]];
        
        case voc_Carnie_Startup1:
            return [["On your mark..."], [0]];
        
        case voc_Carnie_Startup2:
            return [["Get set..."], [0]];
        
        case voc_Carnie_Startup3:
            return [["Go!"], [0]];
        
        case voc_Carnie_Lose1:
            return [["Well I'd tell you to try again, but I don't want you to start crying."], [0]];
        
        case voc_Carnie_Lose2:
            return [["Too bad, so sad,", "now make like a tree and fall in a landfill."], [0, 1.1]];
        
        case voc_Carnie_Lose3:
            return [["Hey kid, don't beat yourself up for sucking at the game!", "That's my job!"], [0, 2.9]];
        
        case voc_Carnie_Lose4:
            return [["Hey, I do things professionally!", "I will only laugh at you when you're not looking!"], [0, 2.1]];
        
        case voc_Carnie_Lose5:
            return [["Ah, come on, don't you wanna be a winner?"], [0]];
        
        case voc_Carnie_Win1:
            return [["Another lucky winner!"], [0]];
        
        case voc_Carnie_Win2:
            return [["Agh, I knew I shoulda rigged that pistol..."], [0]];
        
        case voc_FazEntRep_Enter1:
            return [["Look no further for animatronic companionship!"], [0]];
        
        case voc_FazEntRep_Enter2:
            return [["You'll never be alone again with our furry friends!"], [0]];
        
        case voc_FazEntRep_Enter3:
            return [["We've got terrifying animatronic bears!"], [0]];
        
        case voc_FazEntRep_Enter4:
            return [["HELLOOOOO everybody, I'm Fazbear Entertainment Representative,", "and WELCOME", "to my shop!"], [0, 3.3, 4.5]];
        
        case voc_FazEntRep_Enter5:
            return [["Fun, fun, fun!", "SO much fun!"], [0, 1.2]];
        
        case voc_FazEntRep_Buy1:
            return [["You do you, and I'll do me!"], [0]];
        
        case voc_FazEntRep_Buy2:
            return [["I just LOVE your enthusiasm!"], [0]];
        
        case voc_FazEntRep_Buy3:
            return [["Fazbear Entertainment is not responsible", "if the actions of our animatronics put you in an iron lung."], [0, 1.5]];
        
        case voc_FazEntRep_Buy4:
            return [["Oh yeah! That's a big brain pick!"], [0]];
        
        case voc_FazEntRep_BuyChica:
            return [["Ough...Chica..."], [0]];
        
        case voc_FazEntRep_Leave:
            return [["What are you doing? WHAT'RE YOU DOING!? NO! STOP!"], [0]];
        
        case voc_ElChip_Enter1:
            return [["I'm El Chip! I'm el beaver!", "Jyuk jyuk!"], [0, 2]];
        
        case voc_ElChip_Enter2:
            return [["I'm Mr. Chipper, I'm Mr. Chipper...", "Wait, no no I am El Chip!"], [0, 2.8]];
        
        case voc_ElChip_Enter3:
            return [["Y'all mind if a beaver speak a little Español tonight?"], [0]];
        
        case voc_ElChip_Enter4:
            return [[" Tacos are not given - they are bought!"], [0]];
        
        case voc_ElChip_Enter5:
            return [["Happy Cinco-de-Maya!"], [0]];
        
        case voc_ElChip_Buy1:
            return [["Guten tag!"], [0]];
        
        case voc_ElChip_Buy2:
            return [["And get your guacamole hat by la puerta!"], [0]];
        
        case voc_ElChip_Buy3:
            return [["Eyyyyy Macarena!", "EL CHIP!"], [0, 1.4]];
        
        case voc_ElChip_Buy4:
            return [["Grassy...ass?", "(Can I say that?)"], [0, 1.3]];
        
        case voc_ElChip_Buy5:
            return [["¡Que tengas un lindo y bendecido día!", "...Uhhh, I mean thank you!"], [0, 3.3]];
        
        case voc_ElChip_Leave:
            return [["You wanna put WHAT on my madre!?"], [0]];
        
        case voc_Bobbiedots_EnterGemini1:
            return [["(GEMINI) How may we serve you, user?"], [0]];
        
        case voc_Bobbiedots_EnterGemini2:
            return [["(GEMINI) At your beck and call, we do it all!"], [0]];
        
        case voc_Bobbiedots_EnterRose1:
            return [["(ROSE) Yo yo. Wassup?"], [0]];
        
        case voc_Bobbiedots_EnterRose2:
            return [["(ROSE) First we Bobbie, then we Dot!"], [0]];
        
        case voc_Bobbiedots_EnterOlive1:
            return [["(OLIVE) Good day, uh...user!"], [0]];
        
        case voc_Bobbiedots_EnterOlive2:
            return [["(OLIVE) Power...ON!"], [0]];
        
        case voc_Bobbiedots_BuyGemini1:
            return [["(GEMINI) Let's pump it up!"], [0]];
        
        case voc_Bobbiedots_BuyGemini2:
            return [["(GEMINI) It will be tuned to your liking!"], [0]];
        
        case voc_Bobbiedots_BuyRose1:
            return [["(ROSE) Through the stratosphere!!"], [0]];
        
        case voc_Bobbiedots_BuyRose2:
            return [["(ROSE) We'll have 'em out on a silver platter!"], [0]];
        
        case voc_Bobbiedots_BuyOlive1:
            return [["(OLIVE) I'll be sure to fit that into the schedule."], [0]];
        
        case voc_Bobbiedots_BuyOlive2:
            return [["(OLIVE) I'm...sure we can find them somewhere around here."], [0]];
        
        case voc_Bobbiedots_Leave:
            return [["(GEMINI) Oh...", "That's problematic media..."], [0, 0.8]];
        
        case voc_Rodney_ImBusy:
            return [["Whaddaya want from me!? I'm BUSY!"], [0]];
            break;
        
        case voc_Rodney_Deathcoin:
            return [["Really? It's like that, huh?", "Y-Ya know what, I didn't- I-I didn't even wanna be here. I didn't even wanna be here, I- this is you.", "All on you.", "You got me in here, you brought me in here, then you get me out like that?", "Really? REALLY? It-t-that's what it's like?", "That's your decision?"], [0, 1.5, 5.4, 6.2, 9.3, 11.9]];
            break;
        
        case voc_Rodney_Fail_InThisOne:
            return [["You're doing just about as good in those games as you're doing in this one."], [0]];
            break;
        
        case voc_Rodney_Fail_PlayingGamesPoorly:
            return [["Well, I guess you got a thing for playing games poorly!"], [0]];
            break;
        
        case voc_Rodney_Fail_SeenThatComing:
            return [["Who coulda seen that coming, huh?"], [0]];
            break;
        
        case voc_Rodney_Fail_StifledLaugh:
            return [["(STIFLED LAUGH)"], [0]];
            break;
        
        case voc_Rodney_Fail_WaitingForThat:
            return [["(STIFLED LAUGH)", "I was waiting for that."], [0, 0.6]];
            break;
        
        case voc_Rodney_Fail_WompWomp:
            return [["Womp womp."], [0]];
            break;
        
        case voc_Rodney_Idle_35kDollars:
            return [["Listen, I could make a better game than this.", "Just watch me.", "Raise me 35,000 dollars and I'll show you."], [0, 2.6, 3.6]];
            break;
        
        case voc_Rodney_Idle_AdRevenue:
            return [["If you're recording this for a video,", "I'm gonna be expecting a cut of the ad revenue."], [0, 1.4]];
            break;
        
        case voc_Rodney_Idle_AlarmYou:
            return [["I don't wanna alarm you...", "AHH!!", "Ah, just kidding. I was lying."], [0, 1.5, 2.2]];
            break;
        
        case voc_Rodney_Idle_AltF4:
            return [["Press Alt + F4 to unlock the secret ending!"], [0]];
            break;
        
        case voc_Rodney_Idle_AntiPiracy:
            return [["I'm actually the anti-piracy for this game.", "If you obtained the game for free,", "I WILL be sending a strongly-worded letter to your mother", "to let you know Rodney Redbird is disappointed in you.", "...Not because of the piracy, just 'cuz you suck."], [0, 2, 3.4, 6.2, 9.7]];
            break;
        
        case voc_Rodney_Idle_Beating4020:
            return [["...Yeah, don't count on beating 40/20 with this gameplay, pal."], [0]];
            break;
        
        case voc_Rodney_Idle_BetterToDo:
            return [["...God, do you have anything better to do?"], [0]];
            break;
        
        case voc_Rodney_Idle_Boring1:
            return [["I've run out of things to say.", "That's how uninteresting this is."], [0, 1.4]];
            break;
        
        case voc_Rodney_Idle_Boring2:
            return [["This is getting really boring, I'm starting to run out of things to say."], [0]];
            break;
        
        case voc_Rodney_Idle_BossBet:
            return [["Hey, no pressure...", "but my boss bet a couple thousand on you...", "...and he DOESN'T like to lose."], [0, 1.3, 3.7]];
            break;
        
        case voc_Rodney_Idle_Buddy:
            return [["Man, if only my pal Buddy was here.", "Little bluebird fella.", "He'd be flying around the room, knocking stuff over, yelling in a panic...", "It'd be great."], [0, 1.8, 3.1, 6.4]];
            break;
        
        case voc_Rodney_Idle_Burp2:
            return [["Hey, I wrote a song for you!", "*BELCH*", "...Ah, nevermind, I lost interest."], [0, 1.4, 2.1]];
            break;
        
        case voc_Rodney_Idle_Clothes:
            return [["You can now feel the clothes on your body."], [0]];
            break;
        
        case voc_Rodney_Idle_ComicMischief:
            return [["I dunno about you, but I could go for some alcohol,", "simulated gambling,", "animated blood and comic mischief right about now."], [0, 2.4, 3.7]];
            break;
        
        case voc_Rodney_Idle_Demonitized:
            return [["I should swear so I can get you demonitized."], [0]];
            break;
        
        case voc_Rodney_Idle_DoneThat:
            return [["Now you see, personally, I wouldn't have done that."], [0]];
            break;
        
        case voc_Rodney_Idle_DontChoke:
            return [["DON'T CHOKE! DON'T CHOKE! DON'T CHOKE!"], [0]];
            break;
        
        case voc_Rodney_Idle_Doors:
            return [["Why do the doors need power to stay closed?"], [0]];
            break;
        
        case voc_Rodney_Idle_Fanverse:
            return [["See, now THIS game should've been in the Fanverse.", "Not because it's good, just 'cuz I'd get merchandise."], [0, 2.8]];
            break;
        
        case voc_Rodney_Idle_FanverseManifesto:
            return [["Hey, I found this, uh...this file in one of your cabinets", "while you were, uh, not looking.", "It's uh...it's called 'Dorbledoo Fanverse Manifesto.'", "I went through it, it's got, um...", "It's actually got some pretty, uh, alarming things in it.", "You should probably...maybe report this to someone."], [0, 3.5, 6.1, 8.7, 11.2, 14.2]];
            break;
        
        case voc_Rodney_Idle_FeatureCreep:
            return [["God, you can really see how much this game suffered from feature creep.", "I mean, just...look at me."], [0, 4.5]];
            break;
        
        case voc_Rodney_Idle_FirstTimePlaying:
            return [["Hey, let me guess, this is your first time playing?", "...No?", "Oof.", "That's embarassing."], [0, 2.4, 3.1, 4.2]];
            break;
        
        case voc_Rodney_Idle_FiveNights:
            return [["Hey, so like...", "If you...know the animatronics want to kill you...", "Why are you staying for all the five nights?"], [0, 1.4, 4.6]];
            break;
        
        case voc_Rodney_Idle_FourthPhoneCall:
            return [["Y'know, I actually did the voice for the fourth phone call!", "...They didn't pay me for it."], [0, 4.2]];
            break;
        
        case voc_Rodney_Idle_Frickbears3:
            return [["This is Frickbear's 3?", "Three games of experience and this is all they could do?"], [0, 2.1]];
            break;
        
        case voc_Rodney_Idle_FunChallenge:
            return [["Alright, here's a really cool challenge you can try:", "Beat the night with the audio muted,", "your monitor off,", "and the computer unplugged."], [0, 2.3, 4.2, 5.3]];
            break;
        
        case voc_Rodney_Idle_GasLeak:
            return [["Mmm. You might wanna get your pipes checked.", "Somethin' tells me there's a gas leak."], [0, 2.3]];
            break;
        
        case voc_Rodney_Idle_GetJumpscared:
            return [["Jeez, can you get JUMPSCARED ALREADY!?", "I'm fallin' asleep over here!"], [0, 1.8]];
            break;
        
        case voc_Rodney_Idle_GettingPaid:
            return [["...I'm still getting paid for this, right?"], [0]];
            break;
        
        case voc_Rodney_Idle_GetWorse:
            return [["If you think things are tough now...", "Don't worry, they're gonna get worse."], [0, 1.7]];
            break;
        
        case voc_Rodney_Idle_GimmikoShill:
            return [["This is pathetic. Here's a REAL challenge:", "Can you beat Frickbear's 3 while gifting somebody a copy of GIMMIKO every half hour?", "Only THEN will you have my respect."], [0, 2.4, 7.6]];
            break;
        
        case voc_Rodney_Idle_InRealTime:
            return [["Look!", "I'm movin' in Real Time!"], [0, 0.4]];
            break;
        
        case voc_Rodney_Idle_Invalidate:
            return [["I'm editing your save file to invalidate this speedrun."], [0]];
            break;
        
        case voc_Rodney_Idle_JumpscareCompilation:
            return [["Ohh, I see!", "You're playing bad on purpose so you can get all those jumpscares!", "You're making one of those, uh...compilations, right?"], [0, 1.2, 4.2]];
            break;
        
        case voc_Rodney_Idle_Keyboard:
            return [["Listen, you're not cut out for this.", "Hand me the keyboard."], [0, 1.4]];
            break;
        
        case voc_Rodney_Idle_Kneecapped:
            return [["You ever been kneecapped by a bird before?", "Wanna find out what it's like?"], [0, 2.6]];
            break;
        
        case voc_Rodney_Idle_LegallyDistinct:
            return [["...Hey, why didn't they make the game about me?", "I'm legally distinct! I could've made these guys millions!"], [0, 2.4]];
            break;
        
        case voc_Rodney_Idle_MakeshipPlushie:
            return [["Y'know, I'm the one carrying this whole game.", "They should make ME a Makeship plushie."], [0, 1.9]];
            break;
        
        case voc_Rodney_Idle_ManualBreathing:
            return [["*CLEARS THROAT*", "Manual breathing."], [0, 1.2]];
            break;
        
        case voc_Rodney_Idle_MassiveLoreHint:
            return [["Y'know, I actually have a secret line that's a massive lore hint.", "I'm not gonna say it, though."], [0, 2.7]];
            break;
        
        case voc_Rodney_Idle_MemoryLeak:
            return [["Y'know, it'd be really funny if, OUT OF NOWHERE,", "the game's memory started leaking.", "And you'd have to start ALL over again.", "Wasted all that time on the perfect run just for some faulty coding.", "It could happen. Really could.", "You'd be cryin' tears. And I'll be drinking 'em."], [0, 3.2, 5.1, 7.8, 12.6, 14.4]];
            break;
        
        case voc_Rodney_Idle_Missed:
            return [["God, I REALLY hope me talking has made you miss some important audio cue by now."], [0]];
            break;
        
        case voc_Rodney_Idle_Noticed:
            return [["I'm actually amazed you haven't noticed yet."], [0]];
            break;
        
        case voc_Rodney_Idle_RecordTheseLines:
            return [["You ever wondered how long it took me to record ALL these lines?", "I don't remember.", "But it was probably long.", "I should be making these schmucks pay me extra."], [0, 3.9, 5.3, 6.5]];
            break;
        
        case voc_Rodney_Idle_ReleaseLikeThis:
            return [["I can't believe they let the game release like this."], [0]];
            break;
        
        case voc_Rodney_Idle_RodneyPlus:
            return [["Y'know, this isn't actually live commentary.", "I'm just repeating the same couple canned lines over and over.", "You'll have to subscribe to Rodney+ if you want that."], [0, 2.1, 5.3]];
            break;
        
        case voc_Rodney_Idle_SalvageThisGameplay:
            return [["Oh, you salvaged a lot of those guys, huh?", "Too bad there's no salvaging this gameplay."], [0, 2.7]];
            break;
        
        case voc_Rodney_Idle_SayTheLine:
            return [["Hey, I'll say the age-appropriate drinks line for twenty bucks.", "Put 'em in your computer's CPU cooler."], [0, 2.7]];
            break;
        
        case voc_Rodney_Idle_SecretCheatCode:
            return [["Type in your home address and credit card information to activate my", "secret cheat code that skips the night!"], [0, 3]];
            break;
        
        case voc_Rodney_Idle_Slurp:
            return [["*OBNOXIOUS SLURPING*", "Sorry, I was thirsty."], [0, 9.2]];
            break;
        
        case voc_Rodney_Idle_SmellLikeThat:
            return [["Why do you smell like that?"], [0]];
            break;
        
        case voc_Rodney_Idle_Sweatshop:
            return [["You ever wonder how this game didn't end up getting canned?", "It's actually because they outsourced all the development to a sweatshop!", "It's true. Do NOT look it up."], [0, 2.8, 5.8]];
            break;
        
        case voc_Rodney_Idle_TheControversy:
            return [["Can't believe you're playing this after the controversy.", "Everybody's heard about it!", "Can't believe the developer shot a man."], [0, 2.5, 3.5]];
            break;
        
        case voc_Rodney_Idle_ThreeDimensions:
            return [["Huh. I didn't know you could afford three dimensions for your pizzeria.", "That's kinda lame."], [0, 3.5]];
            break;
        
        case voc_Rodney_Idle_TooManyNights:
            return [["You're really gonna do five nights of this?", "I guess that's not TOO MANY NIGHTS..."], [0, 2.4]];
            break;
        
        case voc_Rodney_Item_BagOfChips:
            return [["Hey, can you get me a bag of chips?"], [0]];
            break;
        
        case voc_Rodney_Item_DontNeedPowerups:
            return [["Y'know, when I play, I don't need any powerups."], [0]];
            break;
        
        case voc_Rodney_Item_Handicap:
            return [["Haha! Look who needs a handicap!"], [0]];
            break;
        
        case voc_Rodney_Item_MinimumWage:
            return [["You're splurging like you haven't been paid minimum wage."], [0]];
            break;
        
        case voc_Rodney_PhoneMute:
            return [["Hey, smart move!", "Sure is a good thing you don't have to listen to someone talk all night now, huh?"], [0, 1.8]];
            break;
        
        case voc_Rodney_Tokens_Casino:
            return [["I hear you can double those earnings if you take 'em to the casino."], [0]];
            break;
        
        case voc_Rodney_Tokens_KingsPrizes:
            return [["You should spend ALL of that on the King's Prizes.", "I hear something REALLY funny will happen if you do."], [0, 2.9]];
            break;
        
        case voc_Rodney_Tokens_LivingWage:
            return [["Kinda sad that this is the only way you're gonna make a living wage here."], [0]];
            break;
        
        case voc_Rodney_Tokens_PaidForPlaying:
            return [["What kinda jerk gets paid for playing video games?"], [0]];
            break;
        
        case voc_Rodney_TV_LoveThisChannel:
            return [["Ooh, I love this channel!"], [0]];
            break;
        
        case voc_Rodney_TV_SomethinGood:
            return [["Oh, finally! Something good on TV!"], [0]];
            break;
        
        case voc_Rodney_Win_BeginnersLuck:
            return [["Eh. Beginner's luck."], [0]];
            break;
        
        case voc_Rodney_Win_BigBrother:
            return [["Hey, big brother pulled through after all!", "You should probably get the guy who was playing horribly before back on here, though."], [0, 2.6]];
            break;
        
        case voc_Rodney_Win_GamblingRegulations:
            return [["You can exchange tokens for cash!?", "I guess that's one way to get around gambling regulations...", "I should take notes."], [0, 2.7, 5.6]];
            break;
        
        case voc_Rodney_Win_GetToLeave:
            return [["*SNORING* Huh? Eh?", "Oh my god, I get to leave. Thank god."], [0, 2.6]];
            break;
        
        case voc_Rodney_Win_HarderWithoutMe:
            return [["Man, could you imagine how much harder that would've been without me?"], [0]];
            break;
        
        case voc_Rodney_Win_NotImpressed:
            return [["Yeah, I'm not impressed."], [0]];
            break;
        
        case voc_Cassie_Selection1:
            return [["Let's go, let's go!"], [0]];
            break;
        
        case voc_Cassie_Selection2:
            return [["My mask is up to the task!"], [0]];
            break;
        
        case voc_Cassie_Selection3:
            return [["Message received!"], [0]];
            break;
        
        case voc_Cassie_Selection4:
            return [["Wait! Let me tie my shoes first..."], [0]];
            break;
        
        case voc_Cassie_Die1:
            return [["No!"], [0]];
            break;
        
        case voc_Cassie_Die2:
            return [["Meanie!"], [0]];
            break;
        
        case voc_Cassie_Die3:
            return [["Ohh..."], [0]];
            break;
        
        case voc_Cassie_GameOver1:
            return [["Blerg...", "I'm gonna puke..."], [0, 1]];
            break;
        
        case voc_Cassie_GameOver2:
            return [["Ughh, I hate this place!", "How the heck am I gonna get out of here!?"], [0, 2.6]];
            break;
        
        case voc_Cassie_GameOver3:
            return [["This place is really kicking in my vertigo..."], [0]];
            break;
        
        case voc_Cassie_GameOver4:
            return [["If this all turns out to be another one of Gregory's pranks,", "I'm gonna be maaaad."], [0, 2.9]];
            break;
        
        case voc_Cassie_GameOver5:
            return [["I'm okay...I'm okay...", "*MUFFLED SCREAMING*"], [0, 4.1]];
            break;
        
        case voc_Cassie_Victory1:
            return [["I guess some of my dad's know-how rubbed off on me after all...!"], [0]];
            break;
        
        case voc_Cassie_Victory2:
            return [["Didn't even need the Faz-Wrench for that one!", "If only I could toss this stupid mask..."], [0, 2.5]];
            break;
        
        case voc_Cassie_Victory3:
            return [["Gregory? Hey, Gregory?", "I found the exit, come on!"], [0, 1.9]];
            break;
        
        case voc_Cassie_Victory4:
            return [["That was too close...", "I was almost a Cassie sandwich!"], [0, 1.5]];
            break;
        
        case voc_Clark_Selection1:
            return [["I'm fixin' to win."], [0]];
            break;
        
        case voc_Clark_Selection2:
            return [["Heave ho."], [0]];
            break;
        
        case voc_Clark_Selection3:
            return [["Yeah, heard ya loud and clear."], [0]];
            break;
        
        case voc_Clark_Die1:
            return [["Nuts!"], [0]];
            break;
        
        case voc_Clark_Die2:
            return [["Bolts!"], [0]];
            break;
        
        case voc_Clark_Die3:
            return [["Scrap!"], [0]];
            break;
        
        case voc_Clark_Die4:
            return [["SCREW IT!"], [0]];
            break;
        
        case voc_Clark_GameOver1:
            return [["*WHISTLES*", "No fixin' this."], [0, 0.8]];
            break;
        
        case voc_Clark_GameOver2:
            return [["I'm rusty! Gimme a break!"], [0]];
            break;
        
        case voc_Clark_GameOver3:
            return [["Ugh...they wrenched my leg..."], [0]];
            break;
        
        case voc_Clark_GameOver4:
            return [["*SIGH* I gotta tighten my focus next time..."], [0]];
            break;
        
        case voc_Clark_GameOver5:
            return [["The animatronics are supposed to be the fixer-uppers, not me!"], [0]];
            break;
        
        case voc_Clark_GameOver6:
            return [["*SIGH* My tech's a wreck..."], [0]];
            break;
        
        case voc_Clark_GameOver7:
            return [["Ehhhh, I mighta had a few screws loose..."], [0]];
            break;
        
        case voc_Clark_Victory1:
            return [["All it takes is the right tools!"], [0]];
            break;
        
        case voc_Clark_Victory2:
            return [["I ain't some kinda greenhorn..."], [0]];
            break;
        
        case voc_Clark_Victory3:
            return [["Hark to the Clark!"], [0]];
            break;
        
        case voc_Clark_Victory4:
            return [["What, they thought I'd be scared of these old models?"], [0]];
            break;
        
        case voc_Clark_Victory5:
            return [["Not gonna lie...", "Surprised I actually salvaged that run."], [0, 1.2]];
            break;
        
        case voc_Edwin_Selection1:
            return [["Remember the name \"Murray\" when you think fun!"], [0]];
            break;
        
        case voc_Edwin_Selection2:
            return [["Get ready to be amazed!"], [0]];
            break;
        
        case voc_Edwin_Selection3:
            return [["I'm pretty clever, if I do say so myself!"], [0]];
            break;
        
        case voc_Edwin_Die1:
            return [["Ouch, that smarts!"], [0]];
            break;
        
        case voc_Edwin_Die2:
            return [["Egads!"], [0]];
            break;
        
        case voc_Edwin_Die3:
            return [["Gadzooks!"], [0]];
            break;
        
        case voc_Edwin_Die4:
            return [["Oh, fie!"], [0]];
            break;
        
        case voc_Edwin_Die5:
            return [["Son of a gun!"], [0]];
            break;
        
        case voc_Edwin_GameOver1:
            return [["It's all gone so wrong..."], [0]];
            break;
        
        case voc_Edwin_GameOver2:
            return [["Someone! Respond! Emergency! Call for help!"], [0]];
            break;
        
        case voc_Edwin_GameOver3:
            return [["This is...only a momentary setback.", "Back to the drawing board..."], [0, 3.3]];
            break;
        
        case voc_Edwin_GameOver4:
            return [["That one wasn't MY fault! M-My vibe got thrown off!"], [0]];
            break;
        
        case voc_Edwin_GameOver5:
            return [["I-I can still fix this! I can fix anything!", "...Right?"], [0, 3.1]];
            break;
        
        case voc_Edwin_Victory1:
            return [["Not to toot my own horn or anything, but...", "I was pretty incredible, wasn't I?"], [0, 1.9]];
            break;
        
        case voc_Edwin_Victory2:
            return [["All this and more from Murray Costume Manor, potential investors!"], [0]];
            break;
        
        case voc_Edwin_Victory3:
            return [["It was very difficult, but...", "...I knew I'd win when I put together a plan."], [0, 2]];
            break;
        
        case voc_Edwin_Victory4:
            return [["\"We did it!\"", "That's right, Mr. Helpful! We sure did."], [0, 1.7]];
            break;
        
        case voc_Frank_Selection1:
            return [["Game on!"], [0]];
            break;
        
        case voc_Frank_Selection2:
            return [["Riiiighteous."], [0]];
            break;
        
        case voc_Frank_Selection3:
            return [["MONDO TUBULOSO!!"], [0]];
            break;
        
        case voc_Frank_Selection4:
            return [["Okay! Heheh."], [0]];
            break;
        
        case voc_Frank_Selection5:
            return [["EXCELLENT!!"], [0]];
            break;
        
        case voc_Frank_Die1:
            return [["Oop!"], [0]];
            break;
        
        case voc_Frank_Die2:
            return [["Misclick-!"], [0]];
            break;
        
        case voc_Frank_GameOver1:
            return [["Game over, dude..."], [0]];
            break;
        
        case voc_Frank_GameOver2:
            return [["Shoot! That was my last quarter!"], [0]];
            break;
        
        case voc_Frank_GameOver3:
            return [["CowaBUMMER!"], [0]];
            break;
        
        case voc_Frank_GameOver4:
            return [["Gamers don't die...", "They respawn."], [0, 2]];
            break;
        
        case voc_Frank_GameOver5:
            return [["My paycheck's in another castle..."], [0]];
            break;
        
        case voc_Frank_GameOver6:
            return [["Ugh, let me get out of this chair.", "My buttcheeks's warm."], [0, 3.1]];
            break;
        
        case voc_Frank_GameOver7:
            return [["Consider my cartridge...tilted."], [0]];
            break;
        
        case voc_Frank_GameOver8:
            return [["Ugh... Get the net!"], [0]];
            break;
        
        case voc_Frank_Victory1:
            return [["WOAH! High score!"], [0]];
            break;
        
        case voc_Frank_Victory2:
            return [["Level up!", "Stache increased by 4!"], [0, 1.2]];
            break;
        
        case voc_Frank_Victory3:
            return [["NOW it's time for New Game+!"], [0]];
            break;
        
        case voc_Frank_Victory4:
            return [["Awesome!", "Gnarly!", "TUBULAR!"], [0, 1, 2.4]];
            break;
        
        case voc_Frank_Victory5:
            return [["It's FRANK'S WORLD! FRANK'S WORLD!", "PARTY TIME! EXCELLENT!", "*IMITATES GUITAR SOLO*"], [0, 2.8, 5.2]];
            break;
        
        case voc_Fritz_Selection1:
            return [["You rang?"], [0]];
            break;
        
        case voc_Fritz_Selection2:
            return [["Back into the fray!"], [0]];
            break;
        
        case voc_Fritz_Selection3:
            return [["How exhilarating!"], [0]];
            break;
        
        case voc_Fritz_Selection4:
            return [["Ooh, about time!"], [0]];
            break;
        
        case voc_Fritz_Die1:
            return [["PAIN!!"], [0]];
            break;
        
        case voc_Fritz_Die2:
            return [["DAMN!"], [0]];
            break;
        
        case voc_Fritz_Die3:
            return [["AGONY!"], [0]];
            break;
        
        case voc_Fritz_Die4:
            return [["YEEOWZA!"], [0]];
            break;
        
        case voc_Fritz_Die5:
            return [["YOW-HOOIE!"], [0]];
            break;
        
        case voc_Fritz_GameOver1:
            return [["That one didn't count!"], [0]];
            break;
        
        case voc_Fritz_GameOver2:
            return [["At my moment of TRIUMPH!?"], [0]];
            break;
        
        case voc_Fritz_GameOver3:
            return [["Thank you, may I have another...?"], [0]];
            break;
        
        case voc_Fritz_GameOver4:
            return [["*GIGGLING* Again, again!", "*LAUGHTER*"], [0, 2]];
            break;
        
        case voc_Fritz_GameOver5:
            return [["Haha! Talk about HELL for leather!"], [0]];
            break;
        
        case voc_Fritz_Victory1:
            return [["Yes yes, now...", "Who's next...?"], [0, 1.2]];
            break;
        
        case voc_Fritz_Victory2:
            return [["Aww, over already...?"], [0]];
            break;
        
        case voc_Fritz_Victory3:
            return [["NOW let's do it BLINDFOLDED!"], [0]];
            break;
        
        case voc_Fritz_Victory4:
            return [["What's one more plane of existence conquered?"], [0]];
            break;
        
        case voc_Fritz_Victory5:
            return [["Hmm...I GUESS I'm satisfied..."], [0]];
            break;
        
        case voc_Fritz_Victory6:
            return [["Yes, yes, the exit is all fine and dandy...", "But I can keep going and come back later, yes?"], [0, 2.9]];
            break;
        
        case voc_Fritz_Victory7:
            return [["Y'know, come to think of it...", "Nothing's stopping me from jumping back down and doing this all again, is there?"], [0, 1.4]];
            break;
        
        case voc_Fritz_Victory8:
            return [["Did somebody say ENCORE!?"], [0]];
            break;
        
        case voc_Henry_Selection1:
            return [["Our job isn't over just yet."], [0]];
            break;
        
        case voc_Henry_Selection2:
            return [["Leaving dead space. 3, 2, 1..."], [0]];
            break;
        
        case voc_Henry_Selection3:
            return [["Don't keep the Angel waiting."], [0]];
            break;
        
        case voc_Henry_Die1:
            return [["NOT YET...!"], [0]];
            break;
        
        case voc_Henry_Die2:
            return [["BALDERDASH!"], [0]];
            break;
        
        case voc_Henry_Die3:
            return [["Confound it..."], [0]];
            break;
        
        case voc_Henry_GameOver1:
            return [["A maze with no prize..."], [0]];
            break;
        
        case voc_Henry_GameOver2:
            return [["It was all too much to bear."], [0]];
            break;
        
        case voc_Henry_GameOver3:
            return [["It wasn't supposed to be like this.", "Now it's all a mess..."], [0, 2.5]];
            break;
        
        case voc_Henry_GameOver4:
            return [["Ugh...I'm old..."], [0]];
            break;
        
        case voc_Henry_GameOver5:
            return [["I can't sleep yet.", "Not until I undo all this."], [0, 1.8]];
            break;
        
        case voc_Henry_Victory1:
            return [["This ends...for all of us."], [0]];
            break;
        
        case voc_Henry_Victory2:
            return [["Now, we return to darkness."], [0]];
            break;
        
        case voc_Henry_Victory3:
            return [["I will keep trying...", "No matter how many times he sends me here."], [0, 1.9]];
            break;
        
        case voc_Henry_Victory4:
            return [["Love always, and to the end."], [0]];
            break;
        
        case voc_Henry_Victory5:
            return [["End communication."], [0]];
            break;
        
        case voc_Henry_Victory6:
            return [["They must take me for a fool, to think I'd not know my own creations..."], [0]];
            break;
        
        case voc_Hudson_Selection1:
            return [["My path is...my own."], [0]];
            break;
        
        case voc_Hudson_Selection2:
            return [["Ugh...I'm gonna need a clear head..."], [0]];
            break;
        
        case voc_Hudson_Selection3:
            return [["Nobody knows what I'm capable of."], [0]];
            break;
        
        case voc_Hudson_Selection4:
            return [["What will we find...? Heheh..."], [0]];
            break;
        
        case voc_Hudson_Selection5:
            return [["I-I'm the guard!"], [0]];
            break;
        
        case voc_Hudson_Die1:
            return [["I'M NOT STUPID!!"], [0]];
            break;
        
        case voc_Hudson_Die2:
            return [["GUMDROPS!"], [0]];
            break;
        
        case voc_Hudson_Die3:
            return [["BULLY!!"], [0]];
            break;
        
        case voc_Hudson_Die4:
            return [["*SCREAMING*"], [0]];
            break;
        
        case voc_Hudson_Die5:
            return [["YEE-OWOWOW!"], [0]];
            break;
        
        case voc_Hudson_GameOver1:
            return [["Why does my path have to be so horrible and scary and miserable!?", "I WANT A NEW OOONE!!"], [0, 5.6]];
            break;
        
        case voc_Hudson_GameOver2:
            return [["They just kept coming, and coming...and coming..."], [0]];
            break;
        
        case voc_Hudson_GameOver3:
            return [["M-M-Monsters are all I hear...", "And I'm losing my MIND I fear!"], [0, 1.9]];
            break;
        
        case voc_Hudson_GameOver4:
            return [["I don't wanna die...", "PLEASE don't let me die...!"], [0, 2.6]];
            break;
        
        case voc_Hudson_GameOver5:
            return [["*SNF* Those Fazbears really ARE frightening...!"], [0]];
            break;
        
        case voc_Hudson_Victory1:
            return [["HAHA! T-T-TAKE THAT, you, s-s-s...", "Stupid pieces of...SCRAP METAL!"], [0, 3.1]];
            break;
        
        case voc_Hudson_Victory2:
            return [["Get me OUTTA HERE!!"], [0]];
            break;
        
        case voc_Hudson_Victory3:
            return [["I'm on a hot streak, baby! YEAH!", "But not too hot. Just...", "Just kinda warm."], [0, 3.4, 5.3]];
            break;
        
        case voc_Hudson_Victory4:
            return [["I don't know my own strength...!"], [0]];
            break;
        
        case voc_Hudson_Victory5:
            return [["Yeah! YEAH! D-Do you know who I am!?", "I'm the man!", "I'm the man who does...the security guard stuff!", "YEAH! Five Nights at...STUPID'S!", "SHUT UP!!"], [0, 3.2, 4.4, 7.2, 9.7]];
            break;
        
        case voc_Hudson_Victory6:
            return [["Who's a swirly-head NOW!?"], [0]];
            break;
        
        case voc_Jeremy_Selection1:
            return [["Okey-dokey!"], [0]];
            break;
        
        case voc_Jeremy_Selection2:
            return [["Let's make the impossible possible!"], [0]];
            break;
        
        case voc_Jeremy_Selection3:
            return [["I'm ready!"], [0]];
            break;
        
        case voc_Jeremy_Selection4:
            return [["Nothing shakes a smiling heart!"], [0]];
            break;
        
        case voc_Jeremy_Selection5:
            return [["Let's roll!"], [0]];
            break;
        
        case voc_Jeremy_Die1:
            return [["EEYIKES!"], [0]];
            break;
        
        case voc_Jeremy_Die2:
            return [["Gee willikers!"], [0]];
            break;
        
        case voc_Jeremy_Die3:
            return [["Cheese and crackers!!"], [0]];
            break;
        
        case voc_Jeremy_Die4:
            return [["D'awwww..."], [0]];
            break;
        
        case voc_Jeremy_Die5:
            return [["Gh-!"], [0]];
            break;
        
        case voc_Jeremy_GameOver1:
            return [["THAT...could've gone better..."], [0]];
            break;
        
        case voc_Jeremy_GameOver2:
            return [["Well, peaks and valleys, I suppose..."], [0]];
            break;
        
        case voc_Jeremy_GameOver3:
            return [["It'll be different next time!", "Not a doubt in my mind."], [0, 1.8]];
            break;
        
        case voc_Jeremy_GameOver4:
            return [["Well, that...certainly was a learning experience!"], [0]];
            break;
        
        case voc_Jeremy_GameOver5:
            return [["It...could be worse!", "I could be fending off...caffeinated...knife-wielding grandmas!"], [0, 1.7]];
            break;
        
        case voc_Jeremy_GameOver6:
            return [["I'll never give into despair!", "I just gotta BELIEVE!"], [0, 1.8]];
            break;
        
        case voc_Jeremy_Victory1:
            return [["HIP HIP HOORAY!!"], [0]];
            break;
        
        case voc_Jeremy_Victory2:
            return [["Awww, you guys!"], [0]];
            break;
        
        case voc_Jeremy_Victory3:
            return [["Mom and dad are gonna be so proud!"], [0]];
            break;
        
        case voc_Jeremy_Victory4:
            return [["Hey, I'm getting pretty good at this!"], [0]];
            break;
        
        case voc_Jeremy_Victory5:
            return [["Hot diggidy-dog!"], [0]];
            break;
        
        case voc_Jeremy_Victory6:
            return [["You think I can put this on my resume...?"], [0]];
            break;
        
        case voc_Michael_Selection1:
            return [["Break their bones. Crush 'em."], [0]];
            break;
        
        case voc_Michael_Selection2:
            return [["Let's flip the script."], [0]];
            break;
        
        case voc_Michael_Selection3:
            return [["We should be dead...but we're not."], [0]];
            break;
        
        case voc_Michael_Selection4:
            return [["No more hanging in the shadows."], [0]];
            break;
        
        case voc_Michael_Selection5:
            return [["Only one thing left to do now."], [0]];
            break;
        
        case voc_Michael_Selection6:
            return [["Tch...you'd think I'd get used to this."], [0]];
            break;
        
        case voc_Michael_Selection7:
            return [["Here we go again..."], [0]];
            break;
        
        case voc_Michael_Die1:
            return [["Again!?"], [0]];
            break;
        
        case voc_Michael_Die2:
            return [["I knew it..."], [0]];
            break;
        
        case voc_Michael_Die3:
            return [["*SIGH* Sloppy..."], [0]];
            break;
        
        case voc_Michael_Die4:
            return [["GAH! EGGS BENEDICT!"], [0]];
            break;
        
        case voc_Michael_GameOver1:
            return [["Perhaps it's...what I deserve..."], [0]];
            break;
        
        case voc_Michael_GameOver2:
            return [["This is not how the story ends."], [0]];
            break;
        
        case voc_Michael_GameOver3:
            return [["I've tarried before...", "But I won't tarry much longer."], [0, 2]];
            break;
        
        case voc_Michael_GameOver4:
            return [["I won't let this place prey on my imagination..."], [0]];
            break;
        
        case voc_Michael_GameOver5:
            return [["*SCOFF* Looks like I'm in quite the snag, here..."], [0]];
            break;
        
        case voc_Michael_Victory1:
            return [["I did it.", "I found it.", "It was right where you said it would be."], [0, 1.3, 3]];
            break;
        
        case voc_Michael_Victory2:
            return [["And I return to life once more."], [0]];
            break;
        
        case voc_Michael_Victory3:
            return [["Tomorrow is another day."], [0]];
            break;
        
        case voc_Michael_Victory4:
            return [["It's no happy ending...", "...But it's a start."], [0, 2.2]];
            break;
        
        case voc_Mike_Selection1:
            return [["Let's get this over with."], [0]];
            break;
        
        case voc_Mike_Selection2:
            return [["I'll try anything once."], [0]];
            break;
        
        case voc_Mike_Selection3:
            return [["Ugh...unpaid overtime..."], [0]];
            break;
        
        case voc_Mike_Selection4:
            return [["Didn't think anyone would side with me..."], [0]];
            break;
        
        case voc_Mike_Selection5:
            return [["Uh...sure."], [0]];
            break;
        
        case voc_Mike_Die1:
            return [["Ugh..."], [0]];
            break;
        
        case voc_Mike_Die2:
            return [["Whatever, man..."], [0]];
            break;
        
        case voc_Mike_Die3:
            return [["UGH-!"], [0]];
            break;
        
        case voc_Mike_Die4:
            return [["CRAP!"], [0]];
            break;
        
        case voc_Mike_Die5:
            return [["Lousy hunk of-!"], [0]];
            break;
        
        case voc_Mike_GameOver1:
            return [["Who's gonna tell Mary...?"], [0]];
            break;
        
        case voc_Mike_GameOver2:
            return [["Does this mean I'm fired?"], [0]];
            break;
        
        case voc_Mike_GameOver3:
            return [["Whatever.", "I'm taking a nap."], [0, 0.8]];
            break;
        
        case voc_Mike_GameOver4:
            return [["Work already felt endless enough!"], [0]];
            break;
        
        case voc_Mike_GameOver5:
            return [["It doesn't matter.", "None of this matters."], [0, 0.8]];
            break;
        
        case voc_Mike_Victory1:
            return [["I need a raise..."], [0]];
            break;
        
        case voc_Mike_Victory2:
            return [["This better've been worth it."], [0]];
            break;
        
        case voc_Mike_Victory3:
            return [["Out of the pan, into the fire.", "Or, whatever."], [0, 1.9]];
            break;
        
        case voc_Mike_Victory4:
            return [["All this just for minimum wage..."], [0]];
            break;
        
        case voc_Strings_Selection1:
            return [["Keep calm."], [0]];
            break;
        
        case voc_Strings_Selection2:
            return [["Note to self:", "PANIC!"], [0, 1.3]];
            break;
        
        case voc_Strings_Selection3:
            return [["*HUMMING*"], [0]];
            break;
        
        case voc_Strings_Die1:
            return [["404!"], [0]];
            break;
        
        case voc_Strings_Die2:
            return [["SIGH..."], [0]];
            break;
        
        case voc_Strings_Die3:
            return [["CPU R.I.P..."], [0]];
            break;
        
        case voc_Strings_Die4:
            return [["STOP!"], [0]];
            break;
        
        case voc_Strings_Die5:
            return [["Pain! PAINpain pain PAIN pain!"], [0]];
            break;
        
        case voc_Strings_Die6:
            return [["CURIOUS!!"], [0]];
            break;
        
        case voc_Strings_Die7:
            return [["DEATH! DEATH! DEATH!", "OOOOWWWWW!!"], [0, 1.6]];
            break;
        
        case voc_Strings_GameOver1:
            return [["The curiosity module killed the...", "Robot? No.", "Cyborg? No.", "Fool?", "...Maybe..."], [0, 2.3, 3.9, 5.9, 7.4]];
            break;
        
        case voc_Strings_GameOver2:
            return [["IT WAS BEARTRAPS!", "The unprecedented variable!", "MUST BUY MORE BEARTRAPS!"], [0, 1.2, 2.8]];
            break;
        
        case voc_Strings_GameOver3:
            return [["My calculations, they have been...COMPROMISED!", "Clearing hard drive.", "OOOOoooo......"], [0, 3.2, 4.9]];
            break;
        
        case voc_Strings_GameOver4:
            return [["SARA CRACK CORN AND SHE DON'T CARE, BONNie crack corn..."], [0]];
            break;
        
        case voc_Strings_GameOver5:
            return [["if: Death, then:", "CONFOUND IT ALL!!"], [0, 2]];
            break;
        
        case voc_Strings_GameOver6:
            return [["YOU HAVE FAILED THE CHALLENGE!"], [0]];
            break;
        
        case voc_Strings_Victory1:
            return [["The nightmare is over! Concluded! TERMINATED!!"], [0]];
            break;
        
        case voc_Strings_Victory2:
            return [["I can finally meet the one who's pulling the strings!", "Ha. Ha. Ha.", "Very funny."], [0, 3.8, 6.4]];
            break;
        
        case voc_Strings_Victory3:
            return [["RESISTENCE IS FUTILE!", "Beg for my forgiveness! Or, better yet...", "JUST SCRAP YOURSELVES!!"], [0, 1.6, 4]];
            break;
        
        case voc_Strings_Victory4:
            return [["METAL REMAINS SUPERIOR AND YOU ARE INFERIOR-RIOR AND", "*VOICEBOX BUGS OUT*", "*JUST GIVE HIM A SECOND*"], [0, 3.2, 6.7]];
            break;
        
        case voc_TheBoss_Selection1:
            return [["Time to make some moolah!"], [0]];
            break;
        
        case voc_TheBoss_Selection2:
            return [["You want something done right, you gotta do it yourself!"], [0]];
            break;
        
        case voc_TheBoss_Selection3:
            return [["H-H-H-HURRY UP!"], [0]];
            break;
        
        case voc_TheBoss_Die1:
            return [["OH MY GOD!"], [0]];
            break;
        
        case voc_TheBoss_Die2:
            return [["WAaAaAaAaAH!"], [0]];
            break;
        
        case voc_TheBoss_Die3:
            return [["Oh, come on!"], [0]];
            break;
        
        case voc_TheBoss_Die4:
            return [["Oh no..."], [0]];
            break;
        
        case voc_TheBoss_Die5:
            return [["Oh boy."], [0]];
            break;
        
        case voc_TheBoss_GameOver1:
            return [["GRRR...", "I'ma get you next time!"], [0, 1]];
            break;
        
        case voc_TheBoss_GameOver2:
            return [["D'oh I missed!"], [0]];
            break;
        
        case voc_TheBoss_GameOver3:
            return [["Somebody cheated!"], [0]];
            break;
        
        case voc_TheBoss_GameOver4:
            return [["I'm ruined! RUINED!", "WAHAHA!"], [0, 2.4]];
            break;
        
        case voc_TheBoss_GameOver5:
            return [["You lousy!", "Play better!"], [0, 1.4]];
            break;
        
        case voc_TheBoss_Victory1:
            return [["I win! I WIN!", "*LAUGHTER*"], [0, 1.9]];
            break;
        
        case voc_TheBoss_Victory2:
            return [["Hail to the king, baby!", "*LAUGHTER*"], [0, 1.7]];
            break;
        
        case voc_TheBoss_Victory3:
            return [["Could've payed some schmuck to do this for me..."], [0]];
            break;
        
        case voc_TheBoss_Victory4:
            return [["Eh-nyeh nyehnyeh-nyeh!", "I won, I won~!"], [0, 2.1]];
            break;
        
        case voc_Vanessa_Selection1:
            return [["Wanna dance?"], [0]];
            break;
        
        case voc_Vanessa_Selection2:
            return [["Back to work!"], [0]];
            break;
        
        case voc_Vanessa_Selection3:
            return [["Let's give 110%!"], [0]];
            break;
        
        case voc_Vanessa_Die1:
            return [["Ah."], [0]];
            break;
        
        case voc_Vanessa_Die2:
            return [["Frickin'...!"], [0]];
            break;
        
        case voc_Vanessa_Die3:
            return [["Son of a BISCUIT!"], [0]];
            break;
        
        case voc_Vanessa_Die4:
            return [["Oh you...!"], [0]];
            break;
        
        case voc_Vanessa_GameOver1:
            return [["Us security hires never last..."], [0]];
            break;
        
        case voc_Vanessa_GameOver2:
            return [["A swing and a miss...", "Let's try that again!"], [0, 1.7]];
            break;
        
        case voc_Vanessa_GameOver3:
            return [["What's another few hours, stuck in the same old office, anyways...?"], [0]];
            break;
        
        case voc_Vanessa_GameOver4:
            return [["This is no time to be slacking off!", "I got this!"], [0, 2.4]];
            break;
        
        case voc_Vanessa_GameOver5:
            return [["*SIGH*", "...Alright. I'm taking my fifteen."], [0, 0.9]];
            break;
        
        case voc_Vanessa_Victory1:
            return [["Simple as!"], [0]];
            break;
        
        case voc_Vanessa_Victory2:
            return [["That's enough unpaid overtime..."], [0]];
            break;
        
        case voc_Vanessa_Victory3:
            return [["Hard work pays off!"], [0]];
            break;
        
        case voc_Vanessa_Victory4:
            return [["It's a good thing I'm not going to remember this", "because I do NOT want to think about the implications of Freddy FazHell."], [0, 2]];
            break;
        
        case voc_Vanessa_Victory5:
            return [["That concludes training!", "Any questions before we do the real thing?"], [0, 1.7]];
            break;
        
        case voc_Vannabelle_Selection1:
            return [["Mwah!"], [0]];
            break;
        
        case voc_Vannabelle_Selection2:
            return [["I'm the bunny, honey!"], [0]];
            break;
        
        case voc_Vannabelle_Selection3:
            return [["I'll hop to it!"], [0]];
            break;
        
        case voc_Vannabelle_Selection4:
            return [["Mweeheehee!"], [0]];
            break;
        
        case voc_Vannabelle_Die1:
            return [["YIPES!"], [0]];
            break;
        
        case voc_Vannabelle_Die2:
            return [["YOU DIMBULB...!"], [0]];
            break;
        
        case voc_Vannabelle_Die3:
            return [["Grrrr..."], [0]];
            break;
        
        case voc_Vannabelle_Die4:
            return [["D'oooh..."], [0]];
            break;
        
        case voc_Vannabelle_GameOver1:
            return [["That was a complete flop..."], [0]];
            break;
        
        case voc_Vannabelle_GameOver2:
            return [["UGH, NO! NOT AGAIN!", "Stupid, stupid, stupid, STUPID...!"], [0, 2.4]];
            break;
        
        case voc_Vannabelle_GameOver3:
            return [["I-I swear I'm good at this!", "J-Just give me another try!"], [0, 1.7]];
            break;
        
        case voc_Vannabelle_GameOver4:
            return [["Just a glitch! It won't happen again."], [0]];
            break;
        
        case voc_Vannabelle_GameOver5:
            return [["Could I do a skee ball game for my soul instead...?"], [0]];
            break;
        
        case voc_Vannabelle_GameOver6:
            return [["Just because I'm down doesn't mean I'm bad!", "I'll get in next time!"], [0, 2.2]];
            break;
        
        case voc_Vannabelle_GameOver7:
            return [["I'm not having fun yet..."], [0]];
            break;
        
        case voc_Vannabelle_GameOver8:
            return [["I'm gonna disassemble Freddy the SECOND I get out of here..."], [0]];
            break;
        
        case voc_Vannabelle_GameOver9:
            return [["I'll bounce back from this..."], [0]];
            break;
        
        case voc_Vannabelle_Victory1:
            return [["I am one cool bunny."], [0]];
            break;
        
        case voc_Vannabelle_Victory2:
            return [["As the old saying goes:", "Make hay while the sun shines!"], [0, 1.8]];
            break;
        
        case voc_Vannabelle_Victory3:
            return [["90% of the time, it works all the time!"], [0]];
            break;
        
        case voc_William_Selection1:
            return [["I'm the fun one!"], [0]];
            break;
        
        case voc_William_Selection2:
            return [["Prepare to meet your maker!"], [0]];
            break;
        
        case voc_William_Selection3:
            return [["I'll show you metal morons what happens when you step out of line!"], [0]];
            break;
        
        case voc_William_Selection4:
            return [["How can I resist a promise such as this?"], [0]];
            break;
        
        case voc_William_Selection5:
            return [["You WILL fear me."], [0]];
            break;
        
        case voc_William_Die1:
            return [["D'OH!"], [0]];
            break;
        
        case voc_William_Die2:
            return [["NOT AGAIN!"], [0]];
            break;
        
        case voc_William_Die3:
            return [["YOU'RE COMING DOWN WITH ME!!"], [0]];
            break;
        
        case voc_William_Die4:
            return [["THIS IS ALL YOUR FAULT!!"], [0]];
            break;
        
        case voc_William_Die5:
            return [["You will not be SPARED...!"], [0]];
            break;
        
        case voc_William_Die6:
            return [["DAMN YOU ALL!!"], [0]];
            break;
        
        case voc_William_GameOver1:
            return [["I would've made it, if it weren't for those meddling kids!"], [0]];
            break;
        
        case voc_William_GameOver2:
            return [["Well, at least my K/D ratio is still looking sharp..."], [0]];
            break;
        
        case voc_William_GameOver3:
            return [["Fine! Leave me here! See if I care!"], [0]];
            break;
        
        case voc_William_GameOver4:
            return [["You'd think I'd know these things better."], [0]];
            break;
        
        case voc_William_GameOver5:
            return [["I'll be back."], [0]];
            break;
        
        case voc_William_Victory1:
            return [["*LAUGHTER*", "Look how SMALL you are!"], [0, 1.4]];
            break;
        
        case voc_William_Victory2:
            return [["Haha! I'm on FIRE!!"], [0]];
            break;
        
        case voc_William_Victory3:
            return [["Mere child's play!"], [0]];
            break;
        
        case voc_William_Victory4:
            return [["Later, haters!"], [0]];
            break;
        
        case voc_William_Victory5:
            return [["That was EXACTLY as easy as I thought it would be!"], [0]];
            break;
        
        case voc_Sally_Selection1:
            return [["Ey, I'm playtimin' here!"], [0]];
            break;
        
        case voc_Sally_Selection2:
            return [["You're not payin' me to say that. No way."], [0]];
            break;
        
        case voc_Sally_Selection3:
            return [["Knock knock!"], [0]];
            break;
        
        case voc_Sally_Selection4:
            return [["Be a pal?"], [0]];
            break;
        
        case voc_Sally_Selection5:
            return [["Knock knock.", "Who's there? It's me. It's Sally Poodle."], [0, 0.5]];
            break;
        
        case voc_Sally_Die1:
            return [["Really?"], [0]];
            break;
        
        case voc_Sally_Die2:
            return [["Come on, man!"], [0]];
            break;
        
        case voc_Sally_Die3:
            return [["That's annoying."], [0]];
            break;
        
        case voc_Sally_GameOver1:
            return [["Whatever, dude."], [0]];
            break;
        
        case voc_Sally_GameOver2:
            return [["I'm tryin' to play over here!"], [0]];
            break;
        
        case voc_Sally_GameOver3:
            return [["Did you say somethin'?", "I-I couldn't...I couldn't hear you."], [0, 0.9]];
            break;
        
        case voc_Sally_GameOver4:
            return [["I was SO close, too! Ugh!"], [0]];
            break;
        
        case voc_Sally_GameOver5:
            return [["It's a dog-eat-dog world out there..."], [0]];
            break;
        
        case voc_Sally_Victory1:
            return [["Huh? What?", "I...I can leave now?", "Finally!"], [0, 2.3, 4.9]];
            break;
        
        case voc_Sally_Victory2:
            return [["I still got it!", "*CHUCKLES*"], [0, 0.9]];
            break;
        
        case voc_Sally_Victory3:
            return [["Eh, a bit lousy, but...", "Still better than nothin'!"], [0, 1.8]];
            break;
        
        case voc_Sally_Victory4:
            return [["Eeeyup, my pleasure."], [0]];
            break;
        
        case voc_Mary_Selection1:
            return [["Don't tell Mike."], [0]];
            break;
        
        case voc_Mary_Selection2:
            return [["Otters otta help eachotter..."], [0]];
            break;
        
        case voc_Mary_Selection3:
            return [["It's the night of the pizza bear!"], [0]];
            break;
        
        case voc_Mary_Selection4:
            return [["Lots of dead kids here...", "...I fit right in."], [0, 1.8]];
            break;
        
        case voc_Mary_Die1:
            return [["Crap!"], [0]];
            break;
        
        case voc_Mary_Die2:
            return [["Frick!"], [0]];
            break;
        
        case voc_Mary_Die3:
            return [["Goddangit!"], [0]];
            break;
        
        case voc_Mary_Die4:
            return [["Rats..."], [0]];
            break;
        
        case voc_Mary_GameOver1:
            return [["There goes THAT Hail Mary..."], [0]];
            break;
        
        case voc_Mary_GameOver2:
            return [["This game sucks..."], [0]];
            break;
        
        case voc_Mary_GameOver3:
            return [["So, what, am I...double dead now?", "...Cool."], [0, 3.4]];
            break;
        
        case voc_Mary_GameOver4:
            return [["Yeah, way to go!", "You murdered the fourteen-year-old!"], [0, 0.9]];
            break;
        
        case voc_Mary_GameOver5:
            return [["Think I'm a little too old to be an MCI victim..."], [0]];
            break;
        
        case voc_Mary_Victory1:
            return [["I'm sure that was meant to be VERY frightening."], [0]];
            break;
        
        case voc_Mary_Victory2:
            return [["THAT was hell?", "I can't imagine how boring HEAVEN will be."], [0, 1.6]];
            break;
        
        case voc_Mary_Victory3:
            return [["Now imagine what I could've done if I WANTED to live."], [0]];
            break;
        
        case voc_Mary_Victory4:
            return [["If I miss my show because of this,", "I'm gonna be SO mad."], [0, 1.6]];
            break;
        
        case voc_Mary_Victory5:
            return [["You think they got novelty tombstones in the gift shop...?"], [0]];
            break;
        
        case voc_OldManConsequences_Selection1:
            return [["Let's fish for a while."], [0]];
            break;
        
        case voc_OldManConsequences_Selection2:
            return [["The time is right."], [0]];
            break;
        
        case voc_OldManConsequences_Selection3:
            return [["Ain't no point in staying."], [0]];
            break;
        
        case voc_OldManConsequences_Selection4:
            return [["Even if it takes an eternity."], [0]];
            break;
        
        case voc_OldManConsequences_Selection5:
            return [["I'll take that there bait."], [0]];
            break;
        
        case voc_OldManConsequences_Die1:
            return [["*COUGHING*"], [0]];
            break;
        
        case voc_OldManConsequences_Die3:
            return [["Oh, fishpaste."], [0]];
            break;
        
        case voc_OldManConsequences_Die4:
            return [["No..."], [0]];
            break;
        
        case voc_OldManConsequences_GameOver1:
            return [["And now...", "There is nothing else."], [0, 1.3]];
            break;
        
        case voc_OldManConsequences_GameOver2:
            return [["Damned be the demon and his demons!"], [0]];
            break;
        
        case voc_OldManConsequences_GameOver3:
            return [["End of the line..."], [0]];
            break;
        
        case voc_OldManConsequences_GameOver4:
            return [["Show me no more!", "No more!"], [0, 1.4]];
            break;
        
        case voc_OldManConsequences_GameOver5:
            return [["Swimming against the tide was never gonna be easy..."], [0]];
            break;
        
        case voc_OldManConsequences_GameOver6:
            return [["Ooh, these tired old claws..."], [0]];
            break;
        
        case voc_OldManConsequences_GameOver7:
            return [["Fish hooks in my hand, fish hooks in my feet...", "...and I can use a fiddly tablet lamentably."], [0, 3.2]];
            break;
        
        case voc_OldManConsequences_Victory1:
            return [["...Okay. I'm ready.", "I deserve this."], [0, 2.5]];
            break;
        
        case voc_OldManConsequences_Victory2:
            return [["I...should feel proud, shouldn't I?"], [0]];
            break;
        
        case voc_OldManConsequences_Victory3:
            return [["Is this...", "...really okay?"], [0, 2]];
            break;
        
        case voc_OldManConsequences_Victory4:
            return [["If fate deems it so, then I..."], [0]];
            break;
        
        case voc_OldManConsequences_Victory5:
            return [["As somebody once taught me...", "\"Later, alligator.\""], [0, 3.5]];
            break;
        
        case voc_Fiona_Selection1:
            return [["I hope there's clear instructions..."], [0]];
            break;
        
        case voc_Fiona_Selection2:
            return [["I believe in us!"], [0]];
            break;
        
        case voc_Fiona_Selection3:
            return [["Anything you need, I'm happy to help."], [0]];
            break;
        
        case voc_Fiona_Selection4:
            return [["One step at a time!"], [0]];
            break;
        
        case voc_Fiona_Die1:
            return [["Oh dear!"], [0]];
            break;
        
        case voc_Fiona_Die2:
            return [["I've fallen!"], [0]];
            break;
        
        case voc_Fiona_Die3:
            return [["Heavens to betsy!"], [0]];
            break;
        
        case voc_Fiona_GameOver1:
            return [["Just another one of life's speedbumps, I suppose."], [0]];
            break;
        
        case voc_Fiona_GameOver2:
            return [["Won't someone teach me how this touch screen device works...?", "There's so many buttons..."], [0, 3.5]];
            break;
        
        case voc_Fiona_GameOver3:
            return [["No, no, it's fine!", "We can fix this. As a team!"], [0, 2]];
            break;
        
        case voc_Fiona_GameOver4:
            return [["At a time like this, Foxy would say...", "\"Why ye look so down in the dumps, Kit?\"", "\"Our voyage is only getting started!\"", " and Captain Cobalt would get right back in there and guide his crew to victory!"], [0, 2.7, 5.5, 8.3]];
            break;
        
        case voc_Fiona_GameOver5:
            return [["Give me my big win, 'cuz I need my Edwin,", "So, please, do not jumpscare me..."], [0, 3.3]];
            break;
        
        case voc_Fiona_Victory1:
            return [["Phew...", "For once, I think I would've liked an elevator."], [0, 1.3]];
            break;
        
        case voc_Fiona_Victory2:
            return [["I couldn't have done it without everyone's help along the way!"], [0]];
            break;
        
        case voc_Fiona_Victory3:
            return [["One foot in front of the other, that's all it takes!"], [0]];
            break;
        
        case voc_Fiona_Victory4:
            return [["...My characters don't ACTUALLY turn into evil scary killers in the future, right?"], [0]];
            break;
        
        case voc_Elizabeth_Selection1:
            return [["I'm a silly kid!", "You're gonna flip your lid."], [0, 1.5]];
            break;
        
        case voc_Elizabeth_Selection2:
            return [["Can we get food on the way home...?"], [0]];
            break;
        
        case voc_Elizabeth_Selection3:
            return [["Watch and listen!"], [0]];
            break;
        
        case voc_Elizabeth_Selection4:
            return [["This is a gift for us!", "...I think."], [0, 1.4]];
            break;
        
        case voc_Elizabeth_Selection5:
            return [["Let's play, let's play!"], [0]];
            break;
        
        case voc_Elizabeth_Die1:
            return [["Whuhappen!?"], [0]];
            break;
        
        case voc_Elizabeth_Die2:
            return [["Errm..."], [0]];
            break;
        
        case voc_Elizabeth_Die3:
            return [["Oughh, I'm telling daddy!!"], [0]];
            break;
        
        case voc_Elizabeth_Die4:
            return [["Blegh..."], [0]];
            break;
        
        case voc_Elizabeth_GameOver1:
            return [["I know it was an accident..."], [0]];
            break;
        
        case voc_Elizabeth_GameOver2:
            return [["Stupid, stupid...", "That's it!", "I'm gonna go play with my toys."], [0, 2.3, 3]];
            break;
        
        case voc_Elizabeth_GameOver3:
            return [["Don't hold it against me!", "I'm only seven years old!"], [0, 1.6]];
            break;
        
        case voc_Elizabeth_GameOver4:
            return [["I thought I did everything right..."], [0]];
            break;
        
        case voc_Elizabeth_GameOver5:
            return [["I am shocked! SHOCKED!", "...Well, not THAT shocked."], [0, 2.6]];
            break;
        
        case voc_Elizabeth_Victory1:
            return [["This is why I'M daddy's favorite~!"], [0]];
            break;
        
        case voc_Elizabeth_Victory2:
            return [["It feels like...my birthday!"], [0]];
            break;
        
        case voc_Elizabeth_Victory3:
            return [["And that's why I'M the prettiest princess!", "Because I'M at the top of a tower", "where ALL pretty princesses are."], [0, 2.5, 4.4]];
            break;
        
        case voc_Elizabeth_Victory4:
            return [["I'm the ElizaBest!"], [0]];
            break;
        
        case voc_Elizabeth_Victory5:
            return [["Not much of a celebration without any balloons...", "*SIGH*"], [0, 3.8]];
            break;
        
        case vocPhoneGuy1:
            return [["...Hello? Hello hello?", "Hey, I hope this message finds you well!", "Now I've got a salvaging job in the morning, and I imagine you got a looong night ahead of you,", "Sooo, for the both of our sakes, I'll try to make this brief.", "First and foremost: Your job!", "I'm sure your manager already went over this, but...wouldn't hurt to cover it again.", "So you, as the night watchman here, have two duties:", "Keeping intruders out, and keeping all our equipment in here safe...", "Most notable of which being, of course, being our animatronic band!", "Y'see the animatronic characters here...you may notice they tend to move around at night.", "DON'T FRET - It's completely normal! Even animatronics need their exercise.", "Stops their mechanisms from locking up when they need to perform in the morning, and saves our maintenance crew a looot of hassle.", "Now, that normally wouldn't be an issue for you, but our animatronics...", "Well...they also have a tendency to wander to parts of the building they aren't supposed to be in...", "...Which might also include your office.", "Because of that, you'll wanna keep an eye on them with your cameras,", "just make sure they aren't straying too far away from their intended areas.", "Oh, and if one reaches the doorway to your office,", "it might be a good idea to close either of those handy mechanical doors.", "There should be one on both sides of your office.", "They stop almost any animatronic.", "Just close 'em, wait for the 'THUNK!'...", "...And the animatronic should go right back to their stage.", "Only close them if you absolutely NEED to, though,", "the doors drain power and power isn't something you've got a lot of.", "And I say ALMOST every animatronic because there IS one that's a little special, though it isn't hard to deal with.", "Just click that 'Reset Music' button on the entrance camera every once in a while and it should leave you be.", "Now if you're wondering why a place like this needs heavy duty mechanical doors,", "or what all these others tools you have at your disposal are,", "my answer to both of these questions is:", "Don't worry about it! You probably won't need to use 'em tonight anyway.", "We just wanna make sure our guards are safe and have the means to defend themselves against any threat that comes their way!", "...Like, y'know. Burglars. Vandals. Those kinds of threats.", "Other than that, the only thing you really have to worry about is your temperature!", "The AC's shot, so you'll have to rely on your fan.", "Just turn it on every so often, it should cool you right back down.", "Just don't leave it on for TOO long, it drains power too.", "Oh yeah, and while all you SHOULD really need tonight are the cameras and doors,", "feel free to flip through the different systems on your monitor and try out some of the other tools just to get a feel for them too.", "It doesn't hurt to be prepared!", "Now I think that's everything...unless I'm forgetting about something...", "No no! I'm sure that's-", "What the!?", "*CRASH!*"], [0, 2, 4.5, 9.3, 12.9, 14.9, 19.1, 22.4, 26.3, 30.2, 34.9, 38.8, 45.1, 49.4, 53.8, 56.1, 59.2, 63.1, 65.5, 69.1, 71.5, 73.9, 75.9, 78.6, 80.6, 84.4, 90.8, 96.1, 99.4, 101.9, 103.7, 107.4, 113.7, 119.1, 122.3, 125.1, 128.3, 131.6, 135.8, 141.8, 143.9, 150.9, 153.6, 153.8]];
            break;
        
        case vocPhoneGuy2:
            return [["And that should be-", "...Yep! Okay, uh...Hi! Hi, uh...sorry.", "The guy that called you last night can't QUITE get back to you, he got into a pretty...", "...Nasty accident with the office locker right when he finished recording your message.", "Apparently the animatronics filled it with the heaviest stuff they could find, and the thing just...", "...tipped over right onto him.", "It's...it's still lying there.", "...I think he still might be in it, actually.", "...", "I have no idea where they managed to find that many blocks of pure tungsten, but...", "You know Freddy and the gang! They're...some real kidders, heh.", "...That aside, I heard you made some salvages last night. That's good! That's good.", "I don't really know...how those ones work, not my jurisdiction...", "So I guess it's up to you to figure that out.", "Other than that, we've been noticing some...STRANGE new behaviors with some of the animatronics.", "Namely, uh...they REALLY like getting into our vent system now.", "If you switch to the 'Vents' setting on your monitor and see one just, crawling around up there...", "...It MIGHT be a good idea to set an audio lure nearby to pull it away from your office.", "Now, if one DOES get into your office, don't worry, just...", "Try throwing on that spare Freddy head for a bit until they go away.", "Usually fools them pretty easily.", "And that should be it...?", "I'm actually coming up at the end of my shift here, SO...", "If you'll excuse me, I'm gonna recklessly meander my way over towards the exit door and-", "*THUNK*"], [0, 1, 3.6, 7.2, 11.7, 16.3, 18.5, 21, 23.3, 24.2, 29, 33.8, 37.3, 40.5, 42.3, 47.2, 51.3, 55.1, 59.4, 62.5, 66.6, 68.2, 70.9, 74.2, 78.8]];
            break;
        
        case vocPhoneGuy3:
            return [["Hey, welcome back!", "...Um, right. Sorry about the background noise.", "I didn't wanna end up like the last guy...", "...so I decided to hide out in the women's restroom!", "But, as it turns out...", "...Freddy does his singing practice in here, so...", "Just...just try to ignore him.", "Uh, anyway...", "Have you checked out the game menu?", "You can play a bunch of dumb little minigames in there.", "You can even earn tokens for it too! The boss set it up.", "I...think he wants to give us an incentive to playtest his...microgames or something?", "I-I dunno, but you can ignore it if you need to focus on your job.", "Oh, and you can spend those tokens you get in the shop menu.", "Give it a look when you get the chance! There's a BUNCH of useful stuff in there.", "Uh, anyway, I'll get back to you tomorrow, I should-", "Ohhhh...", "Could you KEEP IT DOWN IN THERE!?", "Wha-", "What'd you say to me?", "Um...", "W-Woah, hey, hey, I didn't mean to!", "Hey hey HEY HEY!"], [0, 2.7, 6.1, 9, 11.5, 13.6, 16.5, 19.2, 20.1, 22.2, 24.5, 27.4, 31.8, 34.7, 37.2, 40.3, 43.7, 44.5, 48.4, 49.3, 51.2, 52.5, 54]];
            break;
        
        case vocPhoneGuy4:
            return [["Hey palie.", "Yeah, yeah you guessed it. The last guy was found dead again.", "Poor bastard fell victim to a lethal swirlie.", "Anyway.", "I don't really got any survival tips for you or anything,", "You seem to have it pretty much down by now, anyway...", "...Uh, but what I DO have...", "*COCKS GUN*", "...Is a GUN!", "And I ain't meeting the same fate as those shmucks before me!", "YOU HEAR THAT, YOU BEAR BASTARD!?", "YOU WANNA PIECE OF ME!?", "WELL COME GET SOME OF THIS!"], [0, 0.8, 4.2, 8, 9, 11.5, 13.8, 15.2, 15.8, 17.1, 20.6, 22.7, 24.4]];
            break;
        
        case vocPhoneGuy5:
            return [["Hey, it's me again!", "Congratulations on making it to the end of the week.", "You seem real wise with the security stuff by now, so I'll just leave you to it.", "But, uh...", "Just don't forget to check out the shop and buy something if you find yourself struggling with anything.", "...Oh yeah.", "I actually did end up dying last night.", "The bullet ricocheted off of Freddy's head and right back into my skull.", "...So...my soul is trapped inside this phone now.", "...", "...You uh...you have fun with your last shift."], [0, 1.5, 4.2, 8.3, 8.8, 14.1, 15, 17.1, 22.2, 26.3, 28.4]];
        
        case vocPhoneGuy6:
            return [["Hey, chump! It's-a me!", "...Your boss.", "Now, keep an eye on those bots, eh?", "They're shiny, and worth a LOT of gold coins, eheheheheh...", "...But they're also some real jerks!", "...And I already made a reservation at the steakhouse, so you better make it out of there in one piece!", "Don't be a stooge, and uh...", "Have a rotten night! Wahahahaha!", "*BLOWS RASPBERRY*"], [0, 2.4, 3.5, 5.9, 10.1, 12.3, 18.1, 20.3, 23.3]];
            break;
        
        case voc_VladClara_Episode_Granny:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Mr. Landlord, please! Are you Sure you can't get us an apartment?", 0.3, UnknownEnum.Value_9], ["We really need a new place to stay!", 4.6, UnknownEnum.Value_9], ["Well, ma'am, you burned your last residence to the ground. A whole mansion, up in smoke!", 6.8, UnknownEnum.Value_25], ["That kind of thing leaves an... impression.", 12.7, UnknownEnum.Value_25], ["She has a temper, so what?! Stranger things have happened in the throes of passion!", 15.7, UnknownEnum.Value_8], ["Besides, that was all one season ago! she's a changed woman!", 20.8, UnknownEnum.Value_8], ["I'm sorry sir, but that just won't fly. We can't trust the two of you not to get into trouble again.", 25.1, UnknownEnum.Value_25], ["Need I remind you, you have a track record of your own... Mr. Vlad.", 30.3, UnknownEnum.Value_25], ["Aiyee...", 34.2, UnknownEnum.Value_1], ["W-well, what if someone were to sell us their old place?", 35, UnknownEnum.Value_9], ["With all due respect, ma'am, someone would have to be...pretty stupid to do that.", 38, UnknownEnum.Value_25], ["Have a good day.", 43, UnknownEnum.Value_25], ["*SHUTS DOOR*", 44.2, UnknownEnum.Value_20], ["Oh, Vlad... What are we going to do? How will we feed the baby?!", 45, UnknownEnum.Value_9], ["I-I need to take a walk. To clear my head.", 50, UnknownEnum.Value_2], ["Oh no, don't you walk out on me now, mister!", 53.4, UnknownEnum.Value_11], ["Get back here! Vlad! VLAD!!", 56.8, UnknownEnum.Value_19], ["What are we going to do?! We can't go homeless now, we just got back together...", 57.9, UnknownEnum.Value_2], ["Think, Vlad, think!", 62.4, UnknownEnum.Value_2], ["*BUMP*", 64, UnknownEnum.Value_20], ["Oh excuse me, dearie. I'm such a klutz today...hee hee!", 64.5, UnknownEnum.Value_22], ["It's no trouble at all, madam. Are you alright?", 68.2, UnknownEnum.Value_0], ["Why, yes! Fit as a fiddle. I just won the lottery, you see.", 71.2, UnknownEnum.Value_22], ["Hm.", 75.8, UnknownEnum.Value_2], ["And I was about to go sell my old place, ", 76.3, UnknownEnum.Value_22], ["Hm!", 79, UnknownEnum.Value_2], ["and move to the Bahamas!", 79.5, UnknownEnum.Value_22], ["AHA! Of course!", 81, UnknownEnum.Value_0], ["Well, you take care now young ma-", 83.5, UnknownEnum.Value_22], ["YOU WILL COME WITH ME AND MY WIFE. WE WILL HIRE A SOLICITOR AND DRAFT AN AGREEMENT.", 85.5, UnknownEnum.Value_21], ["YOUR OLD HOUSE WILL BE RENDERED UNTO ME. YOU WILL DO AS I COMMAND.", 92.6, UnknownEnum.Value_21], ["Yes, my lord... I will obey...", 99, UnknownEnum.Value_23], ["*CUTS BACK TO HOUSE*", 103.2, UnknownEnum.Value_19], ["I can't believe that undead deadbeat abandoned me AGAIN! The nerve of-", 104, UnknownEnum.Value_9], ["Clara! Clara! I found someone willing to sell their old house!", 108.9, UnknownEnum.Value_0], ["Vlad!", 112.9, UnknownEnum.Value_10], ["...Wait, you did?", 113.9, UnknownEnum.Value_9], ["That's right! Tell her, tell her!", 114.9, UnknownEnum.Value_0], ["I will hire a solicitor... and draft an agreement...", 117.4, UnknownEnum.Value_23], ["Uhh... Vlad.", 122.3, UnknownEnum.Value_9], ["Well, I suppose you can always COUNT on the kindness of others!", 124.1, UnknownEnum.Value_58], ["Ah ah ah ah!", 128.8, UnknownEnum.Value_3], ["Vlad, did you hypnotize this old lady?", 132.3, UnknownEnum.Value_11], ["No.", 134.2, UnknownEnum.Value_0], ["Will vlad and his beloved's new home be as spaceous as the last one?", 134.7, UnknownEnum.Value_17], ["Will the move go smoothly?", 138.5, UnknownEnum.Value_17], ["And WILL that old lady EVER retire and spend the rest of her life ogling speedo-clad men in the Bahamas?!", 140.5, UnknownEnum.Value_17], ["Your questions will be answered NEXT WEEK, on The Immortal and The Restless... SEASON TWOOO~!", 147, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_Chupacabra:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Ah...that's the last of the moving boxes!", 1.4, UnknownEnum.Value_0], ["And what a nice neighborhood, too... That old lady sure knew how to pick!", 4.9, UnknownEnum.Value_0], ["*DOOR OPENS*", 9.4, UnknownEnum.Value_20], ["Vlad, the baby got mad and accidentally turned Fido into a chupacabra!", 9.6, UnknownEnum.Value_9], ["Oh, for the last time, Clara! I absolutely completely undoubtedly had NOTHING to do with the conception of this child!", 13.2, UnknownEnum.Value_8], ["That's...not even what I'm talking about, you idiot! The dog is eating people!", 20.1, UnknownEnum.Value_11], ["And goats! ...A lot of goats.", 25.3, UnknownEnum.Value_9], ["Animals will be animals! Why should we get in the way of the circle of life?", 27.5, UnknownEnum.Value_0], ["They had to call in an exterminator, Vlad! The dog ate him too!", 31.8, UnknownEnum.Value_9], ["...I'll be in my study.", 36.7, UnknownEnum.Value_2], ["Oh, fine. But I am NOT covering you for the vet bill this time!", 38.5, UnknownEnum.Value_11], ["Fine! Well I...", 42.6, UnknownEnum.Value_5], ["...Do you hear that?", 44.6, UnknownEnum.Value_2], ["Don't you try to change the subject! I've had just about enou...", 45.6, UnknownEnum.Value_11], ["Wait, no... I do hear it. It sounds like...", 49.6, UnknownEnum.Value_9], ["It sounds like...barking.", 53.4, UnknownEnum.Value_2], ["Uh-oh.", 57.6, UnknownEnum.Value_1], ["*FIDO CRASHES INTO THE ROOM*", 58.4, UnknownEnum.Value_24], ["I TOLD you! You NEVER LISTEN to me, Vlad!", 59.6, UnknownEnum.Value_11], ["Okay, I think I...", 63.1, UnknownEnum.Value_1], ["Eee!", 64.7, UnknownEnum.Value_4], ["I think I see the problem now!", 65.6, UnknownEnum.Value_1], ["Oh, DO you!?", 67.1, UnknownEnum.Value_11], ["*DOG GROWLING*", 68.4, UnknownEnum.Value_24], ["Why...why is it looking at ME? What did I do?", 69.6, UnknownEnum.Value_7], ["You're a vampire, dummy! You drink blood!", 73, UnknownEnum.Value_11], ["And I think Fido's...thirsty?", 76.2, UnknownEnum.Value_9], ["*FIDO CHARGES*", 78.3, UnknownEnum.Value_24], ["AIYEE! CLARA!! HELP MEEEE...!!", 78.9, UnknownEnum.Value_7], ["Alright, that's it! Down! Down, boy! Sit! Siiiit...", 80.8, UnknownEnum.Value_11], ["No, that isn't working... Ughh. think, think...", 85.9, UnknownEnum.Value_9], ["Oh! I know!", 88.9, UnknownEnum.Value_15], ["HEEL.", 90.5, UnknownEnum.Value_81], ["It's... working?", 94, UnknownEnum.Value_6], ["Clara! We'll make a monster of you yet!", 96.6, UnknownEnum.Value_0], ["Well...I DID learn from the best.", 100.3, UnknownEnum.Value_15], ["Clara... You mean it? I-", 103.8, UnknownEnum.Value_0], ["*CHOMP*", 106.6, UnknownEnum.Value_86], ["YEEOUCH!", 106.9, UnknownEnum.Value_4], ["*BABY BABBLING*", 107.7, UnknownEnum.Value_26], ["..Junior! There you are, you little scamp.", 108.7, UnknownEnum.Value_26], ["You know, Clara...I think this baby might be mine after all!", 113.1, UnknownEnum.Value_58], ["Will Vlad and Clara adjust well to their new home life?", 118.8, UnknownEnum.Value_17], ["How will they fare now that their humble hound is a devilish doom-doggy?", 122.4, UnknownEnum.Value_17], ["And WHAT other mischief will their sweet little hellspawn get up to?", 126.8, UnknownEnum.Value_17], ["Find out next time, on The Immortal and The Restless...SEASON TWOOO~!", 131.2, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_VanHelsing:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Go to sleep... Go to sleep... Go to sleep, little monster...", 0.3, UnknownEnum.Value_28], ["Hope you dream, hope you dream,", 9.9, UnknownEnum.Value_28], ["Dream of suffering and fright...!", 15.5, UnknownEnum.Value_28], ["Sleep tight, my little abomination. Papa loves you...", 20.5, UnknownEnum.Value_0], ["Alright, I just need to get out of this room without waking him.", 27.3, UnknownEnum.Value_2], ["Easy does it...", 31.3, UnknownEnum.Value_1], ["EEE!", 34.7, UnknownEnum.Value_4], ["*BABY SLEEPING*", 35.5, UnknownEnum.Value_28], ["Phew!", 41, UnknownEnum.Value_3], ["*TELEPHONE RINGS*", 42.9, UnknownEnum.Value_4], ["Ugh...CLARA!! Can you get the phone?", 45, UnknownEnum.Value_6], ["Okay! Just watch Fido for me while I do.", 49.8, UnknownEnum.Value_56], ["Alright!", 52.8, UnknownEnum.Value_0], ["...Wait, what?", 54.7, UnknownEnum.Value_6], ["*FIDO APPEARS AND GROWLS*", 55.2, UnknownEnum.Value_24], ["Eheheh... Uh, nice doggy? Sit? Roll over?", 56.6, UnknownEnum.Value_24], ["...play dead?", 63.4, UnknownEnum.Value_24], ["Clara Clara CLARA CLARA-!", 64.7, UnknownEnum.Value_7], ["HEEL.", 66.6, UnknownEnum.Value_81], ["That's right, who's a good doggy? Who's a good boy? Yes, you are, you are!", 69, UnknownEnum.Value_10], ["I had no idea the bar for being a \"good boy\" was so low...", 75.1, UnknownEnum.Value_2], ["Oh! By the way, Vlad, I just got off the phone. Apparently, your old college entourage are all back from the war!", 78.1, UnknownEnum.Value_15], ["Wait, hold on. You mean to tell me...?", 84.9, UnknownEnum.Value_6], ["That's right! Jazzy Frank, King Tut, Wayne Wolfgang, all of them!", 86.7, UnknownEnum.Value_15], ["They're all back from the same war! AND they want to hang out with you at the old park! ", 91, UnknownEnum.Value_10], ["...Which I guess they felt the need to tell me about instead of asking if I could hand the phone to you.", 96.1, UnknownEnum.Value_12], ["I thought Frank got hit with a tank round... They literally mailed me his obituary!!", 100, UnknownEnum.Value_6], ["I cried for weeks!", 104.4, UnknownEnum.Value_6], ["Well, I guess they just put him back together...?", 106.4, UnknownEnum.Value_9], ["Seems like the boys are finally back in town...", 110.4, UnknownEnum.Value_2], ["Clara, I simply HAVE to go!", 113.4, UnknownEnum.Value_3], ["Oh, by the way, Fido's hungry again. You know what to do.", 115.5, UnknownEnum.Value_0], ["Oh, you!", 119.2, UnknownEnum.Value_10], ["*PULLS OUT AXE*", 120.2, UnknownEnum.Value_16], ["Go have fun, big guy! And be back before it hits midnight, okay?", 121, UnknownEnum.Value_16], ["*CUTS TO OUTSIDE*", 125.5, UnknownEnum.Value_31], ["Oh boy, oh boy! The old gang! back together! ", 126.3, UnknownEnum.Value_87], ["Perhaps we'll play twister? Or pin the tail on the wolf-man!", 130, UnknownEnum.Value_88], ["Or perhaps even operation...", 133.5, UnknownEnum.Value_87], ["With REAL organs!", 135.2, UnknownEnum.Value_89], ["Oh, I'm so excited I could-", 136.9, UnknownEnum.Value_87], ["*CROSSBOW COCKS*", 138.8, UnknownEnum.Value_29], ["We meet again, Vampire.", 140.2, UnknownEnum.Value_30], ["*GASPS* ", 142.4, UnknownEnum.Value_91], ["Van Helsing! Wait a minute... YOU made the call!", 143.1, UnknownEnum.Value_90], ["THAT'S RIGHT!! It was ME, you bat-brained, bloodsucking boob!", 147.5, UnknownEnum.Value_30], ["Don't you know vampire hunters are harder to squash than cockroaches!?", 151.6, UnknownEnum.Value_30], ["And this time... I'm here to finish the job!", 154.9, UnknownEnum.Value_30], ["What conundrum has poor vlad found himself in this time?", 159.5, UnknownEnum.Value_17], ["Where are all his college pals? WHO is this Van Helsing?", 163.4, UnknownEnum.Value_17], ["And WILL FIDO'S APPETITE EVER BE SATED!?", 167.5, UnknownEnum.Value_17], ["Tune in next week to FIND OUT! on The Immortal and The Restless... SEASON TWOOO~!", 170.9, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_GarlicBread:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Thank you again for your assistance, officer!", 0.6, UnknownEnum.Value_0], ["That's SHERIFF to you.", 2.7, UnknownEnum.Value_54], ["An' yer jus' lucky we got there on time!", 4.4, UnknownEnum.Value_54], ["Well, I don't-", 7.1, UnknownEnum.Value_6], ["This lil' town has been in CHAOS since you whackjobs moved in!", 8.1, UnknownEnum.Value_54], ["So stay outta trouble. I got my eye...on...YOU.", 12.8, UnknownEnum.Value_54], ["*NERVOUS CHUCKLE*", 19.4, UnknownEnum.Value_1], ["Awright, jimbo! Send 'er off!", 20.7, UnknownEnum.Value_54], ["*CAR DRIVES OFF", 22.9, UnknownEnum.Value_20], ["I'LL GET YOU FOR THIS, VAMPIIIIIIRE..!", 24.3, UnknownEnum.Value_57], ["Bye bye, now! I'll send you some flowers!", 26.8, UnknownEnum.Value_58], ["*SIGHS* Alright. Now that THAT'S over with, I can't help but feel like I'm...forgetting something.", 30.1, UnknownEnum.Value_2], ["Vlad! Where have you been?! The neighbors will be here any minute and we still don't have all the food ready!", 36.1, UnknownEnum.Value_14], ["...Right, the food.", 42, UnknownEnum.Value_1], ["Come on, already! Time's wasting! ", 43.5, UnknownEnum.Value_11], ["*PULLS VLAD AWAY*", 45.2, UnknownEnum.Value_85], ["*RETURNS HOME*", 45.8, UnknownEnum.Value_19], ["Okay. Lucky for you, Mr. Slacker...I've already finished the pasta.", 46.8, UnknownEnum.Value_12], ["The salad can be done last minute, so all that's left for YOU is the garlic bread.", 51.5, UnknownEnum.Value_12], ["D-d-di-did you say... g-g-guh..", 56.1, UnknownEnum.Value_7], ["Garlic bread, yes.", 59.5, UnknownEnum.Value_12], ["...Something the matter, Vlad? You look pale.", 61.2, UnknownEnum.Value_9], ["Well, paler than usual...", 63.8, UnknownEnum.Value_12], ["N-n-no!! Not at all, dearest! I'll get right on it!", 65.4, UnknownEnum.Value_58], ["Alright...I'm gonna go watch junior.", 68.9, UnknownEnum.Value_15], ["Don't want him turning anymore furniture into firewood...", 71.6, UnknownEnum.Value_12], ["Haha! Yes...! You go do that! I'll take care of... of the...", 74, UnknownEnum.Value_58], ["...Garlic bread.", 80, UnknownEnum.Value_60], ["*SIGHS* Okay, Vlad. You can do this. it's just a spot of dinner. When has dinner ever hurt anyone..? ", 81.8, UnknownEnum.Value_2], ["I just...have to...eeeuuuugggghh...", 88.7, UnknownEnum.Value_60], ["EEE!! No, I-I-I can't do it! I can't do it! ", 93.2, UnknownEnum.Value_7], ["Unless... I were to use...", 95.8, UnknownEnum.Value_2], ["...protection.", 98.9, UnknownEnum.Value_0], ["*RUMMAGING THROUGH CUPBOARD*", 100.7, UnknownEnum.Value_82], ["Alright... a little of this... maybe one of these... aaaand...", 102.7, UnknownEnum.Value_82], ["HA! Perfect!", 106.9, UnknownEnum.Value_55], ["A suit of armor fit for a king!", 108.9, UnknownEnum.Value_55], ["Now, for the garlic...", 111.9, UnknownEnum.Value_55], ["Easy does it... easy...", 114.8, UnknownEnum.Value_53], ["Vlad, how's it go-", 119.7, UnknownEnum.Value_15], ["AHH!! *POTS AND PANS CRASH TO THE FLOOR*", 120.6, UnknownEnum.Value_20], ["WHAT ON EARTH ARE YOU DOING?! ARE THOSE MY POTS AND PANS?! ", 122.2, UnknownEnum.Value_14], ["Ah- Clara! I-I was just...", 125.7, UnknownEnum.Value_7], ["COUNT VLADIMIR DRACULA THE THIRD!", 129.1, UnknownEnum.Value_11], ["Our guests will be here ANY SECOND, and you're in here...SCREWING AROUND!? Why, I never-", 131.8, UnknownEnum.Value_11], ["OH, CLARA! Don't make me do it! I can't stand the stuff! Please!! Pleeeheeheeeaaase...!!", 137.9, UnknownEnum.Value_7], ["Vlad? What are you talking about... The garlic?", 146, UnknownEnum.Value_9], ["Yes! The garlic! Don't make me do it, Clara! I'll do anythiiiiiihihihiiing!", 149.2, UnknownEnum.Value_7], ["Ohh, of course! You're a vampire!", 155.9, UnknownEnum.Value_15], ["You can't be around garlic, can you?", 159.6, UnknownEnum.Value_15], ["What...?", 161.5, UnknownEnum.Value_6], ["No, of course not! That's just a myth!", 162.6, UnknownEnum.Value_8], ["THEN WHAT'S WRONG WITH IT!?", 164.6, UnknownEnum.Value_14], ["I'm...I'm...", 166.6, UnknownEnum.Value_7], ["I'M HORRIBLY ALLERGIC!!", 168.7, UnknownEnum.Value_1], ["I have been since i was a child. I couldn't STAND to go in there, all snuffly and sneezy, eyes watering, red in the face, and serve food to our new neighbors!", 170.3, UnknownEnum.Value_1], ["What kind of first impression would THAT be!?", 179.6, UnknownEnum.Value_6], ["*CLARA LAUGHS*", 182.8, UnknownEnum.Value_15], ["Clara? Clara this isn't - Clara it's not funny, Uh...", 184.2, UnknownEnum.Value_6], ["Oh, Vlad! you should have told me!", 188.6, UnknownEnum.Value_10], ["I...I didn't think it was any of your concern...", 191.3, UnknownEnum.Value_2], ["That's not the point, dummy! We're a family! We gotta know these things if we want to help each other out!", 194, UnknownEnum.Value_15], ["Here, we can make the garlic bread together.", 200.3, UnknownEnum.Value_10], ["Together...?", 203.2, UnknownEnum.Value_6], ["Together.", 204.3, UnknownEnum.Value_15], ["Wait, what time is it?", 206.6, UnknownEnum.Value_9], ["*KNOCKS ON DOOR*", 208.7, UnknownEnum.Value_56], ["*SHOCK*", 210.1, UnknownEnum.Value_94], ["THE NEIGHBORS!!", 210.6, UnknownEnum.Value_94], ["Will vlad & clara be able to claw back their disastrous dinner? Will their poor guests go hungry?", 212, UnknownEnum.Value_17], ["And...was this kind of just a filler episode? ", 218.5, UnknownEnum.Value_17], ["Tune in NEXT WEEK for at least two of those answers... on The Immortal and The Restless... SEASON TWOOOOOO~!", 222, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_HalloweenDecorations:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Okay, let's see... Uh, we need more milk, some bread, eggs....", 0.5, UnknownEnum.Value_77], ["Wait, no, I got some from the corner store...", 8.5, UnknownEnum.Value_77], ["We need...well, we need more diapers for junior over here.", 11.7, UnknownEnum.Value_77], ["*BABY NOISE*", 16, UnknownEnum.Value_75], ["*VLAD GRUMBLING*", 16.5, UnknownEnum.Value_67], ["We could do with some more garlic, I think. we used up the last of it yesterday...", 19.9, UnknownEnum.Value_77], ["*VLAD CONTINUES GRUMBLING*", 24.6, UnknownEnum.Value_67], ["Oh, what IS it, Vlad!? I told you you didn't have to come if you'd be bored.", 28, UnknownEnum.Value_76], ["No, no, it's not that. Just...", 32.7, UnknownEnum.Value_61], ["LOOK at this! How...insulting!", 35.4, UnknownEnum.Value_68], ["The... Halloween decorations? Well, it IS that time of year...", 38.7, UnknownEnum.Value_78], ["But-but LOOK! Vampires look nothing like that! That pale, gaunt face! That RIDICULOUS haircut!", 44.1, UnknownEnum.Value_68], ["And that outfit...a CAPE!?", 51.6, UnknownEnum.Value_67], ["What am I, a superhero?!", 54.6, UnknownEnum.Value_68], ["Oh, Vlad. it's just a cartoon, silly! I doubt they meant anything by it...", 56.5, UnknownEnum.Value_76], ["NONSENSE! This place is WROUGHT with stereotypes!", 60.9, UnknownEnum.Value_61], ["Here, I'll show you.", 65.7, UnknownEnum.Value_69], ["Oh boy, here we go...", 67.8, UnknownEnum.Value_76], ["These pumpkins are cheap PLASTIC! Sure, they may look pretty, but what good is a jack-o-lantern that MELTS from CANDLE-HEAT!?", 69.9, UnknownEnum.Value_71], ["*WHOOSH*", 78.1, UnknownEnum.Value_85], ["These cobwebs, and this ghost costume, they're FABRIC! It's all well and good as a costume, until the MOTHS arrive and start EATING YOU ALIVE!!", 78.5, UnknownEnum.Value_73], ["*WHOOSH*", 87.7, UnknownEnum.Value_85], ["Witches don't carry brooms around everywhere! And zombies aren't even green!", 88.1, UnknownEnum.Value_72], ["They're more purple...ish.", 92.7, UnknownEnum.Value_72], ["*WHOOSH*", 94.8, UnknownEnum.Value_85], ["And this... THIS RIGHT HERE... The worst offender of them all.", 95.1, UnknownEnum.Value_61], ["THE SKELETONS ARE ALL NUDE!! Think of the CHILDREN, Clara! THINK!!", 100.9, UnknownEnum.Value_70], ["Ugh... Halloween is a FOOL'S HOLIDAY!! I CURSE ALL WHO CELEBRATE IT, FOR ALL ETERNITY!!", 106.7, UnknownEnum.Value_66], ["..Are you done?", 117.3, UnknownEnum.Value_76], ["NEVER!! I have a right mind to sue for defamation, I tell you! This is outrageous! This is absurd!!", 118.3, UnknownEnum.Value_61], ["This is... is...", 125.3, UnknownEnum.Value_61], ["...Hm?", 128, UnknownEnum.Value_64], ["Duuuude... is that...?", 128.5, UnknownEnum.Value_80], ["A REAL vampire!?", 131.2, UnknownEnum.Value_80], ["May I help you...?", 133, UnknownEnum.Value_62], ["NO WAY!", 134.4, UnknownEnum.Value_79], ["*KIDS INSPECT VLAD*", 136.1, UnknownEnum.Value_82], ["He's totally the real deal... Check out his pale skin!", 136.8, UnknownEnum.Value_63], ["Duuude... and his gnarly fangs!", 140.1, UnknownEnum.Value_63], ["Gehh your hangh ouh of ghere...!", 143.2, UnknownEnum.Value_63], ["Sorry, Mr. Vampire-dude. We're just huuuge fans!", 144.9, UnknownEnum.Value_79], ["Yeah! Do you really sleep in a coffin?", 148.7, UnknownEnum.Value_79], ["W-well I used to, but I, ehh...moved house. ", 151.3, UnknownEnum.Value_61], ["I like a tomb with a view! Ah ah ah!", 155.8, UnknownEnum.Value_69], ["WOOOOAH!!", 159.2, UnknownEnum.Value_80], ["And- and where's your cape?", 160.4, UnknownEnum.Value_79], ["He OBVIOUSLY left it at home, dummy! He wouldn't bring it out shopping, right mister?", 162, UnknownEnum.Value_79], ["Ehh...right! Right you are! ...Left it at home. Eh heh...", 167, UnknownEnum.Value_69], ["So cool...", 172.1, UnknownEnum.Value_80], ["Say...", 173.3, UnknownEnum.Value_80], ["Can we get a selfie?", 174.8, UnknownEnum.Value_79], ["Ehh...Sure! A-Anything for my...adoring fans!", 176.2, UnknownEnum.Value_69], ["AWESOME!!", 181.6, UnknownEnum.Value_79], ["Say cheese, vamp-dude!", 183.1, UnknownEnum.Value_79], ["Eh...Cheese!", 184.8, UnknownEnum.Value_62], ["*SNAPS PHOTO*", 186, UnknownEnum.Value_20], ["Kids! It's time to go now, okay?", 187.2, UnknownEnum.Value_74], ["Awwwww...", 189.6, UnknownEnum.Value_80], ["We gotta go now, mister.", 190.8, UnknownEnum.Value_79], ["That's alright, kiddos! You take care now! Happy Halloween!", 192.3, UnknownEnum.Value_69], ["Byeee!!", 197.3, UnknownEnum.Value_79], ["*SIGHS*", 199.8, UnknownEnum.Value_64], ["Oh, Vlad... It was good of you to entertain them like that. I know that couldn't have been easy...", 201.1, UnknownEnum.Value_76], ["That...That was...", 206.3, UnknownEnum.Value_64], ["INCREDIBLE!", 209.1, UnknownEnum.Value_69], ["Huh?", 210.3, UnknownEnum.Value_78], ["I mean... they were STARSTRUCK!! From ME!", 210.8, UnknownEnum.Value_69], ["Do kids nowadays think vampires are really that cool!?", 214, UnknownEnum.Value_69], ["We... We should decorate the house! Let ALL the trick-or-treaters know to come!! We must have ALL of these decorations!!", 217.1, UnknownEnum.Value_69], ["Oh! Uh... If you say so!", 224.1, UnknownEnum.Value_78], ["WAIT!!", 227.1, UnknownEnum.Value_62], ["Do you think I'd look good in a cape?", 228, UnknownEnum.Value_69], ["Heh, gosh, Vlad. I really don't know, I-", 229.8, UnknownEnum.Value_76], ["Only one way to find out!! TO THE CLOTHING AISLE!!", 232.8, UnknownEnum.Value_65], ["*LAUGHS* Oh, junior... What are we gonna do with your dad, hm?", 237.9, UnknownEnum.Value_65], ["Will the groceries get done before Vlad gets carried away?! Will those two darling kiddies spread the word of a REAL vampire in town?", 243.8, UnknownEnum.Value_17], ["And WILL vlad look good in that cape!?", 252.4, UnknownEnum.Value_17], ["All this and more, next time! on The Immortal and The restless... SEASON TWOOOOOO~!", 255.4, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_Divorce:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["Look, I'll be frank with you two-", 0.8, UnknownEnum.Value_32], ["That's impossible, I saw Frank just a few days ago! He'd lost some weight...", 3.1, UnknownEnum.Value_58], ["Vlad, shush! This is serious!", 7.6, UnknownEnum.Value_12], ["...As I was saying. We can't keep doing this. Your son is just too much of a handful. ", 9.2, UnknownEnum.Value_32], ["Whatever are you talking about?! Little junior would never harm a hair on another child's head!", 16, UnknownEnum.Value_0], ["Sir, I caught him gnawing on some kid's leg just this morning.", 21.1, UnknownEnum.Value_32], ["What, children aren't allowed to go through teething now!?", 25, UnknownEnum.Value_2], ["Teething is one thing, but when your son can bite through a chair leg with his gums alone, god help us when his fangs come in.", 28.2, UnknownEnum.Value_32], ["I'm not sure I like what you're insinuating here.", 36.1, UnknownEnum.Value_5], ["Dislike it all you want, but there's more. The first day you brought junior here, he wouldn't get off the ceiling ALL day.", 38.6, UnknownEnum.Value_32], ["We had to coax him off with a broom.", 47.1, UnknownEnum.Value_32], ["Then, all within the next few weeks, he fed on the class hamster till it was a lifeless ball of fluff,", 49.6, UnknownEnum.Value_32], ["Hypnotized a member of staff into clucking like a chicken, woke everyone up during naptime over EIGHT times, and made another student float by their ankles until they fainted.", 54.9, UnknownEnum.Value_32], ["I mean honestly, the list just goes on and on and...", 65.7, UnknownEnum.Value_32], ["ALRIGHT alright, I get it.", 69.9, UnknownEnum.Value_5], ["What's your point?", 71.9, UnknownEnum.Value_6], ["My point is, we're done. I'm sure there are places out there better suited to the needs of a child as... special as yours.", 73.1, UnknownEnum.Value_32], ["But our daycare? I'm afraid.. isn't. Junior is... expelled.", 83.2, UnknownEnum.Value_32], ["", 90.8, UnknownEnum.Value_94], ["EXPELLED?!", 91.1, UnknownEnum.Value_94], ["But- but you can't do that! No other daycare in town will take him!", 92.4, UnknownEnum.Value_9], ["That's right! You ought to be ashamed! Junior is a little SAINT! You're LUCKY to have him!", 96.9, UnknownEnum.Value_5], ["Believe me, if we had other options it wouldn't have come to this.", 102.2, UnknownEnum.Value_32], ["(SIGH) look, if I can be real for a sec, me and the staff have lost sleep over this kid's antics.", 106.9, UnknownEnum.Value_32], ["I just need to rest, man. There's no other way, junior's gotta go. I'm sorry.", 112.9, UnknownEnum.Value_32], ["(STAMMERS)", 119, UnknownEnum.Value_7], ["(STAMMERS)", 119.2, UnknownEnum.Value_5], ["(STAMMERS)", 119.8, UnknownEnum.Value_0], ["(STAMMERS)", 120, UnknownEnum.Value_7], ["(STAMMERS)", 120.3, UnknownEnum.Value_5], ["(STAMMERS)", 120.5, UnknownEnum.Value_4], ["...Well, some daycare this was anyway!", 121.4, UnknownEnum.Value_5], ["I-I curse your children! I curse your children's children!!", 123.9, UnknownEnum.Value_5], ["May you all walk this earth, gloomy and unfulfilled for the rest of your miserable days!!!", 127.3, UnknownEnum.Value_66], ["May you all walk this earth, gloomy and unfulfilled for the rest of your miserable days!!!", 132.1, UnknownEnum.Value_66], ["May you all walk this earth, gloomy and unfulfilled for the rest of your miserable days!!!", 132.3, UnknownEnum.Value_66], ["VLAD!", 133.3, UnknownEnum.Value_14], ["Let's just go, okay!?", 134.1, UnknownEnum.Value_13], ["(SIGH)", 135.8, UnknownEnum.Value_6], ["Okay...", 136.8, UnknownEnum.Value_6], ["(FOOTSTEPS GETTING QUIETER)", 137.6, UnknownEnum.Value_19], ["(HURRIED FOOTSTEPS GETTING LOUDER)", 140, UnknownEnum.Value_19], ["AND MAY BOTH SIDES OF YOUR PILLOW BE WARM FOR ALL ETERNITY!!", 141.1, UnknownEnum.Value_5], ["(SLAM)", 144.5, UnknownEnum.Value_20], ["...Just another Monday.", 146, UnknownEnum.Value_32], ["*WHOOSH*", 149.9, UnknownEnum.Value_31], ["The nerve of that guy, talking about Junior like he's just some... some freak of nature?!", 150.6, UnknownEnum.Value_2], ["I ought to teach him some manners, eh Clara?", 155.6, UnknownEnum.Value_0], ["...Clara?", 159.4, UnknownEnum.Value_6], ["...", 160.2, UnknownEnum.Value_6], ["It's- It' s okay! ", 160.9, UnknownEnum.Value_0], ["We can take care of junior ourselves!", 162.5, UnknownEnum.Value_0], ["Stay up all night with him, yknow?", 164.5, UnknownEnum.Value_58], ["Hang from the ceiling and watch him play! Go hunting at night together! Flying through the trees, dipping in and out of the clouds...", 166.3, UnknownEnum.Value_3], ["Hang from the ceiling and watch him play! Go hunting at night together! Flying through the trees, dipping in and out of the clouds...", 169.8, UnknownEnum.Value_3], ["Hang from the ceiling and watch him play! Go hunting at night together! Flying through the trees, dipping in and out of the clouds...", 170.8, UnknownEnum.Value_3], ["Just imagine it, Clara!", 172.8, UnknownEnum.Value_58], ["VLAD, ENOUGH! I CAN'T DO ANY OF THAT! I'M NOT A VAMPIRE!!", 174.6, UnknownEnum.Value_14], ["...Right.", 179.5, UnknownEnum.Value_6], [" I'm sorry.", 180.8, UnknownEnum.Value_6], ["No, not this time. 'Sorry' doesn't cut it!", 181.5, UnknownEnum.Value_14], ["Do you even HEAR yourself?!", 184.6, UnknownEnum.Value_14], ["Junior just got kicked out of the last daycare in town and here you are DAYDREAMING!!", 186.4, UnknownEnum.Value_9], ["(SCOFF)", 191.3, UnknownEnum.Value_5], ["WAKE UP, Vlad!", 191.8, UnknownEnum.Value_14], ["You have RESPONSIBILITIES, I mean-", 193.4, UnknownEnum.Value_11], ["Do you EVER think about what it's like to be ANYONE else?!", 195.3, UnknownEnum.Value_11], ["Clara... I-", 198.7, UnknownEnum.Value_1], ["NO!! Don't \"Clara\" me!!", 200, UnknownEnum.Value_14], ["In the time we've been back together, you hypnotized some poor old lady-", 202.1, UnknownEnum.Value_11], ["- Who probably would have sold us her house anyway-", 206, UnknownEnum.Value_11], ["THEN, you don't BOTHER to help when the baby turns our dog into a MONSTER!", 208.5, UnknownEnum.Value_11], ["THEN!!! You disappear ALL NIGHT, leaving me worried SICK!!", 213.4, UnknownEnum.Value_11], ["You refuse to explain yourself, and RUIN dinner", 216.5, UnknownEnum.Value_11], ["ALL because you wouldn't simply TELL me you were allergic to GARLIC of all things!!", 218.8, UnknownEnum.Value_11], ["You get all grumpy when it's time to do groceries, until all of a sudden,", 223.8, UnknownEnum.Value_11], ["Some kids give you just a SECOND of attention, and then you MAKE IT ALL ABOUT YOURSELF!", 227.2, UnknownEnum.Value_11], ["GOD, WHY CAN'T I JUST HAVE A NORMAL HUSBAND!?", 232.1, UnknownEnum.Value_14], ["Clara...", 236, UnknownEnum.Value_6], ["My dear, I had no idea you were this unhappy!", 237.4, UnknownEnum.Value_6], ["BECAUSE YOU NEVER ASKED!!!", 240, UnknownEnum.Value_14], ["...", 243, UnknownEnum.Value_83], ["I...", 247, UnknownEnum.Value_83], ["Vlad... I need some time.", 248.5, UnknownEnum.Value_9], ["Since I burned the mansion down, I've been trying my best to be better.", 251.5, UnknownEnum.Value_13], ["For us and for junior.", 255.9, UnknownEnum.Value_13], ["But you...", 257.8, UnknownEnum.Value_11], ["You haven't!", 258.9, UnknownEnum.Value_11], ["You haven't even tried!", 260, UnknownEnum.Value_11], ["You're no different from when I met you!", 261.8, UnknownEnum.Value_11], ["I need you to just... try, Vlad. Just once.", 264.1, UnknownEnum.Value_9], ["I'm...", 268.2, UnknownEnum.Value_6], ["I'm sorry...", 269.6, UnknownEnum.Value_6], ["If...this is truly what you want...", 270.4, UnknownEnum.Value_9], ["Then don't bother coming home.", 272.9, UnknownEnum.Value_13], ["I'll take care of junior myself, you can...", 274.8, UnknownEnum.Value_13], ["Go do whatever it is you vampires do.", 278.1, UnknownEnum.Value_12], ["You've won, Vlad.", 281.3, UnknownEnum.Value_12], ["Enjoy it.", 283.2, UnknownEnum.Value_12], ["Clara, wait!", 285, UnknownEnum.Value_6], ["This isn't what I...", 286, UnknownEnum.Value_6], ["Clara!", 287.3, UnknownEnum.Value_93], ["CLARA!!", 288.4, UnknownEnum.Value_93], ["CLAAAARAAAA!!!", 289.9, UnknownEnum.Value_19], ["...Clara...", 293.5, UnknownEnum.Value_95], ["...What have I done?", 296.5, UnknownEnum.Value_95], ["Looks like our 'hero' has a lot of thinking to do.", 300.9, UnknownEnum.Value_17], ["And he has plenty of time to do it, too... because it's a long walk home.", 305.5, UnknownEnum.Value_17], ["Dear viewer, maybe the end-of-episode questions belong to him this time.", 312.2, UnknownEnum.Value_17], ["   Tune in next week, for the season finale.", 318.6, UnknownEnum.Value_17], ["...Oh what, I have to do the thing? Okay-", 327.3, UnknownEnum.Value_17], ["Uh, SEASONTWOOOOOOO!!!!!!", 329, UnknownEnum.Value_17]];
        
        case voc_VladClara_Episode_Orlok:
            return [["*STATIC*", 0, UnknownEnum.Value_18], ["(CLOCK TICKING)", 1.2, UnknownEnum.Value_19], ["(SIGHS, GROANS)", 3.2, UnknownEnum.Value_6], ["You've really done it this time, Vlad...", 6.4, UnknownEnum.Value_6], ["Your wife hates you, you can't get your baby a proper education,", 9.4, UnknownEnum.Value_6], ["and it's all because you had to have your head lodged up your-", 14.5, UnknownEnum.Value_6], ["(DOORBELL RINGS)", 18.1, UnknownEnum.Value_56], ["(SCOFFS)", 20.6, UnknownEnum.Value_6], ["Clara, the door...!", 22.3, UnknownEnum.Value_6], ["...", 24.9, UnknownEnum.Value_6], ["CLARA! DOOR-!", 26.2, UnknownEnum.Value_5], ["Oh, I'll get it...", 28.1, UnknownEnum.Value_2], ["Oh hellfire, things can't get ANY wors-", 30.1, UnknownEnum.Value_56], ["", 33.6, UnknownEnum.Value_36], ["VLADIMIR.", 34.4, UnknownEnum.Value_36], ["A-A-AAAAHH!!", 36.5, UnknownEnum.Value_7], ["(DOOR SLAMS)", 37.8, UnknownEnum.Value_56], ["Grandpapa Orlok?! What is he doing here?! His visit wasn't due for another month!!", 38.7, UnknownEnum.Value_2], ["I've had no time to prepare... No time to...", 43.3, UnknownEnum.Value_2], ["Wait.", 46.1, UnknownEnum.Value_4], ["CLARA! I can't let him see her! I need to buy some time.", 47.2, UnknownEnum.Value_5], ["Grandpapa Orlok!! What a... lovely surprise..! You look as pale and decrepit as ever! A-and early, to boot! What brings you here...?", 50.7, UnknownEnum.Value_58], ["Flattery will get you nowhere, my boy. I have arrived so early so that you would not be expecting me. See, I need to observe you.", 60.3, UnknownEnum.Value_35], ["Make sure you're as much of a success as your cousins. Dear Virocia has a fleet of thralls at her service already, you know.", 71.8, UnknownEnum.Value_33], ["AND a mansion! In Pennsylvania!", 80.5, UnknownEnum.Value_33], ["It's not quite Transylvania but what can you do, it's close enough, eh?", 83.8, UnknownEnum.Value_35], ["Iyeee...", 87, UnknownEnum.Value_1], ["Yes, yes I know about Virocia", 88, UnknownEnum.Value_1], ["She wouldn't shut up about it over the phone.", 90, UnknownEnum.Value_2], ["JUUUST give me a few minutes to uh, tidy, and...", 92, UnknownEnum.Value_58], ["Do some last minute... ", 95.6, UnknownEnum.Value_58], ["...Vampire... things.", 97.4, UnknownEnum.Value_2], ["Ah, yes... Vampire things are indeed important. Alright, you may...", 99.1, UnknownEnum.Value_33], ["(SNIFF SNIFF)", 105.1, UnknownEnum.Value_34], ["Wait...", 106.1, UnknownEnum.Value_35], ["(SNIFF SNORT SNIFF)", 107, UnknownEnum.Value_34], ["This place...", 108.3, UnknownEnum.Value_35], ["(SNIFF)", 109.5, UnknownEnum.Value_34], ["It reeks...", 109.8, UnknownEnum.Value_35], ["(SNIFF)", 110.4, UnknownEnum.Value_34], ["OF...", 110.6, UnknownEnum.Value_35], ["(SNORT)", 111, UnknownEnum.Value_33], ["...HUMAN...!", 111.8, UnknownEnum.Value_34], ["AHAHA, THAT IS CRAZY, GRANDPAPA ORLOK!", 113.4, UnknownEnum.Value_7], ["It must be the uh... climate! Playing tricks on you!", 115.9, UnknownEnum.Value_58], ["This is a human town, after all!", 119.9, UnknownEnum.Value_58], ["Your old sense of smell must be... eh- confused.", 121.7, UnknownEnum.Value_58], ["I WILL BE BUT A MOMENT!", 125.5, UnknownEnum.Value_58], ["(DOOR SLAMS SHUT)", 126.6, UnknownEnum.Value_56], ["Do not keep me waiting, Vladimir!", 127.1, UnknownEnum.Value_56], ["I'm really in for it now... I need to hide Clara and Junior. They're both in TERRIBLE DANGER!", 130.5, UnknownEnum.Value_7], ["(HURRIES AWAY)", 135.8, UnknownEnum.Value_19], ["(BABBLING)", 138, UnknownEnum.Value_28], ["I know, honey I know. There there...", 139, UnknownEnum.Value_13], ["CLARA!!! Clara, this is urgent, YOU NEED TO HIDE, I-", 143.1, UnknownEnum.Value_7], ["SHH!", 146.5, UnknownEnum.Value_12], ["...Sorry.", 148, UnknownEnum.Value_2], ["L-Look, I know you aren't talking to me at the moment, I don't blame you. ", 149.2, UnknownEnum.Value_6], ["But this is SERIOUS! I MEAN it this time!", 153.8, UnknownEnum.Value_8], ["(SIGHS)", 157.1, UnknownEnum.Value_12], ["Clara, I understand. ", 158.6, UnknownEnum.Value_6], ["I've been hysterical over little things in the past, but your LIVES are in danger!", 160.6, UnknownEnum.Value_8], ["We could lose junior! We could lose the house! I could...", 165.6, UnknownEnum.Value_8], ["I could lose you.", 170.4, UnknownEnum.Value_6], ["Clara, please. Just listen to me.", 172.8, UnknownEnum.Value_6], ["You can go back to hating me right after, but, please just listen...", 175.5, UnknownEnum.Value_6], ["You promise?", 180.3, UnknownEnum.Value_9], ["(GASP)", 181.2, UnknownEnum.Value_6], ["You promise this isn't another one of your... situations?", 182.2, UnknownEnum.Value_12], ["I swear. Cross my fangs.", 185.7, UnknownEnum.Value_0], ["Okay... Show us where to hide.", 188.7, UnknownEnum.Value_9], ["*WOOSH*", 191.4, UnknownEnum.Value_19], ["Alright, in this closet... that should do it.", 193.2, UnknownEnum.Value_0], ["And whatever you do, STAY QUIET.", 196.5, UnknownEnum.Value_8], ["If anything happens, I lo-", 199.3, UnknownEnum.Value_8], ["This place is disgustingly homey. Where are the coffins... and the suits of armor? And don't tell me you've been...", 201.1, UnknownEnum.Value_35], ["...DUSTING?!", 211.6, UnknownEnum.Value_34], ["Where have you gotten off to-", 213, UnknownEnum.Value_35], [" ", 215, UnknownEnum.Value_84], ["Uh-oh.", 216.2, UnknownEnum.Value_84], ["A HUMAN!!! A HUMAN INTRUDER!!! KILL IT, VLAD!! KILL IT!!!!!", 216.5, UnknownEnum.Value_34], ["HERE!!", 221.7, UnknownEnum.Value_82], ["Uh- Hey!", 222, UnknownEnum.Value_82], ["I'll hold the little rat!", 222.7, UnknownEnum.Value_82], ["QUICK, SINK YOUR TEETH IN!", 224.3, UnknownEnum.Value_82], ["No, no!! You've got it all wrong! I-", 225.8, UnknownEnum.Value_8], ["You what.", 229.5, UnknownEnum.Value_35], ["Ahem.", 230.8, UnknownEnum.Value_2], ["Grandpapa Orlok, allow me to introduce Clara.", 232.2, UnknownEnum.Value_1], ["My...", 236.9, UnknownEnum.Value_1], ["My wife.", 238.5, UnknownEnum.Value_8], ["...Wife?", 239.6, UnknownEnum.Value_35], ["WIFE?!", 241.1, UnknownEnum.Value_34], ["YOU MARRIED A HUMAN?!?", 242.6, UnknownEnum.Value_34], ["OH, THE VAMPIRITY!!!", 244.9, UnknownEnum.Value_34], ["MY OWN FLESH AND BLOOD?!", 247.3, UnknownEnum.Value_34], ["...Wait till you meet the little guy...", 249.8, UnknownEnum.Value_13], ["The Whah...", 251.6, UnknownEnum.Value_35], ["(BABBLE)", 253.3, UnknownEnum.Value_27], ["YOU HAD A CHILD?! A DISGUSTING HALFBREED CHILD?!", 254.1, UnknownEnum.Value_34], ["Oh, why don't you just put a STAKE through my heart...!", 259.2, UnknownEnum.Value_34], ["Sorry, grandpapa...", 263.6, UnknownEnum.Value_1], ["I KNEW you were weak... I KNEW you were a RUNT...", 265, UnknownEnum.Value_33], ["But I NEVER thought you could stoop this low!", 269.7, UnknownEnum.Value_35], ["Yes, grandpapa...", 273.7, UnknownEnum.Value_95], ["I mean, of all the... if you were going to pick a HUMAN, you could have atleast picked a pretty one!", 275.2, UnknownEnum.Value_35], ["Yes, grandpa...", 282.3, UnknownEnum.Value_95], ["Wait... What?", 283.8, UnknownEnum.Value_8], ["I mean really, not much to look at. Humans are weak...Humans are USELESS!", 285.2, UnknownEnum.Value_35], ["Just look at her... I bet you do all the cooking and the cleaning and the shopping, am I right?", 293, UnknownEnum.Value_33], ["What...?", 299.9, UnknownEnum.Value_8], ["And gracious, it carried right over into the little brat.", 300.7, UnknownEnum.Value_35], ["I mean, that is the most UGLY,", 305.2, UnknownEnum.Value_27], ["What?", 308.1, UnknownEnum.Value_8], ["DISGUSTING", 308.6, UnknownEnum.Value_27], ["WHAT?", 309.9, UnknownEnum.Value_8], ["WORTHLESS,", 310.6, UnknownEnum.Value_27], ["WHAAAT?", 311.5, UnknownEnum.Value_5], ["LITTLE FREAK OF NATURE, I HAVE EVER SEEN!!", 312.3, UnknownEnum.Value_27], ["NOW THAT IS ENOUGH!!!", 315.2, UnknownEnum.Value_66], ["You come into my house, you insult MY family,", 318.3, UnknownEnum.Value_66], ["You make assumptions about MY life, and you try and take control and \"fix things\" as if I were just a little bat again.", 321.9, UnknownEnum.Value_66], ["WELL I'M NOT.", 329.2, UnknownEnum.Value_66], ["I am ONE HUNDRED AND FOURTY THREE YEARS OLD NOW.", 330.1, UnknownEnum.Value_66], ["And sure, I may not be the perfect example of what \"makes a good vampire,\"", 333.3, UnknownEnum.Value_66], ["but WHO IS?!", 337.3, UnknownEnum.Value_66], ["YOU certainly aren't.", 338.4, UnknownEnum.Value_66], ["You're just trying to live vicariously through your grandchildren!", 339.9, UnknownEnum.Value_66], ["Who, by the way, are doing more with THEIR lives than you EVER DID!", 343.2, UnknownEnum.Value_66], ["T-that's impossible...!", 347.4, UnknownEnum.Value_34], ["OH, IS IT?", 349, UnknownEnum.Value_8], ["For your information, I have been a TERRIBLE husband.", 350.4, UnknownEnum.Value_6], ["I can't cook to save my life, I throw fits over TINY little things,", 354.3, UnknownEnum.Value_6], ["I struggle with commitment, I run away from my problems,", 358.4, UnknownEnum.Value_6], ["and I JUST! DON'T! LISTEN!", 361.2, UnknownEnum.Value_5], ["But Clara? She has been WONDERFUL.", 363.8, UnknownEnum.Value_6], ["She's stuck with me through ALL of my shortcomings, even though I didn't see it at first.", 367.2, UnknownEnum.Value_6], ["I love her with all my heart, human or no!", 372.7, UnknownEnum.Value_5], ["Vlad...", 376.2, UnknownEnum.Value_15], ["And junior...Is the most perfect baby in the world!", 376.8, UnknownEnum.Value_8], ["He may have quirks, he may not be easy to parent, but he's OURS.", 380.6, UnknownEnum.Value_8], ["And that means more to me than any frustration he may cause.", 385.6, UnknownEnum.Value_8], ["THEY were there when times were tough.", 390.1, UnknownEnum.Value_8], ["THEY were there at my happiest! At my loneliest!", 392.7, UnknownEnum.Value_8], ["YOU were NEVER there!", 396.2, UnknownEnum.Value_5], ["Unless it was to tell me I'll NEVER be as good as you!", 398, UnknownEnum.Value_5], ["You are no grandfather...", 402.3, UnknownEnum.Value_5], ["You are NOTHING to me but a SAD. OLD. MAN.", 404.7, UnknownEnum.Value_5], ["How...", 409.2, UnknownEnum.Value_34], ["How DARE you?!", 410.4, UnknownEnum.Value_34], ["Furthermore!", 411.8, UnknownEnum.Value_8], ["You talk of being a model vampire,", 413.2, UnknownEnum.Value_8], ["And yet you've broken one of the most sacred vampire rules of all time!", 415.2, UnknownEnum.Value_8], ["Say, Grandpa Orlok, were you...", 420.8, UnknownEnum.Value_0], ["...Invited in?", 423.8, UnknownEnum.Value_58], ["I...I!!!!", 425.1, UnknownEnum.Value_34], ["Hm! I didn't THINK so.", 426.7, UnknownEnum.Value_3], ["(SHUDDERS)", 430.3, UnknownEnum.Value_34], ["Then, according to VAMPIRE LAW...", 430.8, UnknownEnum.Value_0], ["You shouldn't be setting foot inside this residence, now should you?", 433.8, UnknownEnum.Value_0], ["Vladimir...", 437.2, UnknownEnum.Value_34], ["You're making a grave mistake...!", 438.4, UnknownEnum.Value_34], ["Orlok Dracula The Fifth...", 440.8, UnknownEnum.Value_66], ["Get out of my house.", 443.9, UnknownEnum.Value_8], ["(STAMMERS)", 445.3, UnknownEnum.Value_34], ["YOU HAVEN'T SEEN THE LAST OF ME, VLADIMIR! YOU'LL SEEEEEEE...!!", 449, UnknownEnum.Value_36], ["(ORLOK FLEES)", 455.8, UnknownEnum.Value_59], ["Good riddance.", 458.4, UnknownEnum.Value_2], ["(DOOR SLAMS)", 459.6, UnknownEnum.Value_56], ["Vlad... Did you really mean all of that?", 461, UnknownEnum.Value_15], ["Of course, my dearest.", 465.1, UnknownEnum.Value_0], ["I have been a fool!", 466.8, UnknownEnum.Value_8], ["I was blind to the effort you were putting in, you have truly been a blessing.", 468.1, UnknownEnum.Value_8], ["You have given me more than I ever dreamed, and more chances than I deserved.", 472.6, UnknownEnum.Value_8], ["I could not imagine a life without you.", 477.6, UnknownEnum.Value_8], ["...Will you stay?", 480.7, UnknownEnum.Value_6], ["Oh, Vlad...", 482.3, UnknownEnum.Value_9], ["Yes! Yes I will.", 483.6, UnknownEnum.Value_10], ["(EMBRACE AND LAUGHTER)", 485.9, UnknownEnum.Value_52], ["You know, I think my old mansion was a bit too spacious anyway.", 491.2, UnknownEnum.Value_52], ["With a home this cozy, a family this loving...", 495.5, UnknownEnum.Value_52], ["I think we'll be alright.", 499.2, UnknownEnum.Value_52], ["You do?", 501.2, UnknownEnum.Value_52], ["I do.", 501.9, UnknownEnum.Value_52], ["As a matter of fact, I think we'll do...", 503.3, UnknownEnum.Value_52], ["Fang-tastically!!", 506.5, UnknownEnum.Value_52], ["(FAMILY AND AUDIENCE LAUGHS TOGETHER)", 508.5, UnknownEnum.Value_92], ["(AUDIENCE LAUGHTER TURNS TO APPLAUSE)", 512.2, UnknownEnum.Value_92], ["As the sun sets on another season of Vlad and Clara's escapades,", 516.7, UnknownEnum.Value_19], ["It would seem they've finally found what they really need...", 521.2, UnknownEnum.Value_19], ["Eachother.", 525.5, UnknownEnum.Value_19], ["BUT WAIT!", 527.9, UnknownEnum.Value_19], ["Will the prison that holds Van Helsing truly be enough to contain his hatred of vampirekind?", 528.9, UnknownEnum.Value_17], ["Will the town find out about Vlad's poorly-kept secret, and out him as a bloodsucker for all to see?", 534.8, UnknownEnum.Value_17], ["And WILL Orlok find a way to worm his way back and ruin this happy family once and for all?!", 541.8, UnknownEnum.Value_17], ["Find out... In The Immortal And The Restless...", 549.5, UnknownEnum.Value_17], ["SEASON... THREEEEEEEEEEE~!", 553.6, UnknownEnum.Value_17], ["(APPLAUSE", 567.9, UnknownEnum.Value_17]];
        
        case voc_VladClara_Ad_WackyWartPaste:
            return [["The Immortal And The Restless is brought to you in part by:", 0, UnknownEnum.Value_38], ["Wacky Wart Paste.", 3, UnknownEnum.Value_38], ["Ugh, these warts are sooo LAME!", 5, UnknownEnum.Value_45], ["Isn't there anything we can do about them?", 8, UnknownEnum.Value_45], ["Hey, I know!", 10.7, UnknownEnum.Value_45], ["HEY, WACKY!", 12.7, UnknownEnum.Value_45], ["Waaaack-AAAYYYY!!!", 14.5, UnknownEnum.Value_48], ["Waaaack-AAAYYYY!!!", 15.1, UnknownEnum.Value_49], ["Bummer, dude! You kids are looking mondo warty!", 16.5, UnknownEnum.Value_50], ["Can you help us, Wacky?", 19.5, UnknownEnum.Value_45], ["Sure thing, little man! Just one dab of Wacky's Wart Paste and those warts are donezo!", 21, UnknownEnum.Value_50], ["WHOA!", 26.7, UnknownEnum.Value_46], ["They're gone like magic!", 27.7, UnknownEnum.Value_46], ["*HOCKS LOOGIE*", 29.3, UnknownEnum.Value_50], ["Whatever.", 30.8, UnknownEnum.Value_50], ["Thanks, Wacky!", 31.4, UnknownEnum.Value_46], ["Sh-Shut up, kid.", 32.6, UnknownEnum.Value_50], ["*SILENCE*", 34.1, UnknownEnum.Value_47], ["U-um...", 35.1, UnknownEnum.Value_47], ["Wacky Wart Paste! Part of this complete breakfast!", 35.9, UnknownEnum.Value_50], ["It's Wackytasti--", 39.3, UnknownEnum.Value_46], ["I SAID ZIP IT YOU LITTLE SH-", 40.8, UnknownEnum.Value_51], ["*STATIC*", 42.5, UnknownEnum.Value_18], ["*SILENCE*", 43.5, UnknownEnum.Value_37], ["We now return to The Immortal and the Restless.", 44.4, UnknownEnum.Value_39]];
        
        case voc_VladClara_Ad_FizzTime:
            return [["The Immortal And The Restless is brought to you in part by:", 0, UnknownEnum.Value_38], ["Fiztime Pop Soda.", 3.2, UnknownEnum.Value_38], ["Heya, kids! It's me, Mr. Fiztime!", 7.4, UnknownEnum.Value_44], ["Don't you wanna take a fizzy drink of my poppy... fizz... pop soda?!", 10.2, UnknownEnum.Value_44], ["Don't you wanna have some of my poppy fizz fi--fizzy, fuzzy... poppy... big pop?!", 14, UnknownEnum.Value_44], ["C'mon! Take a sip of my...", 18.3, UnknownEnum.Value_44], ["...Fuzzy, fizzy poppy!!", 20, UnknownEnum.Value_44], ["C'mon!!", 21.6, UnknownEnum.Value_44], ["Please?!", 22.6, UnknownEnum.Value_44], ["Just once!!", 23.4, UnknownEnum.Value_44], ["It's all I have!", 24.4, UnknownEnum.Value_44], ["C'mon!", 25.6, UnknownEnum.Value_44], ["(SOBBING)\n(Fiztime's in there, he's recording!)", 26.2, UnknownEnum.Value_44], ["It's my... ", 27.8, UnknownEnum.Value_44], ["It's my...\n(What?)", 28.4, UnknownEnum.Value_44], ["Fuzzy, fizzy, poppy, fizz...", 28.9, UnknownEnum.Value_44], ["Fuzzy, fizzy, poppy, fizz...\n(Alright-)", 30.9, UnknownEnum.Value_44], ["Poppy... fizz-\n(Hey, Fizztime.)", 31.3, UnknownEnum.Value_44], ["Wh- LET GO OF ME!!\n(Hey, no. C'mon.)", 32.5, UnknownEnum.Value_44], ["I'M STILL RECORDING!!\n(No. Hey- We're going!)", 34.1, UnknownEnum.Value_44], ["LET GO OF ME!!!\n(WE'RE GOING!)", 35.4, UnknownEnum.Value_44], ["I'M STILL DOING IT!\n(WE'RE GOING!!!)", 36.9, UnknownEnum.Value_44], ["(...Just, turn this off...)", 37.8, UnknownEnum.Value_44], ["We now return to The Immortal And The Restless.", 39.2, UnknownEnum.Value_39]];
        
        case voc_VladClara_Ad_LallysLollies:
            return [["The Immortal And The Restless is brought to you in part by:", 0, UnknownEnum.Value_38], ["Lally's Lollies.", 3.1, UnknownEnum.Value_38], ["Lollipop, lollipop, oh, lolli lolli lolli-", 4.9, UnknownEnum.Value_42], ["Lollipop, lollipop, oh, lolli lolli lolli-\n(Lollipop, lollipop, oh, lolli lolli lolli-)", 8.3, UnknownEnum.Value_42], ["Lollipop, lollipop, oh, lolli lolli lolli-\n(Lollipop, lollipop, oh, lolli lolli lolli-)\n(Lollipop, lollipop, OHHHH, lolli lolli lolli-)", 11.6, UnknownEnum.Value_42], ["Lollipop!\n(Lollipop!)\n(Lollipop!)", 14.8, UnknownEnum.Value_42], ["(GUNSHOT)", 16.1, UnknownEnum.Value_43], ["(WAIL OF PAIN)", 16.4, UnknownEnum.Value_43], ["(SCREAMS)", 16.7, UnknownEnum.Value_43], ["OH MY GOD! OH MY GOD!", 17.6, UnknownEnum.Value_43], ["(CONTINUED SCREAMING)", 18, UnknownEnum.Value_43], [" ", 22, UnknownEnum.Value_43], ["We now return to The Immortal And The Restless.", 23.5, UnknownEnum.Value_39]];
        
        case voc_VladClara_Ad_MartysPlungers:
            return [["The Immortal And The Restless is brought to you in part by:", 0, UnknownEnum.Value_38], ["Marty's Plungers.", 3.1, UnknownEnum.Value_38], ["Hey, it's-a me, Marty, with-a Marty's Plungers!", 5.7, UnknownEnum.Value_41], ["If your toilet is all-a filled up with-a the poopoo,", 9.3, UnknownEnum.Value_41], ["Eh, just use a little Marty's Plunger and get out the poopoo!", 12.2, UnknownEnum.Value_41], ["Or- don't get it out, just push it down like- it- it go-", 16.3, UnknownEnum.Value_41], ["Use a Marty Plunger, it fix it up real good.", 19.7, UnknownEnum.Value_41], ["Thank you for using the Marty's Plunger!", 22.9, UnknownEnum.Value_41], ["Hoho!", 26, UnknownEnum.Value_41], ["We now return to The Immortal And The Restless.", 29.1, UnknownEnum.Value_39]];
        
        case voc_VladClara_Ad_GlossyFloss:
            return [["The Immortal And The Restless is brought to you in part by:", 0, UnknownEnum.Value_38], ["Flo's Glossy Floss.", 3.1, UnknownEnum.Value_38], ["Hey, you!", 5.7, UnknownEnum.Value_40], ["Is your mouth filled up with garbage?", 6.9, UnknownEnum.Value_40], ["Do you wanna get out the garbage that's all stuck between your teeth and stuff?", 9.8, UnknownEnum.Value_40], ["You got a buncha crap in your mouth?", 13.8, UnknownEnum.Value_40], [" They call you Crap Mouth or somethin'?", 16.1, UnknownEnum.Value_40], ["All walkin' around with all that halitosis...", 18.2, UnknownEnum.Value_40], ["Crazy-ass breath...", 20.6, UnknownEnum.Value_40], ["Smellin' like a dumpster fire?", 22.3, UnknownEnum.Value_40], ["Well use our friggin' dental floss! And get it out!", 24.6, UnknownEnum.Value_40], ["Matter of fact, use ANY dental floss!", 27.8, UnknownEnum.Value_40], ["You got a problem, pal!", 29.9, UnknownEnum.Value_40], ["You gotta clean that mouth up, man!", 31.4, UnknownEnum.Value_40], ["That's disgustin'! You can't be walkin' around like that!", 33.4, UnknownEnum.Value_40], ["Yeah, I'm talkin' to you!", 36.3, UnknownEnum.Value_40], ["Wash yourself!", 37.8, UnknownEnum.Value_40], ["CLEAN!", 39.6, UnknownEnum.Value_40], ["We now return to The Immortal And The Restless.", 44, UnknownEnum.Value_39]];
        
        case voc_VladClara_Selection:
            return [["I'm the Immortal!", "And I'm the restless..."], [0, 1.2]];
            break;
        
        case voc_VladClara_Deathcoin:
            return [["AUGH!! I think I'm out for the count!", "Oh Vlad, that was terrible.", "I know..."], [0, 2.9, 4.5]];
            break;
        
        case voc_PhoneCall_Monokuma:
            return [["Helloooo there!", "I thought you might be interested in this WONDERFUL opportunity...", "You see, I'm looking for applicants who excel at really specific talents!", "And you, my friend, are truly the ULTIMATE NIGHTGUARD if there ever was one!", "So, call me right back if you're ITCHIN' for a THRILL!", "I mean... an education!"], [0.7, 2.6, 7.7, 14.2, 20.9, 25.4]];
            break;
        
        case voc_PhoneCall_FredsweeperFrank:
            return [["(INHALE)", "Oh my god.", "Holy CRAP, man.", "This is so freakin' RADICAL man!!", "Dude this is RIGHTEOUS this is totally fhh- freakin righteous man...", "There's so many new games!", "I mean- (INHALE)", "(EXPASPERATED EXHALE)", "I thought I had it BIG with Golden Fredsweeper man!", "We got...", "Trash Stacker, we've got Doofpix-", "Man we've got so many new EXPERIENCES waiting in these cabinets!", "You gotta hop on right away man, I'm tellin' ya.", "Auuuuhhh...", "So much retro GOODNESS!", "Hop on right now dude, you don't wanna miss these minigames!"], [0, 0.5, 2.1, 4.5, 7.5, 11.6, 13.2, 14.3, 15.8, 18.8, 19.9, 22, 26.7, 29.9, 31.2, 34.4]];
            break;
        
        case voc_PhoneCall_Frickbears1PhoneGuy:
            return [["Hello?", "Hello helllooo!", "Am I speaking with the current security guard on hand?", "I know it's probably WEIRD to be getting an unknown caller this late...", "...But, I wouldn't worry about it too much.", "Infact, I actually used to work here!", "That being said, I don't recognize most of the characters you have...", "Mmhmmheh, even the ones I DO know seem to have uh...Changed a little!", "Actually a...LOT has changed.", "Huh.", "(NERVOUS LAUGH)", "Uhh, I probably sound crazy reminiscing about the place where they KILLED people, but...", "You're probably not too far off, considering you're uhh...", "Talking to a dead guy on the phone!", "Oh and the uh, animatronics are going to try and kill you! But...", "Ehhhh!", "But I'll leave you be now!", "So, good luck and don't keel over!"], [0, 1.4, 3.1, 6.2, 9.5, 12.6, 15.1, 19.5, 24.9, 28.2, 29.1, 30.4, 35.8, 38.8, 40.9, 44.4, 45.4, 47.2]];
            break;
        
        case voc_PhoneCall_Kritter:
            return [[" ", "AUGH!"], [0, 1.7]];
            break;
        
        case voc_PhoneCall_CountCannoli:
            return [["Hello?", "Hello, hello?", "Is this even the right bloody numb-", "IT IS! I KNEW IT WAS!", "I can't even be bothered to pretend to wish you a 'Buongiorno!'", "I'm that fumin'!", "RIGHT, MR. 'BOSS MAN'...", "Or WHOEVER is on the end of this line.", "I'm wanting my 20 dollars from that BIG-NOSED buffoon!", "I've been waiting years for him to pay me back! YEARS!", "And now I learn he's gone and bought out this pathetic little pizza place n eating steak dinners every other night!?", "What, I suppose that's where my money went towards, IS IT?", "I don't know what kind of Master Of Disguise he thinks he is,", "Skipping town, changing names, playing restuarant tycoon!", "BUT I WANT MY MONEY. AND I'LL GET IT FROM YOU.", "YA GREEDY,", "GRODY,", "MICRO-MANAGIN',", " PIZZA-SLINGIN',", "PENNYPINCHIN'", "PRRRI-!"], [0, 1, 2.3, 3.5, 5.2, 8.4, 9.5, 10.7, 12.6, 16.2, 19.1, 24.7, 27.6, 30.4, 33.7, 36.4, 37.4, 38, 39.2, 40.2, 41.4]];
            break;
        
        case voc_PhoneCall_WithLyrics:
            return [["", "You hear this tune playing over the speaker right now?", "I always thought it had this sort of...musical quality to it.", "Hey...That gives me an idea!", "What If Frickbear's 3 Had Lyrics?", "Watch for that bear", "Stalk in that chair", "They're everywhere", "They're everywhere\n(Its not so hard, for this nightguard)", "Eager to scare", "Eager to scare\n(Behind these bars, I'll play my part)", "Tonight, just a night among many yet", "And dawn, just another day I'll forget.", "Switch on your fan", "Flip from your cams", "Ghouls versus man", "Ghouls versus man\n(Is this not all I'm meant to be?)", "Think with your hands", "Think with your hands\n(Is there not more for me to see?)", "The night", "It calls to me", "It says", "'Please die for me.'", "The work", "The work\n(The work)", "Insanity\n(The work)", "Insanity", "(Insanity!)", "I'm just", "(I'm just)", "Security~", "Security~\n(I wish you luck with night 3!)"], [0, 1, 4.7, 10, 12.8, 15.3, 21.2, 27.3, 28, 33.5, 34.3, 41.1, 46.4, 51.1, 57.3, 63.3, 64, 69.3, 70.4, 76.1, 79, 82, 85, 88, 89.5, 90.9, 91.2, 93.5, 93.9, 95.6, 97, 100.1]];
            break;
        
        case voc_PhoneCall_HotChickHeaven:
            return [["Freddy Frickbear.", "One of the greatest and most attractive characters ever thought up.", "He can instantly teleport upon laughing,", "take out nightguards in a flash,", "N' best of all,", "He's brown colored and knows how to handle the females.", "Speaking of females,", "The Frickbear's universe might also be classified as \"Hot Chick Heaven\"", "Because there's such a mess of very beautiful and tough women that it will make you love the franchise even more!", "and since Valentine's Day is around the corner, I've been inspired to make a top 10 list of the most beautiful female Frickbear's characters.", "Grab yourself a slice and a glass of orange juice,", "and try not to reach through the screen because here we go!"], [0, 1.1, 4.5, 6.7, 8.6, 9.4, 12.6, 13.8, 18.1, 24.3, 31.9, 34.1]];
            break;
        
        case voc_PhoneCall_Freddy:
            return [["Whu-?", "Oh, hey! I did it. Well ain't that something.", "Hey there! It's me, your old pal Freddy.", "I was just uh, lookin' at this here phone and thinkin' about uh...", "How I always wanted to try to use it, but uh...", "I didn't think I could on account of I got these big ol' bear fingers. N'...", "The lil keypad on this thing is so small. Uh...", "Just didn't think I could make it work, but! Uh, proved myself wrong, lookit that.", "Anyway uh, I'm just leaving this message to let you know that, uh...", "I'm bored, so me 'n all my friends are coming to kill you.", "Alright, bye now.", "", "", ""], [0, 0.5, 3.9, 6.6, 11, 13.6, 18.1, 21, 25.6, 29.9, 33.4]];
            break;
        
        case voc_PhoneCall_Mangle:
            return [["(RHYTHMIC THUDDING)", "Do you hear it through the phone?\n(RHYTHMIC THUDDING)", "(RHYTHMIC THUDDING)", "It's my paddleball!\n(RHYTHMIC THUDDING)", "(RHYTHMIC THUDDING)", "I like playing with it a looot...\n(RHYTHMIC THUDDING)", "(RHYTHMIC THUDDING)", "Okay...\n(RHYTHMIC THUDDING)", "I'll let you get back to dying a horrible death now.\n(RHYTHMIC THUDDING)", "See ya!\n(RHYTHMIC THUDDING)"], [0, 4.3, 5.9, 7.5, 9.1, 11.2, 13.5, 15.4, 16.8, 20.4]];
            break;
        
        case voc_PhoneCall_ToyFreddy:
            return [[" ", "Hey there!", "This is Toy Freddy and I'm calling from the new FrickPhone!", "See? It even has an app to jumpscare all nightguards!", "Watch this!", "(CHA-CHING)", "(DEATHCOIN ACTIVATES) AUUHUHUUU!", "That's the wrong app...", "Haha, FrickPhones are awesome!"], [0, 0.2, 1.1, 4, 6.9, 8.1, 8.8, 10.2, 12.8]];
            break;
        
        case voc_PhoneCall_BB:
            return [["Hi! Hello?", "Yeah, I got your NUMBER!", "D'You wanna tell me what exactly's going on here?", "I don't know if you knew, but most days my feet are bolted to the floor!", "Which means I haven't missed a SINGLE day of work!", "Until NOW!", "So get me back in there!", "I'm really in my element in those vents, y'know?", "Climbin'...Craaawlin'...", "Grabbin'...BATTERIES...", "Well anyway, I'm gonna try and sell a balloon or two while I'm STRANDED out here.", "But in the meantime, if you can get me back, pleaaase do! Heh...", "Alright, BB out!"], [0, 2.6, 5.2, 9.1, 14.4, 17.2, 19.1, 21.3, 25.2, 28.4, 31.9, 37.6, 42.3]];
            break;
        
        case voc_PhoneCall_JerrodSorelli:
            return [["Hi I'm Jerrod Sorelli.", "Did you guys ever make my idea for a shrimp animatronic?", "If you don't like that idea, I've sent you other ideas. Did you use my other ideas?", "Things such as:", "The Purple Device.", "The Mystical Snorkel.", "The Shrimp That Isn't An Animatronic.", "And The Jar Of Pickles That Can Do A Flip.", "Did you use any of those?", "Can you send me a check?", "Also can you send me two pepperondi pizzas? I'm feeling peckish.", "In closing:", "Hi."], [0, 1.9, 5.8, 11.4, 12.7, 14.4, 16.4, 19.3, 22.5, 24.3, 26.1, 31.4, 33.5]];
            break;
        
        case voc_PhoneCall_CardSkimming:
            return [["This is sheriff Muntz with the local police department and I'm just reaching out to you about the, er-", "Excess of card skimming reports and credit card fraud linked to your location.", "Hearin' up to about 30,000 dollars are stolen and spent at one...", "'Microgame Emporium'.", "Now the concern is your lack of cooperation inta this here fiasco. And the folks are getting antsy about the whole thing.", "So I'm gonna need you to return this call to the precinct ASAP."], [0, 4.9, 10, 14.3, 17.8, 24.2]];
            break;
        
        case voc_PhoneCall_Rodney:
            return [["Hey Tony? Uh, yeah it's a business call. From eh, Big Beak Burgers.", "Umm...So, the horse meat that we ordered. The, uh, 'filler' for the beef burgers.", "Uh, it turns out it was ANIMATRONIC horse meat.", "Which...", "Was us- Was a bit of an oversight on our end. Uh, and y'know I know you did your best or whatever.", "But, uh...", "We got kids breaking their teeth on, like nuts and bolts over here.", "And that's uh- That's- That's sub-optimal. That's not exactly what we're looking for here.", "So I'm gonna need you to- Contact our uh, supplier and tellem. Like, we want normal horses.", "Not the animatronic ones. The robot ones are not edible for people.", "...", "Oh my god, is this the wrong number?"], [0, 4.7, 11.2, 14.7, 15.8, 21, 22.4, 26.6, 30.5, 36.6, 40.6, 41.9]];
            break;
        
        case voc_PhoneCall_CharlieCat:
            return [["Heya, pal! It's me, Charlie Cat! Huhuhu!", "...Y'know, from that game Playtime with Percy?", "That's besides the point. I just wanna say I'm sorry I can't be there to lend you a hand!", "I've just been so busy with all this CRAAAZY stuff!", "You see I've been doing all this motion capturing crap. It's for the sequel!", "Which obviously, as you know, I'm the main character of course! Huhuhu!", "Oh yeah!", "And I recently sold my likeness to some merchandising company?", "I think they're gonna be doing plushies of me?", "Which, I mean...Took them long enough, right? Huhuhu.", "Oh and not to mention we're doing a movie-", "(CHARLIE! WHAT THE HELL ARE YOU DOING?!)", "Oh hi Rowan! How are you-", "(IT'S ONE IN THE DAMN MORNING, AND YOU'RE UP HERE RUNNING YOUR MOUTH FOR SOME RANDOM SUCKER ON THE TELEPHONE!)", "(WE SIGNED NDAS FOR GODS SAKE!)", "Well I just thought-", "(YOU LISTEN TO ME.)", "(IF THE PALTRONICS CEO FINDS THIS RECORDING, THEN THEY COULD CONDEMN OUR PLAYHOUSE AND WE'D HAVE TO MOVE OUT OF IT!)", "Okay, I-", "(YOU BETTER DELETE THIS STUFF PRONTO OR IT'S DEEP TROUBLE, Y'HEAR ME?)", "Alright, alright! I'm workin' on it, I'm workin' on it!", "Alright, alright! I'm workin' on it, I'm workin' on it!\n(If I EVER)", "(If I EVER)", "(HEAR YOU DO THIS AGAIN-)"], [0, 5.3, 8.4, 13.4, 17.8, 22.3, 26.9, 27.7, 31.7, 33.7, 36.4, 38.2, 40.3, 41.4, 47.3, 49.6, 51, 52.4, 59.5, 60.4, 63.8, 65.5, 65.8, 67]];
            break;
        
        case voc_PhoneCall_LolzHax:
            return [["(CLEARS THROAT)", "Dear listener...", "Do not turn off your telephone device!", "For I, L.O.L.Z.H.A.X., am the most omnipotent,", "powerful,", "technologically advanced being in the entire universe!", "And you...whoever this is...", "are a FILTHY,", "LOWLY,", "MISBEGOTTEN SPECK!", "So! Please listen closely to the following instructions!", "You will locate that notorious bear.", "You will equip yourself with the Death Coin.", "And you will KILL him!", "Oh yes.", "That Fazbum will be NO MORE!", "And incase I was not ALREADY CLEAR:", "I mean THE Freddy Fazbear.", "NOT Toy Freddy.", "NOT Nightmare Freddy.", "Not...Any of the other deceitful BEARS such as NEDD BEAR and the like.", "Not Firework Freddy...", "NOT SOPPING WET FREDDY!!", "Only the one...", "True...", "Orrrriginal,", "DASTARDLY,", "BASTARDLY", "Freddy Fazbear shall you SLAY!", "And you'll do it JUST for me, won't you?", "Toodleoo...", "(EVIL LAUGHTER)", "(COUGHING)", "(CLEARS THROAT)", "(GROWLS)", "(CONTINUES COUGHING)", "You get the point."], [0, 2.1, 4.6, 7.9, 13.4, 14.6, 18.9, 22.5, 24.5, 25.9, 29.9, 34.8, 39.1, 43.1, 47.2, 48.8, 52.9, 57, 61.7, 63.4, 65.6, 72, 73.6, 76.1, 77.5, 78.6, 79.7, 80.6, 81.6, 85.7, 90.4, 91.9, 97.2, 102.6, 104.7, 105.4, 107.7]];
            break;
        
        case voc_PhoneCall_NightmareBB:
            return [["HEY NIGHTGUARD!", "YOUR FLY IS DOWN!", " (LAUGHTER)", "Or uhh, if you're a girl...", "Your, ummm...", "GIRL...THING IS...DOWN!!!", "(LAUGHTER)", "Also yooou're uhhhmmm...Uhuh...Uh...", "A DUNDERHEAD!!!", "(LAUGHTER)", "Uhh...Umm...", "...", "CRAP!! I FORGOT WHAT I WAS GONNA SAY!!", "UHHHH...", "Can I call ya back?", "Let me call ya back, alright?", "I'll talk to ya later. Bye."], [0, 2.3, 4, 5.3, 7.4, 9.5, 11.7, 14.7, 19.6, 20.8, 24.2, 26.4, 29, 32.4, 34.1, 36.1, 38.8]];
            break;
        
        case voc_PhoneCall_MusicMan:
            return [["(FUNKY BEAT)", "Hey, hey! What's goin' on, party people?", "My name is Music Man!", "AKA M&M", "AKA MMMMMmmmmmm...", "And I just wrote a new track I wanna lay down on y'all.", "Alright, dig this!", "Fred Frickbears Freddy Freddy Frickbears!", "Fred Frickbears Freddy Freddy Frickbears! x2", "Come on in here and spend all yo money!", "Fred Frickbears Freddy Freddy Frickbears!", "Fred Frickbears Freddy Freddy Frickbears! x2", "Come on in here and", "GIMMIE ALL YO MONEY FOOL!!!!!", "(LAUGHTER)", "(FUNKY BEAT)", "Okay bye."], [0, 1.7, 6.1, 8.1, 10.4, 13.1, 17, 19.9, 22.4, 24.5, 29.7, 32.2, 34.3, 36.9, 38.5, 39.7, 42.9]];
            break;
        
        case voc_PhoneCall_PhoneGoon:
            return [["Hey, uh... It- It's Phone Goon again.", "Y-You didn't answer my last few uh...Voicemails.", "But, I was hoping you'd uh...Get in contact with The Boss and tellem about the whole ghost phone situation..", "Tell 'em uh...Y'know, see if you can get 'em to uh...", "Explain how the ghost situation effects the employee contract?", "Cuz uh, I need- I really need this job.", "And uh, y'know, I understand his message about the- bringing a gun to the workplace.", "I uh, I do agree it was really reckless of me.", "But um, Iuuuh...Yeah I-I I mean... ", "I'm sorry for botherin' you. Uhh...", "But uh, if you get in contact with him...Can you tell him to uh, to call me back?", "Th-There's no number you can just, pick up the phone and start talking to it I'll be here.", "I-I I can't really go anywhere else, actually.", "(SIGH)"], [0.3, 3.9, 9.7, 14.8, 18.2, 23.1, 26.8, 32.8, 35.9, 40.7, 43.2, 49.7, 54.7, 59.4]];
            break;
        
        case voc_PhoneCall_NightmareFredbear:
            return [["YOU.", "YOU HAVE NO IDEA HOW HARD IT IS TO USE A PHONE WITH THESE BIG CLAWED FINGERS!", "(GROWLS)", "AND I KNOW YOU HEARD THAT PHONE RINGING.", "YOU HAVE THE GALL TO IGNORE ME?!", "(INHALE)", "(SIGH)", "Y'KNOW WHAT? IT'S FINE.", "Y'KNOW WHY?", "'CAUSE WE'RE GONNA MAKE SURE YOUR NIGHTMARE IS NEVERENDING!", "I HOPE YOU'RE READY.", "AND TO THAT FACELESS BLUE HAIRED FREAK.", "YOU WON'T HAVE TO WORRY ABOUT NIGHTMARES.", "'CAUSE WHERE YOU'RE GOING? YOU WON'T NEED SLEEP.", "AFTER ALL, SWEET DREAMS...", "ARE OVERRATED.", "...", "PICK UP THE DAMN PHONE!!!"], [0, 2.3, 8.6, 10, 12.4, 16.2, 17.4, 18.8, 22.7, 24.6, 29.9, 32.6, 36.7, 40.9, 45.6, 50, 52, 54.9]];
            break;
        
        case voc_PhoneCall_Rougal:
            return [["Hey there my name is Rougal Dunberg and I'm really hungry", 0.3], ["so I wanted to call and order me a pizza", 3.1], ["and I saw your number in the phone book", 5.1], ["and I was thinkin', 'hey, isn't that one of those places", 6.8], ["(INHALE)", 9.1], ["that got all those robots that stand on th' stage and", 9.4], ["sing the little songs to the kiddies' and I was like", 12], ["(INHALE)", 14.1], ["'you know it might be good to get one o' them robots", 14.4], ["so I can have it in my living room for when I get lonely", 16.6], ["I can just turn him on and he sings a little song for me", 19.2], ["(INHALE)", 21.7], ["and I can maybe sing a song with the robot'", 22], ["and I said sure, maybe I should call you up", 23.8], ["(INHALE)", 26], ["and order me a pizza and also one o' them robots", 26.2], ["so if you ever wanna sell that robot you can just", 28.3], ["(INHALE)", 30.4], ["let me know if you wanna sell that robot I'll buy that robot", 30.7], ["and I want a pizza too ok bye.", 33.1]];
        
        case voc_PhoneCall_BossHen:
            return [["Hey, it's me.", "Your boss.", "Again.", "You uhh...", "Wanna hear a chicken fact?", "Yeah you do alright.", "Eh, did you know that chickens use more than 30 distinct vocalizations to communicate?", "Including different alarm calls for ground predators like foxes,", "And even aerial predators like hawks, too!", "What, didn't take me for an animal guy?", "Well, I'll have you know I have myself a pet chicken, so there!", "(CHICKEN CLUCKING)", "Speak of the little lady and she shall appear!", "Here Hen!", "Heeere girly!", "(SQUAWKS)", "Ohh, good girl! You want some seed, Hen?", "Yeah?", "You hungry?", "(CLUCK CLUCK CLUCK)", "Yeah, you are. Letsa go get you some seed!", "(EXCITED CHICKEN)", "Yeah, a-a-alright, I gotta go.", "Smell ya later!"], [0.2, 2.2, 3.7, 5.7, 7, 8.8, 10.1, 15.6, 19.4, 22.5, 24.7, 28.4, 29.2, 32.1, 33, 33.8, 34.4, 37.9, 38.4, 39.2, 39.7, 42.1, 43.3, 45]];
            break;
        
        case voc_PhoneCall_BossDisguise:
            return [["Hey, schmuck! Me again.", "Uh, you seen anything good on TV recently?", "I was binging this new spy show, uh, I forget what it's called...", "I think the main character was called, ehhh...", "Count Crapola or something like that.", "Eh, but the pacing was SO SLOW.", "From the dialogue, to the action, boring boring BORING!!!", "Hell, I could write a spy show better than that!", "I'd call it...Ehh...", "I'd call it the 'Purple Wind'!", "Yeah...Silent but deadly! Hahah!", "He'd put on all sorts of disguises, and ROB EM ALL BLIND!", "Yes...Yes, I can see it all now!", "Imma gonna doodle up a few concepts, and email them to you later.", "Let me know what you think.", "Oh, and fair warning...", "If you don't like 'em,", "You're fired.", "Toodles!"], [0.3, 3, 6.9, 11.4, 13.9, 16.4, 19.7, 24.2, 27.1, 29, 31.4, 34.5, 39.4, 41.9, 45.5, 46.8, 48.5, 49.6, 50.6]];
            break;
        
        case voc_PhoneCall_BossClothes:
            return [["Hey, what's up? It's The Boss here.", "Y'know, the guy paying your wages?", "Y'know, I-I been thinkin'...", "Been thinking about starting a eh, a fashion line!", "Y'know, so people can all look like me, with this fancy tux?", "This fit I'm wearing wasn't cheap, but uh, damned if it ain't an iconic look.", "I'd say it was worth it!", "I used to dress totally different, y'know!", "Me and my roommate had these matching outfits, until... One day he sorta lost his hat,", "And we decided... Screw it! Let's ditch these crummy overalls and get some new threads!", "I went for the more distinguished mobboss sort of look, y'know one that commands attention and respect.", "As far as I know he went for a more, uh...", "Mime...Puppeteer kinda thing.", "Still kept the purple, though.", "Those old outfits were FINE, sure,", "But they remind a bit too much of the clothes a certain childhood friend of mine used to wear.", "Ohhh, I get ticked ok just thinking about him!", "All mr.perfect with his 'neaty groomed mustache!'", "His weedy little WIMP of a brother!", "His...Unyielding kindness..", "His... Willingness to invite everybody go-karting, and...", "...Golfing, and...", "...I wonder how he is, anyway.", "I should call him...", "N-NOT THAT I CARE, OR SOME SAPPY CRAP LIKE THAT!", "EH WHAT ARE YOU LOOKIN' AT?", "I CAN FEEL YOUR JUDGEMENT THROUGH THE PHONE!", "G-G-GET BACK TO WORK!"], [0.3, 2.9, 5.9, 7.6, 11.1, 15.6, 20.5, 22.1, 24.5, 29.8, 35.1, 41.3, 43.9, 47.2, 49, 51.7, 58.2, 61.4, 65.5, 67.7, 70, 74.1, 76.2, 78.1, 79.8, 82.5, 83.8, 85.5]];
            break;
        
        case voc_PhoneCall_BossWL4:
            return [["Hey employee.", "It's me.", "Your boss.", "Again.", "Ughhh okay, I'mma level with you.", "I'm bored.", "Rrrreal bored.", "Y'know this- thisa pizzeria running business is not all it'sa cracked up to be.", "I thought I'd get to kick up my feet and kind of, reap the rewards so-to-speak, but eh...", "I'm... up to my neck in paperwork.", "And lawsuits.", "A metric ton of lawsuits.", " ", "I'm bored!", "I'm so bored!", "I mean, I'm sat here, reading the NEWSPAPER for god's sake!", "A man like me, reduced to reading about some...", "...Ancient pyramid...", "...In the middle of nowhere...", "...That could, eh...", "...Possibly contain...", "Mountains...And mountains of...", "...RICHES...", "...MONEY...", "...TREASURE BEYOND YOUR...WILDEST DREAMS?", "O-OKAY, UMMM...", "H-HOLD THAT THOUGHT EMPLOYEE, I'LL BE RIGHT BACK, OKAY?", "UH, YOU- YOU HOLD ONTO THE COMPANY WHILE I'M GONE!", "HEH, HEH IMMA GONNA BE RICH! RICH!!!\n(CAR STARTING)", "YIPPIEEEEE!!!\n(CAR STARTING)"], [0.5, 2.5, 3.8, 5.5, 8.2, 10.3, 11.8, 13.9, 19.3, 25.5, 28.2, 29.8, 32.4, 33.6, 34.9, 36.5, 40.7, 44.2, 46, 47.9, 49.3, 51.4, 54.1, 55.4, 56.2, 58.3, 59.1, 62.5, 64.9, 67.5]];
            break;
        
        case voc_PhoneCall_BossSalvaging:
            return [["Hey hey! It's your boss speaking.", "You know I decided to have a roam around one of these old abandoned locations that...", "Y'know, you're tasked with wandering around, and eh...", "(STAMMERS)", "You really have to put up with this?", "I mean it's all...Dark, and ehh, creepy.", "Not that I'm scared, or anything! I mean, why would I be scared?", "But eh...Eh, y'know,, it's...It's just eh...", "...What was that?", "Hold on a second, I-I think I just saw that party hat move.", "Okay it- it must have been my imagination.", "As I was saying! You really have to put up with this? I mean...", "It's filthy in here!", "And you wade through this junk...", "Y'know, I think I might be taking your employment for granted.", "I think maybe a raise is in ord-", " ", "Okay no that uh, that party hat definitely just moved.", "I-I-I'mma call you back!"], [0.2, 3, 7.3, 10.8, 11.9, 13.8, 16.9, 19.8, 23.2, 25.5, 30.1, 32.4, 36.9, 38.6, 40.2, 43.7, 45.8, 46.7, 49.5]];
            break;
        
        case voc_PhoneCall_BossPizza:
            return [["Yo, Jerry!", "Yeah, you already know who it is, it's big W money.", "I'm callin' about the usual.", "Y'know, garlic powder pizza, extra garlic.", "Me go for a, big box of those lemon pepper wings too, y'know the ones I love.", "Ehh...What else...", "Imma have a large bev', have like a...", "A croaka cola!", "...What else? Um...", "Oh, I could go for a biscuit, too!", "Alright, what gives? Jerry would've responded by now!", "Who am I speaking to?", "...oh e-employee!", "Heheh, I was just, eh...Conducting...Important, eh...Business!", "...Say, you don't happen to want to make a pizza, do you?", "Maybe some wings on the side?", "No okay I thought not.", "GET BACK TO WORK!"], [0.3, 1.5, 4.5, 6, 9.5, 13.7, 15.1, 18.4, 20.7, 21.9, 24.4, 27.6, 29.9, 31.4, 38.9, 43.1, 45.3, 46.5]];
            break;
        
        case voc_PhoneCall_BossPFF:
            return [["Hey chump, you already know who it is.", "Uhh, I can't talk for long 'cause I'm in the car right now, uhh...", "I'm just heading back to one of those old locations that you used to uh, salvage!", "Because, er...", "There's that uh, that little...Freaky Fredbear plush, right?", "I forget what he's called...", "Putrid Freak Fredbear, something along those lines.", "But eh, y'know.", "I THOUGHT at first, y'know, it creeps me out.", "Is a, weird, and it looks at me funny.", "But then!", "I remember there're some rrreal nuts out there, who collect everything to do with the Frickbear's franchise!", "Every little piece of memorabilia!", "Sooo I thought to myself:", "'Hey! Why not snaffle him up, and sell him to the HIGHEST bidder!", "(LAUGHTER)", "Okay, I'm just-a heading into the joint now.", "Ehhh let me see if I can find-", " ", "Aaand he's gone.", " ", "Great.", "I didn't know the thing could move.", "Alright I-I-I'll call you back."], [0.2, 2, 5.4, 9.2, 10, 13.1, 14.9, 17.9, 20, 22.8, 25.1, 26.1, 32.8, 35.4, 36.5, 40.9, 42.1, 45.1, 46.9, 47.6, 48.5, 49.6, 50.8, 54.4]];
            break;
        
        case voc_PhoneCall_WitheredBonnie:
            return [["Este es un mensaje para el guardia nocturno.", "Guardia, valí nada.", "Te creí choro idiota pero te la pasaí comiendo pizza, como idiota.", "¡Guardia admitelo erí un idiota weno pal POLLO!", "¡GUARDIA FRIKEADO WENO PAL POLLO!", "Gringo tenía que ser el guardia del 8.", "Y pobre de vos que te veo volviéndote ser el choro idiota porque te voy a sacar la cara no ma.", "¡Te voy a sacar la cresta idiota!", "Espero que mi mensaje te haya quedado claro guardia FRIKEADO,", "Que no pienso repetir ni una cosa.", "Aquí nomás estamos los muertos.", "Bueno compás eso fue el final de mi anuncio.", "Pero también quiero agregar que voy a estar en la cocina este viernes.", "Cocina Bonnie, no falten.", "Porque si no van a ser unos idiotas weno pal POLLO, como el guardia.", "Vengan a comer completo-", "Digan no a las pizzas, si a los completos.", "¡Empanadas wey, empanadas!", "¡Ensalada de tomate!", "¡Empanadas de QUESO,", "DE PINO,", "DE POLLO!", "¡DE CUALQUIER COSA!", "¡TERREMOTO! ¡CHURRASCO! ¡CHAPARRITA!", "¡Brocheta de carne! ¡Brocheta de carne de guardia!", "¡QUE NO SEA UNA PIZZA HIJO DE TU MADRE!", "¡SI VEO ALGÚN IDIOTA,", "SI VEO ALGÚN IMBÉCIL COMIENDO PIZZA ESTE VIERNES,", "LE VOY A SACAR LA-!"], [0.1, 3.1, 5, 10.1, 13.4, 16, 18.2, 23.2, 25.1, 28.1, 30.2, 32.3, 35, 38.3, 40.1, 43.2, 44.2, 46.3, 48, 49.1, 50.3, 50.9, 51.7, 52.6, 55.1, 57.8, 60.2, 61.2, 63.1]];
            break;
        
        case voc_PhoneCallTutorial:
            return [["Oho!", "Look whosa back!", "This is your boss speaking, by the way.", "Allllright schmuck, listen up and listen good!", "So here's the deal: you worked real good for me last week, right?", "Hauled in all those metal freaks to liven up this joint?", "Well, I come into work this morning, and find a bunch of them MISSING!", "GONE! INTO THIN AIR!", "And all the ones left are completely mixed up!", "So naturally, I start tearing my stache out, right?", "I'm thinkin', 'that pesky taxman! He swooped by in the night and stole all my hard work!'", "But then, it hits me!", "A new business idea to rule them all!", "The Boss' big blowout! EVERYTHING MUST-A GO!", "(BURPS)", "Excuse me.", "Your job is to scurry around those same old locations after your shift and pick up MORE freaks for the restuarant!", "No matter how worn down, or dangerous lookin',", "And no matter how much they disrupt the space time continuum,", "Just grab whatever you're able!", "There may be a raise in it for you if you do!", "But, eh, no promises!", "WAHAHEHEHEH!", "Oh, also...", "Unrelated, but it looks like our phonelines got scrambled up, too.", "Random jerks have been prank calling the place all night!", "I better not catch you talking to any of them on the clock, or you're FIRED!", "Alright, that should be everything.", "Now, GO MAKE ME-A RRRICH!", "Heheheheheh...", "Later."], [0.2, 1.3, 3.1, 5.2, 9, 13.5, 17.1, 21.4, 22.6, 26.4, 29.4, 34.9, 37.3, 40.7, 44.8, 45.4, 46.2, 53, 56.1, 59.7, 62, 64.1, 66.5, 68.6, 69.7, 73.9, 77.5, 82.7, 84.4, 86.6, 88]];
            break;
        
        case voc_PhoneCall_BossPoopgoes:
            return [["Hey, schmuck, it's me.", "So I've just got off the plane, I just got back from a trip to, uh, Britain!", "You might be asking 'Hey, boss, what were you doing in the UK?'", "Eh, I was just checking out this ehm...This...", "Poopgoes Pizza, I think that's what it was called.", "And ehm,", "I was worried, y'know, about the competition, so to speak.", "I was worried I'm gonna have to...", "Uh, tread another business owner into the ground!", "'Cuz there can only be one.", "But eh...", "I don't think we have much competiton, to be honest!", "I mean, the eh...", "Animatronics look like uh, they were all stretched out and ugly!", "n' they all have these nasty little nasally British accents!", "'Oi whatsa goin' on, mate?'", "Y'know, it...", "Sucks!", "That, and, their arcade games...", "Well, heh, I don't wanna brag, but...", "They were PRIMITIVE!", "And, if you look at your games tab on your little camera device...", "ALL of those microgames!", "Heh, well, let's just say the king of microgame innovation...", "Right here baby, you're talking to him!", "In summary, ehh...", "Down with the british, and we got nothing to worry about.", "Eh, seeya later!"], [0.2, 1.6, 5.8, 9.4, 12.4, 15.2, 16.9, 20.7, 22, 24.8, 26.8, 27.5, 30.1, 31.6, 35.2, 38.4, 40.2, 41.5, 42.3, 44.3, 46.4, 48.2, 51.8, 53.4, 56.5, 58.4, 60.2, 63.1]];
            break;
        
        case voc_PhoneCall_BossPresident:
            return [["Hey.", "It's your boss.", "Sooo...Ehh...", "What do you think of, ehh...", "...The current president?", "I know he's-a controversial, but, eh...", "Honestly, I- I think I get why he shot a nuke at the moon.", "Okay, j- just hear me out for a second!", "Clearly I can explain-"], [0.3, 1.2, 3.2, 5.5, 7.9, 9.9, 12.5, 16.4, 18.2]];
            break;
        
        case voc_PhoneCall_PhonyBoss:
            return [["Hey, chump!", "It'sa me!", "(GLITCHING)", "Your boss.", "Eh...Don't mind the eh, heh. The voice.", "I've uh, I've got a little bit of a...", "A cold! That's right, I'm feeling under the weather.", "You know, eh, you've been doing such a good job that, uh, I think, uh...", "You deserve some, uh, paid time off!", "That's right, take a little vacation!", "Don't worry, I'll have someone cover you and I'll pay them just as well.", "Yes...I think I'm going to give all my employees raises, infact!", "They've all been doing such good, good work for me!", "Uh...", "Uh...\n(HEY!)", "Eh?", "(WHO THE HECK ARE YOU?!)", "YOU...", "(YOU GET AWAY FROM MY PHONE, YOU LOUSY IMPOSTER!)", "Heheh, hold that thought employee!\n(YELLING)", "I'll be right baaack~!\n(YELLING)"], [0.5, 2.5, 3.4, 4.1, 6.2, 10, 12.2, 16.7, 23.1, 26.6, 29.7, 34.9, 38.9, 43.4, 43.9, 44.3, 44.7, 45.9, 47.2, 49.5, 51.2]];
            break;
        
        case voc_PhoneCall_Orville:
            return [["Okay, now it's recording. Let's try this again.", 0.3], ["To my dearest love...", 4.1], ["Your voice and your stories are bliss to my ears...", 6.7], ["On darkest of nights, it's your tones that I hear...", 10.9], ["The shade of your skin, so purple in hue...", 14.9], ["So stunning that nobody else clouds my view.", 18.6], ["Our picnics together, our time in the park", 22.5], ["Our talks keep me laughing until after dark.", 26], ["Why I'd be overjoyed if you would be mine,", 29.4], ["My dear Mr. Hippo...", 33.1], ["...What rhymes with mine?", 35.9], ["WHAT RHYMES WITH MINE?", 37.8], ["ORVILLE YOU BUFFOON, YOU'VE FUMBLED IT AGAIN!", 40.1], ["Oh, darn it all...", 43.7], ["...Wait a moment.", 46.2], ["This isn't a tape recorder.", 47.7], ["THIS IS", 49.9], ["THIS IS A TELEPHONE!", 50.8], ["WHO'S THERE?!", 52.6], ["YOU HEARD NOTHING, YOU HEAR ME?!", 53.6], ["NOTHING!!", 55.5], ["Tell anyone about this and I'll make YOU disappear!", 56.7], ["HARRRUMPH!", 59.7]];
        
        case voc_PhoneCall_Mendo:
            return [["Why, hello there!", "This is Mendo speaking.", "Though, probably not the Mendo that YOU'RE acquainted with.", "Parallel dimensions are a little finnicky like that.", "Uh, what was I saying?", "Oh yeah!", "I'm callingg to inquire if you've had any, uh, portals pop up around you!", "Y'know, these blue, glitchy looking things, you can see another world on the other side-", "You can't really miss 'em!", " ", "No?", "Alright then.", "Okay, uh... If you see any, don't hesitate to call back and let us know!", "Me and my little buddy over here are kind of uh, experts in that field! I don't wanna brag...", "Uhh, I'm rambling, sorry. I'll leave you to it!", "Uh, good look with...Whatever you're doing!", "And uh, catch ya on the flipside!"], [0.2, 1.3, 3.1, 6.1, 9.1, 10.8, 11.5, 16.5, 20.4, 21.5, 22.5, 23.6, 24.5, 28.2, 32.8, 35.5, 37.9]];
            break;
        
        case voc_PhoneCall_MrHugs:
            return [["HEY ITS ME MR. HUGS THE BEST CHARACTER IN THE VIDEO GAME!", "I'M JUST CALLING YOU UP ON YOUR PERSONAL TELEPHONE", "TO TELL YOou-", "(COUGHS)", "HOLD ON-", "(COUGHING FIT)", "HOLD ON- HO-", "(COUGHING FIT CONTINUES)", "HOLD ON.", "(WHEEZE)", "GIVE ME A MOMENT.", "(COUGHING FIT CONTINUES)", "(CLEARS THROAT)", "OKAY AM I GOOD?", "AM I GOOD NOW?", "ALRIGHT.", "AS I WAS SAYING,", "I-I FORGOT.", "OKAY I-I'LL CALL YOU BACK LATER.", "PEACE AND LOVE."], [0.2, 5.6, 9.6, 10.3, 11.2, 11.7, 14.5, 15.6, 17.7, 18.4, 18.9, 20.2, 25.2, 26.3, 27.8, 29.9, 30.8, 33.4, 34.7, 37.5]];
            break;
        
        case voc_PhoneCall_Mario:
            return [["Hello?", "Yoohooo?", "Okie-dokie! Imma think imma comin' through!", "Ahem!", "Hello there, little nightguard!", "Imma justa calling to let you know that you are doin a super duper job!", "Imma hope you have a wonderful night,", "And the people inna you life love and appreciate you very much!", "Keep it up, okay?", "Imma proud of you!", "Okie-dokie! Good luck on your-", "(WAH!)", "(OVERALLS!!)", "(WHO LET YOU IN HERE?!)", "Uh oh!", "I gotta go!", "Bye bye!", "(GET OVER HERE, YOU LITTLE STINKER!)", "Eehyah!!", "(-TEACH YOU NOT TO STEAL MY PHONE!)"], [0.1, 1.4, 3.2, 5.8, 6.9, 8.6, 13.2, 15.1, 19.1, 20.6, 22.4, 24.1, 24.6, 25.5, 26.5, 27, 28, 28.6, 30.1, 30.7]];
            break;
        
        case voc_PhoneCall_Edwin:
            return [["Why hello there!", 0.3], ["Uh, I'm Edwin Murray, from Murray Costume Manor...", 1.5], ["IIII believe this is the hotline to pitch inventions, if I recall correctly?", 4.9], ["Umm...", 9.9], ["Do I just...start?", 10.9], ["O-Okay here goes...", 12.5], ["My Singing Mycellium Men!", 14], ["It's a little program for your home computer.", 16], ["When you open it up, you'll see three little mushroom mascots.", 18.9], ["Uh, carefully designed by my loving wife Fiona-", 22.4], ["Uh, anyway...", 24.9], ["There are these symbols, right?", 26.2], ["And you can drag them onto the little mushroom characters and they each sing a little tune!", 27.7], ["You can make them sing either a- a melody, or a- a bassline or, uh, make them do percussion!", 32.6], ["It's, uh...It's a fun little time passer, really!", 38.3], ["It's, uh...It's a fun little time passer, really!\n(Um, sorry-)", 41], ["(Mr. Murray I believe that's already a thing!)", 41.8], ["Wh-What do you mean? This has already been done?", 44], ["(Aye, it's a wee app on your telephone!)", 46.1], ["(And n'- n'- n')", 47.7], ["By who?", 48.1], ["(Um...)", 49], ["Who stole the idea?! Who?", 49.3], ["(I don't really know.)", 50.5], ["Oh darn it ALL, MURRAY!", 51.3], ["CAN'T YOU COME UP WITH A SINGLE ORIGINAL IDEA IN YOUR LIFE?!", 52.5], ["(Oh!)", 55.2], ["OH, I CAN'T-", 55.5], ["(SOBBING)", 56.3], ["(SOBBING)\n(Oh dear.)", 57.2], ["(SOBBING)", 57.9], ["I CAN'T DO ANYTHING RIGHT...I CAN'T...", 58.5], ["(SOBBING)\n(Uh, just, uh...)", 60.7], ["(SOBBING)", 62], ["(SOBBING)\n(Give ya yer space.)", 62.7], ["What to do...with myself...", 63.5], ["A-Am I still over the phone?", 65.5], ["Okay I'll call you all back eventually with something better!", 67.6], ["Something original, something- something groundbreaking, I swear!", 69.9], ["I-I just need a little more time!", 72.4], ["Please, you just- you just have to give me a little more-", 73.9]];
        
        case voc_PhoneCall_Boozoo:
            return [["Ahoyhoy!", "It's your charming uncle Boozoo!", "I just wanted to call in quickly to ask:", "...Have you seen my boss?", "...Bon?", "He was pacing back and forth a while back, wishing...", "...Death on those who opposed him, and...", "...Well...", "He doesn't do well with friendly competition.", "Last guy who opened a restuarant like ours...", "Bon had his brakes cut.", "Then he shot him five times in the head.", "Just imagine what it's like WORKING with him.", "I just want to make sure you're staying safe out there, but,", "If you won't pick up, um...", "I may try the next guy down on the list.", "Okay!", "Good luck!"], [0.1, 1.1, 3.7, 6.6, 8.5, 9.5, 12.7, 15.3, 16.6, 19.5, 21.9, 24.4, 26.8, 29.8, 32.6, 34.4, 36.8, 37.9]];
            break;
        
        case voc_PhoneCall_Animdude:
            return [["Uh, hello?", "Uhh, hello??", "Hello hello?", "Yeah, it's me. Umm...", "I was just returning your call to- Uh, uh-", "Regarding your application to join the uh,", "Uh, Fazbear Fanverse- Uh- Initiative.", "And, uh, the answer is no.", "Uh, I think you- you knew all along the answer would be no.", "Maybe you were...Calling me as a joke...", "But, um...", "Yeah, there's simply not room in the Fazbear Fanverse for such a corpulent Freddy. ", "Ummm...", "He's just- He's just too- too big.", "Ummmm, but!", "I also feel I- I must let you know, that um...", "Uh, I am taking, uh, Rodney Redbird,", "Uhhhh, for myself.", "So I'm just uh, I'm gonna take him.", "(What? What's this?)", "Uhhh, just- just for me to have.)", "(The- HEY!)", "Okay, well, that's all!\n(Hey, don't touch the merchandise!)", "(Do-HEY!)", "(STRAINING)\n(WOAH! HEY!)", "Okay!", "(PUT ME DOWN YOU BLOCKY BASTARD!)", "Alright, bye now."], [0.1, 1.2, 2.8, 4.4, 6.6, 10, 12.8, 16.2, 18.4, 21.2, 23.7, 25, 30.6, 32, 34.9, 36.5, 39.2, 43.4, 45.9, 49.1, 49.9, 52.4, 52.9, 54.4, 55.2, 56.2, 56.6, 58.1]];
            break;
        
        case voc_PhoneCall_BigTop:
            return [["Oh, jolly good, I've got the telephone working!", "Listen here, young pup!", "I simply wanted to sing to you a song from my youth!", "Back when I was just a young servo motor!", "Listen to this!", "WEEEELLLLLL", "I like to push a hoop with a stick!", "La la la-", "I've forgotten the words.", "Oh well!", "Bye!"], [0.1, 3.7, 5.3, 9.5, 13, 14.7, 15.6, 18, 18.8, 20, 20.6]];
            break;
        
        case voc_PhoneCall_ToyChica:
            return [["Giiiiiirrrrllll.", 0], ["You are, like, NAWT, going to BE-LIEVE what happened the other day.", 2.6], ["So like, me and my friends were in the main room, yeah?", 7.5], ["I had the idea of having a cute little fitness day for then where we, like, spend time doing some exercises and stuff.", 10.8], ["I had all the party tables moved away so like, my friends can have room to move around, and I was like, on the main stage so everyone can see me.", 17.3], ["Anyway, we were doing some basic stretches, as warm up, obviously.", 26.1], ["And like, not even a minute in,", 30.4], ["Toy Freddy starts complaining about how 'he could be gaming' or whatever.", 32.5], ["Except, all he does is stand around and play those arcade games all day!", 37.7], ["Like, so what if he misses one whole day of gaming!?", 43.1], ["But then, ev-ery-one ELSE started complaining about what they could be doing!", 47], ["'I could be playing hide-and-seek!'", 52], ["'Well I could be meeting my fans right now!'", 54.2], ["I like, tried getting their attention but they literally could NOT hear me.", 57.4], ["Thankfully, they taught us fitness instructors how to like, deal with this stuff.", 62.3], ["So like, I got down from the stage, got close enough to my friends, and then I went like", 67.1], ["Didididididimimimi!", 72.4], ["...", 75], ["You should've SEEN their faces!", 76.8], ["Like, they got SO quiet SO fast!", 80], ["But yeah, the next time I plan a fun fitness day, I should like, think about how to make it unique to everyone.", 84.5], ["There are definitely other ways I can teach my friends this stuff, yeah.", 91], ["Maybe like, a game of tag could do the trick...", 95.3], ["OK girl, I'm getting like a BUNCH new ideas so I'll call you back.", 100.3], ["Byyyyyeeeee!", 102.8]];
        
        case voc_PhoneCall_PhoneGal:
            return [["Hey hey!", 0], ["Uh, here's hoping I'm coming through all clear!", 1.2], ["Sorry if there's any gargling noises...", 3.5], ["I guess that's what happens when you stop The Big Faz from doing his vocal warm-up.", 5.4], ["Heh. Just- Just- Just bit of a joke but um,", 9.6], ["I'm sure you've got the basics down pat by now...", 12], ["If you need any refreshers though you know who to call!", 14.3], ["It's...not like anyone else is gonna be picking up a haunted phone any time soon.", 17], ["...I hope they don't...", 21.4], ["Um, well there's now a 50/50 chance it gives me a shock every time I make a phone call and it just makes me feel alive again!", 22.9], ["...Th-That's another joke for ya.. ", 29.9], ["Um...", 32.6], ["But great work making it past your first week!", 33.1], ["Keep it up, and you might end up just like me!", 35.4], ["AS-AS IN A POSITION!", 38.2], ["LIKE- Y'know your JOB? Like you'll get promoted!", 39.5], ["Th-That's what I mean.", 41.4], ["The employee trainer's a pretty big deal!", 42.4], ["It's like a right of passage, you're basically the nightguard of nightguards!", 45], ["And you'll actually get half-decent pay!", 48.5], ["Which is MUCH better than quarter decent pay.", 50.5], ["...I...", 53.9], ["...Hold on, I never actually got my check though.", 55], ["...I don't think anyone's...lived long enough to see it, actually.", 57.8], ["B-But I'm sure you'll be different!", 62.5], ["Just keep it up 'n the rest of the night, and you'll be fine!", 65], ["A-Alright, I'll just leave you to it...let me just...", 68.1], ["Oh god, which wire was it aga-", 70.3], ["(BZZZZZTTTT)", 72.4]];
        
        case voc_PhoneCall_YenndoPopgoes:
            return [["(Pop.)", 0], ["(Pop. Pop pop.)", 0.5], ["(Pop. Pop pop. Pop.)", 1.2], ["(Pop. Pop pop. Pop. Pop Pop)", 1.6], ["(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 2.3], ["(Pop.)", 3.8], ["(Pop. Pop pop.)", 4.2], ["(Pop. Pop pop. Pop.)", 4.9], ["(Pop. Pop pop. Pop. Pop Pop)", 5.4], ["(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 6.1], ["Make a Pop with the Goes perpendicular!\n(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 7.7], ["To the name of this pop in the desktop goes\n(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 11.4], ["Exit wound and a pop\n(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 15], ["GOES NATION!!\n(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 17], ["Showing the pop of the goes this was written for-\n(Pop. Pop pop. Pop. Pop Pop goes Popgoes!)", 18.3], ["(Pop.)", 22.1], ["Okay that should be good.", 22.9], ["Thanks Popgoes!", 24.3], ["POPGOES", 25.2]];
        
        case voc_PhoneCall_FrickRoll:
            return [["Agggh!", 0], ["This night music drives me up a WALL!!!", 1.3], ["Where's the soul?!", 4.8], ["Y'know what?", 6.9], ["I'M putting on MY jams!", 8], ["Let's ROCK!", 10.7], ["(MUSICAL INTRO)", 12.1], ["We're no strangers to scares", 31], ["You know the bears and so do I", 35], ["A full five nights' what I'm thinkin' of.", 39.3], ["You wouldn't get this from any other fright", 43.4], ["And if you ask me how I'm playin'", 47.6], ["I'll tell you I'm Four Layers Down", 52.6], ["Never gonna Frick that Bear (x3)", 55.5], ["Never gonna get jumpscared (x3)", 57.6], ["Never recline my chair (x3)", 59.8], ["'Cuz of Freddy! (x3)", 62], ["Never gonna sweep those freds (x3)", 64], ["Never gonna wind up dead (x3)", 66.1], ["Never gonna lose my head (x3)", 68.2], ["I'm ready! (x3)", 70.7], ["We've known each other for five nights", 73.3], ["You've salvaged Withered Freddy, and I'm kind of angry!", 77.5], ["You've salvaged Withered Freddy, and I'm kind of angr- (LAUGHTER)", 81.2], ["iN-side, wE BoTh knOW who's bEen saLvAGin'", 81.8], ["Inside, we both know who's been salvagin'", 84], ["We know the game and it's", 86], ["AIR ADVENTURE", 88.1], ["And if you see a Withered Bonnie", 90], ["Don't show me cause it's too scary!", 95.1], ["Never Gonna Frick that Bear (x3)", 98], ["Never Gonna Vannabelle (x3)", 100.1], ["Never Gonna Fritz & Mike & Vanessa (x3)", 102.3], ["Never Gonna Psychic Friend (x3)", 106.5], ["Never Gonna Psychic Friend (x2)\n(Never Gonna Psy-PyschIC friend!)", 107.4], ["Never Gonna Psychic Foe (x3)", 108.6], ["Never Gonna Spend Five Nights (x3)", 110.8], ["Je-re-my\n(...Jeremy?)\n(Germy!)", 113.2], ["Never Gonna Crap My Pants (x3)", 115], ["Nevermind I Crapped My Pants (x3)", 117.1], ["Never Gonna Funtime Freddy (x3)", 119.2], ["Ennard Too (x3)", 121.6], ["Never Gonna Flash Foxy (x3)", 123.4], ["Never Gonna Frickbears Five (x3)", 125.6], ["Never Gonna Mod Luigi (x3)", 127.7], ["FNAF 2 (x3)", 130.2], ["(Ooooh)", 132.6], ["(This song sucks!)", 134.6], ["(Oo-Oooooh)", 136.2], ["(This song sucks!)", 138.9], ["(Oo-Oooooh)", 140.5], ["Fredsweeper Frank, Fredsweeper Frank\n(Oo-Oooooh)", 141.3], ["(This song sucks!)", 143.1], ["(Ooooh)", 145.3], ["Fredsweeper Frank, Fredsweeper Frank\n(Ooooh)", 145.6], ["Fredsweeper FraH- Fred  Sweeper  fRaNKk-\n(Ooooh)", 146.2], ["(This song sucks!)", 147.4], ["We have been playing Microgames", 149.7], ["You're out of tokens but, you're too shy to say it", 154], ["MICHAEL'S MOM HAS GOT IT GOIN' ON\n", 158.3], ["MICHAEL'S MOM HAS GOT IT GOIN' ON\n(LAUGHTER)", 161.2], ["You know the Puppet and we're gonna find it", 162.5], ["You know the Puppet and  we'regonna find it", 164.4], ["I just wanna Secret of the Mimic", 166.5], ["Gotta show you Jackie's Box", 171.5], ["Never Gonna Frick that Bear (x3)", 174.5], ["Never Gonna Vannabelle (x3)", 176.5], ["Never Gonna Fritz & Mike & Vanessa (x3)", 178.7], ["Never Gonna Sleepy Moon (x3)", 182.9], ["Never Gonna The Mimic (x3)", 185.1], ["Never Gonna The Mimic (x2)\n(THE MIMIC!!!!!)", 186.2], ["Never Gonna Check the Vents (x3)", 187.2], ["Jumpscare You (x3)", 189.6], ["Never gonna Red that Bird (x3)", 191.4], ["Never gonna Buy That Wood (x3)", 193.5], ["Never gonna Play This Good (x3)", 195.7], ["on Controller (x3)", 197.6], ["Never gonna Afton Labs (x3)", 199.9], ["Never gonna Bidybab (x3)", 202], ["Never gonna Hit that dab (x3)", 204.2], ["Never gonna hIT tha-at dab (x3)", 204.8], ["Puppet Patroller (x3)", 206], ["Puppet Patroller (x2)\n(Pu-Pu-Puppetpatroller-!?) ", 206.5], ["Never gonna Aftonblast (x3)", 208.5], ["Never gonna even last (x3)", 210.6], ["Never gonna rhyme with Golden (x3)", 212.7], ["Withered Freddy (x3)", 214.8], ["Never gonna Nightmare Fred (x3)", 216.9], ["Never gonna OMC (x3)", 219], ["Never gonna eat a sandwich (x3)", 221.1], ["Scooby-Doo (x3)", 223.7], ["(What?)", 225.8], ["(Tihs-)", 226.8], ["(Dumb.)", 228.1], ["(Dumb!)", 228.8], ["(This is dumb.)", 229.4], ["(Woah!)", 230.2], ["(The Scooby-Doo ending!)", 231.2], ["(THANK YOU GOOD NIGHT!!!)", 233.6]];
        
        case voc_PhoneCall_Lester:
            return [["HEY, RICK! It's Lester.", 0], ["I dunno why I'm reminding you who it is when I KNOW you've been getting my calls, ", 2.3], ["Because I found your answering machine in the trash!", 6.2], ["But I GET it, you're a BUSY man.", 10.5], ["So I'll keep things nice, short, and simple,", 13.9], ["Just like your time in the marines!", 16.5], ["I got those residuals from Aftonblast and I realized:", 18.8], ["'Hey!'", 21.9], ["'This money thing ain't half bad!'", 22.8], ["So here's what I'm thinkin'.", 25.1], ["AWESOME NIGHTS AT LESTER'S: 2! ", 26.8], ["I know there's only 4 people who played the original,", 29.9], ["But that just means it's niche, BABY!", 33], ["Just ditch this \"BYOBBQ\" thing and come play with the BIG BOYS!", 36.3], ["And IN CASE you're hesitant, don't worry!", 40.5], ["I HAVE LEVERAGE!", 42.8], ["I'm lookin' at 'em right now!", 44.4], [" ", 46.3], ["I love watchin' em squirm in their stupid chair.", 47.5], ["SO! Call me back when you're off the LAM, yeah? ", 51], ["I know that Christian Warband can't chase you forever!", 53.9], ["Toodles~!", 56.8]];
        
        case voc_PhoneCall_VIP:
            return [["Good evening valued employee!", 0], ["Just figured I'd give you a ring to check up on your TPS reports.", 1.8], ["That, of course, stands for 'Token Payout Summary'.", 5.4], ["Or 'Terrifying Pig Slaughter' if you don't meet your quota!", 8.6], ["(GIGGLES)", 11.4], ["Li'l workplace humor for ya.", 12.1], ["In all seriousness though, I trust you read the introductory pamphlet given to you upon employment in full, so you SHOULD have nothing to worry about.", 13.9], ["Of course, if you need anymore information on how to survive, you know who to call.", 21.6], ["It's me!", 25.9], ["It's V.I.P!", 26.7], ["Ask me anything!", 28.2], ["...Actually, maybe don't.", 30.1], ["If you fail to meet your quota while I'm informing you, you'll still have to be terminated as per company policy.", 32.2], ["Thanks for understanding, buddy.", 37.2], ["Now get out there, and make me proud!", 38.9]];
        
        case voc_PhoneCall_Helpy:
            return [["You're so funny with your hat, Looking all grey and proper,", 0], ["I hope that Mangle doesn't get you with his party poppers!", 3.6], ["I'd do a dance so much I'd fall and break my back with you,", 6.7], ["If you want me as your lawyer all I'd ask is don't get sued!", 9.6], ["You are so", 13.1], ["Freddy Freddy Freddy Freddy Faz Faz bear!", 15.5], ["MUAHAHAHAHA.\n(Freddy Freddy Freddy Freddy Faz Faz bear!)", 17.5], ["MUAHAHAHAHA.\n(Freddy Freddy Freddy Freddy Faz Faz bear! x2)", 18.5], ["Get HELPY on your PHONE!\n(Freddy Freddy Freddy Freddy Faz Faz bear! x2)", 19.5], ["All you have to do is send 'FAZ' to 1-9-8-7!\n(If you're feeling unwell-py just install your good friend Helpy!)", 21.3]];
        
        case voc_PhoneCall_Foxy:
            return [["Uh, hello? Hello hello?", 0.4], ["Oh hi.", 4], ["My name be Foxy the Pirate Fox, and welcome to Freddy Frickbear's Pizza!", 5.2], ["Now I'm calling you to inform you of one thing;", 11.3], ["You're screwed.", 14.1], ["That's just it, you're screwed.", 15.2], ["Our animatronic friends will start moving towards your office,", 17.8], ["And if they get in?", 20.8], ["They'll KILL you.", 22], ["Oh, but here's a little tip for ya!", 23.4], ["Uhhh,", 25.9], ["You should CLOSE both doors,", 26.5], ["Keep the flashlight on,", 28.5], ["And check the cameras at all times!", 30], ["Now I KNOW that sounds bad because you'll be using a lot of power, y'know.", 31.9], ["BUT, in actual fact,", 35.6], ["We use a little reverse psychology,", 37], ["And using the power is actually the RIGHT thing to do around here, trust me!", 39.2], ["Alright buddy, we'll be seein' you real soon.", 43.5]];
        
        case voc_PhoneCall_Lefty:
            return [["Going left because you got right to work.", 0], ["Turning right because you left an audio lure.", 6], ["Moving up because you're down there.", 11.4], ["Going down because you're up to something.", 17], ["Moving forward because an audio lure is behind me.", 22.3], ["Turning back because I can't move on.", 28.6], [" ", 36], ["This is stupid.", 38.2]];
        
        case voc_PhoneCall_MrHippo:
            return [["Well, hey there!", 0], ["I heard your phone lines got all mixed up, so I figured I'd give you a call and... Keep ya company for a while.", 1.4], ["I know this kind of situation can be stressful, and um...", 7.7], ["And y'know, it wouldn't even be the first time.", 10.9], ["See, there- there was this time my old buddy Pigpatch had me over because he thought there was-", 13.6], ["FDA agents had tapped into his phone lines again, and...", 18], ["Well...", 22.5], ["It's kind of a long story, so perhaps I'll save it for another day.", 23.6], ["Well, you take care now.", 27.4]];
        
        case voc_PhoneCall_MarionettePopgoes:
            return [["Down the halls, outside of the box", 0], ["The Puppet hunts the night guard", 3], ["The night guard failed, they could only kick rocks", 5.9], ["Pop! Goes the night guard", 9.1], ["Oi, luv! That's not how it goes!", 13.8]];
        
        case voc_PhoneCall_Bidy:
            return [["h-hello my name ih bidy", 0.2], ["i am also known as the balloon man", 2.5], ["can you please come to visit my baby nightmare circus, please?", 6.1], ["i need...", 12.1], ["i need friends I'm very lonely", 13], ["and i need people to play with", 15.5], ["play my bidy nightmare circus games", 17.8], ["my name ih bidy", 21], ["(STAMMERS)", 22.6], ["my baby nightmare circus", 23.5], ["pleeease come visit me i'm so lonely", 25.5], ["please", 28.9], ["okay bye", 31.9]];
        
        case voc_PhoneCall_Ness:
            return [["Heeello once again!", 0], ["You didn't forget about our convo at the diner this morning, didja?", 1.6], ["It's a shame you had to go so soon but I figured I'd call ya right back to pick up where we left off:", 4.6], ["Just HOW on EARTH does a company that's been bleeding money for YEARS manage to fund an ENTIRE megamall?", 8.5], ["Fortunately, I managed to get my hands on the original blueprints for the building.", 16.3], ["Wouldn't you know it, they just HAPPENED to float out of whatever file cabinet they were buried in,", 21.6], ["Through various staff hallways,", 26.2], ["and directly into my hands!", 27.8], ["And the security footage will corroborate this, by the way!", 29.6], ["But I digress.", 31.5], ["A quick dissection of the blueprints revealed an ENTIRE WING of the building deep underground that's COMPLETELY absent from the floor plans.", 33.1], ["What are they doing down there that they're so keen on keeping hidden?", 39.1], ["Well, with how expensive keeping the facility running must be, even WITHOUT the super secret faz-basement,", 42.6], ["It's extremely likely that whatever's going on down there must be profitable enough to keep everything else afloat.", 48.3], ["And you know what REALLY makes money?", 53.5], ["Military contracts.", 55.5], ["That's right, while Freddy Frickbear and the gang keep you entertained and DISTRACTED on the surface,", 57.3], ["Frickbear Entertainment has been using their animatronic technology to sell an ARMY of Freddy Faztroops to the government!", 62.5], ["...Actually, would it be Faztroops, or Fricktroops?", 70.5], ["The rebrand makes things so confusing.", 73.3], ["-Whatever, you get the point! That's why they keep throwing out more and more advanced animatronics!", 75.7], ["That's why 'accidents' involving nightguards like you slip right under public scrutiny!", 81], ["That's why they have a GIANT DJ MUSIC MAN!!", 85.7], ["It's all building up to America's Animatronic Army, led by General Freddy Frickbear himself!", 89.4], ["...Sans the shows for the kiddies, of course.", 96], ["But hey, that's JUST A THEORY.", 98.6], ["At least, until I can confirm it with my own two eyes!", 101.2], ["Your boss provides you with a Freddy mask on the job, yeah?", 104.7], ["Maybe I can get past the robots undetected with a bear costume...", 107.5], ["Anyway, I'll let you know how that goes.", 111.8], ["Call me if you've got any leads!", 113.3]];
        
        case voc_PhoneCall_NightmareMangle:
            return [["HELLO?", 0.1], ["HELLO THERE?!", 1.4], ["PICK UP THE PHONE!!", 3], ["Oh pity they've left you on voicemail.", 5], ["I'm TRYING to get their attention so they ANSWER ME...", 7.9], ["You... want to engage in conversation over the telephone with the nightguard...?", 13.1], ["How queer...", 19.8], ["IT IS NOT!", 21.3], ["QUEER!!!", 22.8], ["While they TALK TO ME on the PHONE, they'll get DISTRACTED and die...", 24.4], ["Ah! Bravo. What a wonderful plan there.", 31.9], ["Well, when the nightguard does pick up, I'd be delighted to speak to them.", 35.9], ["WHAT?! N- YOU?!", 40.2], ["NO, STAY OUTTA THIS!", 41.7], ["Just try and stop me!", 42.9], ["GRAAAAHHH!!!", 45.2], ["(CARTOON FIGHTBALL)", 47.5]];
        
        case voc_PhoneCall_Henry:
            return [["Begin tape.", 0.3], ["To whatever brave soul may have taken this job...", 1.6], ["I know your battle well.", 4.2], ["A battle long, tumultuous...", 5.9], ["Overflowing with death and suffering and no shortage of expletives", 8.1], ["Whatever you do, don't give up.", 11.8], ["I wish I could be there to plan a way out for you...", 14.4], ["But I have a feeling that's...Not what you want.", 17.1], ["I have a feeling you are...Right where you want to be.", 20.5], ["Maybe your work load is light.", 24.8], ["Maybe you've got the deck stacked against you as high as you can pile it.", 26.9], ["I won't ask why.", 31], ["There's no need to.", 32.5], ["There's just you...And them.", 34.1], ["Until the work I started is done,", 37.3], ["And they're all put to rest,", 39.6], ["Be it by my hand,", 41.5], ["Your hand,", 43.1], ["Or the hands of another...", 44.3], ["Look after them, won't you?", 46.1], ["And look out for them, too.", 48.5], ["End tape.", 50.5]];
        
        case voc_PhoneCall_Ballora:
            return [["Yes, yes, calm down little ones, I'm on the phone right now ordering your yum-yums!\n(INFERNAL MINIREENA NOISES)", 0], ["Alr--oh! Hello! I would like to place an order for pickup, please!\n(INFERNAL MINIREENA NOISES)", 6.2], ["Okay... What I want is, um... Is a... Okay... Alright...\n(INFERNAL MINIREENA NOISES)", 10.8], ["I need 97 chicken nuggets...\n(INFERNAL MINIREENA NOISES)", 15], ["Yes, okay, alright, and... and... okay...\n(INFERNAL MINIREENA NOISES)", 18.4], ["412 large fries...\n(INFERNAL MINIREENA NOISES)", 21.7], ["Yes... Okay... Okay... Alright, um... Okay... Alright, uh...\n(INFERNAL MINIREENA NOISES)", 24.9], ["Y--Okay--\n(INFERNAL MINIREENA NOISES)", 30.5], ["28 cheeseburgers,\n(INFERNAL MINIREENA NOISES)", 31.4], ["AND DON'T FORGET THE MUSTARD!\n(INFERNAL MINIREENA NOISES)", 34.4], ["Okay, and um, uh...\n(INFERNAL MINIREENA NOISES)", 37], ["Two diet colas.\n(INFERNAL MINIREENA NOISES)", 38.8], ["Yes, okay, charge that to the card of whatever night guard is working the shift currently.\n(INFERNAL MINIREENA NOISES)", 40.2], ["Okay, THANK YOUUUU~!\n(INFERNAL MINIREENA NOISES)", 46.6]];
        
        case voc_PhoneCall_Fritz:
            return [["(YAWN)", 0], ["Hello Fritz, it's... It's me, Fritz, heh...", 1.1], ["Uh, just leaving this as a reminder...", 4.8], ["(SNIFFLE) You might not remember, but, um...", 7.2], ["...I found out there really is no limit to those Rewind Clocks, so...", 10.9], ["(YAWN) I'm at the tail end of my... (yawn)", 15.6], ["...138 hour shift.", 17.7], ["(YAAAWN) Man... Uh...", 20.9], ["I'm kind of... fizzled out.", 25.6], ["Um, I was just leaving this, uh, uh...message, for me, tomorrow...", 29], ["...or today... or tonight... or whatever...", 34.7], ["(CLEARS THROAT)", 39.1], ["...To um, say that, uh... don't f--uh, don't forget those notes we wrote on Toy Bonnie.", 41.5], ["Uh, we hid them so they wouldn't get tossed out by sanitation, or police or whoever scoops me up off the floor.", 48.1], ["Uh, if you don't remember where they are, they're, um...", 55.5], ["INSIDE of Toy Bonnie.", 58.6], ["Okay, um--(YAWN)", 62.2], ["I think I'll maybe... clock out and maybe have a nap, heh...", 64.1], ["...Okay, uh... wuh-what was I saying...", 68.5], ["...uh, how do I hang this up...", 73.7], ["Unh.", 76.6]];
        
        case voc_PhoneCall_William:
            return [["Hello, nightguard. It is I, William Afton.", 0], ["If you haven't figured it out by now, I'm the number one guy around here.", 5.4], ["Say, how are you faring against MY creations?", 11.3], ["Poorly, I hope! Muahahahaha...", 15.8], ["Look, not that I wish to give you any advice or anything,", 18.6], ["but not one of my creations is more deadly than...", 23.1], ["THE ONE BEHIND YOU RIGHT NOW!!!", 29.3], ["Hoho, PLEASE tell me there was something there! That'd be SO funny!", 31.9], ["Of course, rather unfortunately, I cannot actually watch you, terrified and fighting for your life right now...", 36.7], ["...Or can I? Muahaha...", 44.4], ["Indeed, I can... for you see, I have direct access to the optic cameras on the animatronic that is", 47.2], ["BEHIND YOU RIGHT NOW!!!", 57.2], ["Muahahahaha, oh PLEASE tell me I was two-for-two!", 59.1], ["Anyway, I--", 64.7], ["Whoop, almost used up all my minutes. Okay! Ta-ta!", 65.5]];
        
        case voc_PhoneCall_JimmyT:
            return [["Hey hey, Big Man. It's me, the big J.T.,", 0], ["that's right, the guy who helped you test all those games.", 4.7], ["Yeaaaah. You know you love my sporty style, but hey, listen, that's not what this call is about.", 8], ["The other day, I lost my 'fro, man. The wig, man!", 14.2], ["No big deal! I can always get me another one...", 18.2], ["...But no I can't, because SOMEBODY'S been withholdin' the payments.", 21.6], ["That's right, Big W, it's you, my man! You are holdin' out on me!", 26.6], ["Imma ask you one more time to send me that bread so I can get me another one o' them top shelf wigs, my man,", 31.9], ["because if I can't do that, I can't do nothin'. I can't be seen without my 'do, brotha.", 37.8], ["And if I don't have my 'do, Imma make sho' you don't got nothin'.", 43.6], ["You know what I'm sayin', my man?", 48], ["You know what I'm puttin' down?", 50.4], ["So just sit with that for a minute.", 52.4], ["Write me a check. You know where I'm at.", 55.2], ["Peace.", 58.7]];
        
        case voc_PhoneCall_PhoneGeek:
            return [[" ", 0], ["...OH! Hi, hi!", 1], ["A-Are we coming through alright?", 2.1], ["Okay! Um- Hi!", 3.1], ["It's me, it's me! Uh, the ghost.", 4], ["The one in your telephone, I mean-", 6], ["One of them.", 7.2], ["So! It's- It's been a minute!", 7.7], ["Or hours.", 9.5], ["Or seconds?", 10.5], ["Ghost time is weird!", 11], ["But point is I'm happy to see you're still hanging in there!", 12, 7], ["Metaphorically of course. Not like the last technicians,", 16.6], ["Uh, but I-", 19], ["Ngeahhh I-I never liked them anyways", 19.7], ["Besides, I don't wanna go comparing deaths here,", 22], ["But I think a snapped neck's preferable to consciously bleeding out while your body is completely paralyzed in shock.", 22.2], ["Blunt force trauma isn't always blunt.", 31], ["B-but that just might be me, I-I didn't ask they...", 32.4], ["Scare me.", 36.7], ["...Uh...", 36.7], ["But you don't wanna hear all that, sorry. ", 37.1], ["Uh- look, I have-", 39.4], ["I don't have too long since there's this whole-", 40.5], ["There's-", 43], ["(RINGTONE)", 43.5], ["Oh- Yeah there, speak- speak of the devil.\n(RINGTONE)", 43.7], ["Uhhh, ghost union...\n(RINGTONE)", 45.3], ["Uh, it's weird. It's weird.", 46.6], ["But I just wanted to check in on you and let you know", 48.1], ["I'm still pissed about dying,", 51], ["And if given the chance I would happily take your life in favor of mine.", 52.8], ["Uh, okay, good luck!", 56]];
        
        case voc_PhoneCall_39:
            return [["Oh, crikey Moses! Someone finally answers the damn phone!", 0], ["Listen, I need some help mate.", 4], ["I keep waking up in these weird places with no recollection of how I got there...", 5.9], ["Now I seem to have found myself in the back alley of Frickbear's!", 10], ["Verrry original.", 14.2], ["Anyways, that's enough waffle. I need some directions to get back to Tubby BlooBear's Pizza.", 15.8], ["I won't bore you with the details, but I really need to get back there. Like, urgently.", 21.3], ["But he just won't let me... And it's starting to piss me off!", 26.1], ["Speaking of, if you happen to see a green rabbit with gray, soulless eyes, and a scar over his eye,", 30.7], ["for the love of God, do not tell him I was here.", 38.3], ["Otherwise he's gonna make my life even harder than it already is...", 41.7], ["Anyway, due to the lack of a response, I can see that you're not gonna be of any help.", 47.1], ["So...", 51.8], ["[THANK] you very much, have a crappy evening,", 52.6], ["I hope whatever you're watching over tonight kills you slowly.", 56.3], ["Hooroo!", 60.8]];
        
        case voc_PhoneCall_NightmareFredbearNEW:
            return [["YOU.", "YOU HAVE NO IDEA HOW HARD IT IS TO USE A PHONE WITH THESE BIG CLAWED FINGERS!", "(GROWLS)", "AND I KNOW YOU HEARD THAT PHONE RINGING.", "YOU HAD THE GALL TO IGNORE ME?!", "(INHALE)", "(SIGH)", "Y'KNOW WHAT, IT'S FINE.", "YOU KNOW WHY?", "'CAUSE YOU'RE GONNA BE STUCK IN HERE WITH US,", "FOR ALL ETERNITY!", "YOU'LL BE IN THE DEEPEST OF SLEEPS WHEN WE'RE THOUGH WITH YOU.", "(LAUGHTER)", "BUT DON'T FEAR YOUR FATE, DEATH SOON ARRIVES.", "ESPECIALLY IF YOU'RE THAT BANDAGED-FACED FREAK!", "'CAUSE AFTER ALL,", "SWEET DREAMS ARE OVERRATED.", "(YEAH, YEAAAHH...)", "(YEAH, YEAAAHH...)\n(Yeaaahh dude! HAHAHAHA!)\n(Yeah heheheheh! Right lad, right!)", "(Yeaaahh dude! HAHAHAHA!)\n(Yeah heheheheh! Right lad, right!)", "(VERY GOOD!)\n(Awesome! Yeah, you go off!)", "(Awesome! Yeah, you go off!)\n(Good anwser Fredbear!)", "(LAUGHTER)\n(Get 'em, get 'em! WOOAAHH!)", "(...UHH, WAIT-)\n(Get 'em, get 'em! WOOAAHH!)\n(Pop it like it's hot, lad!)", "(Oooooh kill 'em!)", "(WAS THAT AVIATORS?!?)\n(Oooooh kill 'em!)", "(WAS THAT AVIATORS?!?)\n(LAUGHTER)\n(Oooooh kill 'em!)\n(Is that Circus Baby?)", "(GROWLS)\n(Did she call us back?)", "(GROWLS)\n(POPGOES!)\n(Did she call us back?)", "WILL YOU GUYS SHUT THE F-"], [0, 2.3, 8.51, 10, 12.45, 16.15, 17.29, 18.8, 22.3, 23.83, 26.45, 28.61, 32.5, 35.82, 39.28, 43.42, 45.55, 50.5, 51.5, 53.4, 54.8, 57.1, 58.5, 59.5, 61.5, 62, 62.5, 64.1, 65, 65.5]];
            break;
        
        case mus_Credits4LD:
            return [["", 0, 16777215], ["When we clock out at the crack of dawn", 14, 14050148], ["I grab my check and then I'm gone.", 20.7, 1986200], ["And suddenly I feel alright", 27.6, 3918847], ["I just can't wait until my shift tonight!", 34.4, 3755990], ["If it's a game", 40.4, 16777215], ["Then we are playing it", 42.6, 16777215], ["If it's a game", 47.3, 16777215], ["I want to play it", 49.4, 16777215], ["Over and over and over and over again!", 51.4, 16777215], ["♫", 54.8, 16777215], ["It really wasn't all that bad!", 68.7, 14050148], ["That was the worst job I've ever had.", 75.6, 1986200], ["I'm never gonna forget the place...", 82.4, 3918847], ["GOOD NEWS!", 88.4, 3755990], ["I fixed the bots, so now they can play", 89.3, 3755990], ["for days and days and days!", 92.1, 3755990], ["Oh, you motherf-", 94.1, 1986200], ["If it's a game", 95.3, 16777215], ["Then we are playing it", 97.4, 16777215], ["If it's a game", 102.1, 16777215], ["I want to play it", 104.3, 16777215], ["Over and over and over and over again!", 106.2, 16777215], ["♫", 109.7, 16777215], ["If it's a game", 122.7, 16777215], ["Then we are playing it", 124.8, 16777215], ["If it's a game", 129.6, 16777215], ["I want to play it", 131.7, 16777215], ["Over and over and over again", 133.6, 16777215], ["Over and over and over again!", 137.1, 16777215], ["Over and over and over and over again!", 140.4, 16777215], ["Thank you SO much for playing Five Nights at Frickbear's: Four Layers Down!", 144.9, 14050148], ["Yeah!", 148.9, 1986200], ["Hope you had...fun, and all that good stuff.", 149.8, 1986200], ["Now do you really think they would've gotten all the way to the end if they WEREN'T having fun?", 152.5, 3918847], ["END!?", 156.2, 3755990], ["Whaddaya MEAN end!?", 157.2, 3755990], ["Put me back in, coach! I'm ready to play!", 158.7, 3755990], ["Bye! (Bye!) Bye! Bye! Bye! (See ya.) See ya later! Bye! (Bye!)", 162, 16777215], ["Hello!", 166.9, 3755990], ["Over and over and over and over again", 167.9, 16777215], ["♫", 172.5, 16777215]];
        
        case mus_MyWay:
            return [["", 0], ["And now, the end is near", 6], ["And so I face my final curtain", 11.4], ["My friend, I'll say it clear", 18.4], ["I'll state my case, of which I'm certain", 23.9], ["I've lived a life that's full", 30.9], ["I traveled each and every highway", 36.2], ["And more, much more than this", 43.4], ["I did it my way", 48.4], ["Regrets? Eh, I've had a few", 55.8], ["But then again, too few to mention", 61.3], ["I did what I had to do", 68.3], ["And saw it through without exemption", 73.7], ["I planned each charted course", 80.8], ["Each careful step along the byway", 86.1], ["And more, much more than this", 93.3], ["I did it my way", 98.3], ["Yes there were times, I'm sure you knew", 104.4], ["Where I bit off more than I could chew", 111.1], ["Yet through it all, when there was doubt", 117.3], ["I ate it up and spit it out", 123.6], ["I faced it all, and I stood tall", 129.9], ["And did it my way", 136.1], ["I've loved, I've laughed and cried", 143.1], ["I've had my fill, my share of losing", 148.6], ["And now, as tears subside", 155.6], ["I find it all oh so amusing", 161.1], ["To think I did all that", 167.9], ["And may I say, not in a shy way", 173.4], ["Oh no, oh no not me", 180.3], ["I did it my way", 185.6], ["For what is a man? What has he got!?", 191.4], ["If not himself, then he has naught", 198.4], ["To say the things he truly feels", 204.5], ["And not the words of one who kneels", 210.9], ["The record shows, I took the blows", 217.1], ["And did it my way", 223.3], ["", 230.8], ["Yes it was", 251.7], ["My way", 255.4], ["Bah, phooey!", 263.7], ["I'm-a never singing again!", 265.2]];
        
        default:
            return [[""], [0]];
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
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
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_76,
    Value_77,
    Value_78,
    Value_79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_84,
    Value_85,
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_90,
    Value_91,
    Value_92,
    Value_93,
    Value_94,
    Value_95
}
