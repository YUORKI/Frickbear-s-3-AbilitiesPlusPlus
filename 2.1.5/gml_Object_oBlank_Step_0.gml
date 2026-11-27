if (global.AILevels[ID] == 21)
{
    global.Temperature += (1/30);
    TotalScore -= 0.027777777777777776;
    
    if (TotalScore <= 0)
        jumpscare(ID);
}
