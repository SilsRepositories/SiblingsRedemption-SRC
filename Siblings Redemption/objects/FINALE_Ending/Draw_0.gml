if (tim < 492) {
	obj_BattleEffects.CMAB = 0;
}
ha = draw_get_halign();
var scal = 2 + ((tim - 492) / 800);
if (tim > 492 && tim < 984) {
	draw_sprite_ext(SRLogo, 0, 427, 240, scal, scal, 0, c_white, (tim - 492) / 30);
	obj_BattleEffects.CMAB = 1;
}
if (tim == 976) {
	instance_create_depth(0, 0, -100000, obj_HitFlash);
	obj_BattleEffects.CMAB = 3;
}
if (tim > 984 && tim < 1446) {
	draw_sprite_ext(SRLogo, 1, 427, 240, scal, scal, 0, c_white, (1446 - tim) / 30);
	obj_BattleEffects.CMAB = lerp(obj_BattleEffects.CMAB, 1, 0.01);
}
if (tim == 1668) {
	obj_BattleEffects.CMAB = 3;
}
if (tim > 1668 && tim < 5292) {
	obj_BattleEffects.CMAB = lerp(obj_BattleEffects.CMAB, 0.5, 0.03);
}
if (tim == 1660) {
	instance_create_depth(0, 0, -100000, obj_HitFlash);
}
if (tim >= 1668 && tim < 2095) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 145, "Inspiration Sources");
	draw_set_color(c_white);
	draw_text(427, 178, "No More Deals by Avranik\nDusttale Last Genocide by Team DTLG\nRejuvenation by S00TF00T\nUndertale Last Breath by ZerJox\nDeltarune Titans by Rovert");
}
if (tim == 2095) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 2095 && tim < 2520) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 145, "Inspiration Sources");
	draw_set_color(c_white);;
	draw_text(427, 188, "Portal and Half Life 2 by VALVE\nJust Shapes and Beats by Berzerk Studio\nHollow Knight by Team Cherry");
}
if (tim == 2520) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 2520 && tim < 2946) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 145, "Music");
	draw_set_color(c_white);
	draw_text(427, 178, "Phase 1 - Megalovania Remix by Frakture\nPhase 2 - Determination by Nick Nitro\nPhase 3 - Gaster's Theme by Kamex\nPhase 4a - Damage Control by Waterflame\nPhase 4b - Finale Remix by NyxTheShield");
}
if (tim == 2946) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 2946 && tim < 3372) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 145, "Music");
	draw_set_color(c_white);
	if global.FG_Start != -1
		draw_text(427, 188, "Phase 5 - Void's Fuel by Pyrom\nPhase 6 - Enigmatic Emotions by Sil\nPhase 7 - Devil's Last Gamble by Sil and CDMusic");
	else
		draw_text(427, 178, "Phase 1 - Megalovania Remix by Frakture\nPhase 2 - Determination by Nick Nitro\nPhase 3 - Gaster's Theme by Kamex\nPhase 4a - Damage Control by Waterflame\nPhase 4b - Finale Remix by NyxTheShield");
}
if (tim == 3372) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 3372 && tim < 3804) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 135, "Main Theme");
	draw_set_color(c_white);
	draw_text(427, 168, "Your Demise by Sil");
	
	draw_set_color(c_yellow);
	draw_text(427, 245, "Credits Theme");
	draw_set_color(c_white);
	draw_text(427, 278, "His Theme Remix by PianoPrinceOfAnime\n(you're listening to it right now)");
}
if (tim == 3804) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 3804 && tim < 4230) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 10, "Special thanks to");
	draw_set_color(c_white);
	draw_text(427, 43, "Pyrom\nS K\nMadeForMario\nXploder\nWarshi\nMaxHardcore\nRiseUT\nQuin\nRem_\nAntizone\nBandana Dee\nfor playtesting, dialogue help\nand quality assurance");
}
if (tim == 4230) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 4230 && tim < 4656) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 200, "Siblings Redemption\nAn Undertale fangame made by");
	draw_set_color(c_white);
	draw_text(427, 260, "Sil");
}
if (tim == 4656) {
	obj_BattleEffects.CMAB = 3;
}
if (tim >= 4656 && tim < 5077) {
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 200, "All Undertale sound effects, sprites\nand music by");
	draw_set_color(c_white);
	draw_text(427, 260, "Toby Fox and Temmie Chang");
}
if (tim > 5292 && tim < 8100) {
	obj_BattleEffects.CMAB = 0;
	draw_sprite_ext(End, 0, 427, 240, 2, 2, 0, c_white, (tim - 5292) / 420);
}
if (tim > 5712 && tim < 8100) {
	draw_set_alpha((tim - 5712) / 420);
	draw_set_halign(fa_center);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	draw_text(427, 260, "Thanks for playing!");
	draw_set_alpha(1);
}
if (tim > 7400 && tim < 8100) {
	draw_set_alpha((tim - 7400) / 600);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 854, 480, false);
	draw_set_alpha(1);
}

