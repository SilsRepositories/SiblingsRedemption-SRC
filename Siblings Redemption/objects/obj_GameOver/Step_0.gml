audio_sound_pitch(MUSIC_GameOver, 0.2);
if Stage == 1 {
	if global.SpeedrunMode > 0 {
		Stage = 5;
		Sel = 0;
		with (obj_SpeedrunTimer) {
			Timer = 0;
		}
		image_alpha = -0.2;
		exit;
	}
	if global.nohitmode {
		Stage = 5;
		Sel = 1;
		image_alpha = -0.2;
		exit;
	}
	if (image_alpha == 0) {
		if global.EnemyGroup < 3 {
			audio_sound_gain(MUSIC_GameOver, 1, 0);
			audio_play_sound(MUSIC_GameOver, 20, true);
			image_blend = c_red;
		}
		else {
			audio_sound_gain(windmode, 0, 0);
			audio_play_sound(windmode, 20, true);
		}
	}
	if image_alpha == 0.01 {
		audio_sound_gain(windmode, 1, 5000);
	}
	image_alpha += 0.01;
}
if Stage == 2 {
	alarm[0] = -1;
	Dialogue = instance_create_depth(154, 278, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2ERROR! PLEASE REPORT!";
	var dialogueRNG = choose(0, 1, 2, 3);
	if global.EnemyGroup == 1 {
		if (dialogueRNG == 0) {
			Dialogue.TextToDraw = "@2Pathetic.";
			Dialogue.TextQueue[0] = "@2You can buy all the&weapons in the world...";
			Dialogue.TextQueue[1] = "@2But you can't buy&SKILL.";
		}
		if (dialogueRNG == 1) {
			Dialogue.TextToDraw = "@2Don't get cocky,&kid.";
			Dialogue.TextQueue[0] = "@2After all, I have&the upper hand in&ANNIHILATION.";
		}
		if (dialogueRNG == 2) {
			Dialogue.TextToDraw = "@2I didn't win because&I'm the strongest.";
			Dialogue.TextQueue[0] = "@2I won because you're&a WEAKLING.";
		}
		if (dialogueRNG == 3) {
			Dialogue.TextToDraw = "@2Can you believe it?";
			Dialogue.TextQueue[0] = "@2Whatever it is&that you believe in...";
			Dialogue.TextQueue[1] = "@2It's not helping you&here.";
		}
	}
	if global.EnemyGroup == 2 {
		if (dialogueRNG == 0) {
			Dialogue.TextToDraw = "@2Is that the best&you can do?";
		}
		if (dialogueRNG == 1) {
			Dialogue.TextToDraw = "@2If you can't beat&me, how can you&beat yourself?";
		}
		if (dialogueRNG == 2) {
			Dialogue.TextToDraw = "@2Whatever, that's what&you deserve.";
		}
		if (dialogueRNG == 3) {
			Dialogue.TextToDraw = "@2Isn't it obvious?";
			Dialogue.TextQueue[0] = "@2You are clearly&not strong enough.";
		}
	}
	if global.EnemyGroup == 3 {
		Dialogue.TextToDraw = "HhhEeeLPPpp MmmMeEEeee...";
	}
	if global.EnemyGroup == 4 {
		instance_destroy(Dialogue);
	}
	if global.EnemyGroup == 5 {
		Dialogue.TextToDraw = "In the afterlife...";
		Dialogue.TextQueue[0] = "There is no getting&away.";
	}
	if global.EnemyGroup == 6 {
		Dialogue.TextToDraw = "@3It's over...&for you.";
	}
	Stage = 3;
}
if (Stage == 3 && !instance_exists(obj_TextElement)) {
	Stage = 4;
}
if Stage == 4 {
	if keyboard_check_pressed(ord("Z")) {
		Stage = 5;
		audio_sound_gain(MUSIC_GameOver, 0, 3000);
		audio_sound_gain(windmode, 0, 3000);
		Sel = 1;
	}
	if keyboard_check_pressed(ord("X")) {
		Stage = 5;
		audio_sound_gain(MUSIC_GameOver, 0, 3000);
		audio_sound_gain(windmode, 0, 3000);
	}
}
if (Stage == 5) {
	image_alpha -= 0.01;
	if (image_alpha < -0.2) {
		audio_stop_all();
		if Sel == 1 {
			room_goto(BattleRoom);
		}
		else {
			room_goto(Room_MainMenu);
			instance_destroy();
			exit;
		}
		Stage = 6;
	}
}
if (Stage == 6) {
	alarm[1] = 3;
	Stage = 7;
}