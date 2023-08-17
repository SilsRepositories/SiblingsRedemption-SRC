// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateEnemyGroup(group) {
	global.CanFlee = false;
	global.NoHit = true;
	global.NoHeal = true;
	global.Monster[0] = noone;
	global.Monster[1] = noone;
	global.Monster[2] = noone;
	global.KARMA_ENABLED = true;
	global.SoulSpeed = 2;
	
	var layer_fx = layer_get_fx("Effect_1");
	fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
	
	switch group {
		case 1:
			global.Monster[0] = instance_create_depth(260, 240, 1, obj_FloweyMonster_Phase1);
			global.Monster[1] = instance_create_depth(1000, 240, 1, obj_CharaMonster_Phase1);
			bul = instance_create_depth(0, 0, -10000, obj_BulletGenerator);
			bul.Turn = -65;
			break;
		case 1.5:
			global.Monster[0] = instance_create_depth(260, 240, 1, obj_FloweyMonster_Phase1);
			global.Monster[1] = instance_create_depth(380, 240, 1, obj_CharaMonster_Phase1);
			bul = instance_create_depth(0, 0, -10000, obj_BulletGenerator);
			bul.Turn = -66;
			bul.Phase2Timer = 1049;
			break;
		case 2:
			global.Monster[0] = instance_create_depth(320, 240, 1, obj_CharaMonster_Phase2);
			global.BattleMusic = audio_play_sound(sr_phase2_loop, 20, true);
			break;
		case 3:
			global.KARMA_ENABLED = false;
			global.Monster[0] = instance_create_depth(320, 160, 1, obj_CharaMonster_Phase3);
			global.Monster[1] = instance_create_depth(60, 335, 1, obj_GasterMonster_Phase3);
			global.Monster[2] = instance_create_depth(580, 335, 1, obj_GasterMonster_Phase3);
			global.BattleMusic = audio_play_sound(sr_phase3_loop, 20, true);
			break;
		case 4:
			global.Monster[0] = instance_create_depth(320, 80, 0, obj_CharaMonster_Phase4);
			global.BattleMusic = audio_play_sound(damagecontrol, 20, false);
			break;
		case 5:
			global.Monster[0] = instance_create_depth(320, 240, 1, obj_CharaMonster_A_Phase1);
			bul = instance_create_depth(0, 0, -10000, obj_BulletGenerator);
			bul.Turn = -68;
			break;
		case 6:
			global.Monster[0] = instance_create_depth(320, 240, 1, obj_CharaMonster_A_Phase2);
			global.BattleMusic = audio_play_sound(Phase6, 20, false);
			break;
	}
}