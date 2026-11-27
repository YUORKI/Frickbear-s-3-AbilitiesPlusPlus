function get_tips(arg0, arg1 = -1)
{
    Tips = array_create(202, ["Work smarter, and harder.", "Pay closer attention next time.", "This will be deducted from your pay.", "Not everyone's cut out for this job.", "Frickbear Entertainment is not responsible for any injury or death.", "Frickbear Entertainment values safety over all else.", "Don't give up! We'll fire you if you do.", "All they want is closure.", "Don't hold it against us.", "At this rate, you're never getting a raise.", "Nothing happened to anyone.", "Another death, another dollar.", "Welcome to the family!", "You'll get used to this after a while.", "Maybe you should've played dead.", "Now let's get you suited up, shall we?", "Your first mistake was signing up.", "You've made a very poor career choice.", "Get up. We're not paying you to sleep on the job.", "It wasn't meant to last."]);
    Tips = array_create(array_length(global.Descriptions), "");
    Tips[arg0] = [string("You were killed by {0}.", global.Descriptions[arg0][0])];
    Tips[UnknownEnum.Value_0] = ["You aren't in danger until the third time he laughs.", "If you have trouble hearing him, watch the cameras instead.", "If you can't watch the cameras, listen for his laughter instead."];
    Tips[UnknownEnum.Value_1] = ["Listen for his footsteps.", "You're safe so long as he can't see you.", "He'll growl before attacking. If you hear this, close the door quickly."];
    Tips[UnknownEnum.Value_2] = ["Listen for her footsteps.", "You're safe so long as she can't see you.", "She'll growl before attacking. If you hear this, close the door quickly."];
    Tips[UnknownEnum.Value_3] = ["Foxy will freeze up for a bit each time you check on him! This'll keep him in place while you're looking elsewhere.", "You can slow him down by leaving your camera on him while the monitor is down. He's also slowed down just by having the monitor up!", "Watch out! He drains more power each time he's blocked."];
    Tips[UnknownEnum.Value_4] = ["Put that mask on a little quicker next time.", "Anticipate him whenever you flip down the monitor.", "It's me."];
    Tips[UnknownEnum.Value_5] = ["The flashlight won't anger it so long as it's not looking at you.", "The endoskeleton's servos are a bit creaky. Listen for its sound cue before it activates.", "ANY flashlight usage will anger the Endoskeleton - even if you're looking away or in the cameras."];
    Tips[UnknownEnum.Value_6] = ["Gaming hard or hardly gaming?", "Remember that any minigame will do - focus on beating whatever you're best at.", "Try playing the minigames whenever you have downtime."];
    Tips[UnknownEnum.Value_7] = ["Listen for his voice as he approaches. Wait until you hear him again before taking your mask off.", "Toy Bonnie's especially suceptible to the audio lure. Use it to keep him away."];
    Tips[UnknownEnum.Value_8] = ["The cupcake can only show up in one of five places. Memorize these locations to find it faster.", "Be sure to scour your entire office before flipping the monitor up again."];
    Tips[UnknownEnum.Value_9] = ["Mangle will calm down if not looked at for a while. You can get away with looking at them so long as you don't do so often.", "Mangle will never be on the same camera twice in a row. Use this to your advantage.", "Mangle will never move to the last camera viewed when flipping the monitor down. You can use this to protect a specific camera."];
    Tips[UnknownEnum.Value_10] = ["Close the door as soon as he leaves your sight.", "Listen for his clanking to know if he's close to the door."];
    Tips[UnknownEnum.Value_11] = ["Be prepared when flipping your monitor down - He can show up at any time.", "Put the mask on as soon as you see him, and keep it on until he leaves."];
    Tips[UnknownEnum.Value_12] = ["Listen for her voice as she approaches. Wait until you hear her again before taking your mask off.", "She's not as gullible to the audio lure, but she'll take a bit longer to reach your office than other vent animatronics."];
    Tips[UnknownEnum.Value_13] = ["Keep your flashlight on him whenever you can.", "Hold your flashlight on him - don't flicker it."];
    Tips[UnknownEnum.Value_16] = ["You can reset the music box even when it's not low, just to be safe."];
    Tips[UnknownEnum.Value_14] = ["Balloon Boy has a small chance of jumpscaring you every time he enters the office. That chance is 100% if playing on Lunatic difficulty."];
    Tips[UnknownEnum.Value_18] = ["Its music box will get louder as it manifests. Listen out for it to make sure you're not in danger.", "Remember to keep the temperature low - it manifests faster the hotter the office is."];
    Tips[UnknownEnum.Value_20] = ["Springtrap will always follow a linear path both forwards and backwards. Know his route to find him faster.", "If you're having trouble keeping track of him, listen for his audio cue."];
    Tips[UnknownEnum.Value_21] = ["Remember not to shine your light down the wrong hallway.", "Make sure you're paying attention when flipping down your monitor.", "If you don't think you'll find him in time, you can use the doors to keep him out."];
    Tips[UnknownEnum.Value_22] = ["You won't see him coming if the monitor's up.", "Keep an eye on the temperature meter."];
    Tips[UnknownEnum.Value_23] = ["Be sure to deal with him before you switch to another camera.", "Be prepared for him to show up every time you switch cameras.", "If you've dealt with him already, he won't show up until flipping the monitor back up again."];
    Tips[UnknownEnum.Value_24] = ["Listen out for audio cues to know where Nightmarionne is without needing to look at him.", "You might be able to sneak quick glances to the sides of the office while Nightmarionne is there - just don't overdo it.", "Be sure to pay special attention to audio cues when Nightmarionne is active - you may miss an animatronic if you can't look at them."];
    Tips[UnknownEnum.Value_26] = ["Up to four Bidybabs can appear on a single camera. If you've already found that many, you know that camera is safe.", "Be sure to check the arcade camera to know how many are left."];
    Tips[UnknownEnum.Value_27] = ["Funtime Freddy will announce himself before attacking. Listen to which side he's on to know which camera to check.", "If you can't check on Funtime Freddy in time, you can keep both doors closed - He'll wait for you to open one before leaving, though.", "Some - but not all - of Funtime Freddy's voice clips will give away if he's faking you out. If you're in a pinch, you can use these to your advantage."];
    Tips[UnknownEnum.Value_28] = ["Funtime Foxy's showtimes are always on 15-second intervals. If you can't check the showtime, you can close the door every 15 seconds just to be safe.", "Funtime Foxy's showtime will update every time he's blocked. Make sure you're keeping up with them to know when she'll attack next."];
    Tips[UnknownEnum.Value_29] = ["A Minireena can only appear in one place on any given camera. If you've seen a Minireena in a spot before, you can memorize it for the next time you have to find them.", "Only one Minireena can appear on any given camera. If you've found one already, you don't need to check that camera again."];
    Tips[UnknownEnum.Value_33] = ["Lefty will typically move to whatever tile is farthest from the audio lure, but prioritize going downwards whenever possible.", "If you're clever, you can trap Lefty in either the left or right corner of the vent system.", "Lefty will never move upwards, unless it's his only option.", "If you want to keep Lefty out, it's recommended you place the audio lure directly in front of the vent opening he's closest to.", "Placing the audio lure directly on top of Lefty will make him move in a random direction immediately. In a pinch, you can use this to push him around."];
    Tips[UnknownEnum.Value_35] = ["You ran out of power."];
    Tips[UnknownEnum.Value_34] = ["Be sure to listen out for his clattering.", "He'll go away faster the sooner you close the door.", "If you can't tell which side he's coming from, you can always close both doors."];
    Tips[UnknownEnum.Value_36] = ["Stay alert - His illusion disc can appear in one of many locations.", "Brace yourself to see him whenever you flip down your monitor."];
    Tips[UnknownEnum.Value_38] = ["Make sure you don't overshoot his jaw - The candy needs to be placed directly into Dreadbear's mouth for him to eat it.", "If you have trouble differentiating the two kinds of candy, remember that Dreadbear's speech bubble will always be on the same side of the office as the bowl of candy he wants."];
    Tips[UnknownEnum.Value_41] = ["It's okay to let Animdude lose a few lives if you need to focus on other tasks - Just don't ignore him for too long.", "A death will only send Animdude to the start of the current screen. If you can't get the whole level done at once, try and aim for incremental progress."];
    Tips[UnknownEnum.Value_42] = ["If you're struggling to save up enough tokens, purchasing a Golden Cupcake and cashing it out near the end of the night may help.", "Don't worry if you can't afford his lumber right away - You'll naturally earn tokens over the course of the night by dealing with animatronics."];
    Tips[UnknownEnum.Value_43] = ["Sparky will become a bit closer to attacking with each camera switch. Check cameras wisely.", "Sparky will attack faster if being actively looked for. If you need to get something done in the office, do it before looking for him.", "Listen to Sparky's barks as you flip through the cameras - They'll give away his position relative to the camera you're watching."];
    Tips[UnknownEnum.Value_44] = ["Be sure to glance at the TV every now and then.", "If you aren't able to put on the mask, purchasing and using an AR Mask should also do the trick."];
    Tips[UnknownEnum.Value_45] = ["Pay attention to where Popgoes is looking while in the showroom - It'll give away which room he intends to move to next.", "Popgoes will make a sound when he moves from his initial position. Listen out for it to know when he leaves."];
    Tips[UnknownEnum.Value_47] = ["If you're stuck in the cameras, use the doors to block Jack-O-Bonnie instead! It'll raise your temperature, but you can mitigate this with a Snowcone or fan upgrades."];
    Tips[UnknownEnum.Value_48] = ["Listen out for Jack-O-Chica's unique footsteps to know when she's approaching!", "If you buy a Snowcone, you can keep your temperature low and buy yourself some time if Jack-O-Chica spots you!"];
    Tips[UnknownEnum.Value_49] = ["Nightmare Mangle will make a garbling noise as he gets closer to the end of her track. Listen out for this to know when you're in danger!", "If you don't have any other vent animatronics, you can let Nightmare Mangle disable the audio lure without worry! It'll keep him in place longer if she does."];
    Tips[UnknownEnum.Value_50] = ["You only have one heal per encounter. Use it wisely!", "Be careful! If your health is low by the end of an encounter, the next enemy can easily wipe you out as soon as they appear.", "Damaging an enemy will delay their attack a bit. If you can help it, just keep attacking!"];
    Tips[UnknownEnum.Value_51] = ["Deedee will wait until you have at least five tokens before attacking. Lose them all and it's game over!"];
    Tips[UnknownEnum.Value_53] = ["Try to cut Ennard off in the vents! While you can deal with his wires in the office, you have much less time to deal with them if they get to that point."];
    Tips[UnknownEnum.Value_54] = ["Yenndo is more likely to show up in the back of the office, but has a chance to appear at the front too. Be prepared to turn every time you flip your monitor down!"];
    Tips[UnknownEnum.Value_58] = ["Listen out for Mr. Hugs' audio cue - You can use it to track his position!"];
    Tips[UnknownEnum.Value_59] = ["Happy Frog has a fairly generous timer, especially if her tablet is down! If you need to deal with something else in the office quickly, do it before you take on her math problem."];
    Tips[UnknownEnum.Value_60] = ["While Pigpatch is only weak to the heater, he's pushed back by it much faster than any other vent animatronic. Use this to your advantage!", "The heater pushes ALL animatronics in the vents back - dealing with Pigpatch should deal with any other vent animatronics as well!"];
    Tips[UnknownEnum.Value_61] = ["Be sure you deal with Nedd Bear as soon as the night starts! He's very easy to forget about.", "Nedd Bear will only be lured if the audio lure is in a tile immediately adjacent to him - if he passes by it on his way to the vent opening, he's guaranteed to go towards it instead!"];
    Tips[UnknownEnum.Value_62] = ["Orville will deliberately choose dummy cards similar to your actual one on higher AI levels. Don't let him trick you!", "Try coming up with a mnemonic to remember your card - if you can connect it to something memorable in your mind, you'll have an easier time remembering it!"];
    Tips[UnknownEnum.Value_63] = ["Scraptrap will kill you as soon as it becomes impossible to complete his tasks by 6 A.M. Be sure you're consistently getting them done!", "Each task will make a sound once complete - listen out for these cues to know when you need to start on another task!"];
    Tips[UnknownEnum.Value_64] = ["Grimm Foxy will begin making a burning sound shortly before your temperature starts to rise. If you can catch him quickly enough, you can push him back before he does any damage!", "Be sure to consistently check on Grimm Foxy before he gets too far! You'll only be able to hear him once he's on the verge of jumpscaring you."];
    Tips[UnknownEnum.Value_66] = ["Other animatronics in the doorway will wait for Glamrock Freddy to leave if he's there. Let him speak!"];
    Tips[UnknownEnum.Value_67] = ["Roxy is a lot quicker to kill than other window animatronics. Don't underestimate her!", "You may be able to get away with glancing away from Roxy every so often - her aggression will lower so long as you're looking at her, even if she isn't fully satisfied yet!"];
    Tips[UnknownEnum.Value_68] = ["Using the flashlight while Monty's sunglasses are on will prevent him from taking them off. Do this for too long and you'll doom yourself!"];
    Tips[UnknownEnum.Value_69] = ["Don't drop the pizza - or do! If you make a mistake, picking up the pizza and dropping it will give you a new blank pizza and allow you to correct your mistake.", "If you have trouble memorizing the toppings, look out for their colors out of the corner of your eye instead!"];
    Tips[UnknownEnum.Value_70] = ["Be sure you deal with Sun and Moon as soon as you see the poster change! Moon will attack much faster if you flip up the monitor while his poster is still in your office.", "Keep an eye out for the poster every time you flip the monitor down - it can change at any moment!"];
    Tips[UnknownEnum.Value_71] = ["M.X.E.S. moves more slowly while the monitor is down. Use this leeway to deal with any threats in the office first!", "While most of its destinations are random, M.X.E.S. will always head towards Cam 1 after spawning in. If you're quick enough, you can use this to deal with it right away!"];
    Tips[UnknownEnum.Value_72] = ["Be careful buying items! If you want to buy something, it's wise to do so AFTER V.I.P. checks your token count. Just be sure you can regain any tokens you spent if it puts you under his quota!"];
    Tips[UnknownEnum.Value_73] = ["The Mimic will rarely be by itself. Keep an especially close eye on the more crowded rooms!", "The suits will move every 30 seconds. Use this as a chance to narrow down where the Mimic might be!"];
    Tips[UnknownEnum.Value_74] = ["Jackie can't jumpscare you so long as you're still holding onto the crank. Wind her all the way up as soon as possible, because looking away can put you in danger!", "Your mouse cursor will be anchored to the crank's handle while you're using it. Keep this in mind and you'll have an easier time getting the motion down!"];
    Tips[UnknownEnum.Value_75] = ["Make sure you reopen the door once Big Top's gone as to reduce your power usage!", "Other door animatronics won't be able to get past Big Top while he's at your door...but you should still close it quickly regardless!"];
    Tips[UnknownEnum.Value_76] = ["The blind puppets, Roxy and Renard, take longer to flash than the other puppets - Renard especially! Keep an eye out for the two of them!", "Bawson (the one with the bandana) will appear a second time in a different position after being flashed. Don't let him trip you up!"];
    Tips[UnknownEnum.Value_80] = ["Blank judges based on how much of your drawing lines up with the template - so scribbling over the whole thing will lose you points! Be sure you only draw over what you need to.", "If you mess up one drawing, you may be able to save yourself with the next! Blank only attacks once his meter is fully depleted."];
    Tips[UnknownEnum.Value_81] = ["Be sure to use EVERY bit of information your wrong guesses provide to your advantage. Mechanics and colors can be an especially good way to narrow animatronics down!", "Be careful about using debut dates - not every animatronic comes from a mainline game, and book and spinoff characters can be tricky!"];
    Tips[UnknownEnum.Value_82] = ["More of Bon's limbs will begin moving as he gets closer to activating. If just his arms are moving, you should be fine...but if his whole body is moving, zap him immediately!", "Keep an eye out for how fast Bon's jaw is moving - it's a telltale sign for when he's close to fully activating!"];
    Tips[UnknownEnum.Value_84] = ["The Reagent will always look in the direction of the hallway it intends to go down shortly before entering it. If you keep an eye on Cam 2, you can catch this cue and block it early!", "The Reagent is a bit more likely to go to the hallway the Wet Floor Bot ISN'T currently blocking than the one it is. Always be prepared to move it around!"];
    Tips[UnknownEnum.Value_85] = ["Ignited Freddy's kill timer drains much faster while he's visible - but it'll freeze if you're flashing him! Be sure you don't go too long without your flashlight on him.", "Ignited Freddy is quite a bit more precise than most other flashlight animatronics. Be sure your mouse is near the center of his face - your flashlight won't effect him otherwise!"];
    Tips[UnknownEnum.Value_86] = ["The balls on the cameras will refresh each time you flip the monitor up. If you've collected all you can already, flip it down and flip it back up to collect more!"];
    Tips[UnknownEnum.Value_87] = ["Wrong notes are far more heavily penalized than off-tempo notes! If you can't get the beat right, just getting the order down should be enough to survive.", "All other door and window characters will be delayed while DJ Music Man is active. Use this to your advantage!"];
    Tips[UnknownEnum.Value_89] = ["Getting rid of one anomaly will get rid of them all, but Foxy.EXE will be delayed for longer the earlier you catch him.", "The countdown starts once three seperate anomalies have popped up. The system buttons will give a hint to what systems are infected."];
    Tips[UnknownEnum.Value_88] = ["If Ralph gets to the right hallway, the right door can keep him out...so long as you have power.", "Ralph is frozen for a few seconds each time you check on him, regardless of how long you spend looking at him."];
    Tips[UnknownEnum.Value_118] = ["Gamble responsibly."];
    Tips[UnknownEnum.Value_119] = ["Don't write checks you can't cash."];
    Tips[UnknownEnum.Value_120] = ["You can use your flashlight on him in the cameras to drain his HP and make him move faster.", "The volume of his footsteps changes depending on where he moves to. Listen out for his audio cues to know where he's going.", "He moves faster when the lights are out, and will always go for the doors after turning them off.", "He can be kept out by keeping the doors closed, but you'll need to let him in to deal damage.", "Certain items may work on him just as they do with other animatronics."];
    Tips[UnknownEnum.Value_121] = ["The temperature will rise over time, and jump up every time you die. Pass a checkpoint to reset it back to zero."];
    Tips[UnknownEnum.Value_122] = ["Nightmare Freddy only attacks if three Freddles latch onto your face. You can let one or two in and still survive."];
    Tips[UnknownEnum.Value_123] = ["Remember that you can control the game even while the handheld is down!"];
    Tips[UnknownEnum.Value_124] = ["Be sure your character is in a safe spot before flipping the handheld down; The game will still run regardless of if it's up or not."];
    Tips[UnknownEnum.Value_125] = ["You can still look around the office while the handheld is up. Use this to keep Foxy's timer in view."];
    
    if (arg1 == -99)
        return Tips[arg0];
    
    if (global.SkinsFunctional[arg0] > -1)
        Tips[arg0] = skin_get_attribute(arg0, "Tips", Tips[arg0]);
    
    if (arg1 == -1)
        arg1 = ((global.DeathRecord[arg0] + global.FunValue[0]) * global.FunValue[1]) % array_length(Tips[arg0]);
    
    return Tips[arg0][arg1];
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
    Value_16 = 16,
    Value_18 = 18,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_26 = 26,
    Value_27,
    Value_28,
    Value_29,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_36,
    Value_38 = 38,
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_53 = 53,
    Value_54,
    Value_58 = 58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_66 = 66,
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
    Value_80 = 80,
    Value_81,
    Value_82,
    Value_84 = 84,
    Value_85,
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_118 = 118,
    Value_119,
    Value_120,
    Value_121,
    Value_122,
    Value_123,
    Value_124,
    Value_125
}
