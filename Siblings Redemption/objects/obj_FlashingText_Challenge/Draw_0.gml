draw_set_alpha(alp);
draw_set_font(font_battleui_hp);
alp -= 0.01;
if alp < 0
	alp = 0;
draw_set_color(c_red);
draw_set_halign(fa_left);
draw_text(20, 20, text);
draw_set_alpha(1);