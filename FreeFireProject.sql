create database free_fire;
use free_fire;
-- 1st table
create table event_s(id int, FF_id bigint primary key ,top_up_amount varchar(200),patach_info varchar(190),
bundle_evnts varchar(100),events varchar(100));  -- here bundle_events is mistake so modify this name to bundle events


alter table event_s add foreign key (bundle_evnts) references luck_royale (gold_royale);
alter table event_s add foreign key(id) references Weapons_Skins(id);

-- primary key is FF-id
-- foreign key is bundle_events,id

set foreign_key_checks = 0;
set autocommit=0;
desc table event_s;

insert into event_s values(1,10182323,900,"BR_Patach_Update","Red_Criminal","NEW_YEAR_Clebrations"),
(2,83784632,100,"CS_Rank_Update","Cobra_Rage_Bundle","Winter_Land"),
(3,92387433,200,"BR_Rank_Coins","Red_Criminal","Daily_Task"),
(4,43458356,100,"Charecter_Update","Green_Criminal","Item_sale"),
(5,28648345,350,"Guns_power_adjustment","Aispeed_Ace_Bundle","Login_rewards"),
(6,68273876,1000,"Rank_Update_Timings","Camou_War_Turtel_Bundle","Top_Up_Promo"),
(7,78763643,4000,"Server_Update","Angelical_Jogger","Web_Event"),
(8,89877939,2000,"Dev_Blog_Map_Adjustement","Frost_Sabertooth_Bundle","Dynamic_Duo"),
(9,96152433,200,"1st_Anniversary","Hiphop_Angel_Bundle","FF_Join_Forces_With_Demon"),
(10,98273710,700,"Sesions_Updates","Keyboard_Warrior_Bundle","Diwali_Event");
select*from event_s;
savepoint a1;

insert into event_s values (11,92837411,300,"Maintaince_Problem","Bunny_warrior_bundle","Bunny_warrior_bundle_event"),
(12,82734412,500,"Patch_notes","Wildifire_Vagabond_bundle","Luck_royal"),
(13,76565613,400,"Br_Economy_Adjustments","Valianta_Skorpina_Bundel","MOCO_Store"),
(14,14876688,600,"Rampage_Return","Venom_Streetware_Bundle","Venom_Colabration"),
(15,15756756,200,"DEV_BLOG_MAP_ADJUSTMENT","Venomous_skorpios_Bundel","ELITE_PASS"),
(16,16876867,400,"Rampage","Frost_Sabertooth_Bundle","Rampage_event"),
(17,18368337,800,"Magic_cube_update","Anniversary_bundle","2ND_Anniversary"),
(18,18376438,80,"store_update","Black_Bunny_Bundle","Luck_Royal"),
(19,19298379,250,"Upcoming_events","Blue_Criminal_Bundle","Ring_Event"),
(20,27655550,400,"Free_Fire_india","Galaxy_Dino_Bundle","Dino_Royal");
select*from event_s;
savepoint a2;
commit;
insert into  event_s values(21,21876677,80,"50%_offon_store","Bunny_Warrior_Bundle","Bunny_event"),
(22,22987987,240,"indipendente_events","Shadow_Red_Bundle","Ring_event"),
(23,28376433,80,"BR_Update","Blue_Blaster","indipendente_day_event"),
(24,22222222,800,"cs_Update","Sakura_Bundle","Return_session_Bundles"),
(25,25565263,450,"Small_Upadte_on_Gun_Attributes","Blue_Criminal_Bundle","Criminal_events"),
(26,26981783,500,"CYBER_AIRDROP","SUGA_Bundle","BTS_Event"),
(27,27872687,80,"Adjusted_the_basic_amount_of_CS_Cash","Jungkook_Bundle","BTS"),
(28,28987383,240,"See_Enemies_Passive_Skils","Jin_Bundle","BTS"),
(29,28276339,4000,"SOLO_DARE","RAGER_TRIBE_Bundle","Diamond_Royal"),
(30,38768270,5000,"ZOMBIE_HUNT","DAWNLIT_HITMAN_Bundle","Diamond_Royal");
select*from event_s;
savepoint a3;

select * from event_s order by id asc;
alter table event_s rename column bundle_evnts to bundle_events;
alter table event_s modify column patach_info varchar(300);
desc event_S;
alter table event_s add column free_fire_UID bigint;
select * from event_s;
update event_s set free_fire_UID=12143414;
alter table event_s  drop column free_fire_UID;
delete from event_s where ff_id = 15756756;
alter table event_s add column ff_UID bigint;
update  event_s set ff_uid = 11111111;
update event_s set ff_uid= case
when id=1 then 87368454
when id=2 then 98777876
when id=3 then 09878777
when id=4 then 98876844
when id=5 then 65623877
when id=6 then 09866432
when id=7 then 83764562
when id=8 then 76687482
else ff_uid
end ;
alter table event_s  drop column ff_uid;

-- Operators
-- AND
select * from event_s where id=2 and FF_id=10182323;   -- id is true but FF-id is false so output is false
select * from event_s where id=2 and FF_id=83784632;   -- id is true and ff-id is also ture so out is also true
-- OR
select*from event_s where id=2 or ff_id= 10182323;
 -- NOT
select* from event_s where not id=1;
-- BETWEEN
select*from event_s where id>=20 and id<=25;
select*from event_s where id between 1 and 10 ;
select*from event_s where patach_info between "a" and "b";

-- like
select * from event_s where patach_info like "a%";
select * from event_s where patach_info like "%a";
select * from event_s where patach_info like "%a%";

-- IN 
select*from event_s where  id in  (1,2) and ff_id in (28648345,18376438) ;
select*from event_s where  id in  (1,2) and ff_id in (10182323,83784632) ;
select*from event_s where  id in  (1,2) or ff_id in (28648345,18376438) ;

