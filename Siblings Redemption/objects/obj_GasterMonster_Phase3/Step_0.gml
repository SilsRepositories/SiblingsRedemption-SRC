for (var i = 0; i < array_length(global.Monster); i++) {
	if instance_exists(global.Monster[i]) {
		if (global.Monster[i].alarm[4] > 0) {
			if instance_exists(obj_SpeechBubble) {
				global.Monster[i].alarm[4] = 3;
			}
		}
	}
}
if (Myself == -1) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if global.Monster[i] == id {
			Myself = i;
			break;
		}
	}
}

if instance_exists(Dialogue) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if instance_exists(global.Monster[i]) {
			with global.Monster[i] {
				ReadyForBattle = true;
				if i != Myself
					if instance_exists(Dialogue)
						instance_destroy(Dialogue);
			}
		}
	}
}
else {
	if ReadyForBattle {
		if instance_exists(obj_TextElement) {
			ReadyForBattle = false;
			alarm[0] = 2;
		}
	}
}