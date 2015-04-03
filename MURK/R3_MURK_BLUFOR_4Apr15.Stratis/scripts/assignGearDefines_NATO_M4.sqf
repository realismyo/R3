// ===============================
// ===== Defines_FACTION.sqf =====
// ===============================
/*
- This part of the scripts defines all of the variables and functions required to equip the units.  

- Default behaviour DOES NOT replace goggles (aside from divers), players will have their default goggles.
- Make sure you test locally to ensure your loadouts work.
- Current Side, Faction: BLUFOR, NATO
- Required Mods: @AGM, @task_force_radio, @RHS_USF
*/
// ===============================
// ========== Variables ==========
// ===============================

private [
"_rifle","_rifleGL","_rifleScoped","_autoRifle","_carbine","_dmr","_mmg","_smg","_pistol",
"_grenade","_smoke","_throwG","_chemlightOne","_chemlightTwo","_flashbang",
"_rifleMag","_rifleTracerMag","_rifleGLMag","_rifleScopedMag","_autoRifleMag","_autoTracerMag","_carbineMag","_dmrMag","_mmgMag","_smgMag","_pistolMag",
"_glExplody","_glSmokeOne","_glSmokeTwo","_glFlareOne","_glFlareTwo",
"_plebUniformArray","_plebRandom","_plebUniform","_crewUniform",
"_plebHelmet",
"_plebVest","_glVest","_medVest",
"_smallRuck","_medRuck","_largeRuck","_uavRuck",
"_rpilotUniform","_fpilotUniform",
"_rotaryPilotHelmet","_fixedPilotHelmet","_crewmanHelmet",
"_pilotVest","_crewVest",
"_sniperUniform","_sniperVest","_sniperRuck",
"_diverUniform","_diverVest","_diverRuck",
"_goggles","_divingGoggles",
"_airRadioRuck","_radioRuck","_diverRadioRuck",
"_medOne","_medTwo","_medThree","_medFour",
"_rifleDiver","_rifleDiverMagOne","_rifleDiverMagTwo",
"_lat","_latMag",
"_binos","_radio","_toolbox",
"_facItems","_facSmokes",
"_uavTool","_uavBat",
"_hatLaunch","_hatMag","_aaLaunch","_aaMag",
"_boltRifle","_boltRifleMag","_sniperItems",
"_rangeFinder","_rangeFinderBat",
"_designator","_designatorBat",
"_hmgBarrel","_hmgTripod","_hmgMag",
"_gmgBarrel","_gmgTripod","_gmgMag",
"_nightVision","_basicTools","_basicItems","_autoItem","_secTools","_secItems","_pltTools","_pltItems",
"_generalAttachments","_autoRifleAttachments","_mmgAttachments",
"_sniperAttachments","_pistolAttachments",
"_scoped_rifleAttachments","_dmrAttachments","_scoped_autoRifleAttachments","_scoped_mmgAttachments",
"_suppressed_generalAttachments","_suppressed_dmrAttachments","_suppressed_autoRifleAttachments","_suppressed_mmgAttachments",
"_suppressed_pistolAttachments",
"_addClothes","_addBasics","_clearRuck","_addRuck","_addAttachments","_IFAK"
];

