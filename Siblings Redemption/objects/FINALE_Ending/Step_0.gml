if !instance_exists(obj_TextElement) {
	tim += 1;
}
// Keeps the music in line with the timer
if abs(audio_sound_get_track_position(currentMus) - (tim / 60)) > 0.1 {
	audio_sound_set_track_position(currentMus, (tim / 60));
}