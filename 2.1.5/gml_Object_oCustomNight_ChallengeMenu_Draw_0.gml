EntrySpacer = 32;
InnerBoxWidth = (48 - EntrySpacer) + (EntrySpacer * EntriesPerRow);
var MainboxWidth = InnerBoxWidth + 12;
var DescBoxHeight = 64;
var YOffset = ChallengeInfoOffset * -1;
EntryY = YOffset;
draw_sprite_stretched(sTextBox_Windows, 0, 0, 0, MainboxWidth, 360 - DescBoxHeight);
HoveredItem = -1;
HoveredType = 0;

if (SelectedChallenge != -1)
{
    var Data = Challenges[Category][SelectedChallenge];
    LevelXs = [];
    draw_entry_box("SP");
    
    for (var i = MaxLvl; i >= 1; i--)
        draw_entry_box(i);
    
    if (variable_struct_exists(Data, "Upgrades"))
    {
        draw_text(6, EntryY + 1, "Upgrades:");
        var ThisField = Data.Upgrades;
        var BoxHeight = (36 - EntrySpacer) + (ceil(array_length(ThisField) / EntriesPerRow) * EntrySpacer);
        EntryY += 20;
        draw_sprite_stretched(sTextBox_Windows, 2, 6, EntryY, InnerBoxWidth, BoxHeight);
        shader_set(shRecolor);
        var Pal = [16777215, 11316396, 5263440, 0];
        replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
        
        for (var i = 0; i < array_length(ThisField); i++)
        {
            ItemX = 6 + ((i % EntriesPerRow) * EntrySpacer);
            var ItemY = EntryY + (floor(i / EntriesPerRow) * EntrySpacer);
            draw_sprite(sShopItemSalvageIcons, ThisField[i], ItemX + 18, ItemY + 18);
            
            if (mouse_in_zone(ItemX, ItemY, 48, 48))
            {
                HoveredItem = ThisField[i];
                HoveredType = 1;
            }
        }
        
        shader_reset();
        EntryY += (BoxHeight - 2);
    }
    
    var CurrentEntryY = EntryY;
    var ItemX = 6 + (InnerBoxWidth / 2);
    
    if (variable_struct_exists(Data, "GuardAbility"))
    {
        draw_text(ItemX, EntryY + 1, "Guard Ability:");
        var BoxHeight = 48;
        EntryY += 20;
        draw_sprite_stretched(sTextBox_Windows, 0, ItemX, EntryY, 48, BoxHeight);
        var ItemY = EntryY;
        draw_sprite(sCustomNightGuardFaces, Data.GuardAbility, ItemX, ItemY);
        
        if (mouse_in_zone(ItemX, ItemY, 48, 48))
            draw_mechanic_box(get_guard_description(Data.GuardAbility));
        
        EntryY += (BoxHeight - 2);
        global.CustomNightGuardAbility = Data.GuardAbility;
    }
    else
    {
        draw_text(ItemX, EntryY + 1, "Guard Ability: None");
        global.CustomNightGuardAbility = UnknownEnum.Value_1;
    }
    
    EntryY = CurrentEntryY;
    ItemX = 6;
    
    if (variable_struct_exists(Data, "DisabledTools"))
    {
        if (array_contains(Data.DisabledTools, "Cameras"))
        {
            draw_text(ItemX, EntryY + 1, "- Cameras Disabled");
            EntryY += 15;
            global.DisabledTools.Camera = true;
        }
        
        if (array_contains(Data.DisabledTools, "Doors"))
        {
            draw_text(ItemX, EntryY + 1, "- Doors Disabled");
            EntryY += 15;
            global.DisabledTools.Doors = true;
        }
        
        if (array_contains(Data.DisabledTools, "Fan"))
        {
            draw_text(ItemX, EntryY + 1, "- Fan Disabled");
            EntryY += 15;
            global.DisabledTools.Fan = true;
        }
        
        if (array_contains(Data.DisabledTools, "Mask"))
        {
            draw_text(ItemX, EntryY + 1, "- Mask Disabled");
            EntryY += 15;
            global.DisabledTools.Mask = true;
        }
        
        if (array_contains(Data.DisabledTools, "Flashlight"))
        {
            draw_text(ItemX, EntryY + 1, "- Flashlight Disabled");
            EntryY += 15;
            global.DisabledTools.Flashlight = true;
        }
    }
    
    if (variable_struct_exists(Data, "Cheats"))
    {
        if (array_contains(Data.Cheats, UnknownEnum.Value_2))
        {
            draw_text(ItemX, EntryY + 1, "- Infinite Power");
            EntryY += 15;
        }
        
        if (array_contains(Data.Cheats, UnknownEnum.Value_4))
        {
            draw_text(ItemX, EntryY + 1, "- No Temperature Gain");
            EntryY += 15;
        }
        
        if (array_contains(Data.Cheats, UnknownEnum.Value_3))
        {
            draw_text(ItemX, EntryY + 1, "- Unlimited Items");
            EntryY += 15;
        }
    }
}

