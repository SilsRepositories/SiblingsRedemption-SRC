DamageWriter = instance_create_depth(x, y - 170, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = MyHP;
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.ShowBar = true;
DodgeAnim = 0;
if (global.Damage <= 0) {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "MISS";
}
else {
	ShakeEffect = 1;
	if (Turn >= 10) {
		audio_stop_sound(mus_wind);
		audio_sound_gain(mus_wind, 1, 0);
		if global.NoHeal
			SetChaText("NO HEAL PHASE 5");
		if global.NoHit
			SetChaText("NO HIT PHASE 5");
		global.Damage = 1;
		DamageWriter.Damage = "UPDATE IN PROGRESS";
		
		if global.SpeedrunMode == 1
			with (obj_SpeedrunTimer)
				Running = false;
		
		UpdateSF(5, global.NoHeal, global.NoHit);
		global.SoulSpeed = 2;
		ShakeEffect = 2;
		audio_play_sound(mus_dialup_0, 0, false);
		DamageWriter.MyHPToBe = (MyHP - global.Damage);
		DamageWriter.ShowBar = false;
		MoveOn = true;
	}
	else {
		image_index += 1;
		instance_create_depth(0, 0, obj_TargetField.depth + 1, obj_HitFlash);
		ShakeEffect = 2;
		audio_play_sound(HeavyDamage, 0, false);
		DamageWriter.Damage = global.Damage;
		DamageWriter.MyHPToBe = (MyHP - global.Damage);
		repeat 30 {
			shard = instance_create_depth(x, y - 90, -100, obj_GameOver_SoulBit);
			shard.hspeed = random_range(-5, 5);
			shard.vspeed = random_range(-5, 1);
			shard.gravity = 0.1;
			shard.sprite_index = Soul_Bit_White;
			shard.image_blend = c_black;
		}
	}
}
MyHP -= global.Damage;
