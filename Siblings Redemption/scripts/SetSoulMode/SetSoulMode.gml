// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetSoulMode(Colour) {
	switch Colour {
		case "BLUE":
			obj_Soul.Mode = 1;
			break;
		case "GREEN":
			obj_Soul.Mode = 2;
			break;
		case "YELLOW":
			obj_Soul.Mode = 3;
			break;
		case "PURPLE":
			obj_Soul.Mode = 4;
			break;
		default:
			obj_Soul.Mode = 0;
			break;
	}
}