gpu_set_blendmode(bm_add);
if global.antiEpilepsy
	CMAB = 0;
draw_surface_ext(view_surface_id[0], x + random_range(-CMAB, CMAB), y + random_range(-CMAB, CMAB), 1, 1, 0, c_red, 1);
draw_surface_ext(view_surface_id[0], x + random_range(-CMAB, CMAB), y + random_range(-CMAB, CMAB), 1, 1, 0, c_lime, 1);
draw_surface_ext(view_surface_id[0], x + random_range(-CMAB, CMAB), y + random_range(-CMAB, CMAB), 1, 1, 0, c_blue, 1);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(haze, 0, 0, 0, camera_get_view_width(view_camera[0]) / 640, 1, 0, c_black, (0.4 + random(0.001)) + (ShakeEffect / 8));