Dialogue = instance_create_depth(203, 388, -1000000, obj_TextElement_Phase4);
Dialogue.TextToDraw = "@2IMPOSSIBLE!";
Dialogue.TextQueue[0] = "@1THIS CAN'T BE&HAPPENING!";
Dialogue.Talker = "Stranger";
audio_stop_all();
audio_play_sound(sr_phase4_3, 0, false);
alarm[5] = 642;