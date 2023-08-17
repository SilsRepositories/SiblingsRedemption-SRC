for (var i = 0; i < array_length(global.Monster); i++) {
	if instance_exists(global.Monster[i]) {
		if (global.Monster[i].alarm[4] > 0) {
			if instance_exists(obj_SpeechBubble) {
				global.Monster[i].alarm[4] = 3;
			}
		}
	}
}
if (Turn < 10)
	MyHP = random(MyMaxHP);
if (Myself == -1) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if global.Monster[i] == id {
			Myself = i;
			break;
		}
	}
}

if ShakeEffect > 0 {
	x = xstart + random_range(-ShakeEffect, ShakeEffect);
	ShakeEffect -= 0.05;
}
Siner += 0.04;
y = 384 - (global.BorderHeight + 20);

/*
  Only use THIS when you want the enemy to DODGE attacks
*/
//else {
//	x += 6;
//	if (x >= 320) {
//		x = 320;
//		DodgeAnim = 0;
//	}
//}
//if (DodgeAnim == 1) {
//	x -= 6;
//	if (x < 160) {
//		x = 160;
//	}
//}

var layer_fx = layer_get_fx("Effect_1");
fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", random(0.05));
obj_BattleEffects.CMAB = 1 + (ShakeEffect / 2);
if died {
	obj_BattleEffects.CMAB = 0;
	fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
}
if instance_exists(Dialogue) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if instance_exists(global.Monster[i]) {
			with global.Monster[i] {
				ReadyForBattle = true;
				if i != Myself
					if instance_exists(Dialogue)
						instance_destroy(Dialogue);
			}
		}
	}
}
else {
	if ReadyForBattle {
		if instance_exists(obj_TextElement) {
			ReadyForBattle = false;
			alarm[0] = 2;
		}
	}
}
if Killed {
	image_alpha -= 0.01;
	repeat (3)
		instance_create_depth(x + random_range(-60, 60), y - random(sprite_height), -1, obj_Particle);
	if image_alpha <= 0
		instance_destroy();
}