-- adding constraints
alter table event_s modify top_up_amount varchar(200) not null;
alter table event_s modify FF_id bigint unique;
alter table event_s modify bundle_events varchar(100) default("Hip_Hop_Bundle");
desc event_s;

-- joins
-- inner join
select*from event_s inner join elite_pass on event_s.ff_id=elite_pass.ff_id;
select*from event_s left join elite_pass on event_s.ff_id=elite_pass.ff_id;
select*from event_s right join elite_pass on event_s.ff_id=elite_pass.ff_id;
-- full join 
select*from event_s left join elite_pass on event_s.ff_id=elite_pass.ff_id union
select*from event_s right join elite_pass on event_s.ff_id=elite_pass.ff_id;
-- corss join 
select * from event_s cross join elite_pass;


-- views
create view v1 as select FF_id from event_s;
create view v2 as select id,bundle_events from event_s;
create or replace view v2 as select bundle_events,ff_id from event_s;
select * from v2;
select * from v1;

-- indexes
create index e on event_s(id);
show indexes in event_s;
select*from event_s use index(e);
create index ev on event_s (ff_id);
show indexes in event_s;
create index eve on event_s(bundle_events);
show indexes in event_s;
drop index ev on event_s;
create unique index even_t on event_s(ff_id);
show indexes in event_s;
-- stored procedures
call omkar();








-- 2nd table
Create table  Elite_Pass(id int, FF_id bigint,name varchar(100),limited_edition varchar(100),
level int,main_prize varchar(100),free_pass_Diamond bigint,premium_pass_Diamond bigint,
Required_Badges_To_complite int);

select*from elite_pass;
desc elite_pass;

alter table Elite_pass add primary key (main_prize);
alter table Elite_pass add foreign key (FF_id) references event_s(FF_id);
alter table Elite_pass add foreign key (id) references Weapons_Skins(id);
alter table Elite_pass add foreign key (FF_id) references  profil_e(uid);

-- primary key is main_prize
-- foreign key is ffid , id

set foreign_key_checks = 0;
set autocommit=0;
desc elite_pass;

-- -- Adding Constraints
alter table elite_pass modify id int not null;
alter table elite_pass modify FF_id bigint check(ff_id=8);
alter table elite_pass modify limited_edition varchar(100) default("30_days");
alter table elite_pass modify ff_id bigint unique;
ALTER TABLE Elite_Pass DROP CHECK elite_pass_chk_1;
alter table elite_pass add column Year_of_coming date after  premium_pass_Diamond ;
select*from elite_pass;
desc elite_pass;

insert into Elite_Pass values (1,98782731,"Kitsune","30_days",20,"Sakura_Blossom_bundles",499,999,"2018-06-01",175),
(2,92874744,"Hip_Hop","31_days",90,"Hip_Hop_Bundles",499,999,"2018-07-01",200),
(3,98743865,"Doomsday_Madness","31_days",60,"futuristic_styled_outfits_fit_Bundles",400,999,"2018-08-01",225),
(4,87236434,"Royal_Revelry","30_days",40,"Royal_Themed_Bundles",500,999,"2018-09-01",200),
(5,10182323,"Pirates_Legend","31_days",60,"Pirates_Legend_Bundles",400,699,"2018-10-01",200),
(6,21876677,"Arcade_Mayhem","30_days",70,"Arcade_Mayhem_Bundles",499,999,"2018-11-01",200),
(7,22987987,"Steampunk_Revolution","31_days",60,"Steampunk_Revolution_Bundles",400,750,"2018-12-01",250),
(8,28376433,"Impulsive_Shock","31_days",70,"Impulsive_Shock_Bundles",499,999,"2019-01-01",250),
(9,22222222,"Bomb_Squad","28_days",100,"Bomb_Squad_Bundles",400,790,"2019-02-01",200),
(10,25565263,"Anubis_Legends","31_days",80,"Anubis_Legends_Bundles",499,999,"2019-03-01",250);
select*from elite_pass;
savepoint b1;

insert into Elite_Pass values(11,27872687,"Dragon_Slayers","30_days",250,"Dragons_EGG_Grenade",599,1000,"2019-04-01",230),
(12,83764867,"Wrath_Of_The_Wild","31_days",250,"Deadly_Panther_SCAR",400,750,"2019-05-01",199),
(13,87264876,"Rampage_Redemption","30_days",250,"Rampage_Bundles",499,999,"2019-06-01",240),
(14,82764873,"Primal_Hunter","31_days",200,"Primal_Hunter_Bundles",400,760,"2019-07-01",200),
(15,87746475,"Sandstorm_Warriors","31_days",4000,"Sandstorm_Warriors_Bundles",499,750,"2019-08-01",200),
(16,28767787,"Gunslinger","30_days",1000,"Gunslinger_Bundles",499,999,"2019-09-01",260),
(17,38764874,"Blood_Demon","31_days",100,"Blood_Demon_Bundles",400,750,"2019-10-01",200),
(18,87687684,"Death_Penalty","30_days",4500,"Death_Penalty_Bundles",499,999,"2019-11-01",230),
(19,97264664,"Ghost_Pirates","31_days",80,"Shark_Head",700,1100,"2019-12-01",250),
(20,76536546,"Shadow_Combat","31_days",80,"Shadow_Combat_Bundles",499,750,"2020-01-01",200);
select*from elite_pass;
savepoint b2;
commit;

