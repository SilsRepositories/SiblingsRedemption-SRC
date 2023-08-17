global.BorderWidth = 570;
global.BorderHeight = 120;

window_set_size(640, 480);
surface_resize(application_surface, 640, 480);

global.SoulSpeed = 2;
global.PlayerHP = 0;
global.PlayerMaxHP = 0;
global.PlayerEXP = 0;
global.PlayerGOL = 0;
global.PlayerLV = 1;
global.Name = "";
global.Damage = 0;
global.GoldSoul = false;

global.GORoom = Room_Name;

global.FG_Hits = 0;
global.FG_Heals = 0;
global.FG_Start = 0;

global.PlayerAttack = 0;
global.PlayerDefense = 0;
global.InvFrames = 0;
global.Karma = 0;
global.KARMA_ENABLED = true;
global.PlayerKills = 0;

global.UISelectionMenu = 0;
global.BattleMenu = -1;

global.SoulX = 0;
global.SoulY = 0;

global.BattleMusic = MUSIC_Battle;
global.CurrentRoom = 0;
global.EnemyGroup = 0;

global.Monster[0] = noone;
global.Monster[1] = noone;
global.Monster[2] = noone;
global.coward = false;

global.Achievement[0, 0] = "Deal With The Devil";
global.Achievement[1, 0] = "The Jaws Of Defeat";
global.Achievement[2, 0] = "To Bed Without Supper";
global.Achievement[3, 0] = "Touch Of Gold Steel";
global.Achievement[4, 0] = "Fallen Down";
global.Achievement[5, 0] = "Slay The Beast";
global.Achievement[6, 0] = "Cold Hands Of Death";
global.Achievement[7, 0] = "The Afterlife";
global.Achievement[8, 0] = "Perfectionist";
global.Achievement[9, 0] = "Who's The Real Winner?";

global.Achievement[0, 1] = "Sell your SOUL to Chara.";
global.Achievement[1, 1] = "Finish the game.";
global.Achievement[2, 1] = "Finish the game from phase 1 to 4\nwithout healing or dying.";
global.Achievement[3, 1] = "The real deal...\nOnly the best can take it.";
global.Achievement[4, 1] = "Finish Phase 1 without getting hit.";
global.Achievement[5, 1] = "Finish Phase 2 without getting hit.";
global.Achievement[6, 1] = "Finish Phase 3 without getting hit.";
global.Achievement[7, 1] = "Finish Phase 4 without getting hit.";
global.Achievement[8, 1] = "You can go outside now.";

global.NoHeal = true;
global.NoHit = true;

global.SpeedrunMode = 0;
instance_create_depth(0, 0, -10000, obj_SpeedrunTimer);

global.DATA = ds_map_create();

global.Item[0] = "Pie";
global.Item[1] = "S.Piece";
global.Item[2] = "S.Piece";
global.Item[3] = "S.Piece";
global.Item[4] = "Steak";
global.Item[5] = "G.Burger";
global.Item[6] = "G.Burger";
global.Item[7] = "G.Burger";
instance_create_depth(20, 20, -1000000, obj_FlashingText);
instance_create_depth(20, 20, -1000000, obj_FlashingText_Challenge);

global.Cell[0] = "Toriel's Phone";
global.Cell[1] = "";
global.Cell[2] = "";
global.Cell[3] = "";

global.PlayerArmor = "Bandage";
global.PlayerWeapon = "Stick";

global.CanFlee = true;

START_GameSetup();
room_goto(Room_Warning);