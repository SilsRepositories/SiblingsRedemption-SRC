if global.soulInv <= 0 {
	global.soulInv = 10;
	audio_play_sound(Hurt, 1, false);
	global.FG_Hits += 0;
	global.NoHit = false;
	global.soul7_HP -= 15;
	if (global.soul7_HP <= 0) {
		global.soul7_HP = 0;
		room_goto(Room_GameOver_Finale);
	}
}