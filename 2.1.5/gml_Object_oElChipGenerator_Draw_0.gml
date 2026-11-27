for (var i = 0; i < array_length(ShopInventory); i++)
    draw_text(16, 16 * (i + 1), string(ShopInventory[i].Name));

check_reset();
