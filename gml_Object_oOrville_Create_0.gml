ID = UnknownEnum.Value_62;
Frame = -0.25;
SPRITE_Head = skin_sprite(sOrville_Head, ID, "sprite_01.png");
SPRITE_Hand = skin_sprite(sOrville_Hands, ID, get_sprite_filenames(2, 3));
SPRITE_Body = skin_sprite(sOrville_Body, ID, get_sprite_filenames(4, 6));
SPRITE_Cards = skin_sprite(sOrville_Cards, ID, get_sprite_filenames(7, 47));
SOUND_Correct = skin_sound_generate_array([voc_Orville_Correct, voc_Orville_FantasticWork, voc_Orville_Fiddlesticks, voc_Orville_GoodJob, voc_Orville_HowDoYouDoIt], ID, "voc_appear");
SOUND_Guess = skin_sound_generate_array([voc_Orville_PickACard, voc_Orville_AddressTheElephant, voc_Orville_IsThisYourCard1, voc_Orville_IsThisYourCard2, voc_Orville_ForMyNextTrick, voc_Orville_NeverForgets], ID, "voc_solved");
SOUND_Sparkle = skin_sound(sfxSparkleImpact, ID, "sq_solved");
SOUND_Swoosh = skin_sound(sfxSwoosh, ID, "sq_swoosh");
SOUND_Appear = skin_sound(sfxOrvilleAppears, ID, "sq_appear");
SOUND_WhipCrack = skin_sound(sfxWhipCrack, ID, "sq_whip");
CardOffset = 128;
CardOffsetSpeed = 0;
OffsetTarget = 128;
CardSuit = irandom(3);
CardRank = irandom(9);
PickACard = false;
SameColorSuit = (CardSuit + 2) % 4;
AltColorSuit = (CardSuit + 4 + random_sign()) % 4;
AltRank = (CardRank + irandom_range(1, 5)) % 10;
AltAltRank = (AltRank + irandom_range(1, 5)) % 10;
Cards = [];
var OneDiffCards = array_shuffle([
{
    Suit: AltColorSuit,
    Rank: CardRank,
    Correct: false
}, 
{
    Suit: CardSuit,
    Rank: AltRank,
    Correct: false
}]);
array_push(Cards, 
{
    Suit: CardSuit,
    Rank: CardRank,
    Correct: true
});
array_push(Cards, 
{
    Suit: AltColorSuit,
    Rank: AltRank,
    Correct: false
});
array_push(Cards, 
{
    Suit: choose(SameColorSuit, AltColorSuit),
    Rank: AltAltRank,
    Correct: false
});
array_push(Cards, OneDiffCards[0]);
array_push(Cards, OneDiffCards[1]);
array_push(Cards, 
{
    Suit: SameColorSuit,
    Rank: CardRank,
    Correct: false
});
CardOffsets = array_create(6, 160);
CardOffsetSpeeds = array_create(6, -16);
CardFlip = 0;
CardFlipSpeed = 0;
CardDisappear = false;
Voiceline = -1;
FlipTarget = 1440;

function cards_available()
{
    return abs(CardFlip - FlipTarget) < 16;
}

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (!CardDisappear && global.AILevels[UnknownEnum.Value_62] > 0 && global.Timer >= 350.5)
    {
        jumpscare(UnknownEnum.Value_62);
        return true;
    }
    
    return false;
}

if (global.Timer > 350)
    instance_destroy();

enum UnknownEnum
{
    Value_62 = 62
}
