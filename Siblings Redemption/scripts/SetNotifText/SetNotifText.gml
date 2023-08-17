function SetNotifText(text){
	obj_FlashingText.text = text;
	obj_FlashingText.alp = 1.5;
	audio_play_sound(snd_mysterygo, 0, false);
}