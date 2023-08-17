x = lerp(x, trueX, 0.1);
y = lerp(y, trueY, 0.1) + (sin(Siner / 3) * 3);
image_angle = -(x - xprevious);
image_xscale = lerp(image_xscale, trueXS, 0.1);
image_yscale = lerp(image_yscale, trueYS, 0.1);
depth = 10;

Siner += 0.07;
ShadowAlph = 0.5 + (sin(Siner) / 3);
BG_y += BGSpeed;
if BG_y > 960
	BG_y -= 960;
ParalAlph = lerp(ParalAlph, TargetAlph, 0.2);
if Stage < 14 {
	draw_sprite_ext(Phase7_Parallax, 0, (BG_x % 3242), -BG_y, 1, 1, 0, BGCol, ParalAlph);
	draw_sprite_ext(Phase7_Parallax, 0, (BG_x % 3242), -BG_y + 960, 1, 1, 0, BGCol, ParalAlph);

	draw_sprite_ext(Phase7_Flames, 0, 0, -(BG_y % 480), 1, 1, 0, c_red, 0.6);

	draw_sprite_ext(Phase7_Glow, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, sin(Siner));
	draw_sprite_ext(Phase7_Chara_Wing, 0, x, y, (image_xscale - abs(sin(Siner) / 2)), image_yscale, image_angle, image_blend, 1);
	draw_sprite_ext(Phase7_Chara_Wing, 0, x, y, -(image_xscale - abs(sin(Siner) / 2)), image_yscale, image_angle, image_blend, 1);
	draw_sprite_ext(Phase7_Chara, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);

	draw_sprite_ext(Phase7_FogEffect, 0, 427, 240, 1, 1, 0, image_blend, ShadowAlph);
}

if WordConfirm {
	WA += 0.05;
	if WA > 1
		WA = 1;
}
else {
	WA -= 0.05;
	if WA < 0
		WA = 0;
}
draw_sprite_ext(Phase7_Subtitles, VoiceLine - 1, 427, 240, 1, 1, 0, c_white, WA);
if VoiceLine == 1 {
	WLT += 1;
	if WLT > 300 {
		draw_set_font(font_battle_dialogue);
		draw_set_color(c_red);
		var fa = draw_get_halign();
		draw_set_halign(fa_center);
		draw_set_alpha((WLT - 360) / 30);
		draw_text(427, 447, "PRESS 'Z' OR ENTER");
		draw_set_alpha(1);
		draw_set_halign(fa);
	}
}

if HPCounter != global.soul7_HP || global.soul7_HP != global.soul7_MaxHP {
	HPCounter = global.soul7_HP;
	DamageTimer = 0;
}

DamageTimer += 1;
if Words != -1 || Stage >= 11
	DamageTimer = 200;
draw_set_alpha(2 - (DamageTimer / 100));
draw_set_color(c_white);
draw_set_font(font_battleui_hp);
draw_text(310, 450, "HP");
draw_set_color(c_red);
draw_rectangle(350, 448, 500, 470, false);
draw_set_color(c_yellow);
draw_rectangle(350, 448, 350 + (150 * (global.soul7_HP / global.soul7_MaxHP)), 470, false);
draw_set_alpha(1);

if Stage == 10 {
	draw_set_color(c_white);
	draw_set_font(font_battleui_hp);
	draw_text(20, 20, "BOSS");
	draw_set_color(c_black);
	draw_rectangle(90, 18, 840, 40, false);
	draw_set_color(c_red);
	draw_rectangle(90, 18, 90 + (750 * (Hits / 255)), 40, false);
}