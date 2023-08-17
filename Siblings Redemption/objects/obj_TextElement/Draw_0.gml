// Colour and font
var colour = DefaultColour;
var font = font_battle_dialogue;

// Default positioning
var sentence_x = 0;
var sentence_y = 0;

// Set the parameters for the space between letters and lines, mess with it all you want
var line_spacing = 30;
var letter_spacing = 16;
if (Talker == "Papyrus") {
	font = font_speech_papyrus;
	line_spacing = 15;
	letter_spacing = 10;
}
if (Talker == "SansA" || Talker == "SansB") {
	font = font_speech_sans;
	line_spacing = 15;
	letter_spacing = 9;
}
if (Talker == "Gaster") {
	font = font_gaster;
	line_spacing = 15;
	letter_spacing = 13;
}
if (room != BattleRoom && room != Room_GameOver && room != Room_Credits) {
	font = font_battle_dialogue_overworld;
	line_spacing /= 2;
	letter_spacing /= 2;
}
else {
	if (Talker == "Normal" || Talker == "FloweyA" || Talker == "Stranger") && instance_exists(obj_SpeechBubble) {
		font = font_speech_bubble;
		line_spacing = 15;
		letter_spacing = 9;
	}
}

StringF = "";
if string_char_at(TextToDraw, 1) == "~" {
	if string_char_at(TextToDraw, 2) == "M" {
		if string_char_at(TextToDraw, 3) == "0" {
			obj_SpeechBubble.x = global.Monster[0].xstart - 40;
			obj_SpeechBubble.y = global.Monster[0].y - 70;
			obj_SpeechBubble.image_xscale = -1;
			_ref = obj_FloweyMonster_Phase1;
			Talker = "FloweyA";
		}
		if string_char_at(TextToDraw, 3) == "1" {
			obj_SpeechBubble.image_xscale = 1;
			obj_SpeechBubble.x = global.Monster[1].x + 40;
			obj_SpeechBubble.y = global.Monster[1].y - 140;
			_ref = obj_CharaMonster_Phase1;
			Talker = "Normal";
		}
	}
}
// Draws every letter that it has so far
for (var i = 0; i < TextLength; i++) {
	if Talker == "Gaster" {
		var fontRNG = irandom(100);
		font = font_gaster;
		if (fontRNG < 80) {
			font = font_speech_bubble;
		}
		line_spacing = 15;
		letter_spacing = 13;
	}
	// Makes the text colour default, you can set it to whatever you want if you use the code below
	if string_char_at(TextToDraw, i + 1) == "~" {
		switch string_char_at(TextToDraw, i + 2) {
			case "W":
				colour = c_white;
				break;
			case "R":
				colour = c_red;
				break;
			case "O":
				colour = c_orange;
				break;
			case "Y":
				colour = c_yellow;
				break;
			case "G":
				colour = c_lime;
				break;
			case "A":
				colour = c_aqua;
				break;
			case "B":
				colour = c_blue;
				break;
			case "P":
				colour = c_fuchsia;
				break;
			case "D":
				colour = DefaultColour;
				break;
			case "F":
				_ref.Emotion = real(string_char_at(TextToDraw, i + 3));
				i += 1;
				break;
			case "M":
				if string_char_at(TextToDraw, i + 3) == "0" {
					obj_SpeechBubble.x = global.Monster[0].xstart - 40;
					obj_SpeechBubble.y = global.Monster[0].y - 70;
					obj_SpeechBubble.image_xscale = -1;
					_ref = obj_FloweyMonster_Phase1;
					Talker = "FloweyA";
				}
				if string_char_at(TextToDraw, i + 3) == "1" {
					obj_SpeechBubble.image_xscale = 1;
					obj_SpeechBubble.x = global.Monster[1].x + 40;
					obj_SpeechBubble.y = global.Monster[1].y - 140;
					_ref = obj_CharaMonster_Phase1;
					Talker = "Normal";
				}
				_ref.Emotion = real(string_char_at(TextToDraw, i + 4));
				i += 2;
				break;
		}
		i += 2;
	}
	if Talker == "DON'T" {
		colour = c_purple;
		ShakeEffect = 2;
	}
	
	draw_set_color(colour);
	draw_set_font(font);
	
	// New line, use "}&" to include the & symbol otherwise it gets cancelled out
	// USAGE: "89 Snowdin Lane&Underground }& Co"
	if (string_char_at(TextToDraw, i + 1) == "&" && string_char_at(TextToDraw, i) != "}") {
		sentence_x = 0;
		sentence_y += line_spacing;
		StringF = "";
		i += 1;
	}
	
	// Used for text delays. Only use this for some long or creepy sentences.
	// USAGE: "@4You'd be dead where you stand."
	if (string_char_at(TextToDraw, i + 1) == "@") {
		if string_char_at(TextToDraw, i + 2) != "S" {
			TextDelay = 2 * real(string_char_at(TextToDraw, i + 2));
			if (TextDelay < 2) {
				TextDelay = 2;
			}
		}
		else {
			TextDelay = 8;
			Unskippable = true;
		}
		i += 2;
	}
	
	// Draw the letters with the correct spacing, as defined above
	//draw_text(x + sentence_x + random_range(-ShakeEffect, ShakeEffect), y + sentence_y + random_range(-ShakeEffect, ShakeEffect), string_char_at(TextToDraw, i + 1));
	draw_text(x + string_width(StringF), y + sentence_y, string_char_at(TextToDraw, i + 1));
	StringF += string_char_at(TextToDraw, i + 1);
	sentence_x += letter_spacing;
}

