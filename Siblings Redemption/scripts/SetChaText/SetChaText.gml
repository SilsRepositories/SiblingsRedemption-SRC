function SetChaText(text){
	obj_FlashingText_Challenge.text = text;
	obj_FlashingText_Challenge.alp = 1.5;
	audio_play_sound(Ping, 0, false);
}