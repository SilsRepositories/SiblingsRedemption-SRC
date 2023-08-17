if TRotation != Rotation {
	TRotation += (Rotation - TRotation) / 12;
}
camera_set_view_angle(view_camera[0], TRotation);
if !surface_exists(surf) {
    surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
    view_surface_id[0] = surf;
}