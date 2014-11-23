// ===============================
// ===== Defines_FACTION.sqf =====
// ===============================
/*
- This part of the scripts defines all of the variables and functions required to equip the units.  

- Default behaviour DOES NOT replace goggles (aside from divers), players will have their default goggles.
- Make sure you test locally to ensure your loadouts work.
- Current Side, Faction: OPFOR, CSAT
- Required Mods: @AGM, @task_force_radio, @TEC_CSAT
*/
// ===============================
// ========== Variables ==========
// ===============================

private [
"_rifle","_rifleGL","_rifleScoped","_autoRifle","_carbine","_dmr","_mmg","_smg","_pistol",
"_grenade","_smoke","_throwG","_chemlightOne","_chemlightTwo",
"_rifleMag","_rifleTracerMag","_rifleGLMag","_rifleScopedMag","_autoRifleMag","_autoTracerMag","_carbineMag","_dmrMag","_mmgMag","_smgMag","_pistolMag",
"_glExplody","_glSmokeOne","_glSmokeTwo","_glFlareOne","_glFlareTwo",
"_plebUniformArray","_plebRandom","_plebUniform","_crewUniform",
"_plebHelmet",
"_plebVest","_glVest","_medVest",
"_plebRuck","_medRuck","_assistantRuck","_uavRuck",
"_rpilotUniform","_fpilotUniform",
"_rotaryPilotHelmet","_fixedPilotHelmet","_crewmanHelmet",
"_pilotVest","_crewVest",
"_sniperUniform","_sniperVest","_sniperRuck",
"_diverUniform","_diverVest","_diverRuck",
"_goggles","_divingGoggles",
"_radioRuck","_airRadioRuck",
"_medOne","_medTwo","_medThree","_medFour",
"_rifleDiver","_rifleDiverMagOne","_rifleDiverMagTwo",
"_lat","_latMag",
"_binos","_radio",
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
_rifle = "arifle_Katiba_F";
_rifleGL = "arifle_Katiba_GL_F";
_rifleScoped = "arifle_Katiba_F";
_autoRifle = "LMG_Mk200_F";
_carbine = "arifle_Katiba_C_F";
_dmr = "srifle_EBR_F";
_mmg = "LMG_Zafir_F";
_smg = "SMG_02_F";
_pistol = "hgun_Rook40_F";
// ===== General Throwables ======
_grenade = "HandGrenade";
_smoke = "SmokeShell";
_throwG = [_grenade,_smoke];
_chemlightOne = "chemlight_green";
_chemlightTwo = "chemlight_red";
// ====== General Magazines ======
_rifleMag = "30Rnd_65x39_caseless_green";
_rifleTracerMag = "30Rnd_65x39_caseless_green_mag_Tracer";
_rifleGLMag = "30Rnd_65x39_caseless_green";
_rifleScopedMag = "30Rnd_65x39_caseless_green";
_autoRifleMag = "200Rnd_65x39_cased_Box";
_autoTracerMag = "200Rnd_65x39_cased_Box_Tracer";
_carbineMag = "30Rnd_65x39_caseless_green";
_dmrMag = "20Rnd_762x51_Mag";
_mmgMag = "150Rnd_762x51_Box";
_smgMag = "30Rnd_9x21_Mag";
_pistolMag = "16Rnd_9x21_Mag";
// ========== GL Rounds ==========
_glExplody = "1Rnd_HE_Grenade_shell";
_glSmokeOne = "1Rnd_SmokeGreen_Grenade_shell";
_glSmokeTwo = "1Rnd_SmokeRed_Grenade_shell";
_glFlareOne = "UGL_FlareWhite_F";
_glFlareTwo = "UGL_FlareYellow_F";
// ===============================
// ========== Clothing ===========
// ======== Camo Specific ========
// ===============================
switch (_camoPattern) do {
	case "arid" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Arid","TEC_U_O_Arid_Shortsleeve","TEC_U_O_Arid"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Arid_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Arid";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Arid";
		_medRuck = "TEC_B_Carryall_Arid";
		_assistantRuck = "TEC_B_Carryall_Arid";
		_uavRuck = "TEC_B_O_UAV_Arid";
		// ==============================
	};
	case "navy" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Navy","TEC_U_O_Navy_Shortsleeve","TEC_U_O_Navy"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Navy_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Booniehat_Navy";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "B_FieldPack_blk";
		_medRuck = "TEC_B_Carryall_Urban";
		_assistantRuck = "TEC_B_Carryall_Urban";
		_uavRuck = "O_UAV_01_backpack_F";
		// ==============================
	};
	case "semiarid" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Semiarid","TEC_U_O_Semiarid_Shortsleeve","TEC_U_O_Semiarid"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Semiarid_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Semiarid";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Semiarid";
		_medRuck = "TEC_B_Carryall_Semiarid";
		_assistantRuck = "TEC_B_Carryall_Semiarid";
		_uavRuck = "TEC_B_O_UAV_Semiarid";
		// ==============================
	};
	case "sof" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_SOF","TEC_U_O_SOF_Shortsleeve","TEC_U_O_SOF"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_SOF_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Arid";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Arid";
		_medRuck = "TEC_B_Carryall_Arid";
		_assistantRuck = "TEC_B_Carryall_Arid";
		_uavRuck = "TEC_B_O_UAV_Arid";
		// ==============================
	};
	case "urban" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Urban","TEC_U_O_Urban_Shortsleeve","TEC_U_O_Urban"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Urban_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Urban";
		// ============ Vests ============
		_plebVest = "V_HarnessO_gry";
		_glVest = "V_HarnessOGL_gry";
		_medVest = "V_HarnessO_gry";
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Urban";
		_medRuck = "TEC_B_Carryall_Urban";
		_assistantRuck = "TEC_B_Carryall_Urban";
		_uavRuck = "TEC_B_O_UAV_Urban";
		// ==============================
	};
	case "woodland" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Woodland","TEC_U_O_Woodland_Shortsleeve","TEC_U_O_Woodland"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Woodland_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Woodland";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Woodland";
		_medRuck = "TEC_B_Carryall_Woodland";
		_assistantRuck = "TEC_B_Carryall_Woodland";
		_uavRuck = "TEC_B_O_UAV_Woodland";
		// ==============================
	};
	default {
		// ========== Uniforms ===========
		_plebUniformArray = ["TEC_U_O_Arid","TEC_U_O_Arid_Shortsleeve","TEC_U_O_Arid"];	
		_plebRandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebRandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "TEC_U_O_Arid_Shortsleeve";
		// =========== Helmets ===========
		_plebHelmet = "TEC_H_Penah_Arid";
		// ============ Vests ============
		_plebVest = "TEC_V_PC_Light_Black";
		_glVest = "TEC_V_PC_Heavy_Black";
		_medVest = "TEC_V_PC_Light_Black";
		// ============ Rucks ============
		_plebRuck = "TEC_B_Fieldpack_Arid";
		_medRuck = "TEC_B_Carryall_Arid";
		_assistantRuck = "TEC_B_Carryall_Arid";
		_uavRuck = "TEC_B_O_UAV_Arid";
		// ==============================
	};
};
// ===============================
// ========== Clothing ===========
// ===== Non-Camo Specific =======
// ===============================
// ========== Veh Crews ==========
_rpilotUniform = "TEC_U_O_Helicopter";
_fpilotUniform = "TEC_U_O_Jet";
_rotaryPilotHelmet = "H_PilotHelmetHeli_O";
_fixedPilotHelmet = "H_PilotHelmetFighter_O";
_crewmanHelmet = "TEC_H_CrewHelmet";
_pilotVest = "TEC_V_TacVest_Black";
_crewVest = "TEC_V_TacVest_Black";
// ========= Sniper Team =========
_sniperUniform = "U_O_GhillieSuit";
_sniperVest = "V_HarnessOGL_brn";
_sniperRuck = "TEC_B_Fieldpack_Arid";
// ========= Diver Gear ==========
_diverUniform = "U_O_Wetsuit";
_diverVest = "V_RebreatherB";
_diverRuck = "B_AssaultPack_blk";
// ===============================
// ============ Misc =============
// =========== Goggles ===========
_goggles = "";	// leave as "" for default
_divingGoggles = "G_O_Diving";
// ========= Radio Rucks =========
_radioRuck = "tf_mr3000";
_airRadioRuck = "tf_mr6000l";
// ======== Medical Gear =========
_medOne = "AGM_Bandage";
_medTwo = "AGM_Morphine";
_medThree = "AGM_Epipen";
_medFour = "AGM_Bloodbag";
// ===============================
// ====== Equipment/Items ========
// ========== General ============
_binos = "Binocular";
_radio = "tf_fadak";
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
	_rifleDiverMagOne = "30Rnd_65x39_caseless_green";
	_rifleDiverMagTwo = "30Rnd_65x39_caseless_green";
};
// ============ LAT ==============
_lat = "launch_RPG32_F";
_latMag = "RPG32_F";
// ============ FAC ==============
_facItems = ["AGM_MapTools"];
_facSmokes = ["SmokeShellBlue","SmokeShellOrange"];
// =========== UAV ===============
_uavTool = "B_UavTerminal";
_uavBat = "AGM_UAVBattery";
// ============= HAT =============
_hatLaunch = "launch_O_Titan_short_F";
_hatMag = "Titan_AT";
// ========== Anti-Air ===========
_aaLaunch = "launch_O_Titan_F";
_aaMag = "Titan_AA";
// ========== Sniper =============
_boltRifle = "srifle_GM6_LRPS_F";
_boltRifleMag = "5Rnd_127x108_Mag";
_sniperItems = ["AGM_ItemKestrel"];
// ======== Rangefinder ==========
_rangeFinder = "AGM_Vector";	// Rangefinder
_rangeFinderBat = "";			// no batteries as of yet
// ========= Laser Des ===========
_designator = "LaserDesignator";
_designatorBat = "LaserBatteries";
// ========== HMG Team ===========
_hmgBarrel = "O_HMG_01_weapon_F";
_hmgTripod = "O_HMG_01_support_F";
_hmgMag = "";	// no magazines as of yet
// ========== GMG Team ===========
_gmgBarrel = "O_GMG_01_weapon_F";
_gmgTripod = "O_HMG_01_support_F";
_gmgMag = "";	// no magazines as of yet
// =========== Tools =============
_nightVision = "NVGoggles_OPFOR";
_basicTools = [_radio,"ItemCompass","ItemMap","AGM_Altimeter"];
_basicItems = ["AGM_EarBuds"];
_autoItem = "AGM_SpareBarrel";
_secTools = ["itemGPS"];
_secItems = ["AGM_MapTools"];
_pltTools = ["itemGPS"];
_pltItems = ["AGM_MapTools"];
// ======== Attachments ==========
_generalAttachments = ["optic_ACO_grn","acc_flashlight"];
_dmrAttachments = ["optic_Arco","acc_flashlight"];
_autoRifleAttachments = ["optic_ACO_grn","acc_flashlight"];
_mmgAttachments = ["optic_ACO_grn","acc_flashlight"];

