audio_play_sound(Explosion, 0, false);
instance_create_depth(320, 320, 0, obj_Ending);
instance_destroy(obj_Explosion_Phase4);
instance_destroy(obj_Phase4_Soul);
var layer_fx = layer_get_fx("Effect_1");
fx_set_parameter(layer_fx, "g_RGBNoiseIntensity", 0);
repeat 50 {
	shard = instance_create_depth(320, 240, -100, obj_GameOver_SoulBit);
	shard.hspeed = random_range(-5, 5);
	shard.vspeed = random_range(-8, 1);
	shard.gravity = 0.02;
	shard.sprite_index = Soul_Bit_White;
}
instance_destroy();