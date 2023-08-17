// Forces Demon Chara to chuck the button away if hovered over with either half of the soul
if place_meeting(x, y, obj_Phase4_Soul) {
	image_index = 1;
	if (obj_CharaMonster_A_Finale.Stage < 9.3) {
		obj_CharaMonster_A_Finale.Stage = 9.3;
		obj_CharaMonster_A_Finale.Timer = 0;
	}
}
else {
	image_index = 0;
}
x = lerp(x, TrueX, 0.2);
y = lerp(y, TrueY, 0.2);