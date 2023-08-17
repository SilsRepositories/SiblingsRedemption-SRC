draw_set_alpha(alp);
draw_set_font(font_battleui_hp);
alp -= 0.01;
if alp < 0
	alp = 0;
draw_set_color(c_white);
var fa = draw_get_halign();
draw_set_halign(fa_center);
draw_text(320, 20, text);
draw_set_halign(fa);
draw_set_alpha(1);