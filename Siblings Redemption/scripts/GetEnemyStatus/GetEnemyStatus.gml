// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetEnemyStatus() {
	if (global.EnemyGroup == 1) {
		var turn = obj_CharaMonster_Phase1.Turn;
		choices[0] = "* Doom awaits you."
		choices[1] = "* You feel like you're going to&  have a ~RBLOODY~W time."
		choices[2] = "* Here lies fate."
		choices[3] = "* Death awaits."
		choices[4] = "* Flowey trembles nervously."
		choices[5] = "* Flowey is having second&  thoughts."
		
		choices[6] = "* ..."
		if turn > 6 {
			turn = 6;
		}
		
		choices[7] = "* Finish them off."
		if obj_CharaMonster_Phase1.MercyTries == 1
			return "~R* What do you think you're&  doing?";
		if obj_CharaMonster_Phase1.MercyTries == 2
			return "~R* Stop it.";
		if obj_CharaMonster_Phase1.MercyTries == 3
			return "~R* Just kill them already.";
		if obj_CharaMonster_Phase1.MercyTries == 4
			return "~R* Do that one more time.";
		if obj_CharaMonster_Phase1.MercyTries == 5
			return "* YOU WILL REGRET THIS.";
		if obj_FloweyMonster_Phase1.MyHP < 0.5
			return choices[7];
		return choices[turn];
	}
	if (global.EnemyGroup == 2) {
		choices[0] = "* What just happened?"
		choices[1] = "* What is this amalgamate?"
		choices[2] = "* You have no idea what they are&  talking about."
		choices[3] = "* How do they know this?"
		choices[4] = "* Who's HE?"
		choices[5] = "* Just keep attacking."
		choices[6] = "* Keep attacking."
		choices[7] = "* It will end eventually."	
		choices[8] = "* Chara is getting ready for&  their special attack."
		choices[9] = "* It's coming..."
		
		choices[10] = "* Now or never!"
		if obj_CharaMonster_Phase2.Turn >= 10 {
			if global.NoHeal {
				SetChaText("NO HEAL PHASE 2");
			}
			if (global.NoHit) {
				UnlockAchievement(5);
				SetChaText("NO HIT PHASE 2");
			}
			UpdateSF(2, global.NoHeal, global.NoHit);
				
			global.NoHit = false;
			global.NoHeal = false;
			return choices[10];
		}
		return choices[obj_CharaMonster_Phase2.Turn];
	}
	if (global.EnemyGroup == 3) {
		choices[0] = "* WHAT THE?!"
		choices[1] = "~R* This isn't right."
		choices[2] = "* The strings vibrate with a&  spinechilling tone."
		choices[3] = "* You feel like you're in danger."
		choices[4] = "* The hands appear to be...&  laughing?"
		choices[5] = "* Wingdings fill your veins."
		choices[6] = "* You're held together with&  determination."
		choices[7] = "* You're prepared."
		
		return choices[obj_CharaMonster_Phase3.Turn];
	}
	if (global.EnemyGroup == 5) {
		var turn = obj_CharaMonster_A_Phase1.Turn;
		choices[0] = "* You feel like you've been here&  before..."
		choices[1] = "* Chara stands there menacingly."
		choices[2] = "* Your face shrivels up in&  horror."
		choices[3] = "* There is no escape."
		choices[4] = "~R* No escape? I'll be the judge&  of that!"
		choices[5] = "~R* This is taking forever."
		choices[6] = "~R* I've just gotta keep slashing..."
		choices[7] = "~R* No matter what, I must win."
		choices[8] = "~R* I WILL NOT STAND DOWN."
		choices[9] = "~R* THE END IS NEAR."
		choices[10] = "~R* ..."
		if (turn > 10) {
			turn = 10;
		}
		return choices[turn];
	}
	return "* But nobody came.";
}