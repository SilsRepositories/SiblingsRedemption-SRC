if speed > 0 && global.soulInv <= 0 {
	global.soulInv = 10;
	audio_play_sound(Hurt, 1, false);
	global.soul7_HP -= 15;
	global.NoHit = false;
	global.FG_Hits += 1;
	if (global.soul7_HP <= 0) {
		global.soul7_HP = 0;
		room_goto(Room_GameOver_Finale);
	}
}