_sniperAttachments = ["optic_SOS"];
_pistolAttachments = [];

_scoped_rifleAttachments = ["optic_Arco","acc_flashlight"];
_scoped_autoRifleAttachments = ["optic_Arco","acc_flashlight"];
_scoped_mmgAttachments = ["optic_Arco","acc_flashlight"];

_suppressed_generalAttachments = ["muzzle_snds_H"];
_suppressed_dmrAttachments = ["muzzle_snds_B"];
_suppressed_autoRifleAttachments = ["muzzle_snds_H_MG"];
_suppressed_mmgAttachments = [];

_suppressed_pistolAttachments = ["muzzle_snds_acp"];
// ===============================
// ===== Variable Processing =====
// ===============================
if ((!isNil "_suppressors") && _suppressors) then {
	_rifleMag = "AGM_30Rnd_65x39_caseless_green_mag_SD";
	_rifleGLMag = "AGM_30Rnd_65x39_caseless_green_mag_SD";
	_rifleScopedMag = "AGM_30Rnd_65x39_caseless_green_mag_SD";
	_carbineMag = "AGM_30Rnd_65x39_caseless_green_mag_SD";
	if (!_underwaterWeapons) then { 
		_rifleDiverMagOne = "AGM_30Rnd_65x39_caseless_green_mag_SD";
		_rifleDiverMagTwo = "AGM_30Rnd_65x39_caseless_green_mag_SD";
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
			_unit addBackpack _medRuck;
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
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "tl" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleTracerMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "ar" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoTracerMag,1];
		};
		case "aar" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoTracerMag,1];
		};
		case "rm" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "rmat" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_latMag,1];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "rmsc" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleScopedMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "dmr" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_dmrMag,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smoke,2];
		};
		case "gren" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,8];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "mmg" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,2];
		};
		case "mmgass" : {
			_unit addBackpack _plebRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,2];		
		};
		case "hat" : {
			_unit addBackpack _assistantRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_hatMag,2];
		};
		case "aa" : {
			_unit addBackpack _assistantRuck;
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
			_unit addBackpack _radioRuck;
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
			(unitBackpack _unit) addItemCargoGlobal [_medFour,2];	// bloodbag
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
	{ _unit removePrimaryWeaponItem _x } forEach _primaryAttachments;
	{ _unit removeHandgunItem _x } forEach _handgunAttachments;
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
		// Scoped & Suppressed MMG - not possible yet.
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
	if (!isNull (unitBackpack _unit) && !(_loadout in ["pltuavop","hmggun","hmgass","gmggun","gmgass"])) then {
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