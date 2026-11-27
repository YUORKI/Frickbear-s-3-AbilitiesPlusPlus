Frame = -0.25;
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
