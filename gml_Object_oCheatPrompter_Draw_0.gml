if (instance_exists(oTipsyBird_Window))
    exit;

draw_set_font(global.FontHanddrawn);

if (keyboard_check(vk_anykey))
    TimeSinceLastInput = 0;
else
    TimeSinceLastInput++;

var i;

for (i = 0; i < array_length(PreviousInputs); i++)
{
    var Col = PreviousInputs[i].LineColor;
    draw_text_color(8, (8 + (i * 32)) - PrompterOffset, "> " + PreviousInputs[i].Text, Col, Col, Col, Col, 1);
}

PrompterOffset += ((max((i - 9) * 32, 0) - PrompterOffset) / 10);
draw_text_color(8, (8 + (i * 32)) - PrompterOffset, "> " + CurrentLine + (((floor(TimeSinceLastInput / 30) % 2) == 0) ? "_" : ""), c_white, c_white, c_white, c_white, 1);
