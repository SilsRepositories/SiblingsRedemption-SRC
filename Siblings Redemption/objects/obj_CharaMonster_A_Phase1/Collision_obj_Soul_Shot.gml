ShakeEffect = 2;
audio_play_sound(MonsterHurt, 0, false);
Hits -= 1;
instance_destroy(other);
shard = instance_create_depth(x + random_range(-20, 20), y - random(30), -100, obj_GameOver_SoulBit);
shard.hspeed = random_range(-3, 3);
shard.vspeed = random_range(-3, 1);
shard.gravity = -0.1;
shard.sprite_index = Soul_Bit_White;