// ===============================
// =========== Defines ===========
// ===============================
// ======= General Weapons =======
switch (_variant) do {
	case "m4" : {
		_rifle = "rhs_weap_m4a1_grip";
		_rifleGL = "rhs_m4a1_m320";
		_rifleScoped = "rhs_weap_m4a1_bipod";
		_autoRifle = "rhs_weap_m249_pip";
		_carbine = "rhs_weap_m4a1_grip2";
		_dmr = "rhs_weap_m14ebrri";
		_mmg = "rhs_weap_m240B";
		_smg = "SMG_01_F";
		_pistol = "hgun_Pistol_heavy_01_F";
	};
	case "m16" : {
		_rifle = "rhs_weap_m16a4_grip";
		_rifleGL = "rhs_m4a1_m320";
		_rifleScoped = "rhs_weap_m16a4_bipod";
		_autoRifle = "rhs_weap_m249_pip";
		_carbine = "rhs_weap_m4a1_grip2";
		_dmr = "rhs_weap_m14ebrri";
		_mmg = "rhs_weap_m240B";
		_smg = "SMG_01_F";
		_pistol = "hgun_Pistol_heavy_01_F";
	};
};
// ====== General Magazines ======
_rifleMag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_rifleTracerMag = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
_rifleGLMag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_rifleScopedMag = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
_autoRifleMag = "rhsusf_100Rnd_556x45_soft_pouch";
_autoTracerMag = "rhsusf_100Rnd_556x45_soft_pouch";
_carbineMag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_dmrMag = "rhsusf_20Rnd_762x51_m118_special_Mag";
_mmgMag = "rhsusf_100Rnd_762x51";
_smgMag = "30Rnd_45ACP_Mag_SMG_01";
_pistolMag = "11Rnd_45ACP_Mag";
// ===== General Throwables ======
_grenade = "HandGrenade";
_smoke = "SmokeShell";
_throwG = [_grenade,_smoke];
_chemlightOne = "chemlight_green";
_chemlightTwo = "chemlight_red";
_flashbang = "AGM_M84";
// ========== GL Rounds ==========
_glExplody = "rhs_mag_M433_HEDP";
_glSmokeOne = "rhs_mag_M715_green";
_glSmokeTwo = "rhs_mag_M713_red";
_glFlareOne = "rhs_mag_M661_green";
_glFlareTwo = "rhs_mag_M662_red";
// ===============================
// ========== Clothing ===========
// ======== Camo Specific ========
// ===============================
switch (_camoPattern) do {
	case "us" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmet = "H_HelmetB_light";
		// ============ Vests ============
		_plebVest = "V_PlateCarrier3_rgr";
		_glVest = "V_PlateCarrierGL_rgr";
		_medVest = "V_PlateCarrier3_rgr";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_mcamo";
		_largeRuck = "B_Carryall_mcamo";
		_uavRuck = "B_UAV_01_backpack_F";
		// ==============================
	};
	case "ctrg" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["U_B_CTRG_1","U_B_CTRG_3","U_B_CTRG_1"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "U_B_CTRG_3";
		// =========== Helmets ===========
		_plebHelmet = "H_HelmetB_light";
		// ============ Vests ============
		_plebVest = "V_PlateCarrierL_CTRG";
		_glVest = "V_PlateCarrierH_CTRG";
		_medVest = "V_PlateCarrierH_CTRG";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_cbr";
		_uavRuck = "B_UAV_01_backpack_F";
		// ==============================
	};
	default {
		// ========== Uniforms ===========
		_plebUniformArray = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmet = "H_HelmetB_light";
		// ============ Vests ============
		_plebVest = "V_PlateCarrier3_rgr";
		_glVest = "V_PlateCarrierGL_rgr";
		_medVest = "V_PlateCarrier3_rgr";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_mcamo";
		_largeRuck = "B_Carryall_mcamo";
		_uavRuck = "B_UAV_01_backpack_F";
		// ==============================
	};
};
// ===============================
// ========== Clothing ===========
// ===== Non-Camo Specific =======
// ===============================
// ========== Veh Crews ==========
_rpilotUniform = "U_B_HeliPilotCoveralls";
_fpilotUniform = "U_B_PilotCoveralls";
_rotaryPilotHelmet = "H_PilotHelmetHeli_B";
_fixedPilotHelmet = "H_PilotHelmetFighter_B";
_crewmanHelmet = "H_HelmetCrew_B";
_pilotVest = "V_TacVest_oli";
_crewVest = "V_TacVest_oli";
// ========= Sniper Team =========
_sniperUniform = "U_B_GhillieSuit";
_sniperVest = "V_Chestrig_rgr";
_sniperRuck = "B_AssaultPack_rgr";
// ========= Diver Gear ==========
_diverUniform = "U_B_Wetsuit";
_diverVest = "V_RebreatherB";
_diverRuck = "B_AssaultPack_blk";
// ===============================
// ============ Misc =============
// =========== Goggles ===========
_goggles = "";	// leave as "" for default
_divingGoggles = "G_B_Diving";
// ========= Radio Rucks =========
_airRadioRuck = "tf_anarc210";
_radioRuck = "tf_rt1523g_big";
_diverRadioRuck = "tf_rt1523g_black";
// ======== Medical Gear =========
_medOne = "AGM_Bandage";
_medTwo = "AGM_Morphine";
_medThree = "AGM_Epipen";
_medFour = "AGM_Bloodbag";
// ===============================
// ====== Equipment/Items ========
// ========== General ============
_binos = "Binocular";
_radio = "ItemRadio";
_toolbox = "ToolKit";
// ============ Diver ============
if (_underwaterWeapons) then { 
	_rifleDiver = "arifle_SDAR_F"; 
} else { 
	_rifleDiver = _rifle; 
};
if (_underwaterWeapons) then { 
	_rifleDiverMagOne = "30Rnd_556x45_Stanag";	// standard mag
	_rifleDiverMagTwo = "20Rnd_556x45_UW_mag";	// underwater mag
} else { 
	_rifleDiverMagOne = _rifleMag;
	_rifleDiverMagTwo = _rifleMag;
};
// ============ LAT ==============
_lat = "rhs_weap_M136";
_latMag = "rhs_m136_mag";
// ============ FAC ==============
_facItems = ["AGM_MapTools"];
_facSmokes = ["SmokeShellBlue","SmokeShellOrange"];
// =========== UAV ===============
_uavTool = "B_UavTerminal";
_uavBat = "AGM_UAVBattery";
// ============= HAT =============
_hatLaunch = "rhs_weap_fgm148";
_hatMag = "rhs_fgm148_magazine_AT";
// ========== Anti-Air ===========
_aaLaunch = "rhs_weap_fim92";
_aaMag = "rhs_fim92_mag";
// ========== Sniper =============
_boltRifle = "srifle_LRR_LRPS_F";
_boltRifleMag = "7Rnd_408_Mag";
_sniperItems = ["AGM_ItemKestrel"];
// ======== Rangefinder ==========
_rangeFinder = "AGM_Vector";	// Rangefinder
_rangeFinderBat = "";			// no batteries as of yet
// ========= Laser Des ===========
_designator = "LaserDesignator";
_designatorBat = "LaserBatteries";
// ========== HMG Team ===========
_hmgBarrel = "B_HMG_01_weapon_F";
_hmgTripod = "B_HMG_01_support_F";
_hmgMag = "";	// no magazines as of yet
// ========== GMG Team ===========
_gmgBarrel = "B_GMG_01_weapon_F";
_gmgTripod = "B_HMG_01_support_F";
_gmgMag = "";	// no magazines as of yet
// =========== Tools =============
_nightVision = "NVGoggles";
_basicTools = [_radio,"ItemCompass","ItemMap","AGM_Altimeter"];
_basicItems = ["AGM_EarBuds"];
_autoItem = "AGM_SpareBarrel";
_secTools = ["itemGPS"];
_secItems = ["AGM_MapTools"];
_pltTools = ["itemGPS"];
_pltItems = ["AGM_MapTools"];
// ======== Attachments ==========
_generalAttachments = ["rhsusf_acc_compm4","acc_flashlight"];
_dmrAttachments = ["rhsusf_acc_LEUPOLDMK4","acc_flashlight"];
_autoRifleAttachments = ["rhsusf_acc_EOTECH","acc_flashlight"];
_mmgAttachments = ["rhsusf_acc_EOTECH","acc_flashlight"];

