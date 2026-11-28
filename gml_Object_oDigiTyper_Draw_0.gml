draw_set_font(global.FontHanddrawn);

if (keyboard_check(vk_anykey))
    TimeSinceLastInput = 0;
else
    TimeSinceLastInput++;

if (keyboard_check(vk_backspace))
    BackspaceHeld++;
else
    BackspaceHeld = 0;

if ((keyboard_check_pressed(vk_backspace) || BackspaceHeld >= 30) && string_length(CurrentLine) > 0)
{
    show_debug_message(string("BACKSPACE PRESSED: {0}", CurrentLine));
    CurrentLine = string_copy(CurrentLine, 0, string_length(CurrentLine) - 1);
    keyboard_string = "";
}

if (keyboard_string != "")
{
    CurrentLine += keyboard_string;
    keyboard_string = "";
}

draw_text_ext_color(8, 8 - PrompterOffset, TextToMatch, 32, 600, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
draw_text_ext(8, 8 - PrompterOffset, CurrentLine + (((floor(TimeSinceLastInput / 30) % 2) == 0) ? "_" : ""), 32, 600);