// Skips Unified teaser if the player has accessed the credits via the menu
if (tim == 8099) {
	if global.FG_Start <= -1
		tim = 8600;
}
if (tim == 8100) {
	audio_play_sound(mus_musicbox, 0, false);
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2M-M-Mother...";
	Dialogue.TextQueue[0] = "@2...Is that you?";
	Dialogue.Talker = "AsrielA";
	tim += 1;
}
if (tim == 8161) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2Yes, it really is...&My child...";
	Dialogue.TextQueue[0] = "@2Why the long face...?";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8200) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2I-I couldn't avenge you...";
	Dialogue.TextQueue[0] = "@2I couldn't avenge Dad.";
	Dialogue.TextQueue[1] = "@2I gave it my all...";
	Dialogue.TextQueue[2] = "@2Yet, I still failed&all of you...";
	Dialogue.Talker = "AsrielA";
	tim += 1;
}
if (tim == 8261) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2No, Azzy... we will&always be proud.";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8263) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2...";
	Dialogue.TextQueue[0] = "@2...thanks, Mom.";
	Dialogue.Talker = "AsrielA";
	tim += 1;
}
if (tim == 8265) {
	audio_stop_all();
	audio_play_sound(snd_spearappear, 0, false);
}
if (tim > 8265 && tim < 8404) {
	draw_sprite_ext(symbol, 0, 427, 200, 2, 2, 0, c_white, (tim - 8265) / 20);
}
if (tim == 8382) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2...";
	Dialogue.TextQueue[0] = "@2Strange...";
	Dialogue.TextQueue[1] = "@2It seems... they&still live...";
	Dialogue.TextQueue[2] = "@2They still prosper...";
	Dialogue.TextQueue[3] = "@2Spitting in the face&of death itself...";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8384) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	audio_play_sound(mus_prebattle1, 0, true, 1, 0, 0.25);
	Dialogue.TextToDraw = "@2M-Mom?";
	Dialogue.Talker = "AsrielA";
	tim += 1;
}
if (tim == 8386) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2That... looming sense&of dread...";
	Dialogue.TextQueue[0] = "@2It's... awfully familiar...";
	Dialogue.TextQueue[1] = "@2No... it can't be...";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8388) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2M-Mom! Talk to me!";
	Dialogue.Talker = "AsrielA";
	tim += 1;
}
if (tim == 8390) {
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@2Azzy...";
	Dialogue.TextQueue[0] = "@2My child...";
	Dialogue.TextQueue[0] = "@2L-... Listen closely...";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8392) {
	audio_stop_all();
	Dialogue = instance_create_depth(200, 280, 0, obj_TextElement);
	Dialogue.TextToDraw = "@4They shall be... REBORN.";
	Dialogue.Talker = "Toriel";
	tim += 1;
}
if (tim == 8394) {
	audio_play_sound(Gigatalk, 0, false);
	instance_create_depth(0, 0, -10000, obj_HitFlash);
}
if (tim == 8600) {
	room_goto(Room_MainMenu);
}
draw_set_halign(ha);