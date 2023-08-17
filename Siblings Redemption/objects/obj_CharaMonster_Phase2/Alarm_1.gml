/*
  Only use THIS when you want the enemy to DODGE attacks
*/
DamageWriter = instance_create_depth(x, y - 170, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP;
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.ShowBar = false;
DamageWriter.Damage = "IMMUNE";
DodgeAnim = 0;
MyHP += global.Damage;
if global.PlayerAttack < 9999 {
	if (global.Damage <= 0) {
		DamageWriter.ShowBar = false;
		DamageWriter.Damage = "MISS";
	}
	else {
		CheckDescription[1] = "~R* I can't slash it to death...&* How am I supposed to kill&  this thing?";
		ShakeEffect = 8;
		Fought = true;
		if (Turn >= 10) {
			global.Damage = 600 + irandom(99);
			global.SoulSpeed = 2;
			ShakeEffect = 4;
			died = true;
			audio_play_sound(MonsterHurt, 0, false);
			DamageWriter.Damage = "";
			repeat 30 {
				shard = instance_create_depth(x, y - 90, -100, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-5, 5);
				shard.vspeed = random_range(-5, 1);
				shard.gravity = 0.1;
				shard.sprite_index = Soul_Bit_White;
			}
			MyHP -= global.Damage;
		}
		else {
			audio_play_sound(MonsterHurt, 0, false);
			audio_play_sound(DialupMashup, 0, false);
		}
	}
}
else {
	if (global.Damage <= 0) {
		DamageWriter.ShowBar = false;
		DamageWriter.Damage = "MISS";
	}
	else {
		CheckDescription[1] = "~R* Well, that was easy.";
		Fought = true;
		audio_stop_sound(global.BattleMusic);
		DamageWriter.Damage = global.Damage;
		DamageWriter.MyHPToBe = (MyHP - global.Damage);
		DamageWriter.ShowBar = false;
		DamageWriter.Damage = global.Damage;
		repeat 100 {
			shard = instance_create_depth(x, y - 90, -100, obj_GameOver_SoulBit);
			shard.hspeed = random_range(-5, 5);
			shard.vspeed = random_range(-8, 1);
			shard.gravity = 0.1;
			shard.sprite_index = Soul_Bit_White;
		}
		Parti = instance_create_depth(0, 0, -1000000, obj_Particle);
		Parti.image_blend = c_white;
		Parti.hspeed = 0;
		Parti.vspeed = 0;
		Parti.image_xscale = 2000;
		Parti.image_yscale = 2000;
		Parti.fad = true;
		MyHP -= global.Damage;
		
		Hits = 9999999;
		Phase2Timer = 2689;
		Rotation = 0;
		died = true;
		Turn = 11;
		ShakeEffect = 5;
		audio_play_sound(HeavyDamage, 0, false);
		instance_destroy(obj_Bullet);
		instance_destroy(obj_LightRay);
		instance_destroy(obj_GasterBlaster);
		instance_destroy(obj_GasterBlasterBeam);
		instance_destroy(obj_CharaSlash);
		instance_destroy(obj_Shrike_Small);
		instance_destroy(obj_Shrike_Big);
	}
}