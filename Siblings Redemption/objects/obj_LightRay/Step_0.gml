image_angle += spd;
xa += 0.004;
xa = clamp(xa, 0, 1);
if spd == 0
	spd = choose(-1, 1);
image_alpha = (1 * abs(spd)) * xa;
if instance_exists(obj_Soul_Flowey_Phase2Cutscene) {
	x = obj_Soul_Flowey_Phase2Cutscene.x;
	y = obj_Soul_Flowey_Phase2Cutscene.y;
}
if instance_exists(obj_CharaMonster_Phase4) {
	x = obj_CharaMonster_Phase4.x;
	y = obj_CharaMonster_Phase4.y;
}