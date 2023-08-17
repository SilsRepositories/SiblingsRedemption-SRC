draw_self();
draw_set_font(font_speech_bubble);
draw_set_color(c_white);
draw_set_halign(fa_left);
var va = draw_get_valign();
draw_text(5, 440, "Hold 'H' for info");
draw_text(5, 460, "Left and Right to navigate");

if keyboard_check(ord("H")) {
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_rectangle(0, 180, 640, 300, false);
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	switch image_index {
		case 0:
			draw_text(320, 240, "This is the evolution of the Chara sprite.\nA lot of people compared it to a Minecraft\ncharacter, which was funny but got out of hand\nreally quickly.");
			break;
		case 1:
			draw_text(320, 240, "This was the promotional banner for the newer\nversion of this game.");
			break;
		case 2:
			draw_text(320, 240, "Original logo design");
			break;
		case 3:
			draw_text(320, 240, "Polished and final version of the logo.\nI like this one better because it makes\nthe letters look sharper.");
			break;
		case 4:
			draw_text(320, 240, "Rough concept design for the original\nfour phases. This was WAY before Afterlife\ncontent.");
			break;
		case 5:
			draw_text(320, 240, "Concept art of the menu you see today.");
			break;
		case 6:
			draw_text(320, 240, "Original phase 5-7 previews.\nThese were scrapped along with the original\nfour in favour of better art style.");
			break;
		case 7:
			draw_text(320, 240, "Original concept art for Phase 7, containing\nthe iconic line.");
			break;
		case 8:
			draw_text(320, 240, "Unused sounds\nPress 'SPACE' to hear");
			break;
	}
}
if keyboard_check_pressed(vk_left)
	image_index -= 1;
if keyboard_check_pressed(vk_right)
	image_index += 1;
if image_index == 8 {
	audio_pause_sound(sr_menu);
	if keyboard_check_pressed(vk_space) {
		audio_stop_sound(sr_unused);
		audio_play_sound(sr_unused, 0, false);
	}
}
else {
	audio_stop_sound(sr_unused);
	audio_resume_sound(sr_menu);
}
draw_set_valign(va);
draw_set_halign(fa_left);