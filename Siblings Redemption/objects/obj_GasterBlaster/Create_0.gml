DestinationX = 0;
DestinationY = 0;
DestinationAngle = 0;
Spawned = false;
Timer = 20;
Beam = noone;
nos = false;
Interval = 60;
NoDamage = false;
if global.EnemyGroup != 3 && global.EnemyGroup != 6 {
	audio_play_sound(GasterBlaster_Appear, 20, false);
	if global.EnemyGroup < 3
		image_blend = c_red;
}