insert into Elite_Pass values(21,65634633,"T_R_A_P_Revolution","28_days",100,"Swagger_Grenade",499,999,"2020-02-01",200),
(22,76576524,"Wasteland_Survivors","31_days",80,"Wasteland_Survivors_Bundles",499,999,"2020-03-01",250),
(23,15317653,"Agent_Paws","30_days",250,"Agent_Paws_Bundles",400,999,"2020-04-01",200),
(24,71635433,"Forsaken_Creed","31_days",1000,"Forsaken_Creed_Bundles",499,999,"2020-05-01",250),
(25,87626423," Fabled_Fox","30_days",2000,"Fabled_Fox",400,999,"2020-06-01",200),
(26,54563423,"Rampage_II:_Uprising","31_days",2000,"Treatment_Gun_Lifebeam",499,999,"2020-07-01",240),
(27,65876224,"Sushi_Menace","31_days",900,"Sushi_Menace_Bundles",500,999,"2020-08-01",250),
(28,87625432,"Celestial_Street","30_days",750,"Celestial_Street_pan",499,999,"2020-09-01",200),
(29,28276339,"Anubis_Legend_II","31_days",1000,"Mysterious_Bundles",499,999,"2020-10-01",250),
(30,38768270,"Ultrasonic_Rave","30_days",2000,"Ultrasonic_Rave_Bundles",499,999,"2020-11-01",250);
select*from elite_pass;
savepoint b3;
desc elite_pass;

-- Operators
-- AND
select * from elite_pass where FF_id=98782731 and  id=2 ;
select * from elite_pass where FF_id=98782731 and  id=1 ;
-- OR
select * from elite_pass where FF_id=98782731 or id=2 ;

-- BETWEEN
select*from elite_pass where id>=20 and id<=25;
select*from elite_pass where id between 1 and 10 ;
select*from elite_pass where main_prize between "a" and "b";

-- LIKE
select*from elite_pass where main_prize like "a%";
select*from elite_pass where main_prize like "%r";
select*from elite_pass where main_prize like "%a%"; 

-- IN 
select * from elite_pass where id in (1,2) or  main_prize in ("Kitsune" ,"Hip_Hop");

-- views
create view o1 as select  FF_id from elite_pass;
create view o2 as select main_prize from elite_pass;
create or replace view o2 as select main_prize,ff_id from elite_pass;
select * from o1;
select * from o2;

-- indexes
create index o on elite_pass(id);
show index in elite_pass;
create index m on elite_pass(main_prize);
create index k on elite_pass(ff_id);
select*from elite_pass use index(o);



-- stored procedures
call omkar2 ();








-- 3rd table 

create table luck_royale(id int, gold_royale varchar(100) primary key ,weapon_royale varchar(100),
ring_events varchar(100),diamond_royale varchar(100),incubator varchar(100),
moco_store varchar(100));

alter table luck_royale add foreign key (weapon_royale) references Store (weapon);
alter table luck_royale add foreign key (diamond_royale) references Elite_pass (main_prize);
alter table luck_royale add foreign key (id) references Weapons_Skins(id);

-- primary key is gold_royale
-- forign key is weapon royal,diamond_royale,id
set foreign_key_checks = 0;
set autocommit=0;

-- adding constraints
alter table luck_royale modify gold_royale varchar(100) not null;
alter table luck_royale modify id int unique;
alter table luck_royale modify weapon_royale varchar(100) default("AK47");
desc luck_royale;

insert into luck_royale values(1,"Leather_Vest","Famas_T_R_A_P","Golden_Shade_Bundle","Plan_Bermuda_Kunoichi_Bundle","Dino_Rangers_Incubator","Demilord_Bundle"),
(2,"Breakdancer","SVD_Swordsman_Legends","Fiery_Flash_Bundle","Age_of_Gold_Bundle","Top_Criminal_Incubator","valentines_Bundle"),
(3,"Wild Leopard","Duke_Swallowtail_AWM","Monister_Ring","Arcane_Seeker_Bundle","Wolf&Wizard_Incubator","Claws_Of_Fury_Skin"),
(4,"Dunk_Master"," ScorchingSands_AKA_The_Earth_M4A1","T_R_A_P_Chromablact","Duchess_Swallowtail_Bundle","Spiders_Nest_Incubator","Time_Traveller_Thomson"),
(5,"Quarterback","M82B_Vampire_Malevolence","Aim_High_Bundle","The_Executor_Bundle","Jesters_Manor_Incubator","Fist_of_Glory_bundle"),
(6,"Kitten","Groza_PoppinShootin","Dune_Konqueror_Bundle","LC_Colonel_Bundle","Mystical_Masters_Incubator","Futuristic_Skin"),
(7,"Queen_of_the_Ring","Sickly_Sweet_Parafal","M4A1_Gun_Skin","LC_Commander_Bundle","Heart_of_Marionette_Incubator","Limitless_punch_Skin"),
(8,"Motorcyclist","Sickly_Sweet_Parafal","Dune_Konqueror_Bundle","The_Abuser_Bundle","Blood_Moon_Incubator","Bule_Wave_Bundle"),
(9,"Warrior_Maiden","Warith_Patrol_Bizon","Shadow_ring_Event","The_Lion_Heart_Bundle","Samurai_x_Geisha_Incubator","Fist_Skin"),
(10,"Noble_Miss","Lava_Lustre_ChargeBuster","Dino_Bundle","Kungfu_fighting_Bundle","Rapper_Underworld_Incubator","Liberty_Superjock_Bundle");
savepoint c1;

