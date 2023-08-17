x = 320 + random_range(-ShakeEffect, ShakeEffect);
ShakeEffect -= 0.1;
if ShakeEffect < 0
	ShakeEffect = 0;
if con == 1 {
	Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Ugggh...";
	Dialogue.TextQueue[0] = "@2Even with all that..."
	Dialogue.TextQueue[1] = "@2I wasn't able to&stop you...";
	if global.NoHit {
		Dialogue.TextQueue[2] = "@2I couldn't even land&a single scratch on you.";
		Dialogue.TextQueue[3] = "@2How is this even&possible?";
	}
	Dialogue.Talker = "Normal";
	con = 2;
}
if con == 2 && !instance_exists(obj_TextElement) {
	con = 3;
	alarm[0] = 40;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
}
if (con == 4) {
	con = 5;
	alarm[0] = 20;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
}
if (con == 6) {
	con = 7;
	alarm[0] = 180;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
}
if con == 8 {
	Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Partner...";
	Dialogue.TextQueue[0] = "@2Listen to me...&I have a request."
	Dialogue.TextQueue[1] = "@2Leave this world.";
	Dialogue.TextQueue[2] = "@2And let it die.";
	Dialogue.TextQueue[3] = "@2There's nothing else&you can do now.";
	Dialogue.TextQueue[4] = "@2I...";
	Dialogue.Talker = "Normal";
	con = 9;
}
if con == 9 && !instance_exists(obj_TextElement)
	con = 10;
if (con == 10) {
	con = 11;
	alarm[0] = 180;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
	image_index = 1;
}
if con == 12 {
	Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2I don't have&much time left.";
	Dialogue.TextQueue[0] = "@2I will go back&to being dead."
	Dialogue.TextQueue[1] = "@2And then what?";
	Dialogue.TextQueue[2] = "@2You will move on&with your life?";
	Dialogue.TextQueue[3] = "@2Maybe you...";
	Dialogue.Talker = "Normal";
	con = 13;
}
if con == 13 && !instance_exists(obj_TextElement)
	con = 14;
if (con == 14) {
	con = 15;
	alarm[0] = 180;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
	image_index = 2;
}
if con == 16 {
	Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2Partner...";
	Dialogue.TextQueue[0] = "@2No...";
	Dialogue.TextQueue[1] = "@2You...";
	Dialogue.Talker = "Normal";
	con = 17;
}
if con == 17 && !instance_exists(obj_TextElement)
	con = 18;
if (con == 18) {
	con = 19;
	alarm[0] = 180;
	ShakeEffect = 3;
	audio_play_sound(Hurt, 0, false);
}
if con == 20 {
	ShakeEffect = 3;
	audio_play_sound(mus_zzz_c, 0, true);
	audio_play_sound(Hurt, 0, false);
	audio_play_sound(MonsterHurt, 0, false);
	image_index = 3;
	ini_open("file0");
	Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
	if ini_read_real("AFTERLIFE", "RESURRECTION", 0) == 0 {
		Dialogue.TextToDraw = "@2YOU.";
		Dialogue.TextQueue[0] = "@2You thought you&were above consequences.";
		Dialogue.TextQueue[1] = "@2But you're still not, even&when I die.";
		Dialogue.TextQueue[2] = "@2This will come back in the&future to ~Rhit you hard,~W I know&that for certain.";
		Dialogue.TextQueue[3] = "@5Since when were YOU&the one in control?";
	}
	else {
		Dialogue.TextToDraw = "@2YOU AGAIN.";
		Dialogue.TextQueue[0] = "@2Did you expect me&to believe that you&ARE above consequences?";
		Dialogue.TextQueue[1] = "@2Ridiculous, you still have&no power over mine.";
		Dialogue.TextQueue[2] = "@2" + environment_get_variable("USERNAME") + ".";
		Dialogue.TextQueue[3] = "@5You are wracked with&a perverted&sentimentality.";
	}
	Dialogue.Talker = "Normal";
	
	ini_write_real("AFTERLIFE", "RESURRECTION", 1);
	ini_close();
	con = 21;
}
if con == 21 {
	RedSin += 0.1;
	obj_BattleEffects.CMAB = 1;
}
if con == 21 && !instance_exists(obj_TextElement)
	con = 22;
if (con == 22) {
	if global.SpeedrunMode == 1 || global.SpeedrunMode == 2
		with (obj_SpeedrunTimer)
			Running = false;
			
	RedSin = 0;
	audio_stop_all();
	con = 23;
	obj_BattleEffects.CMAB = 0;
	alarm[0] = 240;
	image_index = 4;
	audio_play_sound(snd_test, 0, false);
	audio_play_sound(snd_spearrise, 0, false);
	instance_create_depth(320, 250, -1, obj_Ending_Soul);
	bul = instance_create_depth(x - 75, y, 0, obj_Bullet);
	bul.behav = -2;
	bul.image_blend = c_red;
	bul.image_angle = 90;
	bul.vspeed = -8;
}
if (con == 24) {
	con = 25;
	alarm[0] = 150;
	image_index = 5;
}
if (con == 26) {
	con = 27;
	alarm[0] = 150;
	image_index = 6;
}
if (con == 28) {
	con = 29;
	alarm[0] = 300;
	image_index = 7;
}
if (con == 30) {
	image_alpha -= 0.003;
	if image_alpha <= 0 {
		con = 31;
		instance_destroy(obj_Soul);
		exit;
	}
}
if (con == 31) {
	soul = instance_create_depth(320, 500, -1, obj_Soul);
	soul.vspeed = -1;
	alarm[0] = 240;
	con = 32;
}
if (con == 33) {
	soul.vspeed = 0;
	con = 34;
	alarm[0] = 105;
	bul = instance_create_depth(320, -30, 0, obj_Bullet);
	bul.behav = 6;
	bul.image_blend = c_red;
}
if (con == 35) {
	White = 1;
	audio_sound_gain(sr_phase4_preview, 1, 0);
	audio_play_sound(sr_phase4_preview, 0, true);
	audio_play_sound(snd_scytheburst, 0, false);
	audio_play_sound(Soul_Shatter, 20, false);
	instance_destroy(obj_Soul);
	repeat 5 {
		shard = instance_create_depth(x, y, -100, obj_GameOver_SoulBit);
		shard.hspeed = random_range(-3, 3);
		shard.vspeed = random_range(-2, 1);
		shard.gravity = 0.02;
	}
	con = 36;
	alarm[0] = 200;
}