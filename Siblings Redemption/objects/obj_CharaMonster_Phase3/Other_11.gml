var border_l = 320 - (obj_BulletBoard.current_width / 2);
var border_u = 384 - obj_BulletBoard.current_height;

Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
if MyHP > 1490 {
	if Strings > 2 {
		Dialogue.TextToDraw = "* You cut a string!";
		Strings -= 1;
		audio_play_sound(MonsterHurt, 0, false);
		global.Damage = 1;
	}
	else {
		Dialogue.TextToDraw = "* You prepare to cut the last&  strings...";
		EndingTime = true;
	}
}
else {
	Dialogue.TextToDraw = "* You try to cut a string...&  but it didn't work.";
}
Dialogue.CanAdvance = true;
Dialogue.Talker = "Battle";