insert into luck_royale values(11,"Madame_Poison","Riveroust_SplasherM24","Bunny_Ring_Event","Contingency_Elite_Bundle","M4A1_Incubator","Blue_Wave_Bundle"),
(12,"Disco","Falaring_Bionica_G36","Arctic_Blue_Bundle","Nian_Beast_Bundle","PockerMP40","Street_Thug_Bundle"),
(13,"Warrior_of_Garuda","Enflamed_Terror_MAC10","Angelic_Pants","Silver_Cyborg_Bundle","Samurai_Bundles","Mythos_Fist"),
(14,"Wolf_Catcher","BurnninglilyM14","Charge_Buster","Assassins_Cross_Bundle","Woodpaker_GunSkins","Fierce_Demilord_Bundle"),
(15,"Imperial_Guard","Frenzy_Bunny_charge_Buster","Hunter_Dante_Bundle","Colossal_Cyborg_Bundle","KillSpark_Game_Bundle","Street_thug_Bundle"),
(16,"Sailor","G18","Golden_Shade_Bundle","Purple_flame_Bundle","Rapper_UnderWorld","Shake_with_me"),
(17,"Cricket","Desert","FFWS_Evo_Bundle","Mystic_Seeker_Bundle","Yoka_Incubator","Fierce_Demilord_Bundle"),
(18,"Toxic_Retaliation","PARAFAL_Sickly_Sweet","Fiery_Ring","Inking_Affection","Daino_Incubator","MAG_7"),
(19,"Dunk_Bundle","Urban_Ragger_SKS","M_O_Ring","hunger_Strike_Bundle","Time_Travellers","AK47_Skull_Hunter"),
(20,"Imperial_corps","Urban_Ragger_SPAS12","Frostfire_Ring","Special_force_Elite_Bundle","Scifiscar_Incubator","Arrival_Animation");
savepoint c2;
commit;

insert into luck_royale values(21,"Quarter_Back","Urban_Ragger_Ak47","Throne_Emote","Dark_Eagle_Bundle","Redeye_M1887","Arrival_Skywing"),
(22,"Keyboard_Warrior","Imperial_Rome_collection_Famas","Fantastic_Fantasy_Bundle","Jiangshi_Bundle","Anegelic_Incubator","Locked_and_Loaded"),
(23,"Summer_wawe","Imperial_Rome_collection_Kar98k","Bunnys_M1887","Fire_Assassin_Bundle","Groza_Betaz_Banger_Incubator","Cosmic_Drachen_Skwing"),
(24,"Watercolor_Canvas","Imperial_Rome_collection_MP5","Manic_Maharaja_Bundle","Bloodthirst_varmpire_Bundle","MythosM60","Blood_moon_Katana"),
(25,"SPA_Vacation_Bundle","Imperial_Rome_collection_AK47","Mini_UZI_Space_Voyage","Cold_Frost_Bundle","Mp5_Incubator","Sweetie_villain_Bundle"),
(26,"Mechanical_set","Crowned_Conqueror","Ink_Strone_Bundle","Booldthirst_vampire_Bundle","MR_Fiery_Bundle","Moony_pet"),
(27,"Pop_Host_Bundle","Bizon_Warith_Patrol","Criminal_Event","Ace_Pilot_Bundle","Spiders_Nest","Groza_Golden_Roar"),
(28,"Rainbow_Sunshine_Bundle","M1014_Skins","EVO_Ring_Events","Vigilante_strike_Bundle","Rampage_Earthstomper_AUG","Celebration_Mask"),
(29,"Danuntless_Cammander","Flaring_Bionica_G36","Top_Criminal_Bundle","Verdict_Ironface","Brings_the_Theme_of_CardboardAnimals","Cobra_Fist"),
(30,"Midnight_Rider_Bundle","P90_Skins","The_Frost_Fire_Ring","Fury_Tribe_Bundle","Thompson_Galactic_Panrhera","Limitless_Punch");
savepoint c3;

-- Operators
-- AND
select * from luck_royale where id =2 and gold_royale="Madame_Poison";
select * from luck_royale where id=2 and gold_royale="Breakdancer";  
-- OR
select*from luck_royale where id=2 or gold_royale="Madame_Poison" ;
 -- NOT
select* from luck_royale where not id=1;
-- BETWEEN
select*from luck_royale where id>=25 and id<=26;
select*from luck_royale where id between 10 and 30 ;
select*from luck_royale where diamond_royale between "a" and "b";

-- like

select * from luck_royale where weapon_royale like "a%";
select * from luck_royale where diamond_royale like "a%";
select * from luck_royale where incubator like "%a%";

-- IN 

select*from luck_royale where  id in  (1,2) and gold_royale in ("Madame_Poison","Breakdancer") ;
select*from luck_royale where  id in  (10,25) and weapon_royale in ("Lava_Lustre_ChargeBuster","Imperial_Rome_collection_AK47");
select*from luck_royale where  id in  (1,2) or moco_store in ("Arrival_Animation","valentines_Bundle");


-- joins
-- inner join
select*from luck_royale inner join store on luck_royale.gold_royale=store.fashion;
select*from luck_royale left join store on luck_royale.weapon_royale=store.Weapon;
select*from luck_royale right join store on luck_royale.gold_royale=store.fashion;
-- full join 
select*from luck_royale left join store on luck_royale.weapon_royale=store.Weapon union
select*from luck_royale right join store on luck_royale.gold_royale=store.fashion;
-- corss join 
select * from luck_royale cross join store;


-- views

create view m1 as select id from luck_royale;
create view m2 as select id,gold_royale from luck_royale;
create or replace view m2 as select id,gold_royale from luck_royale;
select * from m2;
select * from m1;


-- indexes

create index l on luck_royale(id);
show indexes in luck_royale;
select*from luck_royale use index(l);
create index lu on luck_royale (gold_royale);
show indexes in luck_royale;
create unique index moco_store on luck_royale(id);
show indexes in luck_royale;
-- stored procedures
call Friend ();








-- 4th table
create table store(id int,UID bigint, daily_special_item varchar(100),fashion varchar(100),
collection varchar(100),Weapon varchar(100),redeem varchar(50),gifts varchar(100));


alter table store add primary key (weapon);
alter table store add foreign key (fashion) references luck_royale (gold_royale);
alter table store add foreign key(id) references Weapons_Skins(id);
alter table store add foreign key(UID) references event_s(FF_id);
alter table store add foreign key(UID) references  profil_e(uid);


-- primary key is weapon
-- foreign key is fashion , id , UID
-- adding constraints
alter table store modify Weapon varchar(100) not null;
alter table store modify id int unique;
alter table store modify collection  varchar(100) default("HipHop");

