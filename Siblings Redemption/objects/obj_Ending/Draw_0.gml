Siner += 0.01;
global.SoulSpeed = 0;
if image_index > 3
	Siner = 0;
image_xscale = 2;
image_yscale = 2 - abs(sin(Siner) / 40);
draw_set_color(make_color_rgb(abs(sin(RedSin)) * 40, 0, 0));
draw_rectangle(-10, -10, 650, 490, false);
draw_self();
White -= 0.05;
if White < 0
	White = 0;
draw_set_color(c_white);
draw_set_alpha(White);
draw_rectangle(-10, -10, 650, 490, false);
draw_set_alpha(1);
if (con == 37) {
	CredAlpha += 0.01;
	if CredAlpha > 1 {
		con = 38;
		audio_sound_gain(sr_phase4_preview, 0, 2000);
		CredAlpha = 1;
	}
}
if (con == 38) {
	CredAlpha -= 0.01;
	if CredAlpha < -0.5 {
		con = 39;
		audio_stop_all();
		global.EnemyGroup = 5;
		room_goto(BattleRoom);
		UnlockAchievement(1);
		if global.FG_Start == 1 {
			if global.FG_Heals == 0
				UnlockAchievement(2);
			if global.FG_Hits == 0
				UnlockAchievement(3);
		}
	}
}
//draw_set_alpha(CredAlpha);
//draw_sprite_ext(SRLogo, 0, 320, 70, 2, 2, 0, c_white, CredAlpha);
//draw_set_color(c_red);
//fa = draw_get_halign();
//draw_set_halign(fa_center);
//draw_text(320, 140, "Game by");
//draw_text(320, 210, "Audio sources");
//draw_text(320, 370, "Playtested by");
//draw_text(320, 450, "THANKS FOR PLAYING!");
//draw_set_color(c_white);
//draw_set_halign(fa_center);
//draw_text(320, 160, "QSV");
//draw_text(320, 230, "Frakture (Megalovania Halloween Hack)");
//draw_text(320, 250, "Nick Nitro (Determination)");
//draw_text(320, 270, "Kamex (Gaster Remix)");
//draw_text(320, 290, "Waterflame (Damage Control)");
//draw_text(320, 310, "NyxTheShield (Finale Metal Remix)");
//draw_text(320, 330, "Rawtekk (Amber's Love Was Like A Marble)");
//draw_text(320, 390, "S K, Xploder, Omni Kirby Nil, MaxHardcore,");
//draw_text(320, 410, "MadeForMario and Pyrom");
//draw_set_halign(fa);