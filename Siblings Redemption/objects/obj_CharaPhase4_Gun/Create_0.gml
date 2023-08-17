alarm[0] = 60;
alarm[1] = 180;
alarm[2] = 30;
hspeed = (x < 320 ? 3 : -3);
repeat 4
	audio_play_sound(Phase4_Reload, 0, false);