set foreign_key_checks = 0;
set autocommit=0;


insert into store values (1,82764666,"Gold","The_Flashing_Spade_Bundle","BackPacks125","GoldenM4A1","Ancient_Glory_Bundle","RookieDevilBundle"),
(2,82364837,"TheWeekendBundle","The_Blazing_Heart_Bundle","Kemusan_Emote","M24SteelCowboy","EnergyTotenBundle","GlacierDevilHunterBundle"),
(3,76542677,"CaryGuitarEmote","TealYoungstarBundle","SpinMaster","SongOfHangKingFisher","DuskitSlayerBundle","PacificBreezeBundle"),
(4,65436253,"EnflamedterrorBundle","DreamyClub_Bundle","GrimRiderBackPack","CHargeBusterNightBite","BladebillSoarer_Bundle","DenimShorts"),
(5,43245435,"DenimShortFemale","EternalDiamond_Bundle","KittyRide_SkyBoard","NightslayerGrizzly_UMP","BR_ProtectionCard","PacificBreeze_Bundle"),
(6,87625323,"EnflamedImmortal_Bundle","SummerDarling_Bundle","DeadlyDescentParachute","NightslayerGrizzly_SVD","DoctorRedBundle","EnflamedImmortal_Bundle"),
(7,35476566,"MonochromeSuspense_Bundle","ExiledBiker_Bundle","CrownedBones_Parachute","WarithPatrol_Bizon","DocoterRed_BundleFemale","EnflamedTerrpr_BundleMale"),
(8,76525464,"ClassicJazzJacket","BanishedBiker_Bundle","RuinsColossus_LootBox","WarithPatrol_PARAFAL","NightbloomSlayer_Bundle","P90_Phantom"),
(9,76535354,"Summerheart_Throb","Azure_Annihilation_Bundle","Flame_WingsSkywing","MaroonLaser_Katana","InnerSelfMastery","ShinobiAblaze_Bundle"),
(10,98764674,"LOLEmote","Tan_the_Assassin_Bundle","Cobra_MoterBike","PhantomPredaterGlooWall","InnerNightMare_M14","ModrenjazzPants");
savepoint d1;

insert into store values(11,87236434,"GreyTechwearPant","Lee_the_Dragon_Bundle","VictoriousEagleEmote","OrnamentalTouch_DesertEagle","AncientTribe","ExclusvieGalaxyCoat"),
(12,28276339,"FullArmTatto","Aloks_Beach_Bod","EnergeticEmote","ChargeBuster_LavaLuster","HauntsQutarageM14","HipHopGaze_Bundle"),
(13,27872687,"ShinningBoot","MrDeath_Bundle","LuminoWheels_MonisterTruck","LavaLustre_G18","GoldRoyaleVochers","ColorsOfLuckFacepaintsFace"),
(14,10182323,"AloksBeachBod","DevilHunter_Bundle","WeightTrainingEmote","M1014_DarkroseLurker","M4A1_Stargeneral","M1014_DarkroseLurker"),
(15,28376433,"Doggo_cap","Perfect_Rhythm_Bundle","SpoortsCarVentus","Scyte_AstroTaunt","SilverSamurai_Bundle","PugPet"),
(16,15317653,"M1014_DarkroseLurker","Deep_Freeze_Bundle","NanoLifeSheld","Parag_CrystalPixelSlicer","SillverEmpressBundle","ShinobiLaghiteBundle"),
(17,76536546,"CubicBunnyFace","Crystal_Giant_Bundle","LootBox_TrophyCase","Pan_TideWaves","TheGeaffitoMarinoBundle","odrenJazzPants"),
(18,18376438,"AmateurNinjaPant","Blue_Angel_Bundle","LakeSpiritsSkyBoard","Dagger_Scorpio","NameChangeCard","BloodBusterBundle"),
(19,76576524,"Gold","PinkGuardian_Bundle","DribbleKingEmote","PinkWink_GlooWall","SnappyBundle","StarGarzer_Bundle"),
(20,14876688,"Gold","NorthernCardinal_Bundle","GalaxyHyperbook","Parang_FuturneticSlicer","LotusBlader_Bundle","FangPet");
savepoint d2;
commit;

insert into store values(21,97264664,"Gold","Budgerigar_Bundle","HungryDoge_LootBox","MAC10_EnflamedTerror","MR_NutcrakerBundle","Monumental_Colors"),
(22,65634633,"AzureAnnihilation_Top","PinkFiresparksFACE","Aqua_Backpack","DarkroseLurker_M1014","DawnlitHitman_Bundle","Metallic_SwordmasterBundle"),
(23,28767787,"Exiled_Biker_Face","PhantomMicrozark_Bundle","HandPainted_Skyboard","FlaringBionica_G36","MoonlightBallad_Bundle","JailbirdTop"),
(24,97264664,"SummerDarling_Top","Jailbrid_Bundle","GreatCinductorEmote","AK47_PigmentSplash","StarGazer_Bundle","Scyte_AsrroTaunt"),
(25,82764873,"SilverBoot","ClassicJazzjacket_Bundle","HeartLaced_LootBox","PigmentSplash_AK47","EnchantedFable_Bundle","HipHopGaze_Bundle"),
(26,87746475,"EternalDiamond_Top","EvilSlayer_Bundle","BlazedNight_Parachute","ParangFuturneticSlicer","ShdowEarthshaker_Bundle","Impossibles"),
(27,22987987,"ModerenJazz_Shoes","SunscaleSepent_Bundle","BooyahSparksEmote","HavenWarrior_SCAR","WickendCOcount_Backpack","PhantomMicrozark_Bundle"),
(28,27655550,"Soft_mint_Shoes","EngravedMoonlight_FacePaint","Moco_Skywing","Dagger_Boho","ChickyChic_Bundle","Cheongsam_Bottom"),
(29,22222222,"Cheongsam_Bottom","FemaletechwearPants","TheCollapse_Emote","M82B_VampireMalevolence","GraffitiMarina_Top","SillverEmpress_Bundle"),
(30,27655550,"DreamyClub_Shoes","SilverEmpressBundle","GreenPower_Backpack","UMP_DigitalDasher","GraffitoMarino_Mask","RiderJacket_Male");
savepoint d3;

