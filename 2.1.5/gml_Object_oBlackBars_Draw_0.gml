depth = -1;
draw_rectangle_color(0, 0, 640, (180 * TransitionAmount) - 1, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 360 - (180 * TransitionAmount), 640, 360, c_black, c_black, c_black, c_black, false);
TransitionAmount += ((BlackOut - TransitionAmount) / 5);
