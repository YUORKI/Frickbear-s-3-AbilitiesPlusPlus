draw_set_font(Font);
var _x = 0;
var _y = 0;

for (var i = 1; i <= floor(CharactersWritten); i++)
{
    var Char = string_char_at(TextToWrite, i);
    
    if (Char == " ")
    {
        var j = 0;
        var textX = _x;
        
        while ((i + j) < string_length(TextToWrite) && string_char_at(TextToWrite, j) != " ")
        {
            j++;
            textX += string_width(string_char_at(TextToWrite, j));
        }
        
        if (textX > 180)
        {
            _y += 16;
            _x = string_width(Char) * -1;
        }
    }
    
    draw_text_transformed(_x + 10, _y + 10 + StringOffset[i - 1], Char, 1, 1, StringOffset[i - 1] * -1);
    _x += string_width(Char);
    StringOffset[i - 1] += StringOffsetSpeed[i - 1];
    StringOffsetSpeed[i - 1] = lerp(StringOffsetSpeed[i - 1], (0 - StringOffset[i - 1]) * 0.2, 0.2);
}

if (CharactersWritten < string_length(TextToWrite))
    CharactersWritten += 1;

check_reset();
