if image_alpha > 0.6 && global.soulInv <= 0 && Timer <= 0 {
	//if collision_line(x - lengthdir_x(2000, Dir), y - lengthdir_y(2000, Dir), x + lengthdir_x(2000, Dir), y + lengthdir_y(2000, Dir), obj_Phase4_Soul, false, true) {
	global.soulInv = 10;
	global.NoHit = false;
	global.FG_Hits += 1;
	audio_play_sound(Hurt, 1, false);
	global.soul7_HP -= 30;
	if (global.EnemyGroup == 1) {
		if obj_CharaMonster_Phase1.Taunted {
			room_goto(Room_GameOver);
			exit;
		}
	}
	if (global.soul7_HP <= 0 && global.EnemyGroup > 6) {
		global.soul7_HP = 0;
		room_goto(Room_GameOver_Finale);
	}
	//}
}