_sniperAttachments = ["optic_SOS"];
_pistolAttachments = ["optic_MRD"];

_scoped_rifleAttachments = ["rhsusf_acc_ACOG3","acc_flashlight"];
_scoped_autoRifleAttachments = ["rhsusf_acc_ELCAN","acc_flashlight"];
_scoped_mmgAttachments = ["rhsusf_acc_ELCAN","acc_flashlight"];

_suppressed_generalAttachments = ["rhsusf_acc_rotex5_grey"];
_suppressed_dmrAttachments = ["muzzle_snds_B"];
_suppressed_autoRifleAttachments = [];
_suppressed_mmgAttachments = [];

_suppressed_pistolAttachments = ["muzzle_snds_acp"];
// ===============================
// ===== Variable Processing =====
// ===============================
if ((!isNil "_suppressors") && _suppressors) then {
	_rifleMag = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
	_rifleGLMag = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
	_rifleScopedMag = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
	_carbineMag = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
	if (!_underwaterWeapons) then { 
		_rifleDiverMagOne = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
		_rifleDiverMagTwo = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
	};
};
if ((!isNil "_scopes") && _scopes) then {
	_generalAttachments = _scoped_rifleAttachments;
	_autoRifleAttachments = _scoped_autoRifleAttachments;
	_mmgAttachments = _scoped_mmgAttachments;
};
if ((!isNil "_suppressors") && _suppressors) then {
	_generalAttachments = _generalAttachments + _suppressed_generalAttachments;
	_dmrAttachments = _dmrAttachments + _suppressed_dmrAttachments;
	_autoRifleAttachments = _autoRifleAttachments + _suppressed_autoRifleAttachments;
	_mmgAttachments = _mmgAttachments + _suppressed_mmgAttachments;
	_scoped_rifleAttachments = _scoped_rifleAttachments + _suppressed_generalAttachments;
	_scoped_autoRifleAttachments = _scoped_autoRifleAttachments + _suppressed_autoRifleAttachments;
	_scoped_mmgAttachments = _scoped_mmgAttachments + _suppressed_mmgAttachments;
	_pistolAttachments = _pistolAttachments + _suppressed_pistolAttachments;
};
if ((!isNil "_nightGear") && _nightGear) then { 
	_basicItems = _basicItems + ["AGM_IR_Strobe_Item"]; 
};
if ((!isNil "_nightGear") && _nightGear) then { 
	_basicTools = _basicTools + [_nightVision]; 
};
if ((!isNil "_nightGear") && _nightGear) then { 
	private "_test";
	_test = _generalAttachments find "acc_flashlight";
	if (_test != -1) then {_generalAttachments set [_test,"acc_pointer_IR"]};
	_test = _dmrAttachments find "acc_flashlight";
	if (_test != -1) then {_dmrAttachments set [_test,"acc_pointer_IR"]};
	_test = _autoRifleAttachments find "acc_flashlight";
	if (_test != -1) then {_autoRifleAttachments set [_test,"acc_pointer_IR"]};
	_test = _mmgAttachments find "acc_flashlight";
	if (_test != -1) then {_mmgAttachments set [_test,"acc_pointer_IR"]};
	_test = _scoped_rifleAttachments find "acc_flashlight";
	if (_test != -1) then {_scoped_rifleAttachments set [_test,"acc_pointer_IR"]};
	_test = _scoped_autoRifleAttachments find "acc_flashlight";
	if (_test != -1) then {_scoped_autoRifleAttachments set [_test,"acc_pointer_IR"]};
	_test = _scoped_mmgAttachments find "acc_flashlight";
	if (_test != -1) then {_scoped_mmgAttachments set [_test,"acc_pointer_IR"]};
};