insert into store values(31,98728743,"gold","Leather_Vest","Midnight_Rider_Bundle","SVD_Swordsman_Legends","docter_red_bundle","Tshirt"),
(32,98273498,"gold","Breakdancer","Female_docter_redBundle"," ScorchingSands_AKA_The_Earth_M4A1","MagicCube","AK47_skins"),
(33,98798724,"Bundle","Sailor","HipHop_Bundle","SCAR_Alpha","ElectricShack_bundle","Bunny_MP40") ;
savepoint d4;


select *from store;

-- Operators
-- AND
select * from store where uid=22987987 and  id=2 ;
select * from store where uid=82764666 and  id=1 ;
-- OR
select * from store where uid=22987987 or  id=2 ;

-- BETWEEN
select*from store where id>=20 and id<=25;
select*from store where id between 5 and 10 ;
select*from store where daily_special_item between "a" and "g";

-- LIKE
select*from store where gifts like "f%";
select*from store where Weapon like "%r";
select*from store where collection like "%b%"; 

-- IN 
select * from store where id in (1,2,9) or  Weapon in ("GoldenM4A1","M24SteelCowboy","MaroonLaser_Katana");

-- views
create view k1 as select  weapon from store;
create view k4 as select daily_special_item from store;
create view k3 as select gifts from store;
create or replace view k2 as select weapon,gifts,daily_special_item from store;
select * from k1;
select * from k2;
select* from k3;
select*from k4;

-- indexes
create index d on store(id);
show index in store;
create index e on store(uid);
create index c on store(fashion);
select*from store use index(c);



-- stored procedures
call omkar3();

















-- 5th table
create table Weapons_Skins(id int, UID bigint, Rifle varchar(100),Sub_MachinEgun varchar(100),
Shotgun varchar(100),Pistol varchar(100),Melee varchar(100),Grenade int,
Grenade_Gloo_Wall varchar(100));


alter table  Weapons_Skins add primary key(id); 
alter table Weapons_Skins add foreign key(UID) references event_s (FF_id);
alter table Weapons_Skins add foreign key(Rifle) references store(weapon);
alter table Weapons_Skins add foreign key(Sub_MachinEgun) references store(weapon);
alter table Weapons_Skins add foreign key(Shotgun) references store(weapon);
alter table Weapons_Skins add foreign key(Pistol) references store(weapon);
alter table Weapons_Skins add foreign key(Melee) references store(weapon);
alter table Weapons_Skins add foreign key(Grenade_Gloo_Wall) references store(weapon);
alter table Weapons_Skins add foreign key(UID) references  profil_e(uid);



-- primary key is id
-- foreign key is UID,Rifle,Rifle,Sub_MachinEgun,Shotgun,Pistol,Melee,Grenade,Grenade_Gloo_Wall
alter table weapons_skins modify uid bigint not null;
alter table weapons_skins modify id int unique;
alter table weapons_skins modify Grenade_Gloo_Wall varchar(100) default("GlooWall");


set foreign_key_checks = 0;
set autocommit=0;


alter table weapons_skins modify column Grenade varchar(100);-- here change the Grenade datatype

insert into Weapons_Skins values(1,76235476,"M4A1_50","MP_20","M1887_6","G18_30","PAN_40","Grenade_60","GlooWall_30"),
(2,82764666,"Ak47_50","UMP_60","M1014_40","M500_20","Parang_30","Grenade_20","GlooWall_20"),
(3,76525464,"M14_85","MP5_53","MAG7_20","DesertEagle_30","Katana_50","Grenede_30","GlooWall_40"),
(4,76536546,"SCAR_45","MP40_15","ChargeBuster_12","USP_20","BAT_50","Grenade_70","GlooWall_20"),
(5,18376438,"GROZA_40","P90_80","Trogon_2","M1917_30","Scythe_23","Grenade_21","GlooWall_10"),
(6,76576524,"M4A1_50","Thompson_40","M1887_10","USP2_4","Katana_30","Grenade_12","GlooWall_20"),
(7,14876688,"SCAR_40","MP40_30","SPAS12_19","MiniUzi_30","FFKnife_30","Grenede_42","GlooWall_29"),
(8,97264664,"XM8_30","Vector_20","M1014_30","USP_20","Bat_20","SMokeGrenade_10","GlooWall_20"),
(9,65634633,"M14","MAC10_10","M1887_10","G18_20","Parang_20","Grenade_20","GlooWall_30"),
(10,28767787,"FAMAS_50","VSS_20","SPAS12_20","M1917_50","Katana_20","Grenade_20","GlooWall_20");
savepoint e1;

insert into weapons_skins values(11,97264664,"AN94_100","MP40_30","M1887_12","G18_20","Bat_20","Grenade_40","GlooWall_30"),
(12,82764873,"M14_30","Mp5_120","MAG7_20","M1873_20","Katana_50","Grenade_20","GlooWall_40"),
(13,87746475,"AK47_30","VSS_20","MAG7_10","DesertEgale_30","Pan_20","Grenade_20","GlooWall_30"),
(14,22987987,"AUG_20","UMP_20","SPAS12_30","M500","BAT_20","Grenade_60","GlooWall_30"),
(15,27655550,"AN94_30","MP40_20","M1887_12","G18_30","PAN_40","Grenade_20","GlooWall_30"),
(16,22222222,"GROZA_20","VECTOR_30","SPAS12_30","USP2_10","FFKnife_10","Grenade_50","GlooWall_30"),
(17,27655550,"PLASMA_100","BIZON_10","M1887_13","M1873_20","Katana_40","Grenade_20","GlooWall_39"),
(18,98273710,"SCAR_38","MP40_32","M1014_23","DesertEagle_12","Bat_23","Grenade_44","GlooWall_23"),
(19,82366877,"AK47","MP5_34","MAG7_23","USP_12","Parang_23","Grenade_23","GlooWall_34"),
(20,98797332,"FAMAS_21","VSS_12","M1887_14","G18_34","Parang_12","Grenade_21","GlooWall_23");
savepoint e2;
commit;