// Sets the number of letters to draw, it ignores everything that we cancelled out above
if IsWriting {
	CurrentDelay += 1;
	if (CurrentDelay >= TextDelay) {
		CurrentDelay = 0;
		TextLength += 1;
		if string_char_at(TextToDraw, TextLength) != " " && string_char_at(TextToDraw, TextLength) != "~" && CurrentDelay == 0 {
			switch Talker {
				case "Normal":
					audio_play_sound(Talk_Normal, 20, false);
					break;
				case "Battle":
					audio_play_sound(Talk_Battle, 20, false);
					break;
				case "Alphys":
					audio_play_sound(Talk_Alphys, 20, false);
					break;
				case "Asgore":
					audio_play_sound(Talk_Asgore, 20, false);
					break;
				case "AsrielA":
					audio_play_sound(Talk_AsrielChild, 20, false);
					break;
				case "AsrielB":
					audio_play_sound(Talk_AsrielGod, 20, false);
					break;
				case "FloweyA":
					audio_play_sound(Talk_Flowey, 20, false);
					break;
				case "FloweyB":
					audio_play_sound(Talk_FloweyEvil, 20, false);
					break;
				case "Gaster":
					var snd = choose(Talk_Gaster1, Talk_Gaster2, Talk_Gaster3, Talk_Gaster4, Talk_Gaster5, Talk_Gaster6, Talk_Gaster7);
					audio_play_sound(snd, 20, false);
					break;
				case "Papyrus":
					audio_play_sound(Talk_Papyrus, 20, false);
					break;
				case "SansA":
					audio_play_sound(Talk_Sans, 20, false);
					break;
				case "SansB":
					audio_play_sound(Talk_SansToriel, 20, false);
					break;
				case "Toriel":
					audio_play_sound(Talk_Toriel, 20, false);
					break;
				case "UndyneA":
					audio_play_sound(Talk_Undyne, 20, false);
					break;
				case "UndyneB":
					audio_play_sound(Talk_UndyneTheUndying, 20, false);
					break;
				case "Stranger":
					audio_play_sound(snd_txt_strangeperson, 20, false);
					break;
				case "DON'T":
					audio_play_sound(Gigatalk, 20, false);
					CurrentDelay = -10;
					obj_BattleEffects.CMAB = 6;
					break;
			}
		}
		
		// Puts half a second of delay inbetween sentences.
		// USAGE: "I told you. I emptied the trash! What else do you want?"
		if ((string_char_at(TextToDraw, TextLength) == "." && string_char_at(TextToDraw, TextLength + 1) != ".") || string_char_at(TextToDraw, TextLength) == "?" || string_char_at(TextToDraw, TextLength) == "!") {
			CurrentDelay = -30;
		}
		
		// Slight pause in the middle of a sentence.
		// USAGE: "Well, don't you have anything else? I can help, it's the least I can do."
		if (string_char_at(TextToDraw, TextLength) == ",") {
			CurrentDelay = -15;
		}
		
		// Stops writing the text
		if (TextLength >= string_length(TextToDraw)) {
			IsWriting = false;
		}
	}
	if ((keyboard_check(ord("X")) || keyboard_check(ord("C")) || keyboard_check(vk_rshift) || keyboard_check(vk_rcontrol)) && !Unskippable) {
		TextLength = string_length(TextToDraw);
		IsWriting = false;
	}
}
else {
	// Moves on to the next line of text, or destroy the writer
	if ((keyboard_check_pressed(ord("Z")) || keyboard_check(ord("C")) || keyboard_check_pressed(vk_enter) || keyboard_check(vk_rcontrol)) && CanAdvance) {
		TextLength = 0;
		TextDelay = 2;
		CurrentDelay = 0;
		
		// Checks if there is any text in the queue
		if variable_instance_exists(id, "TextQueue") {
			// Checks if the queue is exhausted
			// Without this, your game will CRASH because it's trying to look in an unknown area of memory
			if (NumInQueue >= array_length(TextQueue)) {
				instance_destroy();
				exit;
			}
			TextToDraw = TextQueue[NumInQueue];
			CDL += 1;
		}
		else {
			// Sets the text to a signalling value to destroy the instance
			TextToDraw = "{end}";
		}
		
		IsWriting = true;
		if (TextToDraw == "" || TextToDraw == "{end}") {
			instance_destroy();
		}
		NumInQueue += 1;
	}
}