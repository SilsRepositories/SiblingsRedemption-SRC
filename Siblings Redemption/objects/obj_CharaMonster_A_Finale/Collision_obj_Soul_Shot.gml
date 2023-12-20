Hits -= 1;
if other.big {
	Hits -= 10;
	bla = instance_create_depth(0, 0, -10000, obj_HitFlash);
	bla.alp = 0.8;
	bla.timer = 30;
	audio_play_sound(snd_scytheburst, 0, false);
}
audio_play_sound(MonsterHurt, 0, false);
instance_destroy(other);
if (Hits <= 0) {
	Stage = 11;
	x = 427;
	trueX = 427;
	trueXS = 2;
	trueYS = 2;
	Charge = 0;
	audio_stop_sound(snd_chargeshot_charge);
	TargetAlph = 0;
	obj_Phase4_Soul.alp = 0;
	instance_destroy(FINALE_Master);
	instance_destroy(FINALE_ItemButton);
	
	if global.NoHeal
		SetChaText("NO HEAL PHASE 7");
	if global.NoHit
		SetChaText("NO HIT PHASE 7");
		
	if global.FG_Start == 5 {
		if global.FG_Heals == 0 {
			SetChaText("NO HEAL ALL AFTERLIFE PHASES");
			UnlockAchievement(10);
		}
		if global.FG_Hits == 0 {
			SetChaText("NO HIT ALL AFTERLIFE PHASES");
			UnlockAchievement(10);
			UnlockAchievement(11);
		}
	}
	
	if global.FG_Start == 1 {
		if global.FG_Heals == 0 {
			SetChaText("NO HEAL ALL 7 PHASES IN ONE GO!");
			UnlockAchievement(12);
		}
		if global.FG_Hits == 0 {
			SetChaText("ARE YOU HUMAN?!");
			UnlockAchievement(12);
			UnlockAchievement(13);
		}
	}
	
	DamageWriter = instance_create_depth(427, 50, -100, obj_MonsterHP);
	DamageWriter.MyHP = 9999;
	DamageWriter.MyCurrentHP = 9999;
	DamageWriter.MyHPToBe = 9999;
	DamageWriter.MyMaxHP = 9999;
	DamageWriter.ShowBar = true;
	DamageWriter.BarWidth = 600;
	DamageWriter.Damage = 9999999999999;
	
	instance_create_depth(0, 0, -10000, obj_HitFlash);
	audio_play_sound(mus_sfx_abreak, 0, false);
	audio_play_sound(mus_sfx_abreak2, 0, false);
	audio_play_sound(mus_sfx_gigapunch, 0, false);
	audio_play_sound(snd_scytheburst, 0, false);
	audio_play_sound(HeavyDamage, 0, false);
	instance_destroy(obj_Soul_Shot);
	ParalAlph = 0;
	alarm[2] = 120;
}