insert into weapons_skins values(21,87287654,"M14_23","MP40_22","M1014_13","G18_35","Bat_23","Grenade_23","GlooWall_13"),
(22,92874998,"AK47","MP5_23","M1887_12","G18_45","Pan_23","Grenade_24","GlooWall_21"),
(23,26747423,"SCAR_23","UMP_34","SPAS12_32","USP2_22","Parang_23","Grenade_23","GlooWall_23"),
(24,28347872,"AUG_43","MAC10_23","M1887_12","G18","Bat_100","Grenade_23","GlooWall_23"),
(25,87349898,"XM8_34","MP5_56","M1014_34","ICEGun_1","Scythe_23","Grenade_23","GlooWall_34"),
(26,87984293,"PLASMA_23","P90_53","M1014_23","M1917_10","Bat_23","Grenade_23","GlooWall_44"),
(27,98877233,"M14_45","UMP_32","SPAS12_34","DesertEagle_32","Katana_22","Grenade_23","GlooWall_65"),
(28,98789473,"AN94_23","MP5_53","MAG7_5","G18_33","PAN_53","Grenade_46","GlooWall_57"),
(29,98798375,"AK47_76","UMP_45","M1887_67","USP_56","Bat_56","Grenade_46","GlooWall_76"),
(30,00000000,"SCAR_22","MP5_22","M1887_2","G18_22","Bat_22","Grenade_22","GlooWall_22");
savepoint e3;
 select*from weapons_skins;

-- Operators
-- AND
select * from weapons_skins where id=2 and uid=76235476 ;
select * from weapons_skins where id=1 and uid=76235476 ;  
-- OR
select*from weapons_skins where id=2 or gold_royale="Madame_Poison" ;
 -- NOT
select* from weapons_skins where not id=1;
-- BETWEEN
select*from weapons_skins where id>=0 and id<=3;
select*from weapons_skins where id between 1 and 2 ;
select*from weapons_skins where Pistol between "a" and 0;

-- like

select * from weapons_skins where Pistol like "g%";
select * from weapons_skins where Shotgun like "m%";
select * from weapons_skins where Pistol like "%n%";

-- IN 

select*from weapons_skins where  id in  (1,2) and Pistol in ("G18_30","Katana_20") ;
select*from weapons_skins where  id in  (10,25) and Shotgun in ("SPAS12_20","M1014_34");
select*from weapons_skins where  id in  (1,2) or Pistol in ("G18_30","Katana_20");


-- joins
-- inner join
select*from weapons_skins inner join profil_e on weapons_skins.uid=profil_e.uid;
select*from weapons_skins left join profil_e on weapons_skins.uid=profil_e.uid;
select*from weapons_skins right join profil_e on weapons_skins.uid=profil_e.uid;
-- full join 
select*from weapons_skins left join profil_e on weapons_skins.uid=profil_e.uid;
select*from weapons_skins right join profil_e on weapons_skins.uid=profil_e.uid;
-- corss join 
select * from weapons_skins cross join profil_e;


-- views

create view b1 as select id from weapons_skins;
create view u2 as select id,uid from weapons_skins;
create or replace view u2 as select id,Pistol from weapons_skins;
select * from b1;
select * from u2;


-- indexes

create index w on weapons_skins(uid);
show indexes in weapons_skins;
select*from weapons_skins use index(w);
create index ea on weapons_skins (pistol);
show indexes in weapons_skins;
create unique index uid on weapons_skins(id);
show indexes in weapons_skins;


-- stored procedures
call omkar4();











-- 6th table
create table profil_e(id int,name varchar(100),uid bigint,
Histor_y varchar(100) ,honor_score int,visitors_name  varchar(100));



alter table profil_e add primary key (uid);
alter table profil_e add foreign key (id) references Weapons_Skins(id);


-- foreign key is id 
-- primary key is uid

alter table profil_e modify id int not null;
alter table profil_e modify uid bigint unique;
alter table profil_e modify honor_score int default(100);



set foreign_key_checks = 0;
set autocommit=0;
select*from profil_e;

insert into profil_e values(1,"Omkar_143",76235476,"CS_Rank_Victory",94,"kalayan_453"),
(2,"Omkar_321",22222222,"CS_Deffet",100,"Decent_143"),
(3,"Reddy_143",76525464,"BR_RANK_Victory",99,"Kanna_143"),
(4,"Krishna_143",76536546,"CS_RANK_Victory",100,"DUKE_390"),
(5,"Duke_390",18376438,"CS_RANK_Deffet",90,"Nayu_123"),
(6,"Kanna_143",76576524,"BR_RANK_Victory",100,"Mahesh_763"),
(7,"Nani_764",14876688,"CS_RANK-Deffet",99,"NariNani_123"),
(8,"Nari_23444",97264664,"BR_RANK_Deffet",100,"Ashok_2423"),
(9,"Idiot_143",65634633,"CS_Deffet",60,"Pandu_2567557"),
(10,"Chinna_86873",28767787,"CS_Deffet",70,"Mahi_87685");
savepoint f1;
select*from profil_e;