// ===============================
// ========== Functions ==========
// ===============================

// Adds basic clothes/vest/helmet etc. to a unit
// Possible Cases: leader, medic, pleb, assistant, gren, rpilot, fpilot, crew, diver, sniper
// Example: ["leader"] call _addClothes;
_addClothes = {
	private ["_type"];
	_type = toLower (_this select 0);
	if (_plebUniform != "") then { _unit forceAddUniform _plebUniform; };
	if (_goggles != "") then { _unit addGoggles _goggles; };
	
	switch (_type) do {
		case "leader" : {
			_unit addHeadgear _plebHelmet;
			_unit addVest _glVest;
		};
		case "medic" : {
			_unit addHeadgear _plebHelmet;
			_unit addVest _medVest;
		};
		case "pleb" : {
			_unit addHeadgear _plebHelmet;
			_unit addVest _plebVest;
		};
		case "assistant" : {
			_unit addHeadgear _plebHelmet;
			_unit addVest _plebVest;
		};
		case "gren" : {
			_unit addHeadgear _plebHelmet;
			_unit addVest _glVest;
		};
		case "rpilot" : {
			removeUniform _unit;
			_unit forceAddUniform _rpilotUniform;
			_unit addHeadgear _rotaryPilotHelmet;
			_unit addVest _pilotVest;
		};
		case "fpilot" : {
			removeUniform _unit;
			_unit forceAddUniform _fpilotUniform;
			_unit addHeadgear _fixedPilotHelmet;
			_unit addVest _pilotVest;
		};
		case "crew" : {
			removeUniform _unit;
			_unit forceAddUniform _crewUniform;
			_unit addHeadgear _crewmanHelmet;
			_unit addVest _crewVest;
		};
		case "diver" : {
			removeUniform _unit;
			removeGoggles _unit;
			_unit forceAddUniform _diverUniform;
			_unit addGoggles _divingGoggles;
			_unit addVest _diverVest;
		};
		case "sniper" : {
			removeUniform _unit;
			_unit forceAddUniform _sniperUniform;
			_unit addHeadgear _plebHelmet;
			_unit addVest _sniperVest;
		};
		default {
			hint format ["Incorrect clothes call for unit: %1",_unit];
			_unit addHeadgear _plebHelmet;
			_unit addVest _plebVest;
		};
	};
};

