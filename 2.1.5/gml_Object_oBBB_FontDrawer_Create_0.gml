var TextOrder = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"'-/#$()~*:;.,!? ";
Font = font_add_sprite_ext(sBBBFont, TextOrder, true, 1);
TextToWrite = "Hello, Frickbear Nation. I love eating burgers. I'm FAT!! Skooble wooble dibbly doo. Flooble booble skobodo doo. Fee Fi Fo Fum.";
CurrentText = "";
CharactersWritten = 1;
StringOffset = array_create(string_length(TextToWrite), 0);
StringOffsetSpeed = array_create(string_length(TextToWrite), 1);
