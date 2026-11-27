apply_skins();

for (var i = 0; i <= 90; i++)
{
    var _x = (i % 10) * 128;
    var _y = floor(i / 10) * 128;
    
    with (instance_create_layer(_x, _y, "Walls", oInteraction_Animatronic))
    {
        AnimatronicID = i;
        Text = "Salvage";
        Height = DepthOffset + get_animatronic_height(AnimatronicID);
        
        if (global.SkinsFunctional[i] > -1)
        {
            CustomSprite = skin_sprite(sMaze_Animatronics_Backup, AnimatronicID, "salvage.png");
            Height = DepthOffset + skin_get_attribute(AnimatronicID, "SalvageLocation_Height", get_animatronic_height(AnimatronicID));
        }
        
        ImageApplied = true;
    }
}
