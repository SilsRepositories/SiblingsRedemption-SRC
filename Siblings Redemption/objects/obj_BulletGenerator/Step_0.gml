if Turn == 50 {
	obj_BulletBoard.Show = false;
}
if (global.BorderWidth != obj_BulletBoard.current_width || global.BorderHeight != obj_BulletBoard.current_height) && Turn >= 30 {
	if !begi {
		if alarm[1] > 0 {
			alarm[1] += 1;
		}
		exit;
	}
}
else {
	begi = true;
}

switch Turn {
	// PHASE 1
	// Starter attack
	case 0:
		if alarm[1] == 410 MakeCSlash(320, obj_Soul.y, 90);
		if alarm[1] == 380 {
			b2 = instance_create_depth(-199, (global.BoardFloor + 50), -1000000, obj_Bullet);
			b2.behav = 6;
			b2.image_angle = 0;
			audio_play_sound(snd_spearappear, 0, false);
		}
		if alarm[1] == 340 {
			b2 = instance_create_depth(-199, 220, -1000000, obj_Bullet);
			b2.behav = 6;
			b2.image_angle = 180;
			audio_play_sound(snd_spearappear, 0, false);
		}
		if alarm[1] >= 200 && alarm[1] <= 250 && alarm[1] % 4 == 0 {
			b3 = instance_create_depth(obj_Soul.x, -99, 1, obj_Bullet);
			b3.behav = -1;
			b3.image_angle = -90;
			b3.vspeed = 18;
			audio_play_sound(snd_arrow, 0, false);
		}
		if alarm[1] == 190 MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(-20, 20));
		if alarm[1] == 150 {
			MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(70, 110));
			instance_create_depth(100, 100, -1, obj_Bullet);
			instance_create_depth(540, 100, -1, obj_Bullet);
		}
		break;
	// Starter attack, Flowey equivalent
	case 0.5:
		if alarm[1] > 100 {
			if alarm[1] % 100 >= 75 && alarm[1] % 3 == 0 {
				pel = instance_create_depth(-9999, obj_Soul.y, -1, obj_Flowey_Pellet);
				pel.cenx = 320;
				pel.ceny = 384 - (global.BorderHeight / 2);
				pel.di = ((alarm[1] % 25) / 25) * 360;
				pel.ai = 2;
			}
		}
		if alarm[1] % 100 == 20 {
			with obj_Flowey_Pellet {
				if ai == 2
					ai = 3;
			}
		}
		break;
	// Knife boomerang attack
	case 1:
		if alarm[1] % 50 == 0 {
			b = instance_create_depth(choose(150, 490), obj_Soul.y, -1, obj_Bullet);
			b.behav = 4;
		}
		if alarm[1] % 110 == 3 {
			MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(70, 110));
		}
		break;
	// "Chara worm dance" attack
	case 2:
		if !instance_exists(obj_Bullet) {
			for (var i = 0; i < 7; i++) {
				b = instance_create_depth(240, 384 - (20 * i), 1, obj_Bullet);
				b.behav = 2;
				b.image_blend = c_red;
				b.siner = (90 * (i / 6));
			}
			for (var i = 0; i < 7; i++) {
				b = instance_create_depth(400, 384 - (20 * i), 1, obj_Bullet);
				b.behav = 2;
				b.image_angle = 180;
				b.image_blend = c_red;
				b.siner = (90 * (i / 6));
			}
		}

		if alarm[1] == 700 {
			var vin1 = instance_create_depth(global.LeftEdge, 264, 1, obj_Vine);
			vin1.targs = 1;
			var vin2 = instance_create_depth(global.RightEdge, 384, 1, obj_Vine);
			vin2.targs = -1;
		}
		
		if alarm[1] <= 400 && alarm[1] % 100 == 0 {
			MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(70, 110));
		}
		break;
	// "Chara worm dance" attack, Flowey equivalent
	case 2.5:
		if alarm[1] > 140 {
			if alarm[1] % 140 == 110 {
				var l = 0;
				repeat 36 {
					pel = instance_create_depth(choose(random_range(50, 200), random_range(440, 590)), random_range(250, 370), -1, obj_Flowey_Pellet);
					pel.cenx = 320;
					pel.ceny = 384 - (global.BorderHeight / 2);
					pel.ai = 2;
					pel.di = l * 10;
					pel.image_blend = c_aqua;
					l += 1;
				}
				audio_play_sound(snd_shakerbreaker, 0, false);
			}
		}
		if alarm[1] % 140 == 60 {
			with obj_Flowey_Pellet {
				if ai == 2
					ai = 3;
			}
		}
		break;
	// Red knife chase followed by quick knife gaps
	case 3:
		if alarm[1] > 200 {
			if alarm[1] % 30 == 3 {
				var dir = choose(0, 1);
				if dir == 0 {
					b = instance_create_depth(-30, obj_Soul.y, 1, obj_Bullet);
					b.behav = -1;
					b.image_blend = c_red;
					b.hspeed = 5 + random(1);
				}
				if dir == 1 {
					b = instance_create_depth(670, obj_Soul.y, 1, obj_Bullet);
					b.behav = -1;
					b.image_angle = 180;
					b.image_blend = c_red;
					b.hspeed = -5 - random(1);
				}
			}
			if alarm[1] % 140 == 3 {
				MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(-20, 20));
				MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(70, 110));
			}
		}
		if alarm[1] == 120 {
			var i = 0;
			repeat 4 {
				b1 = instance_create_depth(220, global.BoardFloor - (i * 40), 1, obj_Bullet);
				b1.behav = 10;
				b1.Inside = false;
				b1.image_angle = 0;
				b1.direction = 0;
				b1.speed = -3;
				i += 1;
			}
		}
		if alarm[1] == 90 {
			var i = 0;
			repeat 3 {
				b1 = instance_create_depth(420, (global.BoardFloor - 20) - (i * 40), 1, obj_Bullet);
				b1.behav = 10;
				b1.Inside = false;
				b1.image_angle = 180;
				b1.direction = 180;
				b1.speed = -3;
				i += 1;
			}
		}
		break;
	// Flowey's nervous effort to help with that attack
	case 3.5:
		if alarm[1] % 100 == 0 {
			instance_create_depth(random_range(80, 560), random_range(0, 120), -1, obj_Flowey_Pellet);
		}
		break;
	// Spinning circle attack
	case 4:
		var Angle = 0;
		repeat 6 {
			b = instance_create_depth(320, 304, 1, obj_Bullet);
			b.behav = 3;
			b.ang = Angle;
			b.siner = 80;
			if Angle % 120 == 0 {
				b.image_blend = c_red;
			}
			Angle += 60;
		}
		Turn = 4.1;
		break;
	// "Last resort" attack
	case 5:
		if alarm[1] == 810 {
			audio_play_sound(Swipe, 0, false);
			b = instance_create_depth(-30, obj_Soul.y, 1, obj_Bullet);
			b.behav = -1;
			b.image_blend = c_red;
			b.hspeed = 21 + random(1);	
		}
		if alarm[1] == 770 {
			audio_play_sound(Swipe, 0, false);
			b = instance_create_depth(670, obj_Soul.y, 1, obj_Bullet);
			b.behav = -1;
			b.image_angle = 180;
			b.image_blend = c_red;
			b.hspeed = -21 - random(1);
		}
		if alarm[1] == 730 {
			global.BorderWidth += 40;
			MakeCSlash(320, 0, 90);
			var l = 0;
			
			// Has Flowey been killed beforehand?
			if obj_FloweyMonster_Phase1.MyHP > 0.5 {
				repeat 36 {
					pel = instance_create_depth(choose(random_range(50, 200), random_range(440, 590)), random_range(250, 370), -1, obj_Flowey_Pellet);
					pel.cenx = 320;
					pel.ceny = 384 - (global.BorderHeight / 2);
					pel.ai = 2;
					pel.di = l * 10;
					pel.image_blend = c_aqua;
					l += 1;
				}
				audio_play_sound(snd_shakerbreaker, 0, false);
			}
		}
		if alarm[1] == 710 {
			MakeCSlash(300, 0, 90);
			MakeCSlash(340, 0, 90);
		}
		if alarm[1] == 690 {
			MakeCSlash(280, 0, 90);
			MakeCSlash(360, 0, 90);
		}
		if alarm[1] == 670 {
			MakeCSlash(260, 0, 90);
			MakeCSlash(380, 0, 90);
			with obj_Flowey_Pellet {
				if ai == 2
					ai = 3;
			}
		}
		if alarm[1] == 650 {
			MakeCSlash(240, 0, 90);
			MakeCSlash(400, 0, 90);
		}
		if alarm[1] == 630 {
			MakeCSlash(220, 0, 90);
			MakeCSlash(420, 0, 90);
		}
		if alarm[1] == 580 {
			b = instance_create_depth(global.RightEdge + 20, (global.BoardFloor - global.BorderHeight) + 20, 1, obj_Bullet);
			b.Inside = true;
			b.behav = -1;
			b.image_angle = -90
			b.hspeed = -4;
		
			b2 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor - 20, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = 90
			b2.hspeed = 4;
		
			audio_play_sound(mus_sfx_a_pullback, 0, false);
			MakeCSlash(320, global.BoardFloor - (global.BorderHeight / 2), 0);
		}
		if alarm[1] == 520 {
			b = instance_create_depth(global.RightEdge + 20, global.BoardFloor - 20, 1, obj_Bullet);
			b.Inside = true;
			b.behav = -1;
			b.image_angle = 90
			b.hspeed = -4;
		
			b2 = instance_create_depth(global.LeftEdge - 20, (global.BoardFloor - global.BorderHeight) + 20, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = -90
			b2.hspeed = 4;
		
			audio_play_sound(mus_sfx_a_pullback, 0, false);
			MakeCSlash(320, global.BoardFloor - (global.BorderHeight / 2), 0);
		}
		if alarm[1] == 450 {
			global.BorderWidth = 500;
			global.BorderHeight = 90;
			var kni = 0;
			audio_play_sound(mus_sfx_a_pullback, 0, false);
			repeat 8 {
				b = instance_create_depth(320 - (20 * kni), 250 - (30 * kni), 1, obj_Bullet);
				b.behav = -1;
				b.image_angle = -90;
				b.image_blend = c_red;
				b.vspeed = 6;
				b.Inside = true;
			
				b2 = instance_create_depth(320 + (20 * kni), 250 - (30 * kni), 1, obj_Bullet);
				b2.behav = -1;
				b2.image_angle = -90;
				b2.image_blend = c_red;
				b2.vspeed = 6;
				b2.Inside = true;
			
				b3 = instance_create_depth(320 - (20 * kni), 420 + (30 * kni), 1, obj_Bullet);
				b3.behav = -1;
				b3.image_angle = 90;
				b3.image_blend = c_red;
				b3.vspeed = -6;
				b3.Inside = true;
			
				b4 = instance_create_depth(320 + (20 * kni), 420 + (30 * kni), 1, obj_Bullet);
				b4.behav = -1;
				b4.image_angle = 90;
				b4.image_blend = c_red;
				b4.vspeed = -6;
				b4.Inside = true;
				kni += 1;
			}
		}
		if alarm[1] == 400 {
			for (var h = 0; h < 6; h++) {
				b = instance_create_depth(global.LeftEdge - 20, global.BoardFloor - (20 * h), 1, obj_Bullet);
				b.behav = -1;
				b.Inside = true;
				b.hspeed = 0.66;
			
				c = instance_create_depth(global.RightEdge + 20, global.BoardFloor - (20 * h), 1, obj_Bullet);
				c.behav = -1;
				c.Inside = true;
				c.image_angle = 180;
				c.hspeed = -0.66;
			}
			audio_play_sound(snd_spearrise, 0, false);
		}
		if alarm[1] >= 100 && alarm[1] <= 400 {
			global.BorderWidth -= 1.3667;
			if alarm[1] % 50 == 0 {
				for (var i = -1; i < 2; i += 2) {
					b1 = instance_create_depth(320 - (i * 60), global.BoardFloor + 40, 1, obj_Bullet);
					b1.Inside = true;
					b1.behav = -1;
					b1.image_angle = 90
					b1.vspeed = -2;
			
					b2 = instance_create_depth(320 - (i * 105), (global.BoardFloor - global.BorderHeight) - 40, 1, obj_Bullet);
					b2.Inside = true;
					b2.behav = -1;
					b2.image_angle = -90
					b2.vspeed = 2;
				
					b3 = instance_create_depth(320 - (i * 150), global.BoardFloor + 40, 1, obj_Bullet);
					b3.Inside = true;
					b3.behav = -1;
					b3.image_angle = 90
					b3.vspeed = -2;
				}
			}
		}
		if alarm[1] == 80 {
			with (obj_Bullet) {
				image_blend = c_orange;
				friction = -0.2;
			}
			MakeCSlash(320, 339, 45);
			MakeCSlash(320, 339, -45);
		}
		break;
	// Easier knife circle attack
	case 6:
		var Angle = 0;
		repeat 4 {
			b = instance_create_depth(320, 304, 1, obj_Bullet);
			b.behav = 3;
			b.ang = Angle;
			b.siner = 80;
			Angle += 90;
		}
		Turn = 6.1;
		break;
	// Flowey's little help with attack 4 and 6
	case 4.1:
	case 6.1:
		if alarm[1] % 120 == 0 {
			MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
		}
		break;
	// PHASE 2
	// Knife chase attack, this used to have blasters but I took them out
	case 9:
		if alarm[1] == 320 {
			obj_BattleEffects.Rotation = 180;
			audio_play_sound(asset_get_index("mus_dialup_" + string(choose(0,1,2,3,4))), 0, false);
			Mo = true;
		}
		if alarm[1] % 320 == 319 {
			var _x = random_range(80, 560);
			var _y = random_range(0, 120);
			b = instance_create_depth(_x, _y, 1, obj_Bullet);
			b.behav = 5;
			b.image_angle = point_direction(_x, _y, obj_Soul.x, obj_Soul.y);
			b.image_alpha = 0;
			b.direction = b.image_angle;
			b.speed = -2;
			b.disocon = false;
		}
		if alarm[1] % 45 == 0 && alarm[1] >= 320 {
			//CreateGB(choose(30, 610), obj_Soul.y, 90, alarm[1] - 90, 1, 2, true);
		
			var _x = choose(80, 560);
			var _y = random_range(284, 384);
			b = instance_create_depth(_x, _y, 1, obj_Bullet);
			b.behav = 7;
			b.image_angle = point_direction(_x, _y, obj_Soul.x, obj_Soul.y);
			b.image_alpha = 0;
			b.disocon = false;
		}
		break;
	// Vine knife swing
	case 10:
		global.BorderWidth = 300;
		global.BorderHeight = 175;
		A2 += 1;
		if A2 == 50 {
			instance_create_depth(320, 30, 1, obj_VineKnife);	
		}
		if alarm[1] < 1060 && alarm[1] % 8 == 0 {
			b4 = instance_create_depth(global.LeftEdge - 20, 400, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = 90;
			b4.hspeed = 5;
		}
		if alarm[1] % 140 == 0 {
			instance_create_depth(random_range(40, 600), random(200), 1, obj_Bullet);
			instance_create_depth(random_range(40, 600), random(200), 1, obj_Bullet);

			var _x = random_range(global.LeftEdge - 100, global.RightEdge + 100);
			ShrikeBig = instance_create_depth(_x, -40, 0, obj_Shrike_Big);
			ShrikeBig.direction = point_direction(_x, -40, obj_Soul.x, obj_Soul.y);
			ShrikeBig.speed = 5;
		}
		break;
	// Circle movement attack with screen flip
	case 11:
		if alarm[1] > 150 {
			if alarm[1] % 40 == 0 {
				b5 = instance_create_depth(global.RightEdge + 20, global.BoardFloor + 92, 1, obj_Bullet);
				b5.Inside = true;
				b5.behav = -1;
				b5.image_angle = 90;
				b5.hspeed = -2;
			}
			if alarm[1] % 40 == 20 {
				b6 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor + 30, 1, obj_Bullet);
				b6.Inside = true;
				b6.behav = -1;
				b6.image_angle = -90;
				b6.hspeed = 1.3;
			}
		}
		if alarm[1] == 150 {
			b2 = instance_create_depth(-199, (global.BoardFloor - 30), 1, obj_Bullet);
			b2.behav = 6;
			b2.image_angle = 0;
			audio_play_sound(snd_spearappear, 0, false);
		}
		if alarm[1] == 450 {
			obj_BattleEffects.Rotation = 90;
			audio_play_sound(asset_get_index("mus_dialup_" + string(choose(0,1,2,3,4))), 0, false);
			Mo = true;
		}
		break;
	// Small "Mettaton" attack, this isn't really Mettaton but they're meant to be orbs
	case 12:
		if alarm[1] % 90 == 0 {
			var _x = random_range(global.LeftEdge - 100, global.RightEdge + 100);
			ShrikeBig = instance_create_depth(_x, -40, 0, obj_Shrike_Big);
			ShrikeBig.direction = point_direction(_x, -40, obj_Soul.x, obj_Soul.y);
			ShrikeBig.speed = 5;
		}
		break;
	// Orb attack with knives
	case 13:
		global.BoardFloor = 384 - global.BorderHeight;
		if alarm[1] % 100 == 0 {
			b5 = instance_create_depth(global.RightEdge + 20, global.BoardFloor + 92, 1, obj_Bullet);
			b5.Inside = true;
			b5.behav = -1;
			b5.image_angle = 90;
			b5.hspeed = -3;
		}
		if alarm[1] % 100 == 50 {
			b6 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor + 30, 1, obj_Bullet);
			b6.Inside = true;
			b6.behav = -1;
			b6.image_angle = -90;
			b6.hspeed = 3;
		}
		if alarm[1] % 200 == 0 {
			var _x = random_range(global.LeftEdge - 100, global.RightEdge + 100);
			ShrikeBig = instance_create_depth(_x, -40, 0, obj_Shrike_Big);
			ShrikeBig.direction = point_direction(_x, -40, obj_Soul.x, obj_Soul.y);
			ShrikeBig.speed = 5;
		}
		break;
	// Knife circle attack from before but shielded
	case 14:
		if alarm[1] == 400 {
			var Angle = 0;
			repeat 4 {
				b = instance_create_depth(320, 304, 1, obj_Bullet);
				b.behav = 3;
				b.ang = Angle;
				b.siner = 80;
				Angle += 90;
			}
		}
		if alarm[1] % 6 == 0 && alarm[1] < 380 {
			b3 = instance_create_depth(global.RightEdge + 20, 390, 1, obj_Bullet);
			b3.Inside = true;
			b3.behav = -1;
			b3.image_angle = 90;
			b3.hspeed = -5;
		
			b4 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = -90;
			b4.hspeed = 5;
		}
		break;
	// Slice attack
	case 15:
		global.BoardFloor = 384 - global.BorderHeight;
		global.BorderHeight = 120;
		if alarm[1] % 60 == 0 {
			var i = 0;
			repeat 4 {
				b1 = instance_create_depth(-199, global.BoardFloor + (i * 40), 1, obj_Bullet);
				b1.behav = -1;
				b1.image_angle = 0;
				b1.hspeed = 4;
				i += 1;
			}
		}
		if alarm[1] % 60 == 30 {
			var i = 0;
			repeat 3 {
				b1 = instance_create_depth(-199, (global.BoardFloor + 20) + (i * 40), 1, obj_Bullet);
				b1.behav = -1;
				b1.image_angle = 0;
				b1.hspeed = 4;
				i += 1;
			}
		}
		if alarm[1] % 120 == 119 {
			b2 = instance_create_depth(-199, (global.BoardFloor - 30), 1, obj_Bullet);
			b2.behav = 6;
			b2.image_angle = 0;
			audio_play_sound(snd_spearappear, 0, false);
		}
		break;
	// Random slow knife attack
	case 16:
		global.BoardFloor = 384 - global.BorderHeight;
		if alarm[1] % 6 == 0 {
			b1 = instance_create_depth(global.RightEdge + 20, 390, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 90;
			b1.hspeed = -5;
		
			b2 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = -90;
			b2.hspeed = 5;
		}
		if global.BorderWidth == obj_BulletBoard.current_width && global.BorderHeight == obj_BulletBoard.current_height {
			if alarm[1] % 40 == 0 {
				var pick = choose(1, 2, 3, 4);
				if pick == 1 {
					for (var i = 0; i < 2; i++) {
						b3 = instance_create_depth(global.RightEdge + (i * 20), 360, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = 90;
						b3.hspeed = -2;
					}
				}
				if pick == 2 {
					for (var i = 0; i < 2; i++) {
						b3 = instance_create_depth(global.RightEdge + (i * 20), global.BoardFloor + 30, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = -90;
						b3.hspeed = -2;
					}
				}
				if pick == 3 {
					for (var i = 0; i < 2; i++) {
						b3 = instance_create_depth(global.LeftEdge - (i * 20), 360, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = 90;
						b3.hspeed = 2;
					}
				}
				if pick == 4 {
					for (var i = 0; i < 2; i++) {
						b3 = instance_create_depth(global.LeftEdge - (i * 20), global.BoardFloor + 30, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = -90;
						b3.hspeed = 2;
					}
				}
			}
		}
		break;
	// "Last resort" attack for Phase 2
	case 18:
		P2FT += 1;
		if P2FT == 1 {
			ChangeSoulAngle(0);
			SetSoulMode("RED");
			Dialogue = instance_create_depth(120, 90, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "A blurry memory comes&into your head...";
			Dialogue.Talker = "Silent";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if P2FT == 400 {
			instance_destroy(Dialogue);
			Dialogue2 = instance_create_depth(120, 40, -1000000, obj_TextElement);
			Dialogue2.TextToDraw = "You gather all your&courage, and remember&all of the trouble&you went through to&get here.";
			Dialogue2.Talker = "Silent";
			Dialogue2.Unskippable = true;
			Dialogue2.CanAdvance = false;
		}
		if P2FT == 818 {
			instance_destroy(Dialogue2);
			global.BorderHeight = 400;
			global.BorderWidth = 100;
			reflect = instance_create_depth(220, 120, -10000, obj_Reflection);
			reflect.image_alpha = 0;
			reflect.image_xscale = 1.5;
			reflect.image_yscale = 1.5;
		}
		if P2FT > 818 && P2FT < 1106 {
			if P2FT % 6 == 0 {
				bul1 = instance_create_depth(260 - (sin(P2FT / 15) * 40), -50, 1, obj_Bullet);
				bul1.behav = -1;
				bul1.vspeed = 5;
				bul1.Inside = true;
	
				bul2 = instance_create_depth(380 - (sin(P2FT / 15) * 40), -50, 1, obj_Bullet);
				bul2.behav = -1;
				bul2.vspeed = 5;
				bul2.Inside = true;
				bul2.image_angle = 180;
			}
			if P2FT % 80 == 0 {
				MakeCSlash(obj_Soul.x, obj_Soul.y, random_range(-5, 5));
			}
		}
		if P2FT == 1226 {
			ChangeSoulAngle(0);
			global.BorderHeight = 70;
			global.BorderWidth = 400;
		}
		if P2FT > 1226 && P2FT < 1540 {
			reflect.image_alpha += 0.01;
			if reflect.image_alpha > 0.4 {
				reflect.image_alpha = 0.4;
			}
			if P2FT % 35 == 0 {
				bul1 = instance_create_depth(540, global.BoardFloor, 1, obj_Bullet);
				bul1.behav = -1;
				bul1.hspeed = -4;
				bul1.Inside = true;
				bul1.image_angle = 90;

				bul2 = instance_create_depth(100, global.BoardFloor - 72, 1, obj_Bullet);
				bul2.behav = -1;
				bul2.hspeed = 4;
				bul2.Inside = true;
				bul2.image_angle = -90;
			}
		}
		if P2FT == 1634 {
			reflect.x = 90;
			reflect.y = 90;
			reflect.image_index += 1;
			ChangeSoulAngle(0);
			SetSoulMode("GREEN");
		}
		if P2FT > 1634 && P2FT < 1970 {
			if P2FT % 18 == 0 {
				var shieldRNG = choose(0, 1, 2, 3);
				if shieldRNG == 0 {
					up = instance_create_depth(320, -80, 1, obj_Bullet);
					up.image_angle = -90;
					up.vspeed = 7;
					up.behav = -1;
				}
				else if shieldRNG == 1 {
					down = instance_create_depth(320, 560, 1, obj_Bullet);
					down.image_angle = 90;
					down.vspeed = -7;
					down.behav = -1;
				}	
				else if shieldRNG == 2 {
					left = instance_create_depth(0, 240, 1, obj_Bullet);
					left.image_angle = 0;
					left.hspeed = 7;
					left.behav = -1;
				}	
				else {
					right = instance_create_depth(640, 240, 1, obj_Bullet);
					right.image_angle = 180;
					right.hspeed = -7;
					right.behav = -1;
				}
			}
		}
		if P2FT == 2044 {
			reflect.x = 340;
			reflect.y = 140;
			reflect.image_index += 1;
			global.BorderWidth = 384;
			global.BorderHeight = 72;
			SetSoulMode("PURPLE");
			instance_destroy(obj_Soul_Shield);
			obj_BulletBoard.current_offsety = 0;
		}
		if P2FT > 2044 && P2FT < 2830 {
			if P2FT % 30 == 0 {
				var lineRNG = choose(obj_Soul.PURPLE_Line1Height, obj_Soul.PURPLE_Line2Height, obj_Soul.PURPLE_Line3Height);
				var dirRNG = choose(0, 180);
				if dirRNG == 0 {
					left = instance_create_depth(-40, lineRNG, 1, obj_Bullet);
					left.image_angle = 0;
					left.hspeed = 6;
					left.behav = -1;
				}	
				else {
					right = instance_create_depth(680, lineRNG, 1, obj_Bullet);
					right.image_angle = 180;
					right.hspeed = -6;
					right.behav = -1;
				}
			}
			if P2FT % 150 == 0 {
				MakeCSlash(obj_Soul.x, obj_Soul.y, 0);
			}
		}
		if P2FT == 2980 {
			global.BorderWidth = 300;
			global.BorderHeight = 16;
			ChangeSoulAngle(0);
			SetSoulMode("RED");
			// global.PlayerHP = global.PlayerMaxHP;
		}
		if P2FT > 2980 && P2FT < 3170 {
			reflect.image_alpha -= 0.004;
			if reflect.image_alpha <= 0 {
				reflect.image_alpha = 0
			}
			if P2FT % 20 == 0 {
				var shieldRNG = choose(0, 1);
				if shieldRNG == 0 {
					left = instance_create_depth(680, global.BoardFloor, 1, obj_Bullet);
					left.image_angle = 90;
					left.hspeed = -7;
					left.behav = -1;
					left.image_blend = choose(c_aqua, c_orange);
				}	
				if shieldRNG == 1 {
					right = instance_create_depth(-40, global.BoardFloor, 1, obj_Bullet);
					right.image_angle = 90;
					right.hspeed = 7;
					right.behav = -1;
					right.image_blend = choose(c_aqua, c_orange);
				}
			}
		}
		if P2FT == 3270 {
			global.BorderWidth = 130;
			global.BorderHeight = 80;
			ChangeSoulAngle(0);
			SetSoulMode("RED");
			obj_BulletBoard.current_offsety = 0;
			if !global.NoHeal
				global.PlayerHP = global.PlayerMaxHP;
			obj_BulletBoard.current_offsetx = -200;
			instance_destroy(obj_Bullet);
		}
		if P2FT > 3270 && P2FT < 4070 {
			obj_BulletBoard.current_offsetx += 0.5;
			if P2FT % 60 == 0 && P2FT < 3900 {
				bul1 = instance_create_depth(0, global.BoardFloor - 10, 1, obj_Bullet);
				bul1.behav = -1;
				bul1.hspeed = 3;
				bul1.Inside = true;
				bul1.image_angle = 90;

				bul2 = instance_create_depth(640, global.BoardFloor - 70, 1, obj_Bullet);
				bul2.behav = -1;
				bul2.hspeed = -3;
				bul2.Inside = true;
				bul2.image_angle = -90;
			}
		}
		if P2FT > 4086 && P2FT < 4792 {
			obj_BulletBoard.current_offsetx = 0;
			global.BorderWidth = 300;
			global.BorderHeight = 150;
			if P2FT % 50 == 0 {
				instance_create_depth(random_range(20, 620), random_range(20, 200), -1, obj_Bullet);
				instance_create_depth(random_range(20, 620), random_range(20, 200), -1, obj_Bullet);
			}
		}
		if P2FT == 4902 {
			reflect.x = 500;
			reflect.image_xscale = 1;
			reflect.image_yscale = 1;
			reflect.image_index += 1;
			global.BorderHeight = 120;
			ChangeSoulAngle(180);
			SetSoulMode("YELLOW");
			if !global.NoHeal
				global.PlayerHP = global.PlayerMaxHP;
		}
		if P2FT >= 4902 && P2FT < 4942 {
			reflect.image_alpha += 0.01;
		}
		if P2FT >= 5222 && P2FT < 5262 {
			reflect.image_alpha -= 0.01;
		}
		if (P2FT == 5263) {
			instance_destroy(reflect);
			instance_create_depth(170, 30, 1, obj_VineKnife);
			instance_create_depth(470, 30, 1, obj_VineKnife);
		}
	
		if alarm[1] > 1248 && alarm[1] < 1872 {
			obj_BattleEffects.Rotation = sin(alarm[1] / 60) * 25;
			if alarm[1] % 90 == 12 {
				instance_create_depth(obj_Soul.x + random_range(-5, 5), 180, -1, obj_Bullet);
				instance_create_depth(choose(50, 590), obj_Soul.y + random_range(-5, 5), -1, obj_Bullet);
				//CreateGB(obj_Soul.x, global.BoardFloor - 140, 0, 20, 0.5, 2, true);
				//CreateGB(100, obj_Soul.y, 90, 20, 0.5, 2, true);
			}
		}
		if alarm[1] > 648 && alarm[1] < 1248 {
			obj_BattleEffects.Rotation = sin(alarm[1] / 60) * 50;
			if alarm[1] % 60 == 12 {
				instance_create_depth(obj_Soul.x + random_range(-5, 5), 180, -1, obj_Bullet);
				instance_create_depth(choose(50, 590), obj_Soul.y + random_range(-5, 5), -1, obj_Bullet);
			}
		}
		if alarm[1] > 290 && alarm[1] < 648 {
			obj_BattleEffects.Rotation = 0;
			if alarm[1] % 30 == 10 {
				instance_create_depth(320, obj_CharaMonster_Phase2.y - (obj_CharaMonster_Phase2.sprite_height / 2), obj_CharaMonster_Phase2.depth + 1, obj_LightRay);
				b1 = instance_create_depth(random_range(100, 540), 180, -1, obj_Bullet);
				b1.behav = 10;
				b1.speed = -3;
				b1.image_angle = -90;
				b1.direction = -90;
			}
			if alarm[1] % 30 == 20 {
				//CreateGB(random_range(40, 600), global.BoardFloor - 140, 0, 40, 0.5, 2, false);
				b1 = instance_create_depth(random_range(100, 540), 180, -1, obj_Bullet);
				b1.behav = 10;
				b1.speed = -3;
				b1.image_angle = -90;
				b1.direction = -90;
			}
		}
		if alarm[1] == 240 || obj_CharaMonster_Phase2.Hits < -200 {
			alarm[1] = 240;
			depth = -1000000;
			audio_stop_sound(sr_phase2_final);
			obj_CharaMonster_Phase2.Hits = 9999999;
			Phase2Timer = 2689;
			obj_BattleEffects.Rotation = 0;
			obj_CharaMonster_Phase2.died = true;
			obj_CharaMonster_Phase2.Turn = 11;
			obj_CharaMonster_Phase2.ShakeEffect = 5;
			repeat 30 {
				shard = instance_create_depth(obj_CharaMonster_Phase2.x, obj_CharaMonster_Phase2.y - 90, -100, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-5, 5);
				shard.vspeed = random_range(-5, 1);
				shard.gravity = 0.02;
				shard.sprite_index = Soul_Bit_White;
			}
			audio_play_sound(HeavyDamage, 0, false);
			instance_destroy(obj_Bullet);
			instance_destroy(obj_LightRay);
			instance_destroy(obj_GasterBlaster);
			instance_destroy(obj_GasterBlasterBeam);
			instance_destroy(obj_CharaSlash);
			instance_destroy(obj_Shrike_Small);
			instance_destroy(obj_Shrike_Big);
		}
		if alarm[1] < 240 {
			Phase2Timer += 1;
		}
		break;
	// PHASE 3
	// Circle attack
	case 19:
		global.BorderWidth = 380;
		if alarm[1] % 60 == 0 {
			//var _x = choose(100, 540);
			//b = instance_create_depth(_x, global.BoardFloor - random(global.BorderHeight), 1, obj_Gaster_Bullet);
			//b.Inside = true;
			//if _x > 320
			//	b.hspeed = -3;
			//else
			//	b.hspeed = 3;
			var bu = 4;
			var rnd = alarm[1];
			var g = 0;
			repeat bu {
				b = instance_create_depth(60, global.BoardFloor - random(global.BorderHeight), 1, obj_Gaster_Bullet);
				b.Inside = true;
				b.hspeed = 2;
				b.CenX = 60;
				b.CenY = 384 - global.BorderHeight;
				b.len = 50;
				b.dir = rnd + ((g / bu) * 360);
				b.dirSpd = -0.3;
				b.behav = 4;
				g += 1;
			}
		
			g = 0;
			repeat bu {
				b = instance_create_depth(60, global.BoardFloor - random(global.BorderHeight), 1, obj_Gaster_Bullet);
				b.Inside = true;
				b.hspeed = -2;
				b.CenX = 580;
				b.CenY = 384;
				b.len = 50;
				b.dir = rnd + ((g / bu) * 360);
				b.dirSpd = 0.3;
				b.behav = 4;
				g += 1;
			}
		}
		with (obj_Gaster_Bullet) {
			len = 40 + (sin(siner / 8) * 30);
		}
		if alarm[1] == 280 {
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 180;
		}
		if alarm[1] == 5 {
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
		}
		break;
	// Spray attack
	case 20:
		if alarm[1] % 30 == 0 {
			var Dir = point_direction(0, 0, obj_Soul.x, obj_Soul.y);
			repeat 20 {
				b = instance_create_depth(0, 0, 1, obj_Gaster_Bullet);
				b.direction = Dir;
				b.speed = 4;
			
				b2 = instance_create_depth(640, 0, 1, obj_Gaster_Bullet);
				b2.direction = Dir;
				b2.speed = 4;
				Dir += 18;
			}
		}
		break;
	// Blaster attack
	case 21:
		if alarm[1] % 5 == 0 {
			b1 = instance_create_depth(390, 400, 1, obj_Gaster_Bullet);
			b1.direction = 90;
			b1.speed = 4;
			b1.behav = -1;
		
			b2 = instance_create_depth(250, 238, 1, obj_Gaster_Bullet);
			b2.direction = 270;
			b2.speed = 4;
			b2.behav = -1;
		
			b3 = instance_create_depth(410, 368, 1, obj_Gaster_Bullet);
			b3.direction = 180;
			b3.speed = 4;
			b3.behav = -1;
		
			b4 = instance_create_depth(230, 278, 1, obj_Gaster_Bullet);
			b4.direction = 0;
			b4.speed = 4;
			b4.behav = -1;
		
			b1.Inside = true;
			b2.Inside = true;
			b3.Inside = true;
			b4.Inside = true;
		}
		if alarm[1] % 60 == 0 {
			var gasterRNG = choose(0, 1);
			if gasterRNG == 0
				CreateGB(choose(260, 320, 380), 250, 0, 50, 2, 2, false);
			else
				CreateGB(450, choose(300, 322, 345), -90, 50, 1, 2, false);
		}
		break;
	// Tunnel attack
	case 22:
		if alarm[1] % 5 == 0 {
			b1 = instance_create_depth(100, global.BoardFloor - (20 + (sin(alarm[1] / 12) * 26)), 1, obj_Gaster_Bullet);
			b1.hspeed = 4;
			b1.Inside = true;
			b1.behav = -1;
			b2 = instance_create_depth(100, global.BoardFloor - (90 + (sin(alarm[1] / 12) * 26)), 1, obj_Gaster_Bullet);
			b2.hspeed = 4;
			b2.Inside = true;
			b2.behav = -1;
		}
		if alarm[1] % 40 == 0 { 
			b3 = instance_create_depth(obj_Soul.x, -10, 1, obj_Gaster_Bullet);
			b3.vspeed = 4;
			b3.behav = -1;
		}
		break;
	// Upside-down circle attack
	case 23:
		if alarm[1] == 690 {
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 180;
		}
		if alarm[1] % 80 == 0 {
			var dir = random(360);
			var dirSpd = choose(-1, 1);
			for (var i = 0; i < 36; i++) {
				b = instance_create_depth(-100, -100, 1, obj_Gaster_Bullet);
				b.behav = 1;
				b.dir = dir + (10 * i);
				b.dirSpd = dirSpd;
				b.len = 340;
				b.image_blend = c_dkgrey;
				if i > 28 {
					b.image_blend = c_aqua;
				}
			}
		}
		if alarm[1] == 5 {
			instance_destroy(obj_Gaster_Bullet);
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
		}
		break;
	// Circles attack
	case 24:
		if !instance_exists(obj_Gaster_Bullet) {
			for (var i = 0; i < 6; i++) {
				b1 = instance_create_depth(-100, -100, 1, obj_Gaster_Bullet);
				b1.behav = 2;
				b1.dir = (60 * i);
				b1.dirSpd = 1;
				b1.siner = 0;
				b1.image_alpha = 0;
				if i % 4 == 1 b1.image_blend = c_aqua;
				if i % 4 == 3 b1.image_blend = c_orange;
		
				b2 = instance_create_depth(-100, -100, 1, obj_Gaster_Bullet);
				b2.behav = 2;
				b2.dir = 30 + (60 * i);
				b2.dirSpd = -1;
				b2.siner = 96;
				b2.image_alpha = 0;
			}
		}
		break;
	// Flash attack
	case 25:
		if alarm[1] % 80 == 0 {
			si = instance_create_depth(0, 0, -1000000, obj_Phase3_RevealTeaser);
			si.side = choose(0, 1);
		}
		break;
	// "Last resort" attack for Phase 3
	case 26:
		P3FT += 1;
		if P3FT == -3502 {
			obj_ButtonController.visible = false;
			obj_BulletBoard.Show = false;
			global.FreeMoving = true;
		}
		if P3FT >= -3502 && P3FT < -2981 {
			obj_BulletBoard.BattleUI = (obj_BulletBoard.BattleUI + (458 - obj_BulletBoard.BattleUI) / 24);
			if P3FT % 78 == 0 {
				CreateGB(random(640), random(480), 0, 621 - (P3FT + 3502), 1, 2, true);
			}
			alter = false;
		}
		if P3FT >= -3502 && P3FT < -1014 {
			if P3FT % 90 == 0 {
				alter = !alter;
				for (var i = 0; i < 9; i++) {
					b1 = instance_create_depth(320, 140, 1, obj_Gaster_Bullet);
					b1.behav = 3;
					b1.dir = (40 * i);
					b1.dirSpd = alter ? -0.6 : 0.6;
					b1.siner = 0;
					b1.image_alpha = 0.5;
				}
			}
		}
		if P3FT < -1017 {
			obj_Soul.x = clamp(obj_Soul.x, 8, 632);
			obj_Soul.y = clamp(obj_Soul.y, 8, 472);
		}
		if P3FT == -1017 {
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 234;
		}
		if P3FT == -1014 {
			instance_destroy(obj_Gaster_Bullet);
			obj_ButtonController.visible = true;
			obj_BulletBoard.Show = true;
			global.FreeMoving = false;
			obj_Soul.x = 320;
			obj_Soul.y = 280;
			global.BorderWidth = 380;
			global.BorderHeight = 200;
			obj_BulletBoard.BattleUI = 400;
		}
		if P3FT == -509 {
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 76;
		}
		if P3FT > -1014 && P3FT < 0 {
			if abs(P3FT) % 40 == 15 {
				global.BorderWidth = 380;
				var _x = 50;
				var _y = 30;
				if abs(P3FT) % 80 == 55 {
					_x = 590;
					_y = global.BorderHeight - 30;
				}
				var _z = random(360);
				var _aa = 0;
				repeat 6 {
					b = instance_create_depth(_x, global.BoardFloor - random(global.BorderHeight), 1, obj_Gaster_Bullet);
					b.Inside = true;
					b.CenX = _x;
					b.CenY = 384 - _y;
					b.len = 60;
					b.dir = _z + ((_aa / 6) * 360);
					b.dirSpd = 1;
					b.behav = 4;
					if _x > 320
						b.hspeed = -1.7;
					else
						b.hspeed = 1.7;
					_aa += 1;
				}
			}
		}
		if P3FT == -4 {
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
		}
		if P3FT == 1 {
			CreateGB(30, 135, 90, 100, 9, 2, false);
		}
		if P3FT == 120 {
			global.BorderHeight = 120;
			global.BorderWidth = 180;
			instance_destroy(obj_CharaMonster_Phase3);
			CreateGB(30, 450, 90, 90, 2, 2, false);
		
			CreateGB(230, 450, 180, 90, 2, 2, false);
			CreateGB(410, global.BoardFloor - global.BorderHeight, 0, 90, 2, 2, false);
			CreateGB(200, global.BoardFloor, 90, 90, 2, 2, false);
			CreateGB(440, global.BoardFloor - global.BorderHeight, -90, 90, 2, 2, false);
		}
		if P3FT == 232 {
			instance_destroy(obj_Gaster_Bullet);
			global.BorderWidth = 640;
			global.BorderHeight = 480;
			global.SoulSpeed = 5;
			obj_BulletBoard.Show = false;
			obj_ButtonController.visible = false;
		}
		if P3FT > 232 && P3FT < 2714 {
			obj_BulletBoard.BattleUI = (obj_BulletBoard.BattleUI + (458 - obj_BulletBoard.BattleUI) / 3);
			if P3FT <= 2560 {
				obj_Soul.x = clamp(obj_Soul.x, 8, 632);
				obj_Soul.y = clamp(obj_Soul.y, 8, 472);
			}
			if P3FT & 6 == 0 {
				fa = instance_create_depth(random(100), 480, 12, obj_FreefallingParticle);
				fa.vspeed = -(4 + random(8));
			}
			if P3FT & 6 == 2 {
				fa = instance_create_depth(640 - random(100), 480, 12, obj_FreefallingParticle);
				fa.vspeed = -(4 + random(8));
			}
		}
		if P3FT > 340 && P3FT < 540 {
			if P3FT % 3 == 0 {
				b = instance_create_depth(random(640), 500, 1, obj_Gaster_Bullet);
				b.Inside = false;
				b.vspeed = -6;
				b.hspeed = random_range(-1, 1);
			}
		}
		if P3FT >= 540 && P3FT < 802 {
			if P3FT % 20 == 0 {
				MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
			}
		}
		if P3FT > 852 && P3FT < 1400 {
			if P3FT % 20 == 0 {
				var dir = point_direction(320, 240, obj_Soul.x, obj_Soul.y);
				for (var i = 0; i < 20; i++) {
					b = instance_create_depth(320, 240, 1, obj_Gaster_Bullet);
					b.Inside = false;
					b.direction = dir + (18 * i);
					b.speed = 5;
				}
			}
		}
		if P3FT >= 1480 && P3FT < 2400 {
			if P3FT % 20 == 0 {
				var _u = random_range(-3, 3);
				var _v = 30 + random(60);
				var _w = -(2 + random(2));
				var _x = random_range(20, 620);
				var _y = 560;
				var _z = random(360);
				var _aa = 0;
				repeat 8 {
					b = instance_create_depth(_x, _y, 1, obj_Gaster_Bullet);
					b.Inside = false;
					b.CenX = _x;
					b.CenY = _y;
					b.len = _v;
					b.dir = _z + ((_aa / 8) * 360);
					b.dirSpd = _u;
					b.behav = 4;
					b.vspeed = _w;
					b.hspeed = (_u / 4);
					_aa += 1;
				}
			}
		}
		if P3FT == 1980 {
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 180;
		}
		if P3FT == 2450 {
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
			with (obj_Gaster_Bullet) {
				friction = -0.1;
			}
		}
		if P3FT == 2560 {
			if global.NoHeal
				SetChaText("NO HEAL PHASE 3");
			if global.NoHit {
				UnlockAchievement(6);
				SetChaText("NO HIT PHASE 3");
			}
			UpdateSF(3, global.NoHeal, global.NoHit);
		}
		if P3FT < 2800
			obj_BattleEffects.CMAB = lerp(obj_BattleEffects.CMAB, 1, 0.06);
		if P3FT == 2800 {
			obj_Soul.visible = false;
			obj_BattleEffects.CMAB = 0;
			var layer_fx = layer_get_fx("Effect_1");
			fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
		}
		if P3FT == 3600 {
			instance_create_depth(320, 240, 1, obj_Flowey_Phase4Transition);
		}
		break;
	// PHASE 4 has no attacks in this code
	// PHASE 5
	// Blaster attack
	case 30:
		if alarm[1] % 50 == 0 {
			CreateGB(random_range(100, 640), random_range(150, 230), 0, 20, 1, 2, true);
		}
		if alarm[1] == 450 {
			obj_BattleEffects.Rotation = 205;
			audio_play_sound(asset_get_index("mus_dialup_" + string(choose(0,1,2,3,4))), 0, false);
			Mo = true;
		}
		break;
	// Slice + blaster attack
	case 31:
		if alarm[1] % 70 == 0 {
			for (var i = 0; i < 6; i++) {
				b3 = instance_create_depth(global.LeftEdge + 4 + (42 * i), 200, 1, obj_Bullet);
				b3.Inside = true;
				b3.behav = -1;
				b3.image_angle = -90;
				b3.vspeed = 3;
			}
		}
		if alarm[1] % 70 == 35 {
			for (var i = 0; i < 5; i++) {
				b3 = instance_create_depth(global.LeftEdge + 25 + (42 * i), 200, 1, obj_Bullet);
				b3.Inside = true;
				b3.behav = -1;
				b3.image_angle = -90;
				b3.vspeed = 3;
			}
		}
		if alarm[1] % 190 == 0 {
			CreateGB(choose(100, 540), obj_Soul.y, 0, 20, 1, 2, true);
		}
		if alarm[1] == 450 {
			obj_BattleEffects.Rotation = 90;
			audio_play_sound(asset_get_index("mus_dialup_" + string(choose(0,1,2,3,4))), 0, false);
			Mo = true;
		}
		break;
	// Wave attack
	case 32:
		global.BorderWidth = 120;
		global.BorderHeight = 120;
		if alarm[1] % 9 == 0 {
			b1 = instance_create_depth(260 + sin(alarm[1] / 30) * 30, 400, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 0;
			b1.vspeed = -3;

			b2 = instance_create_depth(380 + sin(alarm[1] / 30) * 30, 400, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = 180;
			b2.vspeed = -3;
	
			b3 = instance_create_depth(global.LeftEdge - 20, 264 + sin(alarm[1] / 10) * 30, 1, obj_Bullet);
			b3.Inside = true;
			b3.behav = -1;
			b3.image_angle = -90;
			b3.hspeed = 3;

			b4 = instance_create_depth(global.LeftEdge - 20, 384 + sin(alarm[1] / 10) * 30, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = 90;
			b4.hspeed = 3;
		}
		break;
	// Slam attack
	case 33:
		global.BorderWidth = 100;
		global.BorderHeight = 100;
		if alarm[1] % 60 == 30 {
			ang = choose(0, 90, 180, -90);
			ChangeSoulAngle(ang);
		}
		if alarm[1] % 60 == 0 {
			var leniency = 20;
			if (ang == 0) {
				b4 = instance_create_depth(global.RightEdge + leniency, 354 + leniency, 1, obj_Bullet);
				b4.Inside = true;
				b4.behav = -1;
				b4.image_angle = 90;
				b4.hspeed = -5;
			}
			if (ang == 90) {
				b4 = instance_create_depth((global.RightEdge - 30) + leniency, 284 - leniency, 1, obj_Bullet);
				b4.Inside = true;
				b4.behav = -1;
				b4.image_angle = 180;
				b4.vspeed = 5;
			}
			if (ang == 180) {
				b4 = instance_create_depth(global.LeftEdge - leniency, 324 - leniency, 1, obj_Bullet);
				b4.Inside = true;
				b4.behav = -1;
				b4.image_angle = -90;
				b4.hspeed = 5;
			}
			if (ang == -90) {
				b4 = instance_create_depth((global.LeftEdge + 30) - leniency, 384 + leniency, 1, obj_Bullet);
				b4.Inside = true;
				b4.behav = -1;
				b4.image_angle = 0;
				b4.vspeed = -5;
			}
		}
		break;
	// Platforming attack
	case 34:
		if alarm[1] == 799 {
			ChangeSoulAngle(0);
			global.BorderWidth = 340;
		}
		if alarm[1] % 8 == 0 && alarm[1] < 790 {
			b1 = instance_create_depth(global.LeftEdge - 20, 390, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 90;
			b1.hspeed = 3;
		}
		if alarm[1] % 40 == 20 && alarm[1] < 760 {
			b2 = instance_create_depth(global.LeftEdge - 34, 350, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = 90;
			b2.hspeed = 3;
		
			b3 = instance_create_depth(global.LeftEdge - 34, 265, 1, obj_Bullet);
			b3.Inside = true;
			b3.behav = -1;
			b3.image_angle = -90;
			b3.hspeed = 3;
		}
		if alarm[1] % 40 == 0 && alarm[1] < 790 {
			CreatePlatform(true, false, 15, global.LeftEdge - 30, 340, true);
			b4 = instance_create_depth(global.LeftEdge - 32, 375, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = -90;
			b4.hspeed = 3;
		
			b5 = instance_create_depth(global.RightEdge + 16, 290, 1, obj_Bullet);
			b5.Inside = true;
			b5.behav = -1;
			b5.image_angle = -90;
			b5.hspeed = -5;
		}
		break;
	// Wave attack
	case 35:
		global.BorderWidth = 120;
		global.BorderHeight = 120;
		var leniency = 20;
		if alarm[1] == 1199 {
			ChangeSoulAngle(90);
		}
		if alarm[1] % 9 == 0 && alarm[1] > 860 {
			b3 = instance_create_depth(global.LeftEdge - 20, 274 + sin(alarm[1] / 15) * 30, 1, obj_Bullet);
			b3.Inside = true;
			b3.behav = -1;
			b3.image_angle = -90;
			b3.hspeed = 3;

			b4 = instance_create_depth(global.LeftEdge - 20, 374 + sin(alarm[1] / 15) * 30, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = 90;
			b4.hspeed = 3;
			if alarm[1] % 90 == 0 {
				b2 = instance_create_depth((global.RightEdge - 20) + leniency, 264 - leniency, 1, obj_Bullet);
				b2.Inside = true;
				b2.behav = -1;
				b2.image_angle = 180;
				b2.vspeed = 5;
			}
		}
		if alarm[1] == 810 {
			ChangeSoulAngle(180);
		}
		if alarm[1] % 9 == 0 && (alarm[1] > 350 && alarm[1] < 800) { 
			b1 = instance_create_depth(270 + sin(alarm[1] / 25) * 30, 400, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 0;
			b1.vspeed = -3;

			b2 = instance_create_depth(370 + sin(alarm[1] / 25) * 30, 400, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = 180;
			b2.vspeed = -3;
			if alarm[1] % 90 == 0 {
				b3 = instance_create_depth(global.LeftEdge - leniency, 290 - leniency, 1, obj_Bullet);
				b3.Inside = true;
				b3.behav = -1;
				b3.image_angle = -90;
				b3.hspeed = 5;
			}
		}
		if alarm[1] == 300 ChangeSoulAngle(90);
		if alarm[1] == 200 ChangeSoulAngle(-90);
		if alarm[1] == 100 ChangeSoulAngle(0);
		if alarm[1] == 280 || alarm[1] == 180 || alarm[1] == 80 {
			b1 = instance_create_depth(global.RightEdge + leniency, 354 + leniency, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 90;
			b1.hspeed = -5;
			
			b2 = instance_create_depth((global.RightEdge - 40) + leniency, 264 - leniency, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = 180;
			b2.vspeed = 5;

			b3 = instance_create_depth(global.LeftEdge - leniency, 294 - leniency, 1, obj_Bullet);
			b3.Inside = true;
			b3.behav = -1;
			b3.image_angle = -90;
			b3.hspeed = 5;

			b4 = instance_create_depth((global.LeftEdge + 30) - leniency, 384 + leniency, 1, obj_Bullet);
			b4.Inside = true;
			b4.behav = -1;
			b4.image_angle = 0;
			b4.vspeed = -5;
		}
		break;
	// Faster knife attack
	case 36:
		global.BoardFloor = 384 - global.BorderHeight;
		if alarm[1] % 6 == 0 {
			b1 = instance_create_depth(global.RightEdge + 20, 390, 1, obj_Bullet);
			b1.Inside = true;
			b1.behav = -1;
			b1.image_angle = 90;
			b1.hspeed = -5;
		
			b2 = instance_create_depth(global.LeftEdge - 20, global.BoardFloor, 1, obj_Bullet);
			b2.Inside = true;
			b2.behav = -1;
			b2.image_angle = -90;
			b2.hspeed = 5;
		}
		if global.BorderWidth == obj_BulletBoard.current_width && global.BorderHeight == obj_BulletBoard.current_height {
			if alarm[1] % 30 == 0 {
				var pick = floor(alarm[1] / 2.4) % 4;
				if pick == 0 {
					for (var i = 3; i < 4; i++) {
						b3 = instance_create_depth(global.RightEdge + (i * 20), 360, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = 90;
						b3.hspeed = -3.2;
					}
				}
				if pick == 1 {
					for (var i = 3; i < 4; i++) {
						b3 = instance_create_depth(global.RightEdge + (i * 20), global.BoardFloor + 30, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = -90;
						b3.hspeed = -3.2;
					}
				}
				if pick == 2 {
					for (var i = 3; i < 4; i++) {
						b3 = instance_create_depth(global.LeftEdge - (i * 20), 360, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = 90;
						b3.hspeed = 3.2;
					}
				}
				if pick == 3 {
					for (var i = 3; i < 4; i++) {
						b3 = instance_create_depth(global.LeftEdge - (i * 20), global.BoardFloor + 30, 1, obj_Bullet);
						b3.Inside = true;
						b3.behav = -1;
						b3.image_angle = -90;
						b3.hspeed = 3.2;
					}
				}
			}
		}
		break;
	// Memory attack
	case 37:
		global.BorderHeight = 90;
		global.BorderWidth = 90;
		if ang == 45 {
			posTable[0] = 1;
			posTable[1] = 2;
			posTable[2] = 3;
			posTable[3] = 4;
			posTable[4] = 5;
			posTable[5] = -1;
			posTable[6] = -2;
			posTable[7] = -3;
			posTable[8] = -4;
			posTable[9] = -5;
			for (var i = 0; i < 10; i++) {
				while (true) {
					var j = irandom(9);
					if posTable[j] != 0 {
						knifePos[i] = posTable[j];
						posTable[j] = 0;
						break;
					}
				}
			}
			ang = 0;
		}
		else {
			if alarm[1] % 30 == 0 && ang < 10 {
				if knifePos[ang] < 0 {
					knife = instance_create_depth(260 + (20 * abs(knifePos[ang])), 250, 1, obj_Bullet);
					knife.behav = 7;
					knife.image_alpha = 0;
					knife.image_angle = -90;
					knife.Inside = false;
				}
				else {
					knife = instance_create_depth(230, 400 - (20 * abs(knifePos[ang])), 1, obj_Bullet);
					knife.behav = 7;
					knife.image_alpha = 0;
					knife.image_angle = 0;
					knife.Inside = false;
				}
				ang += 1;
			}
		}
		break;
	// Random falling knives
	case 38:
		global.BorderWidth = 180;
		global.BorderHeight = 130;
		obj_BulletBoard.current_offsetx = sin(alarm[1] / 60) * 50;
		if alarm[1] % 25 == 0 {
			repeat 2 {
				knife = instance_create_depth(208 + (irandom(14) * 16), 210, 1, obj_Bullet);
				knife.behav = -1;
				knife.vspeed = 3;
				knife.image_angle = -90;
				knife.Inside = true;
			}
		}
		break;
	// "Last resort" attack for Phase 5
	case 39:
		if alarm[1] > 1800
			obj_BattleEffects.Rotation += 0.3;
		if alarm[1] > 900 && alarm[1] < 1800
			obj_BattleEffects.Rotation += 0.9;
		if alarm[1] = 900 {
			//audio_stop_all();
			audio_sound_gain(global.BattleMusic, 0, 12000);
			global.InvFrames = 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
			obj_CharaMonster_A_Phase1.Mutate = true;
		}
		if alarm[1] % 100 == 0 && alarm[1] > 1800 {
			CreateGB(obj_Soul.x + random_range(-40, 40), random_range(20, 250), 0, 20, 1, 2, true);
			MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
		}
		if alarm[1] % 60 == 0 && (alarm[1] > 900 && alarm[1] < 1800) {
			CreateGB(obj_Soul.x + random_range(-40, 40), random_range(20, 250), 0, 20, 1, 2, true);
			MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
		}
		if alarm[1] % 30 == 0 && (alarm[1] > 540 && alarm[1] <= 900) {
			CreateGB(obj_Soul.x + random_range(-40, 40), random_range(20, 250), 0, 20, 1, 2, true);
			MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
		}
		if alarm[1] % 60 == 0 && alarm[1] > 180 && alarm[1] < 540 {
			ang = random(360);
			CreateGB(320 + lengthdir_x(100, ang), 284 + lengthdir_y(100, ang), ang - 90, 20, 1, 2, false);
		}
		break;
	// Healing attack for Phase 1
	case -19:
		if alarm[1] % 90 == 0 {
			b1 = instance_create_depth(random_range(20, 620), random_range(20, 200), -1, obj_Bullet);
			b1.behav = 4;
			instance_create_depth(random_range(20, 620), random_range(20, 200), -1, obj_Bullet);
		}
		if alarm[1] % 90 == 45
			MakeCSlash(obj_Soul.x, obj_Soul.y, random(360));
		break;
	// Healing attack for Phase 2
	case -20:
		global.BorderWidth = 300;
		global.BorderHeight = 150;
		if alarm[1] % 90 == 0 {
			b1 = instance_create_depth(obj_Soul.x + random_range(-5, 5), 180, -1, obj_Bullet);
			b1.behav = 4;
			b2 = instance_create_depth(choose(50, 590), obj_Soul.y + random_range(-5, 5), -1, obj_Bullet);
			b2.behav = 4;
		}
		break;
	// PHASE 6
	// Really, this is literally all it is
	case 50:
		global.Karma = global.PlayerHP;
		if (keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_rcontrol)) && A2 < 3060 {
			Phase6NoHeal = !Phase6NoHeal;
			if Phase6NoHeal
				SetNotifText("AUTO HEALS: OFF");
			else
				SetNotifText("AUTO HEALS: ON");
		}
		if A2 == 0 {
			instance_create_depth(0, 0, -1000, obj_Phase6_CamHandler);
			obj_CharaMonster_A_Phase2.image_alpha = 0;
			obj_ButtonController.visible = false;
			obj_BulletBoard.current_width = global.BorderWidth;
			obj_BulletBoard.current_height = global.BorderHeight;
			obj_BulletBoard.Show = false;
			global.FreeMoving = true;
		}
		obj_BulletBoard.BattleUI = 458;
		if !instance_exists(obj_TextElement)
			A2 += 1;
		if (abs(audio_sound_get_track_position(global.BattleMusic) - (A2 / 60)) >= 0.01) {
			audio_sound_set_track_position(global.BattleMusic, (A2 / 60));
		}
		if A2 == 679 {
			CreateGB(120, 228, 45, 171, 3, 3, true);
			CreateGB(520, 228, -45, 171, 3, 3, true);
		}
		if A2 >= 210 && A2 < 650 {
			if A2 % 42 == 0 {
				var pick = -200;
				while (pick < 680) {
					r1 = instance_create_depth(740, pick, 1, obj_Bullet);
					r1.behav = 8;
					r1.image_angle = -2 * A2;
					r1.hspeed = -2;
					r1.vspeed = 0.2;
					pick += 60;
				}
			}
		}
		if A2 == 1044
			CreateGB(20, 20, 0, (1705 - A2), 3, 2, true);
		if A2 == 1214
			CreateGB(20, 460, 0, (1705 - A2), 3, 2, true);
		if A2 == 1384
			CreateGB(620, 20, 0, (1705 - A2), 3, 2, true);
		if A2 == 1554
			CreateGB(620, 460, 0, (1705 - A2), 3, 2, true);
		if A2 == 1715
			instance_create_depth(-100, -100, -1000000, obj_HitFlash);
		if A2 == 1725 {
			obj_CharaMonster_A_Phase2.image_alpha = 1;
			global.BorderWidth = 450;
			//obj_Phase6_CamHandler.vs = 0.5;
		}
		if A2 == 2388 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, obj_ButtonController.depth - 1, obj_GasterFlash_Phase3);
			twist.ang = 180;
		}
		if A2 >= 1735 && A2 < 2900 {
			if A2 % 21 == 0 {
				if A2 % 189 == 0 {
					CreateGB(obj_Soul.x, 40, 0, 20, 1, 2, true);
				}
				var _x = choose(-40, 320, 680);
				var _y = choose(-40, 520);
				b3 = instance_create_depth(_x, _y, 1, obj_Bullet);
				b3.behav = 8;
				b3.direction = point_direction(_x, _y, obj_Soul.x, obj_Soul.y);
				b3.speed = 3;
			}
		}
		if A2 == 3060 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
			if !Phase6NoHeal {
				global.PlayerHP += 60;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
		}
		if A2 > 3060 && A2 < 3660 {
			if A2 % 42 == 0 {
				CreateGB(90, 90, 0, 42, 1, 2, true);
				CreateGB(550, 90, 0, 42, 1, 2, true);
			}
		}
		if A2 >= 3720 && A2 < 4298 {
			if A2 % 120 == 0 {
				ang = random(360);
				repeat 4 {
					b1 = instance_create_depth(-99, -99, 1, obj_Bullet);
					b1.behav = 9;
					b1.CentX = obj_Soul.x;
					b1.CentY = obj_Soul.y;
					b1.ang = ang;
					b1.CenSpd = 2;
					ang += 90;
				}
				ang += 45;
				repeat 4 {
					b1 = instance_create_depth(-99, -99, 1, obj_Bullet);
					b1.behav = 9;
					b1.CentX = obj_Soul.x;
					b1.CentY = obj_Soul.y;
					b1.ang = ang;
					b1.CenSpd = -2;
					ang += 90;
				}
			}
		}
		if A2 >= 4350 && A2 <= 4604 {
			//obj_Phase6_CamHandler.vs = 1;
			obj_CharaMonster_A_Phase2.Alpha -= 0.01;
			obj_CharaMonster_A_Phase2.image_blend -= make_color_rgb(1, 1, 1);
			obj_Soul.image_blend -= make_color_rgb(1, 1, 1);
			obj_BulletBoard.BackCol += make_color_rgb(1, 1, 1);
			var lay_id = layer_get_id("Background");
			var back_id = layer_background_get_id(lay_id);
			layer_background_blend(back_id, obj_BulletBoard.BackCol);
		}
		if A2 >= 5066 && A2 < 5630 {
			if A2 % 42 == 29 {
				CreateGB(random(640), random(480), 0, 42, 1, 2, true);
			}
		}
		if A2 >= 5730 && A2 < 6905 {
			//obj_Phase6_CamHandler.vs = 0.5;
			if A2 % 60 == 30 {
				ang = random(360);
				repeat 8 {
					b1 = instance_create_depth(-99, -99, 1, obj_Bullet);
					b1.behav = 9;
					b1.CentX = obj_Soul.x;
					b1.CentY = obj_Soul.y;
					b1.ang = ang;
					b1.CenSpd = 1;
					ang += 45;
				}
			}
		}
		if A2 == 6367 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 135;
			if !Phase6NoHeal {
				global.PlayerHP += 60;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
		}
		if A2 == 7068 {
			//obj_Phase6_CamHandler.vs = 1;
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
			if !Phase6NoHeal {
				global.PlayerHP += 60;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
			obj_CharaMonster_A_Phase2.Alpha = 1;
			obj_CharaMonster_A_Phase2.image_blend = c_white;
			obj_Soul.image_blend = c_white;
			obj_BulletBoard.BackCol = c_black;
			var lay_id = layer_get_id("Background");
			var back_id = layer_background_get_id(lay_id);
			layer_background_blend(back_id, obj_BulletBoard.BackCol);
		}
		if A2 > 7060 && A2 < 7320 {
			if A2 % 21 == 9 {
				repeat 3 {
					var len = 70 + random(130);
					var dir = random(360);
					var _x2 = obj_Soul.x + lengthdir_x(len, dir);
					var _y2 = obj_Soul.y + lengthdir_y(len, dir);
				
					knife = instance_create_depth(_x2, _y2, 1, obj_Bullet);
					knife.behav = 7;
					knife.image_alpha = 0;
					knife.image_angle = point_direction(_x2, _y2, obj_Soul.x, obj_Soul.y);
					knife.Inside = false;
				}
			}
		}
		if A2 == 7680 {
			if !Phase6NoHeal {
				global.PlayerHP += 60;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
		}
		if A2 > 7680 && A2 < 8900 {
			if A2 % 200 == 0 {
				ang = random(360);
				repeat 4 {
					b1 = instance_create_depth(-99, -99, 1, obj_Bullet);
					b1.behav = 9;
					b1.CentX = obj_Soul.x;
					b1.CentY = obj_Soul.y;
					b1.ang = ang;
					b1.CenSpd = 2;
					ang += 90;
				}
				ang += 45;
				repeat 4 {
					b1 = instance_create_depth(-99, -99, 1, obj_Bullet);
					b1.behav = 9;
					b1.CentX = obj_Soul.x;
					b1.CentY = obj_Soul.y;
					b1.ang = ang;
					b1.CenSpd = -2;
					ang += 90;
				}
			}
			if A2 % 70 == 0 && A2 < 8700 {
				var len = 70 + random(130);
				var dir = random(360);
				var _x2 = obj_Soul.x + lengthdir_x(len, dir);
				var _y2 = obj_Soul.y + lengthdir_y(len, dir);
			
				knife = instance_create_depth(_x2, _y2, 1, obj_Bullet);
				knife.behav = 7;
				knife.image_alpha = 0;
				knife.image_angle = point_direction(_x2, _y2, obj_Soul.x, obj_Soul.y);
				knife.Inside = false;
			}
			if A2 % 135 == 0 {
				CreateGB(random(640), random(480), 0, 67, 1, 2, true);
			}
		}
		if A2 == 8400 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 180;
		}
		if A2 > 9084 && A2 < 9750 {
			if A2 % 3 == 0 {
				CreateGB(320 + lengthdir_x(240, ang), 240 + lengthdir_y(240, ang), ang - 90, 20, 0.5, 2, false);
				ang += 3;
			}
		}
		if A2 == 9084 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 0;
			if !Phase6NoHeal {
				global.PlayerHP += 100;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
		}
		if A2 > 9750 && A2 < 10300 {
			if A2 % 2 == 0 {
				CreateGB(320 + lengthdir_x(240, ang), 240 + lengthdir_y(240, ang), ang - 90, 20, 0.5, 2, false);
				ang -= 3;
			}
		}
		if A2 == 9750 {
			global.InvFrames += 5;
			twist = instance_create_depth(0, 0, -1000000, obj_GasterFlash_Phase3);
			twist.ang = 180;
			if !Phase6NoHeal {
				global.PlayerHP += 100;
				global.NoHeal = false;
				global.FG_Heals += 1;
			}
			if global.PlayerHP > global.PlayerMaxHP
				global.PlayerHP = global.PlayerMaxHP;
		}
		if A2 == 10700 {
			instance_destroy(obj_CharaMonster_A_Phase2);
			obj_Soul.visible = false;
			obj_BulletBoard.visible = false;
			var layer_fx = layer_get_fx("Effect_1");
			fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
			obj_BattleEffects.CMAB = 0;
		}
		if A2 == 11299 {
			obj_BattleEffects.Rotation = 0;
			obj_BattleEffects.TRotation = 0;
		}
		if A2 == 11300 {
			audio_play_sound(mus_wind, 0, true);
			if global.NoHeal
				SetChaText("NO HEAL PHASE 6");
			if global.NoHit
				SetChaText("NO HIT PHASE 6");
			UpdateSF(6, global.NoHeal, global.NoHit);
		}
		if A2 == 11400 { 
			Dialogue = instance_create_depth(130, 350, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3...Huh?";
			Dialogue.TextQueue[0] = "@3Where... am I?"
			Dialogue.Talker = "Silent";
			Dialogue.Unskippable = true;
			A2 += 1;
		}
		if A2 == 11700 { 
			Dialogue = instance_create_depth(130, 350, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3...";
			Dialogue.TextQueue[0] = "@3Great, more isolation.";
			Dialogue.TextQueue[1] = "@3But it gets very lonely&down here, really quickly.";
			Dialogue.TextQueue[2] = "@3...";
			Dialogue.TextQueue[3] = "@3Maybe I should open&my SAVE and beat that&goon up for good.";
			Dialogue.Talker = "Silent";
			Dialogue.Unskippable = true;
			A2 += 1;
		}
		if A2 == 11702 {
			audio_play_sound(snd_spearappear, 0, false);
		}
		if A2 == 12000 { 
			Dialogue = instance_create_depth(130, 350, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3What?";
			Dialogue.TextQueue[0] = "@3I'm in... Hell?"
			Dialogue.TextQueue[1] = "@3No, this can't be."
			Dialogue.TextQueue[2] = "@3I don't remember&saving THERE..."
			Dialogue.TextQueue[3] = "@3..."
			Dialogue.TextQueue[4] = "@3Well, I have no other&options."
			Dialogue.TextQueue[5] = "@3I have to finish my&mission of total&eradication."
			Dialogue.TextQueue[6] = "@3If someone wants to&hide from me, so be&it."
			Dialogue.TextQueue[7] = "@3Eventually, I will find&them."
			Dialogue.TextQueue[8] = "@3Eventually, I will kill&them."
			Dialogue.TextQueue[9] = "@3" + global.Name + "... No...&Whoever you are..."
			Dialogue.TextQueue[10] = "@7Prepare for your&'ultimate demise'."
			Dialogue.Talker = "Silent";
			Dialogue.Unskippable = true;
			A2 += 1;
		}
		if A2 == 12002 {
			audio_stop_all();
			audio_play_sound(Save, 0, false);
			obj_BattleEffects.CMAB = 0.5;
			audio_sound_gain(sr_phase4_preview, 1, 0);
			audio_play_sound(sr_phase4_preview, 0, true);
		}
		if A2 == 13112 {
			Dialogue = instance_create_depth(120, 350, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2You're in hell.";
			Dialogue.TextQueue[0] = "@2The temperature is&unbearable."
			Dialogue.TextQueue[1] = "@2You feel all your sins&crawling on your whole&body."
			Dialogue.TextQueue[2] = "@2As you traverse through&the cave of the damned..."
			Dialogue.TextQueue[3] = "@2You come across something&strange..."
			Dialogue.Talker = "Battle";
			Dialogue.Unskippable = true;
			A2 += 1;
		}
		if A2 == 13312 {
			Dialogue = instance_create_depth(120, 350, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2It's a crack in the&rock that surrounds&you.";
			Dialogue.TextQueue[0] = "@2But it appears to be&getting... bigger?"
			Dialogue.Talker = "Battle";
			Dialogue.Unskippable = true;
			A2 += 1;
		}
		if A2 == 13314 {
			audio_stop_all();
			obj_BattleEffects.CMAB = 3;
			audio_play_sound(Gigapunch, 0, false, 1, 0, 0.8);
		}
		if A2 == 13414 {
			audio_play_sound(Gigapunch, 0, false, 1, 0, 0.5);
		}
		if A2 == 13514 || (A2 > 11400 && keyboard_check_pressed(ord("L"))) {
			if global.SpeedrunMode == 1
				with (obj_SpeedrunTimer)
					Running = false;
				
			audio_stop_all();
			audio_play_sound(Gigapunch, 0, false, 1, 0, 0.3);
			audio_play_sound(Explosion, 0, false);
			for (var i = 0; i < 21; i++) {
				for (var j = 0; j < 11; j++) {
					instance_create_depth(42 * i, 48 * j, -100000, obj_Finale_Break);
				}
			}
			room_goto(Room_Finale);
		}
		break;
	// INTRO CUTSCENE
	case -65:
		alarm[1] = -1;
		if IntroTimer == 0 {
			audio_sound_gain(mus_wind, 1, 0);
			obj_ButtonController.visible = false;
			obj_BulletBoard.visible = false;
			obj_Soul.visible = false;
			audio_play_sound(mus_wind, 0, true);
			obj_BattleEffects.dontRestrict = true;
			camera_set_view_pos(view_camera[0], -640, 0);
			obj_CharaMonster_Phase1.Alpha = 0;
			obj_FloweyMonster_Phase1.MyHP = 0.0002;
			obj_CharaMonster_Phase1.image_alpha = 0;
			coffin = instance_create_depth(1080, 240, -10000, obj_Coffin);
			coffin.image_xscale = 2;
			coffin.image_yscale = 2;
		}
		if IntroTimer < 320 {
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 2.02, 0);
		}
		if IntroTimer > 420 && IntroTimer < 520 {
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 7.1, 0);
		}
		coffin.x = coffin.xstart + random_range(-coffinshaker, coffinshaker);
		coffin.y = coffin.ystart + random_range(-coffinshaker, coffinshaker);
		coffinshaker *= 0.9;
		if IntroTimer > 600 && IntroTimer < 830 {
			coffin.image_xscale += 0.01;
			coffin.image_yscale += 0.01;
		}
		if IntroTimer == 600 {
			audio_play_sound(snd_test, 0, false);
			coffinshaker = 3;
		}
		if IntroTimer == 700 {
			audio_play_sound(snd_test, 0, false);
			coffinshaker = 3;
		}
		if IntroTimer == 750 {
			audio_play_sound(snd_test, 0, false);
			coffinshaker = 3;
		}
		if IntroTimer == 800 {
			audio_play_sound(snd_test, 0, false);
			coffinshaker = 3;
		}
		if IntroTimer == 820 {
			audio_play_sound(snd_test, 0, false);
			coffinshaker = 3;
		}
		if IntroTimer == 830 {
			audio_play_sound(Gigapunch, 0, false);
			coffinshaker = 5;
			coffin.image_index += 1;
			audio_sound_gain(mus_wind, 0, 2000);
		}
		if IntroTimer > 1030 && IntroTimer < 1130 {
			coffin.image_alpha -= 0.01;
		}
		if IntroTimer > 1290 && IntroTimer <= 1340 {
			obj_CharaMonster_Phase1.image_alpha += 0.02;
			obj_CharaMonster_Phase1.Disarmed = true;
		}
		if IntroTimer == 1400 {
			Dialogue = instance_create_depth(930, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3Greetings.";
			Dialogue.TextQueue[0] = "@3I am Chara."
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			IntroTimer = 1401;
		}
		if IntroTimer == 1520 {
			Dialogue = instance_create_depth(930, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3Chara.";
			Dialogue.TextQueue[0] = "@3The demon that comes&when"
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			IntroTimer = 1521;
		}
		if IntroTimer == 1521 && !Dialogue.IsWriting {
			obj_CharaMonster_Phase1.Emotion = 6;
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(820, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "Chara?";
			Dialogue.Talker = "FloweyA";
			Dialogue.Unskippable = true;
			IntroTimer = 1522;
		}
		if IntroTimer == 1592 {
			Dialogue = instance_create_depth(930, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2I recognise that&voice...";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			IntroTimer = 1593;
		}
		if IntroTimer == 1593 && !Dialogue.IsWriting {
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(820, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "Chara! Don't you&remember me?";
			Dialogue.Talker = "FloweyA";
			Dialogue.Unskippable = true;
			IntroTimer = 1594;
		}
		if IntroTimer > 1594 && IntroTimer < 1794 {
			camera_set_view_pos(view_camera[0], floor(camera_get_view_x(view_camera[0]) * 0.9), 0);
			obj_CharaMonster_Phase1.x -= 2.8;
		}
		if IntroTimer == 1794 {
			Dialogue = instance_create_depth(300, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "Azzy, is that you?&You're badly hurt...";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			IntroTimer = 1795;
		}
		if IntroTimer == 1796 {
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "I am, Chara! They&did this to me!";
			Dialogue.Talker = "FloweyA";
			Dialogue.Unskippable = true;
			IntroTimer = 1797;
		}
		if IntroTimer == 1798 {
			obj_CharaMonster_Phase1.Emotion = 2;
			Dialogue = instance_create_depth(300, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "So I see...";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			IntroTimer = 1799;
		}
		if IntroTimer == 1849 {
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "Human...";
			Dialogue.Talker = "FloweyA";
			Dialogue.Unskippable = true;
			IntroTimer = 1850;
		}
		if IntroTimer == 1851 {
			obj_CharaMonster_Phase1.Emotion = 0;
			obj_FloweyMonster_Phase1.MyHP = 1200;
			obj_FloweyMonster_Phase1.Emotion = 0;
			audio_play_sound(sr_phase1_0, 0, false);
			Dialogue = instance_create_depth(300, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@1Prepare for your&ultimate demise.";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer == 2024 {
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "But Chara, you have&nothing to fight with...";
			Dialogue.Talker = "FloweyA";
			obj_FloweyMonster_Phase1.Emotion = 3;
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer == 2357 {
			obj_CharaMonster_Phase1.x = 380;
			Phase2Timer = 2689;
			audio_play_sound(Swipe, 0, false);
			obj_CharaMonster_Phase1.Disarmed = false;
			camera_set_view_pos(view_camera[0], 0, 0);
			obj_ButtonController.visible = true;
		}
		obj_BattleEffects.CMAB = 0;
		if IntroTimer == 2358 {
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2Now this is more&like it.";
			Dialogue.Talker = "FloweyB";
			obj_FloweyMonster_Phase1.Emotion = 9;
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer == 2570 {
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "Human, it's time for&you to fail once&and for all!";
			Dialogue.Talker = "FloweyB";
			obj_FloweyMonster_Phase1.Emotion = 0;
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer > 2640 {
			obj_CharaMonster_Phase1.Alpha += 0.01;
		}
		if (IntroTimer < 2865 && keyboard_check_pressed(ord("L"))) || instance_exists(obj_GameOver) {
			IntroTimer = 2865;
			audio_stop_all();
		}
		if IntroTimer == 2865 {
			global.BattleMusic = audio_play_sound(sr_phase1_1, 0, true);
			instance_destroy(Dialogue);
			obj_BulletBoard.visible = true;
			obj_CharaMonster_Phase1.Alpha = 1;
			obj_CharaMonster_Phase1.image_alpha = 1;
			obj_CharaMonster_Phase1.Disarmed = false;
			camera_set_view_pos(view_camera[0], 0, 0);
			obj_FloweyMonster_Phase1.MyHP = 1200;
			obj_FloweyMonster_Phase1.Emotion = 0;
			obj_CharaMonster_Phase1.x = 380;
			obj_ButtonController.visible = true;
			instance_destroy();
		}
		if IntroTimer > 2357 && IntroTimer < 2400 {
			Phase2Timer += 1;
		}
		if (!instance_exists(Dialogue) && !instance_exists(obj_SpeechBubble)) || IntroTimer > 1850
			IntroTimer += 1;
		break;
	// PHASE 1 ENDING
	case -66:
		alarm[1] = -1;
		if Phase2Timer == 0 {
			if global.NoHeal
				SetChaText("NO HEAL PHASE 1");
			if (global.NoHit) {
				UnlockAchievement(4);
				SetChaText("NO HIT PHASE 1");
			}
			UpdateSF(1, global.NoHeal, global.NoHit);
		}
		if instance_exists(Dialogue) {
			if Dialogue.CDL == 3 && Phase2Timer > 2709 {
				BLTimer += 1;
				if BLTimer > 255
					BLTimer = 255;
				obj_CharaMonster_Phase1.image_blend = make_color_rgb(BLTimer, BLTimer, BLTimer);
			}
		}
		if !instance_exists(Dialogue) && !instance_exists(obj_SpeechBubble)
			Phase2Timer += 1;
		if Phase2Timer == 80 {
			obj_ButtonController.visible = false;
			obj_BulletBoard.visible = false;
			obj_Soul.visible = false;
			slice = instance_create_depth(global.Monster[global.MRN].x, 140, -10, obj_Slice);
			slice.alarm[0] = 45;
			audio_play_sound(Slash, 0, false);
		}
		if Phase2Timer == 140 {
			global.Damage = -9999;
			//DamageWriter = instance_create_depth(obj_CharaMonster_Phase1.x, obj_CharaMonster_Phase1.y - 170, -100, obj_MonsterHP);
			//DamageWriter.MyHP = 9999;
			//DamageWriter.MyCurrentHP = 9999;
			//DamageWriter.MyHPToBe = 2160;
			//DamageWriter.MyMaxHP = 9999;
			//DamageWriter.ShowBar = true;
			//DamageWriter.Damage = 7800 + irandom(199);
			obj_CharaMonster_Phase1.ShakeEffect = 20;
			obj_CharaMonster_Phase1.Death = 1;
			audio_play_sound(MonsterHurt, 0, false);
		}
		if Phase2Timer == 195
			obj_CharaMonster_Phase1.Death = 2;
		if Phase2Timer == 200 {
			obj_CharaMonster_Phase1.Death = 3;
			audio_play_sound(snd_test, 0, false);
		}
		if Phase2Timer == 400 {
			obj_CharaMonster_Phase1.Death = 4;
			MySpeechBubble = instance_create_depth(obj_CharaMonster_Phase1.x + 40, obj_CharaMonster_Phase1.y - 60, -10000, obj_SpeechBubble);
			MySpeechBubble._ref = self;
			MySpeechBubble.TextToSend = "@1No...";
			MySpeechBubble.TextToStore[0] = "@1You can't...";
			Phase2Timer = 401;
		}
		if Phase2Timer == 540 {
			obj_CharaMonster_Phase1.ShakeEffect = 10;
			obj_CharaMonster_Phase1.Death = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase2Timer == 678 {
			MySpeechBubble = instance_create_depth(obj_CharaMonster_Phase1.x + 40, obj_CharaMonster_Phase1.y - 60, -10000, obj_SpeechBubble);
			MySpeechBubble._ref = self;
			MySpeechBubble.TextToSend = "@1You were much&stronger than I&thought.";
			MySpeechBubble.TextToStore[0] = "@1Even with Azzy by&my side...";
			MySpeechBubble.TextToStore[1] = "@1This is how it&ends.";
			MySpeechBubble.TextToStore[2] = "@1Beaten by someone&my own size&so easily...";
			if global.NoHit
				MySpeechBubble.TextToStore[3] = "@1Who I can't even&hit just once...";
			Phase2Timer = 679;
		}
		if Phase2Timer == 680 {
			obj_CharaMonster_Phase1.ShakeEffect = 10;
			obj_CharaMonster_Phase1.Death = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase2Timer == 730 {
			obj_CharaMonster_Phase1.ShakeEffect = 10;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase2Timer == 760 {
			obj_CharaMonster_Phase1.ShakeEffect = 10;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase2Timer == 775 {
			obj_CharaMonster_Phase1.ShakeEffect = 10;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase2Timer > 800 && Phase2Timer < 900 {
			obj_CharaMonster_Phase1.image_alpha -= 0.006;
			obj_FloweyMonster_Phase1.image_alpha -= 0.006;
		}
		if Phase2Timer == 900 {
			Dialogue = instance_create_depth(54, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3Chara, wake up! You're the future&of humans and monsters!";
			Dialogue.TextQueue[0] = "@3Asriel, get up! We rely on you!"
			Dialogue.TextQueue[1] = "@3You cannot give up just yet."
			Dialogue.TextQueue[2] = "@3Both of you!@7 &Stay determined!"
			Dialogue.Talker = "Silent";
			Dialogue.Unskippable = true;
			Phase2Timer = 901;
		}
		if Phase2Timer > 902 && Phase2Timer < 1040 {
			obj_CharaMonster_Phase1.image_alpha -= 0.006;
			obj_FloweyMonster_Phase1.image_alpha -= 0.006;
		}
	
		// PHASE 2 TRANSITION
		if Phase2Timer == 1050 {
			obj_FloweyMonster_Phase1.MyHP = 0.0002;
			obj_CharaMonster_Phase1.MyHP = 2160;
			obj_CharaMonster_Phase1.Death = 3;
			obj_CharaMonster_Phase1.Alpha = 0;
			obj_CharaMonster_Phase1.image_alpha = 0;
			obj_FloweyMonster_Phase1.image_alpha = 0;
			obj_ButtonController.visible = false;
			obj_BulletBoard.visible = false;
			obj_Soul.visible = false;
			audio_play_sound(sr_phase2_intro, 0, false);
		}
	
		if Phase2Timer > 1460 && Phase2Timer < 1570 {
			obj_CharaMonster_Phase1.image_alpha += 0.05;
			obj_FloweyMonster_Phase1.image_alpha += 0.05;
			if obj_CharaMonster_Phase1.image_alpha >= 1 {
				obj_CharaMonster_Phase1.image_alpha = 1;
				obj_FloweyMonster_Phase1.image_alpha = 1;
			}
		}
		if Phase2Timer == 1665 {
			obj_FloweyMonster_Phase1.Killed = true;
			audio_play_sound(Vaporize, 0, false);
		}
		if Phase2Timer == 1872 {
			obj_BattleEffects.dontRestrict = true;
		}
		if Phase2Timer > 1972 && Phase2Timer < 2072 {
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + ((Phase2Timer - 1972) / 90), 0);
		}
		if Phase2Timer == 2450 {
			audio_play_sound(snd_revival, 0, false);
		}
		if Phase2Timer > 2450 && Phase2Timer < 2689 {
			if Phase2Timer % 5 == 0 {
				instance_create_depth(obj_CharaMonster_Phase1.x, obj_CharaMonster_Phase1.y - 70, 3, obj_LightRay);
			}
			with (obj_Particle) {
				x = lerp(x, obj_CharaMonster_Phase1.x, 0.01);
				y = lerp(y, obj_CharaMonster_Phase1.y - 70, 0.01);
			}
		}
		if Phase2Timer == 2689 {
			var layer_fx = layer_get_fx("Effect_1");
			fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0.05);
			obj_BattleEffects.CMAB = 5;
			instance_destroy(obj_Particle);
			instance_destroy(obj_LightRay);
			obj_CharaMonster_Phase1.Death = 5;
			obj_CharaMonster_Phase1.image_blend = c_black;
			audio_stop_sound(sr_phase2_intro);
			audio_play_sound(sr_phase2_drama, 0, true);
			audio_play_sound(mus_create, 0, false);
			audio_play_sound(Swipe, 0, false);
			audio_play_sound(Gigatalk, 0, false);
			audio_play_sound(mus_sfx_abreak, 0, false);
			audio_play_sound(DialupMashup, 0, false);
		}
		if Phase2Timer == 2759 {
			Dialogue = instance_create_depth(183, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2Partner.";
			Dialogue.TextQueue[0] = "@1Allow me to show you..."
			Dialogue.TextQueue[1] = "@4MY NEW FORM."
			Dialogue.Talker = "Stranger";
			Phase2Timer = 2760;
		}
		if Phase2Timer == 2761 || keyboard_check_pressed(ord("L")) {
			if global.SpeedrunMode == 1 && global.FG_Start == 1
				with (obj_SpeedrunTimer)
					Running = false;
				
			audio_stop_sound(sr_phase2_intro);
			audio_stop_sound(sr_phase2_drama);
			if global.FG_Heals > 0
				SetNotifText("ALL ITEMS RESTORED\nHP FULLY RECOVERED");
			global.EnemyGroup = 2;
			room_restart();
		}
		break;
	// PHASE 2 ENDING
	case -67:
		obj_Soul.Mode = SoulModes.Red;
		if (!instance_exists(Dialogue) && !instance_exists(obj_SpeechBubble)) || Phase3Timer > 1100
			Phase3Timer += 1;
		if Phase3Timer == 120 {
			audio_stop_all();
			obj_CharaMonster_Phase2.Death = 0;
			obj_CharaMonster_Phase2.ShakeEffect = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase3Timer == 210 {
			obj_CharaMonster_Phase2.ShakeEffect = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase3Timer == 270 {
			obj_CharaMonster_Phase2.ShakeEffect = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase3Timer == 300 {
			obj_CharaMonster_Phase2.ShakeEffect = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase3Timer == 450 {
			obj_CharaMonster_Phase2.Death = 1;
			Dialogue = instance_create_depth(123, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2Would you look at this?";
			Dialogue.TextQueue[0] = "@2I'm powerless."
			Dialogue.TextQueue[1] = "@2As I thought YOU would&be..."
			if global.NoHit
				Dialogue.TextQueue[2] = "@2Yet I can't inflict any&damage on you..."
			Dialogue.Talker = "Normal";
			Phase3Timer = 451;
		}
		if Phase3Timer == 452 {
			if global.SpeedrunMode == 1
				with (obj_SpeedrunTimer)
					Running = false;
		}
		if Phase3Timer == 455 {
			obj_CharaMonster_Phase2.Death = 0;
			obj_CharaMonster_Phase2.ShakeEffect = 3;
			audio_play_sound(Hurt, 0, false);
		}
		if Phase3Timer == 550 {
			audio_play_sound(sr_phase3_intro, 0, false);
			gaster = instance_create_depth(320, 20, 12, obj_GasterHands_Transition);
		}
		if Phase3Timer == 1172 {
			gaster.LeftOut = true;
			audio_play_sound(snd_grab, 0, false);
			obj_CharaMonster_Phase2.ShakeEffect = 2;
			obj_CharaMonster_Phase2.Death = 1;
		}
		if Phase3Timer == 1222 {
			Dialogue = instance_create_depth(133, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2What was that?";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if Phase3Timer == 1483 {
			instance_destroy(Dialogue);
			gaster.RightOut = true;
			audio_play_sound(snd_grab, 0, false);
			obj_CharaMonster_Phase2.ShakeEffect = 2;
			obj_CharaMonster_Phase2.Death = 2;
		}
		if Phase3Timer == 1533 {
			Dialogue = instance_create_depth(83, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@1What's happening to me?";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
			CreateGB(395, 390, 0, 242, 3, 2, false);
			CreateGB(560, 390, 0, 242, 3, 2, false);
		}
		if Phase3Timer == 1795 {
			instance_destroy(Dialogue);
			repeat 12 {
				shard = instance_create_depth(345, 430, -100, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-5, 5);
				shard.vspeed = random_range(-5, 1);
				shard.gravity = 0.1;
				shard.sprite_index = Soul_Bit_White;
			
				shard2 = instance_create_depth(500, 430, -100, obj_GameOver_SoulBit);
				shard2.hspeed = random_range(-5, 5);
				shard2.vspeed = random_range(-5, 1);
				shard2.gravity = 0.1;
				shard2.sprite_index = Soul_Bit_White;
			}
			audio_play_sound(mus_create, 0, false);
			audio_play_sound(mus_sfx_abreak, 0, false);
			instance_destroy(obj_GasterHands_Transition);
			instance_destroy(obj_CharaMonster_Phase2);
			instance_create_depth(320, 160, 1, obj_CharaMonster_Phase3);
			global.GA = true;
			global.KARMA_ENABLED = false;
			Phase2Timer = 2689;
		}
		if Phase3Timer >= 1795 {
			Phase2Timer += 1;
			with (obj_CharaMonster_Phase3) {
				Siner = 0;
			}
		}
		if Phase3Timer == 1900 {
			Dialogue = instance_create_depth(70, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@1I feel so... strange...";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if Phase3Timer == 2399 {
			instance_destroy(Dialogue);
		}
		if Phase3Timer == 2400 {
			Dialogue = instance_create_depth(90, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@3This really hurts...&Please make it stop!";
			Dialogue.Talker = "Normal";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if Phase3Timer == 3199 || keyboard_check_pressed(ord("L")) {
			audio_stop_sound(sr_phase3_intro);
			global.EnemyGroup = 3;
			room_restart();
		}
		break;
	// Phase 3 alternate ending
	case 6666:
		obj_BulletBoard.visible = false;
		obj_ButtonController.visible = false;
		obj_CharaMonster_Phase3.visible = false;
		obj_Soul.visible = false;
		obj_BattleEffects.CMAB = 0;
		var layer_fx = layer_get_fx("Effect_1");
		fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
		if (!instance_exists(Dialogue) && !instance_exists(obj_SpeechBubble))
			Phase3Timer += 1;
		if Phase3Timer == 1 {
			audio_stop_all();
			audio_play_sound(mus_sfx_abreak2, 0, false);
			instance_create_depth(0, 0, -100000, obj_HitFlash);
			instance_create_depth(320, 230, 0, obj_Chara_Phase3Ending);
		}
		if Phase3Timer == 300 {
			obj_Chara_Phase3Ending.shake = 3;
			audio_play_sound(Hurt, 0, false);
			obj_Chara_Phase3Ending.image_index = 1;
				
			if global.NoHeal
				SetChaText("NO HEAL PHASE 3");
			if global.NoHit {
				UnlockAchievement(6);
				SetChaText("NO HIT PHASE 3");
			}
			UpdateSF(3, global.NoHeal, global.NoHit);
		}
		if Phase3Timer == 600 {
			obj_Chara_Phase3Ending.image_index += 1;
			Dialogue = instance_create_depth(133, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2P... Partner...";
			Dialogue.Talker = "Normal";
			Dialogue.CanAdvance = true;
			Phase3Timer += 1;
		}
		if Phase3Timer == 800 || Phase3Timer == 890 || Phase3Timer == 1000 {
			obj_Chara_Phase3Ending.shake = 3;
			audio_play_sound(Hurt, 0, false);
			obj_Chara_Phase3Ending.image_index = 1;
		}
		if Phase3Timer == 1200 {
			obj_Chara_Phase3Ending.image_index = 3;
			obj_Chara_Phase3Ending.shake = 3;
			audio_play_sound(Hurt, 0, false);
			Dialogue = instance_create_depth(133, 30, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2T... Thank you...";
			Dialogue.Talker = "Normal";
			Dialogue.CanAdvance = true;
			Phase3Timer += 1;
		}
		if Phase3Timer == 1202 {
			audio_play_sound(Hurt, 0, false);
			audio_play_sound(snd_test, 0, false);
			obj_Chara_Phase3Ending.image_index = 4;
			instance_create_depth(320, 380, -1000000, obj_Ending_Soul);
		}
		if Phase3Timer == 1800 {
			instance_create_depth(320, 240, 1, obj_Flowey_Phase4Transition);
		}
		break;
	// Phase 5 introduction
	case -68:
		alarm[1] = -1;
		if IntroTimer == 0 {
			audio_sound_gain(mus_wind, 0.2, 0);
			obj_ButtonController.visible = false;
			obj_BulletBoard.visible = false;
			obj_Soul.visible = false;
			audio_play_sound(mus_wind, 0, true);
			audio_play_sound(mus_phase5_intro, 0, true);
			obj_CharaMonster_A_Phase1.image_blend = c_black;
		}
		if IntroTimer == 120 {
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2Ten minutes, Partner.";
			Dialogue.Talker = "Stranger";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer == 413 {
			instance_destroy(Dialogue);
			Dialogue = instance_create_depth(100, 288, -1000000, obj_TextElement);
			Dialogue.TextToDraw = "@2Ten minutes, until we both&succumb to our fates.";
			Dialogue.Talker = "Stranger";
			Dialogue.Unskippable = true;
			Dialogue.CanAdvance = false;
		}
		if IntroTimer > 413 && IntroTimer < 669 {
			obj_CharaMonster_A_Phase1.image_blend = make_color_rgb(IntroTimer - 413, IntroTimer - 413, IntroTimer - 413);
		}
		if IntroTimer == 822 || keyboard_check_pressed(ord("L")) || instance_exists(obj_GameOver) {
			audio_stop_sound(mus_phase5_intro);
			instance_destroy(Dialogue);
			global.BattleMusic = audio_play_sound(Phase5, 20, true);
			global.PlayerHP = 100;
			obj_BulletBoard.visible = true;
			obj_ButtonController.visible = true;
			instance_destroy();
			obj_CharaMonster_A_Phase1.image_blend = c_white;
		}
		IntroTimer += 1;
		break;
	// PACIFIST ENDING
	// Look, I wanted to pick a random number that wasn't used, I didn't do this for the memes
	case 727:
		if !instance_exists(obj_SpeechBubble)
			Phase2Timer += 1;
		if (Phase2Timer == 1) {
			obj_CharaMonster_Phase1.PacifistEnding = 1;
		}
		if (Phase2Timer == 30) {
			obj_Soul.x = obj_CharaMonster_Phase1.x - 40;
			obj_Soul.y = obj_CharaMonster_Phase1.y - 94;
			global.SoulSpeed = 0;
			global.FreeMoving = true;
			audio_play_sound(snd_grab, 0, false);
			UnlockAchievement(0);
		}
		if Phase2Timer == 150 {
			audio_play_sound(mus_zzz_c, 0, true);
			MySpeechBubble = instance_create_depth(obj_CharaMonster_Phase1.x + 40, obj_CharaMonster_Phase1.y - 130, -10000, obj_SpeechBubble);
			MySpeechBubble._ref = self;
			MySpeechBubble.TextToSend = "@1Thank you.";
			MySpeechBubble.TextToStore[0] = "@1I am very&grateful.";
			MySpeechBubble.TextToStore[1] = "@1However, don't&think I'm going&to let you off&that easily...";
			MySpeechBubble.TextToStore[2] = "@1Because...";
			MySpeechBubble.TextToStore[3] = "@1If I break&your SOUL...";
			MySpeechBubble.TextToStore[4] = "@1You will return.";
			MySpeechBubble.TextToStore[5] = "@1I know you&will.";
			MySpeechBubble.TextToStore[6] = "@1I saw it with&my own two&eyes, time and&time again.";
			MySpeechBubble.TextToStore[7] = "@1Whenever you&die, you come&back.";
			MySpeechBubble.TextToStore[8] = "@1Whenever you&die, you try&again.";
			MySpeechBubble.TextToStore[9] = "@1Whenever you&die...";
			MySpeechBubble.TextToStore[10] = "@1...";
			MySpeechBubble.TextToStore[11] = "@1It's obvious,&isn't it?";
			MySpeechBubble.TextToStore[12] = "@1You have a&bloodthirsty&need for&revenge...";
			MySpeechBubble.TextToStore[13] = "@1Don't you?";
			MySpeechBubble.TextToStore[14] = "@1Hee hee hee...";
			MySpeechBubble.TextToStore[15] = "@1Consider yourself...";
			Phase2Timer = 151;
		}
		if Phase2Timer == 211 {
			obj_Soul.visible = false;
			obj_ButtonController.visible = false;
			obj_BulletBoard.visible = false;
			audio_stop_all();
			audio_play_sound(Soul_Halve, 0, false);
			audio_play_sound(Soul_Shatter, 0, false);
			obj_CharaMonster_Phase1.PacifistEnding = 2;
			repeat 5 {
				shard = instance_create_depth(obj_CharaMonster_Phase1.x - 40, obj_CharaMonster_Phase1.y - 84, -1000000, obj_GameOver_SoulBit);
				shard.hspeed = random_range(-3, 3);
				shard.vspeed = random_range(-2, 1);
				shard.gravity = 0.02;
			}
		}
		if Phase2Timer == 311 {
			MySpeechBubble = instance_create_depth(obj_CharaMonster_Phase1.x + 40, obj_CharaMonster_Phase1.y - 60, -10000, obj_SpeechBubble);
			MySpeechBubble._ref = self;
			MySpeechBubble.TextToSend = "@9LOST.";
			MySpeechBubble.Talker = "Silent";
			Phase2Timer = 312;	
		}
		if Phase2Timer == 313 {
			with (obj_SpeedrunTimer) {
				Running = false;
				if global.SpeedrunMode != 1
					Time = 0;
			}
		}
		if Phase2Timer == 1380 {
			room_goto(Room_MainMenu);
			if (global.NoHit)
				UnlockAchievement(4);
			UpdateSF(0, global.NoHeal, global.NoHit);
		}
		break;
}