// Colour and font
var colour = DefaultColour;
var font = font_battle_dialogue;

// Default positioning
var sentence_x = 0;
var sentence_y = 0;

// Set the parameters for the space between letters and lines, mess with it all you want
var line_spacing = 30;
var letter_spacing = 16;

// Draws every letter that it has so far
for (var i = 0; i < TextLength; i++) {
	// Makes the text colour default, you can set it to whatever you want if you use the code below
	if string_char_at(TextToDraw, i + 1) == "~" {
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
		}
		i += 2;
	}
	}
	
	draw_set_color(colour);
	draw_set_font(font);
	
	// New line, use "}&" to include the & symbol otherwise it gets cancelled out
	// USAGE: "89 Snowdin Lane&Underground }& Co"
	if (string_char_at(TextToDraw, i + 1) == "&" && string_char_at(TextToDraw, i) != "}") {
		sentence_x = 0;
		sentence_y += line_spacing;
		i += 1;
	}
	
	// Used for text delays. Only use this for some long or creepy sentences.
	// USAGE: "@4You'd be dead where you stand."
	if (string_char_at(TextToDraw, i + 1) == "@") {
		TextDelay = 2 * real(string_char_at(TextToDraw, i + 2));
		if (TextDelay < 2) {
			TextDelay = 2;
		}
		i += 2;
	}
	
	// Draw the letters with the correct spacing, as defined above
	draw_text(x + sentence_x, y + sentence_y, string_char_at(TextToDraw, i + 1));
	sentence_x += letter_spacing;
}

// Sets the number of letters to draw, it ignores everything that we cancelled out above
if IsWriting {
	CurrentDelay += 1;
	if (CurrentDelay >= TextDelay) {
		CurrentDelay = 0;
		TextLength += 1;
		if string_char_at(TextToDraw, TextLength) != " " && CurrentDelay == 0 {
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
		if (string_char_at(TextToDraw, TextLength) == "." || string_char_at(TextToDraw, TextLength) == "?" || string_char_at(TextToDraw, TextLength) == "!") {
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
			alarm[0] = 180;
		}
	}
}