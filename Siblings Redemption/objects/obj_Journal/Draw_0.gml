if pag > 1
	draw_sprite_ext(arrow, 0, 320, 0, 1, 1, 0, c_white, 1);
if pag < 7
	draw_sprite_ext(arrow, 0, 320, 0, -1, 1, 0, c_white, 1);
image_alpha = 1 - alp;
image_index = (pag - 1);
alp -= 0.02;
if alp < 0
	alp = 0;
draw_self();

var fa = draw_get_halign();
draw_set_halign(fa_center);
draw_set_font(font_battleui_hp);
draw_set_color(c_grey);
draw_text(320, 10, "PRESS X TO GO BACK");
draw_set_halign(fa);