insert into profil_e values(11,"Narayan_9798",97872748,"BR_Victory",100,"Mahimanani"),
(12,"Mahima_7686",82764873,"CS_RANK_Victory",99,"Roy_8777"),
(13,"KTM_200",87746475,"CS_Deffet",30,"Baby_2452"),
(14,"KZY_876876",22987987,"BR_RANK_Deffet",100,"Nayudu_9874"),
(15,"Lahari_86874",27655555,"CS_Victory",90,"JANU_278622"),
(16,"Nayudu_7862",27655550,"BR_RANK_Vectory",100,"Narashimha_87264"),
(17,"RTH_236817",98273710,"CS_RANk_Deffet",99,"ZX_87686"),
(18,"Duke_200",82366877,"BR_RANK_Victory",100,"TTT62343"),
(19,"Baby_87683",23435556,"CS_RANK_vectory",90,"Kavya_7987"),
(20,"Navya_8764",98384293,"BR_RANK_Deffet",100,"Hani_143");
savepoint f2;
commit;


insert into profil_e values(21,"Kavya_1134",9874673,"CS_RANK_Deffet",90,"Lohini_82768"),
(22,"Lohitha_8716",78334732,"BR_RANK_Vectory",100,"Navi_872684"),
(23,"Priya_26467",98736678,"CS_RANK_Deffet",99,"Loki_87623"),
(24,"Chintu_78",98383733,"BR_RANK_Victory",100,"Nari_6235"),
(25,"Omkar_87874",98484294,"CS_RANK_Vectory",99,"Mahendra_87264"),
(26,"OmkarReddy_874",87737438,"BR_RANK_Victory",100,"Janu_78263"),
(27,"Kanna_1341",96473476,"CS_RANK_Deffet",92,"Mohan_2647"),
(28,"Mohan_8264",97263642,"BR_RANK_Vectory",100,"KTM_2378"),
(29,"Barath_278",98773743,"CS_RANK_Deffet",90,"KTN_2364"),
(30,"Niru_874365",87623264,"BR_RANK_Deffet",100,"Ashok_98734");
savepoint f3;


select*from profil_e;

-- Operators
-- AND
select * from profil_e where id=2 and  uid=22222222 ;
select * from profil_e where id=23 and  uid=98736678 ;
-- OR
select * from profil_e where uid=22987987 or  id=2 ;

-- BETWEEN
select*from profil_e where id>=1 and id<=3;
select*from profil_e where id between 9 and 10 ;
select*from profil_e where visitors_name between "a" and "g";

-- LIKE
select*from profil_e where Histor_y  like "b%";
select*from profil_e where visitors_name like "%3";
select*from profil_e where Histor_y like "%f%"; 

-- IN 
select * from profil_e where id in (1,2,9) or  visitors_name in ("Ashok_98734","Hani_143","Janu_78263");

-- views
create view j as select visitors_name  from profil_e;
create view j2 as select Histor_y from profil_e;
create view j3 as select uid from profil_e;
create or replace view j as select visitors_name,histor_y from profil_e;
select * from j;
select * from j2;
select* from j3;

-- indexes
create index p on profil_e(id);
show index in profil_e;
create index r on profil_e(uid);
create index f on profil_e(visitors_name);
select*from profil_e use index(r);



-- stored procedures
call omkar5();










-- 7th table

create table friends(game_friends varchar(50),Dynamic_duo varchar(50),
platform_friends varchar(100),add_UID bigint);-- self join table

alter table friends add id int first;
select*from friends;

insert into friends values(1,"Omkar_143","Decent_143","Reddy_354",63427648),
(2,"Decent_143","Reddy_143","Duke_234",76784827),
(3,"Reddy_143","Duke_143","Nani234",82764243),
(4,"Duke_143","Mahi_123","Mohan_2863",87635624),
(5,"Mahi_123","Nari_187465","navya_6523",87632872),
(6,"Nari-187465","Kalyani_00","Hari_274",87289492),
(7,"Kalyani_00","Hari_274","Kiran_77",98728673),
(8,"Hari_274","Kiran_77","Mukesh_320",78264362),
(9,"Kiran_77","Mukesh_320","Sai_243",87657285),
(10,"Mukesh_320","Sai_243","Chandhu_24",09278724);
savepoint g1;

insert into friends values(11,"Sai_243","Chandhu_24","Nayu_263",98276873),
(12,"Chandhu_24","Nayu_263","Sunil_234",28763486),
(13,"Nayu_263","Sunil_234","Raju_23",86264828),
(14,"Sunil_234","Raju_23","Sunny_87",98276834),
(15,"Raju_23","Sunny_87","Mahesh_234",87287346),
(16,"Sunny_23","Mahesh_234","Ashok_34",28763462),
(17,"Mahesh_234","Ashok_34","Veera_23",76764587),
(18,"Ashok_34","Veera_23","Madhu_2655",98762645),
(19,"Veera_23","Madhu_2655","Deelip8725",82768746),
(20,"Madhu_2655","Deelip8725","Akil_24",98276478);
savepoint g2;
commit;


insert into friends values(21,"Deelip8725","Akil_24","Mohan7834",27646287),
(22,"Akil_24","Mohan7834","Sri_23",98726873),
(23,"Mohan7834","sri_23","Arjun_234",98278462),
(24,"Sri_23","Arjun_234","Deepa_234",87465685),
(25,"Arjun_234","Deepa_234","Ajay_345",87684586),
(26,"Deepa_234","Ajay_345","Raja_345",98789758),
(27,"Ajay_345","Raja_345","Nisha_87",87263462),
(28,"Raja_345","Nisha_87","Budden_24",87662846),
(29,"Nisha_87","Budden_24","NS_234",98727424),
(30,"Budden_24","NS_234","NS_200",98768276);
savepoint g3;
select*from friends;

select a1.game_friends as b_name , a2.game_friends as c_name from friends as a1 , friends a2 where a1.Dynamic_duo=a2.game_friends;






