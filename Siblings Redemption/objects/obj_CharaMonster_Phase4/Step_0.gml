if instance_exists(obj_ButtonController)
	obj_ButtonController.visible = false;
if instance_exists(obj_BulletBoard)
	obj_BulletBoard.visible = false;
if instance_exists(obj_Soul)
	obj_Soul.visible = false;

switch Phase4Timer {
	case 1:
		var layer_fx = layer_get_fx("Effect_1");
		fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
		break;
	case 655:
		var layer_fx = layer_get_fx("Effect_1");
		fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0.1);
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		break;
	case 1004:
		Dialogue = instance_create_depth(173, 248, -1000000, obj_TextElement_Phase4);
		Dialogue.TextToDraw = "@1Human.";
		Dialogue.TextQueue[0] = "@1Prepare for your&ultimate demise.";
		Dialogue.TextQueue[1] = "@1And this time, we're&not holding back.";
		Dialogue.Talker = "Silent";
		break;
	case 1006:
		var layer_fx = layer_get_fx("Effect_1");
		fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0.25);
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		global.SoulSpeed = 0;
		instance_create_depth(320, 380, -10000, obj_Phase4_Soul);
		break;
	case 1665:
		global.SoulSpeed = 2.5;
		Stage = 2;
		Timer = 0;
		alarm[2] = 300;
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		break;
	case 3480:
		Stage = 1;
		Timer = 0;
		alarm[2] = -1;
		instance_destroy(obj_Phase4_FightButton);
		break;
	case 4956:
		BGAlp = 0;
		break;
	case 5280:
		global.SoulSpeed = 2.5;

		Stage = 2;
		Timer = 0;
		alarm[2] = 300;
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		break;
	case 6400:
		Stage = 1;
		Timer = 0;
		alarm[2] = -1;
		instance_destroy(obj_Phase4_FightButton);
		break;
	case 6480:
		BGAlp = 1;
		break;
	case 8658:
		instance_create_depth(random(640), 960, -10, obj_CharaPhase4_ThistleTwo);
		break;
	case 9900:
		BGAlp = 0;
		break;
	case 10000:
		global.SoulSpeed = 2.5;
		Stage = 2;
		Timer = 0;
		alarm[2] = 300;
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		break;
	case 12300:
		Stage = 1;
		Timer = 0;
		alarm[2] = -1;
		instance_destroy(obj_Phase4_FightButton);
		break;
	case 12626:
		Dialogue = instance_create_depth(173, 248, -1000000, obj_TextElement_Phase4);
		Dialogue.TextToDraw = "@2Had enough?";
		Dialogue.TextQueue[0] = "@2Honestly, not surprising.";
		Dialogue.TextQueue[1] = "@2Did you really think&that you could beat&us AGAIN?";
		Dialogue.TextQueue[2] = "@2That's hilarious.";
		Dialogue.TextQueue[3] = "@2It's the end for you,&and your run.";
		Dialogue.TextQueue[4] = "@2You're not above&consequences.";
		Dialogue.TextQueue[5] = "@2Consequences are above&YOU.";
		Dialogue.Talker = "Silent";
		RemHP = global.PlayerHP;
		if global.NoHit {
			Dialogue.TextToDraw = "@2Impressive.";
			Dialogue.TextQueue[0] = "@2But don't think you'll be&let off that easily.";
			Dialogue.TextQueue[1] = "@2Did you really think&that you could beat&us AGAIN?";
			Dialogue.TextQueue[2] = "@2Especially like that?";
			Dialogue.TextQueue[3] = "@2You're a clown.";
			Dialogue.TextQueue[4] = "@2You're not above&consequences.";
			Dialogue.TextQueue[5] = "@2Consequences are above&YOU.";
		}
		break;
	case 14000:
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		global.PlayerHP /= 2;
		obj_Phase4_Soul.x = 320;
		obj_Phase4_Soul.y = 320;
		obj_Phase4_Soul.image_alpha = 1;
		global.SoulX = 320;
		global.SoulY = 320;
		global.SoulSpeed = 0;
		break;
	case 14580:
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		audio_play_sound(Gigapunch, 0, false);
		obj_Phase4_Soul.sprite_index = Soul_Phase4_Break;
		global.PlayerHP = global.PlayerMaxHP;
		break;
	case 15440:
		audio_play_sound(Soul_Halve, 0, false);
		obj_Phase4_Soul.sprite_index = Soul_Phase4;
		break;
	case 15600:
		audio_play_sound(sr_phase4_1, 0, false);
		break;
	case 15900:
		Dialogue = instance_create_depth(173, 176, -1000000, obj_TextElement_Phase4);
		Dialogue.TextToDraw = "~RI cannot give up&just yet.";
		Dialogue.TextQueue[0] = "~RIf I have to stay&for eternity, so&be it.";
		Dialogue.TextQueue[1] = "~RI need to complete&my quest.";
		Dialogue.TextQueue[2] = "~RLet's end this. NOW.";
		Dialogue.Talker = "FloweyB";
		break;
	case 17100:
		WhiteFlash = 1;
		audio_play_sound(Flash, 0, false);
		global.SoulSpeed = 2.5;
		Stage = 2;
		Timer = 0;
		alarm[2] = 600;
		Dialogue = instance_create_depth(173, 248, -1000000, obj_TextElement_Phase4);
		Dialogue.TextToDraw = "You are filled with&  ~RDETERMINATION.";
		Dialogue.Talker = "Silent";
		if global.NoHeal {
			global.PlayerHP = RemHP;
		}
		break;
}