var c;

for (c = 0; c < array_length(Challenges); c++)
    cn_button(c, 496, 32 + (22 * c), 144, 22, CategoryNames[c], c == Category, "Category");

draw_sprite_stretched(sTextBox_Windows, 0, 496, 32 + (c * 22), 144, 228 - (c * 22));
draw_sprite_stretched(sTextBox_Windows, 0, 480, 0, 16, 360);

if (Category >= 2)
    draw_text_ext(502, 32 + (c * 22) + 1, "These challenges aren't required for 100% completion. Play them only if you're up to the challenge!", 15, 132);

var ScrollBar = scroll_bar(ChallengeInfoOffset, ChallengeInfoDragged, 0, 0, MainboxWidth, 360, max(360 - DescBoxHeight, EntryY + ChallengeInfoOffset + 96), 16);
ChallengeInfoOffset = ScrollBar[0];
ChallengeInfoDragged = ScrollBar[1];

if (Category != -1)
{
    var ChalNames = "";
    var ChallengeSet = Challenges[Category];
    var ButtX, ButtWidth;
    
    for (c = 0; c < array_length(ChallengeSet); c++)
    {
        var Unlock = ChallengeSet[c].Unlocked;
        ButtX = MainboxWidth + 16;
        var ButtY = (22 * c) - ChallengeButtonOffset;
        ButtWidth = 640 - (MainboxWidth + 16 + 160);
        var Cleared = global.ClearedChallenges[ChallengeSet[c].ID];
        cn_button(c, ButtX, ButtY, ButtWidth, 22, ChallengeSet[c].Name, c == SelectedChallenge, "Challenge", Unlock);
        
        if (Cleared > 0)
            draw_sprite(sCustomNightChallengeSticker, Cleared - 1, (ButtX + ButtWidth) - 20, ButtY + 2);
        
        if (!Unlock)
            draw_sprite(sCustomNightChallengeSticker, 3, (ButtX + ButtWidth) - 20, ButtY + 2);
    }
    
    if (HoveredItem != -1)
    {
        if (HoveredType == 1)
        {
            var Upgrade = get_upgrades(HoveredItem);
            draw_mechanic_box(Upgrade.Name + ": " + Upgrade.Desc);
        }
        else
        {
            draw_mechanic_box(global.Descriptions[HoveredItem][0] + ": " + global.Descriptions[HoveredItem][1]);
        }
    }
    
    ScrollBar = scroll_bar(ChallengeButtonOffset, ChallengeButtonDragged, ButtX, 0, ButtWidth, 360, array_length(ChallengeSet) * 22, 22);
    ChallengeButtonOffset = ScrollBar[0];
    ChallengeButtonDragged = ScrollBar[1];
}

cn_button(0, 0, 360 - DescBoxHeight, MainboxWidth, DescBoxHeight, (SelectedChallenge == -1) ? "" : Challenges[Category][SelectedChallenge].Desc, false);

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4
}
