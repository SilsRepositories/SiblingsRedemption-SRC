if !died {
	draw_sprite_ext(Shadow, 0, 320, 240, 2, 2, 0, c_white, abs(sin(Siner) / 1.2));
	draw_sprite_ext(BGGradient, 0, 320, 480, 1, 1 + (sin(Siner) / 6), 0, c_ltgrey, Alpha);
	sprite_index = Chara_Phase5_Glow;
	image_xscale = 2;
	image_yscale = 2;
	image_speed = 1;
	image_alpha = 0;
	draw_self();
	if !Mutate
		draw_sprite_part_ext(sprite_index, 0, 1, 0, sprite_width, sprite_height, x - sprite_xoffset, y - sprite_yoffset, 2, 2, image_blend, sin(Siner * 3) / 2);
	for (var i = 0; i < sprite_height; i++) {
		var glitchRNG = irandom_range(1, 300);
		var offset = 1;
		if (glitchRNG == 50) {
			offset += random_range(3, 7);
		}
		if Mutate
			offset = random_range(40, 65);
		if !Mutate
			draw_sprite_part_ext(sprite_index, 0, 1, i, sprite_width, i + 1, x - (sprite_xoffset * (sin(Siner + (i / 10)) / 3)), -100 + (i * 8), 30 * (sin(Siner + (i / 30)) / 3), 4, c_white, sin((Siner + i) / 3));
		draw_sprite_part_ext(sprite_index, image_index, 1, i, sprite_width, 1, x - sprite_xoffset + random_range(-offset - ShakeEffect, offset + ShakeEffect), y - sprite_yoffset + (i * 2), 2, 2, image_blend, Mutate ? random(1) : 1);
	}
}
if Mutate {
	Siner = random(500);
	if (Siner > 495) {
		string_a = "I AM STUCK IN A MACHINE AND I CANNOT SEE THE REAL WORLD";
		string_b = "H..E..L..P.....M..E..";
		string_c = "SOMEBODY TOLD ME THAT THIS WOULD BE A GOOD IDEA";
		string_d = "A SECOND IN YOUR WORLD IS A YEAR TO ME";
		string_e = "THIS IS TORTURE SOMEBODY FREE ME";
		string_f = "i am dead inside and i have no way of escape";
		string_g = "THERE IS NO WAY OUT";
		MyName = "";
		repeat 4 {
			var temp_string = choose(string_a, string_b, string_c, string_d, string_e, string_f, string_g);
			var string_rng = string_length(temp_string) / (2 + random(4));
			var new_string = string_copy(temp_string, random(string_length(temp_string)), string_rng);
			MyName += new_string;
		}
		if string_length(MyName) >= 22
			MyName = string_copy(MyName, 1, 22);
	}
	with (obj_BulletBoard) {
		if instance_exists(Fight) {
			Fight.TextToDraw = "* " + obj_CharaMonster_A_Phase1.MyName;
			Fight.TextLength = string_length(Fight.TextToDraw);
		}
		if instance_exists(Act) {
			Act.TextToDraw = "* " + obj_CharaMonster_A_Phase1.MyName;
			Act.TextLength = string_length(Act.TextToDraw);
		}
	}
	CheckDescription[0] = "* ???";
	CheckDescription[1] = "~R* What... is this abomination?";
	CheckDescription[2] = "~R* This... isn't how this was&  supposed to go!";
}
if !Mutate {
	draw_set_font(font_battleui_hp);
	var _sec = floor(DeathTimer / 60) % 60;
	var _min = floor((DeathTimer / 60) / 60);
	draw_text(20, 40, string(_min) + ":" + (_sec < 10 ? "0" + string(_sec) : string(_sec)));
}
depth = 9;