if audio_is_playing(global.BattleMusic) {
	if abs(audio_sound_get_track_position(global.BattleMusic) - (Phase4Timer / 60)) > 0.1
		audio_sound_set_track_position(global.BattleMusic, (Phase4Timer / 60));
}

if Phase4Timer >= 3600 && Phase4Timer <= 4900 {
	BGAlp = 1;
	if Phase4Timer % 18 == 0 {
		var stix = choose(-100, 740);
		if Phase4Timer >= 4250 {
			stix = choose(-100, 580);
			stik = instance_create_depth(random(640), stix, -1000000, obj_CharaPhase4_Stick);
			stik.vspeed = (stix < 240 ? 1.2 : -1.2);
		}
		else {
			stik = instance_create_depth(stix, random(480), -1000000, obj_CharaPhase4_Stick);
			stik.hspeed = (stix < 320 ? 1.2 : -1.2);
		}
	}
}
if Phase4Timer >= 6600 && Phase4Timer <= 8300 {
	if Phase4Timer % 50 == 0 {
		instance_create_depth(random(640), 960, -1000000, obj_CharaPhase4_Thistle);
	}
	if Phase4Timer % 20 == 0 {
		instance_create_depth(random(640), 550, -1000000, obj_CharaPhase4_Fly);
	}
}
if Phase4Timer >= 8658 && Phase4Timer <= 9800 {
	if Phase4Timer % 10 == 0 {
		fl = instance_create_depth(-100 + random(840), choose(-100, 580), -1000000, obj_CharaPhase4_Fly);
		var rn = choose(0, 1);
		fl.attractX = (rn == 0 ? 10 : -150);
		fl.attractY = (rn == 1 ? -130 : -100);
	}
}
if Phase4Timer >= 12300 && Phase4Timer <= 12600 {
	obj_Phase4_Soul.image_alpha -= 0.0034;
}

if !audio_is_playing(sr_phase4_1) && Phase4Timer > 16000 && MyHP > 0 {
	if !audio_is_playing(sr_phase4_2)
		audio_play_sound(sr_phase4_2, 0, true);
}
	
if (Timer == 0 && Stage >= 2) {
	alarm[0] = 1;
}
Phase4Timer += 1;
ShakeEffect *= 0.95;
if Phase4Timer > 1200 || Stage == 2 {
	obj_BattleEffects.CMAB = random(1 + ShakeEffect);
	if alarm[5] > 0 {
		obj_BattleEffects.CMAB = random(8 + ShakeEffect);
		ShakeEffect = random(20);
	}
}

switch NewAttack {
	case 0:
		if (Timer % 10 == 0 && Timer > 40) {
			var _x = choose(-140, 800);
			gun = instance_create_depth(_x, random(480), -10000, obj_CharaPhase4_Gun);
			if _x > 320
				gun.image_xscale = -1;
		}
		break;
	case 1:
		if (Timer == 119) {
			repeat 6 {
				Glove1 = instance_create_depth(random(640), 500, -10000, obj_CharaPhase4_Glove);
				Glove1.image_angle = 0;
			}
		}
		if (Timer == 59) {
			repeat 6 {
				Glove2 = instance_create_depth(-70, random(480), -10000, obj_CharaPhase4_Glove);
				Glove2.image_angle = -90;
			}
		}
		break;
	case 2:
		if (Timer == 159) {
			Knife1 = instance_create_depth(680, 530, -10000, obj_CharaPhase4_Knife);
			Knife1.image_angle = 0;
			Knife2 = instance_create_depth(-50, -40, -10000, obj_CharaPhase4_Knife);
			Knife2.image_angle = 180;
		}
		if (Timer == 79) {
			Knife1 = instance_create_depth(690, 0, -10000, obj_CharaPhase4_Knife);
			Knife1.image_angle = 90;
			Knife2 = instance_create_depth(-50, 480, -10000, obj_CharaPhase4_Knife);
			Knife2.image_angle = -90;
		}
		break;
	case 3:
		if (Timer % 20 == 0 && Timer > 0) {
			var _x = choose(-100, 740);
			Pan = instance_create_depth(_x, random(480), -10000, obj_CharaPhase4_Pan);
			if (_x < 320) {
				Pan.hspeed = 8;
			}
			else {
				Pan.hspeed = -8;
			}
		}
		break;
	case 4:
		if (Timer % 20 == 0 && Timer > 90) {
			instance_create_depth(random(640), -20, -10000, obj_CharaPhase4_Paper);
		}
		break;
	case 5:
		if (Timer == 49 || Timer == 129) {
			instance_create_depth(-50, random(480), -10000, obj_CharaPhase4_Seed);
			instance_create_depth(-50, random(480), -10000, obj_CharaPhase4_Seed);
			instance_create_depth(690, random(480), -10000, obj_CharaPhase4_Seed);
			instance_create_depth(690, random(480), -10000, obj_CharaPhase4_Seed);
		}
		break;
	case 6:
		if (Timer % 30 == 0 && Timer > 60) {
			var i = random(90);
			repeat 9 {
				Shuriken1 = instance_create_depth(0, 0, -10000, obj_CharaPhase4_Shuriken);
				Shuriken1.direction = i;
				i += 40;
			}
			i = random(90);
			repeat 9 {
				Shuriken2 = instance_create_depth(640, 0, -10000, obj_CharaPhase4_Shuriken);
				Shuriken2.direction = i;
				i += 40;
			}
		}
		break;
	case 7:
		if (Timer % 20 == 0 && Timer > 60) {
			instance_create_depth(random(640), 20, -10000, obj_CharaPhase4_Shoe);
		}
		break;
}
Timer -= 1;