// Adds the basic items and tools of the loadouts to a unitBackpack
// No cases, just generic items. Adds binocular item depeding on loadout
// Example: call _addBasics;
_addBasics = {
	sleep _delay;
	{ _unit linkItem _x } foreach _basicTools; 		// add and assign each of the basic tools
	{ _unit addItem _x } foreach _basicItems; 		// add each of the basic items, can't be assigned
	sleep _delay;
	
	// following roles will recieve rangefinders
	if (_loadout in ["pltld","secco","sectl","hmgass","gmgass","hatammo","aaammo","divertl"]) then { _unit addWeapon _rangeFinder; };
	// following roles will recieve laser designators
	if (_loadout in ["pltfac","spotter"]) then { _unit addWeapon _designator; };
	// following roles will recieve binoculars
	if (_loadout in ["aar","mmgass","crewmander"]) then { _unit addWeapon _binos; };
};

// Empties a unit's ruck
// Example: call _clearRuck;
_clearRuck = {
	clearWeaponCargoGlobal (unitBackpack _unit);
	clearMagazineCargoGlobal (unitBackpack _unit);
	clearItemCargoGlobal (unitBackpack _unit);
	sleep _delay;
};

// Adds ruck to the unit.
// Adds a backpack and cargo to that backpack.
// Note that these cases are mostly similar to the unit's loadout case.
// Possible Cases: plt, medic, fac, uavop, secco, tl, ar, aar, rm, rmat, dmr, gren, mmg, mmgass, hat, aa, crew, aircrew, hmggun, hmgass, gmggun, gmgass, diver, sniper, spotter
// Example: ["plt"] call _addRuck;
_addRuck = {
	private ["_pack"];
	_pack = _this select 0;
	switch (_pack) do {
		case "plt" : {
			_unit addBackpack _radioRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleTracerMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "medic" : {
			_unit addBackpack _largeRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addItemCargoGlobal [_medOne,20];	// bandages
			(unitBackpack _unit) addItemCargoGlobal [_medTwo,16];	// morphine
			(unitBackpack _unit) addItemCargoGlobal [_medThree,16];	// epinephrine
			(unitBackpack _unit) addItemCargoGlobal [_medFour,6];	// bloodbag
		};
		case "fac" : {
			_unit addBackpack _airRadioRuck;
			call _clearRuck;
		};
		case "uavop" : {
			_unit addBackpack _uavRuck;
			call _clearRuck;
		};
		case "secco" : {
			_unit addBackpack _radioRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleTracerMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "tl" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleTracerMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "ar" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoTracerMag,1];
		};
		case "aar" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
		};
		case "rm" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "rmat" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_latMag,1];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "rmsc" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleScopedMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "dmr" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_dmrMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "gren" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "mmg" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,2];
		};
		case "mmgass" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,3];		
		};
		case "hat" : {
			_unit addBackpack _medRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_hatMag,1];
		};
		case "hatass" : {
			_unit addBackpack _largeRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_hatMag,2];
		};
		case "aa" : {
			_unit addBackpack _medRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_aaMag,1];
		};
		case "aaass" : {
			_unit addBackpack _largeRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_aaMag,2];
		};
		case "crew" : {
			_unit addBackpack _radioRuck;
			call _clearRuck;
		};
		case "aircrew" : {
			_unit addBackpack _airRadioRuck;
			call _clearRuck;
		};
		case "hmggun" : {
			_unit addBackpack _hmgBarrel;
		};
		case "hmgass" : {
			_unit addBackpack _hmgTripod;
		};
		case "gmggun" : {
			_unit addBackpack _gmgBarrel;
		};
		case "gmgass" : {
			_unit addBackpack _gmgTripod;
		};
		case "divertl" : {
			_unit addBackpack _diverRadioRuck;
			call _clearRuck;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleDiverMagOne,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleDiverMagTwo,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "diver" : {
			_unit addBackpack _diverRuck;
			call _clearRuck;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleDiverMagOne,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleDiverMagTwo,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "sniper" : {
			_unit addBackpack _sniperRuck;
			call _clearRuck;
			(unitBackpack _unit) addMagazineCargoGlobal [_boltRifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "spotter" : {
			_unit addBackpack _radioRuck;
			call _clearRuck;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,4];
			(unitBackpack _unit) addItemCargoGlobal [_medOne,8];	// bandages
			(unitBackpack _unit) addItemCargoGlobal [_medTwo,4];	// morphine
			(unitBackpack _unit) addItemCargoGlobal [_medThree,4];	// epinephrine
			(unitBackpack _unit) addItemCargoGlobal [_medFour,1];	// bloodbag
		};
		case "engi" : {
			_unit addBackpack _medRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addItemCargoGlobal [_toolbox,1];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		default {
			_unit groupChat format ["Incorrect ruck call for unit: %1",_unit];
		};
	};
};

// Addition of Attachments to a Unit's weapon
// Note that pistol attachments are done regardless of what is called
// Possible Cases: general, dmr, ar, mmg, sniper, diver, scopedgeneral, scopedar, scopedmmg, suppgeneral, suppdmr, suppar, suppmmg, scuppgeneral, scuppar, scuppmmg
// Example: ["general"] call _addRuck;
_addAttachments = {
	private ["_type","_primaryAttachments","_handgunAttachments"];
	_type =  toLower (_this select 0);
	_primaryAttachments = primaryWeaponItems _unit;
	_handgunAttachments = handgunItems _unit;
	if (!isNil "_primaryAttachments") then { { _unit removePrimaryWeaponItem _x } forEach _primaryAttachments; };
	if (!isNil "_handgunAttachments") then { { _unit removeHandgunItem _x } forEach _handgunAttachments; };
	switch (_type) do {
		// ===============================
		// ===== General Attachments =====
		// ===============================
		case "general" : {
			if (!isNil "_generalAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _generalAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "dmr" : {
			if (!isNil "_dmrAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _dmrAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "ar" : {
			if (!isNil "_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _autoRifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "mmg" : {
			if (!isNil "_mmgAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _mmgAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "sniper" : {
			if (!isNil "_sniperAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _sniperAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "diver" : {
			if (!_underwaterWeapons) then { 
				if (!isNil "_generalAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _generalAttachments;
				};
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		// ===================================================
		// ===== Scoped - Redundant if '_scopes' is true =====
		// ===================================================
		case "scopedgeneral" : {
			if (!isNil "_scoped_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "scopedar" : {
			if (!isNil "_scoped_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_autoRifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "scopedmmg" : {
			if (!isNil "_scoped_mmgAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_mmgAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		// ============================================================
		// ===== Suppressed - Redundant if '_suppressors' is true =====
		// ============================================================
		case "suppgeneral" : {
			if (!isNil "_generalAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _generalAttachments; };
			if (!isNil "_suppressed_generalAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_generalAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		case "suppdmr" : {
			if (!isNil "_dmrAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _dmrAttachments;
			};
			if (!isNil "_suppressed_dmrAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_dmrAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then { 
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; 
			};
		};
		case "suppar" : {
			if (!isNil "_autoRifleAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _autoRifleAttachments; };
			if (!isNil "_suppressed_autoRifleAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_autoRifleAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		// Suppressed MMG - not possible yet.
		case "suppmmg" : {
			if (!isNil "_mmgAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _mmgAttachments; };
			if (!isNil "_suppressed_mmgAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_mmgAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		// =========================================================================================
		// ===== Scoped & Suppressed - Redundant if both '_suppressors' and '_scopes' are true =====
		// =========================================================================================
		case "scuppgeneral" : {
			if (!isNil "_scoped_rifleAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments; };
			if (!isNil "_suppressed_generalAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_generalAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		case "scuppar" : {
			if (!isNil "_scoped_autoRifleAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _scoped_autoRifleAttachments; };
			if (!isNil "_suppressed_autoRifleAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_autoRifleAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		// Scoed & Suppressed MMG - not possible yet.
		case "scuppmmg" : {
			if (!isNil "_scoped_mmgAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _scoped_mmgAttachments; };
			if (!isNil "_suppressed_mmgAttachments") then { { _unit addPrimaryWeaponItem _x } forEach _suppressed_mmgAttachments; };
			if (!isNil "_pistolAttachments") then { { _unit addHandgunItem _x } forEach _pistolAttachments; };
			if (!isNil "_suppressed_pistolAttachments") then { { _unit addHandgunItem _x } forEach _suppressed_pistolAttachments; };
		};
		// =========================================================================================
		default {
			_unit groupChat format ["Incorrect attachment call for unit: %1",_unit];
		};
	};
};

// Basic Meds for the unit
// Example: call _IFAK;
_IFAK = {
	if (!isNull (unitBackpack _unit) && !(_loadout in ["pltuavop"])) then {
		(unitBackpack _unit) addItemCargoGlobal [_medOne,4];
		(unitBackpack _unit) addItemCargoGlobal [_medTwo,2];
	} else {
		for "_i" from 1 to 4 do {_unit addItem _medOne};
		for "_i" from 1 to 2 do {_unit addItem _medTwo};
	};
};
// ===============================
// ===============================
// ===============================