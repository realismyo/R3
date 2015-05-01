// ===============================
// ===== Defines_FACTION.sqf =====
// ===============================
/*
- This part of the scripts defines all of the variables and functions required to equip the units.  

- Default behaviour DOES NOT replace goggles (aside from divers), players will have their default goggles.
- Make sure you test locally to ensure your loadouts work.
- Current Side, Faction: OPFOR, CSAT
- Required Mods: @AGM, @task_force_radio, @RHS_AFRF, @HLCMods_Core, @HLCMods_AK
*/
// ===============================
// ========== Variables ==========
// ===============================

private [
"_rifle","_rifleGL","_rifleScoped","_autoRifle","_carbine","_dmr","_mmg","_smg","_pistol",
"_grenade","_smoke","_throwG","_chemlightOne","_chemlightTwo","_flashbang",
"_rifleMag","_rifleTracerMag","_rifleGLMag","_rifleScopedMag","_autoRifleMag","_autoTracerMag","_carbineMag","_dmrMag","_mmgMag","_smgMag","_pistolMag",
"_glExplody","_glSmokeOne","_glSmokeTwo","_glFlareOne","_glFlareTwo",
"_plebUniformArray","_plebURandom","_plebUniform","_crewUniform",
"_plebHelmetArray","_plebHRandom","_plebHelmet",
"_plebVest","_glVest","_medVest",
"_smallRuck","_medRuck","_largeRuck","_uavRuck",
"_rpilotUniform","_fpilotUniform",
"_rotaryPilotHelmet","_fixedPilotHelmet","_crewmanHelmet",
"_pilotVest","_crewVest",
"_sniperUniform","_sniperVest","_sniperRuck",
"_diverUniform","_diverVest","_diverRuck",
"_goggles","_divingGoggles",
"_radioRuck","_airRadioRuck","_diverRadioRuck",
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
_rifle = "hlc_rifle_aks74";
_rifleGL = "hlc_rifle_aks74_GL";
_rifleScoped = "hlc_rifle_aks74";
_autoRifle = "hlc_rifle_rpk";
_carbine = "hlc_rifle_aks74u";
_dmr = "rhs_weap_svdp";
_mmg = "rhs_weap_pkp";
_smg = "hlc_rifle_aks74u";
_pistol = "hgun_Rook40_F";
// ====== General Magazines ======
_rifleMag = "hlc_30Rnd_545x39_B_AK";
_rifleTracerMag = "hlc_30Rnd_545x39_T_AK";
_rifleGLMag = "hlc_30Rnd_545x39_B_AK";
_rifleScopedMag = "hlc_30Rnd_545x39_B_AK";
_autoRifleMag = "hlc_75Rnd_762x39_m_rpk";
_autoTracerMag = "hlc_75Rnd_762x39_m_rpk";
_carbineMag = "hlc_30Rnd_545x39_B_AK";
_dmrMag = "rhs_10Rnd_762x54mmR_7N1";
_mmgMag = "rhs_100Rnd_762x54mmR";
_smgMag = "hlc_30Rnd_545x39_B_AK";
_pistolMag = "16Rnd_9x21_Mag";
// ===== General Throwables ======
_grenade = "HandGrenade";
_smoke = "SmokeShell";
_throwG = [_grenade,_smoke];
_chemlightOne = "chemlight_green";
_chemlightTwo = "chemlight_red";
_flashbang = "AGM_M84";
// ========== GL Rounds ==========
_glExplody = "hlc_VOG25_AK";
_glSmokeOne = "hlc_GRD_green";
_glSmokeTwo = "hlc_GRD_red";
_glFlareOne = "UGL_FlareWhite_F";
_glFlareTwo = "UGL_FlareYellow_F";
// ===============================
// ========== Clothing ===========
// ======== Camo Specific ========
// ===============================
switch (_camoPattern) do {
	case "summer" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["rhs_uniform_emr_patchless","rhs_uniform_emr_patchless","rhs_uniform_emr_patchless"];	
		_plebURandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebURandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "rhs_uniform_emr_patchless";
		// =========== Helmets ===========
		_plebHelmetArray = ["rhs_6b28","rhs_6b27m_digi","rhs_6b28","rhs_6b28_bala","rhs_6b28","rhs_6b27m_digi_bala","rhs_6b28","rhs_6b28_ess","rhs_6b28","rhs_6b28_ess_bala","rhs_6b28"];	
		_plebHRandom = (floor(random (count _plebHelmetArray)));
		_plebHelmet = _plebHelmetArray select _plebHRandom;	// enter single string value to remove randommess
		// ============ Vests ============
		_plebVest = "rhs_6b23_digi_6sh92_headset";
		_glVest = "rhs_6b23_digi_6sh92_vog_headset";
		_medVest = "rhs_6b23_digi_medic";
		_crewVest = "rhs_6b23_digi_crew";
		_sniperVest = "rhs_6b23_digi_sniper";
		// ============ Rucks ============
		_smallRuck = "rhs_sidor";
		_medRuck = "rhs_assault_umbts";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "O_UAV_01_backpack_F";
		// ==============================
	};
	case "flora" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["rhs_uniform_flora_patchless","rhs_uniform_flora_patchless","rhs_uniform_flora_patchless"];	
		_plebURandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebURandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "rhs_uniform_flora_patchless";
		// =========== Helmets ===========	
		_plebHelmetArray = ["rhs_6b28_flora","rhs_6b27m_bala","rhs_6b28_flora","rhs_6b28_flora_bala","rhs_6b28_flora","rhs_6b27m","rhs_6b28_flora"];	
		_plebHRandom = (floor(random (count _plebHelmetArray)));
		_plebHelmet = _plebHelmetArray select _plebHRandom;	// enter single string value to remove randommess
		// ============ Vests ============
		_plebVest = "rhs_6b23_6sh92_headset";
		_glVest = "rhs_6b23_6sh92_vog_headset";
		_medVest = "rhs_6b23_medic";
		_crewVest = "rhs_6b23_crew";
		_sniperVest = "rhs_6b23_sniper";
		// ============ Rucks ============
		_smallRuck = "rhs_sidor";
		_medRuck = "rhs_assault_umbts";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "O_UAV_01_backpack_F";
		// ==============================
	};
	case "mountainflora" : {
		// ========== Uniforms ===========
		_plebUniformArray = ["rhs_uniform_mflora_patchless","rhs_uniform_mflora_patchless","rhs_uniform_mflora_patchless"];	
		_plebURandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebURandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "rhs_uniform_mflora_patchless";
		// =========== Helmets ===========	
		_plebHelmetArray = ["rhs_6b27m_ml","rhs_6b27m_ml","rhs_6b27m_ml"];	
		_plebHRandom = (floor(random (count _plebHelmetArray)));
		_plebHelmet = _plebHelmetArray select _plebHRandom;	// enter single string value to remove randommess
		// ============ Vests ============
		_plebVest = "rhs_6b23_ML_6sh92_headset";
		_glVest = "rhs_6b23_ML_6sh92_vog_headset";
		_medVest = "rhs_6b23_ML_medic";
		_crewVest = "rhs_6b23_ML_crew";
		_sniperVest = "rhs_6b23_ML_sniper";
		// ============ Rucks ============
		_smallRuck = "rhs_sidor";
		_medRuck = "rhs_assault_umbts";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "O_UAV_01_backpack_F";
		// ==============================
	};
	default {
		// ========== Uniforms ===========
		_plebUniformArray = ["rhs_uniform_msv_emr","rhs_uniform_msv_emr","rhs_uniform_msv_emr"];	
		_plebURandom = (floor(random (count _plebUniformArray)));
		_plebUniform = _plebUniformArray select _plebURandom;	// leave as "" for default, or enter single string value to remove randommess
		_crewUniform = "rhs_uniform_msv_emr";
		// =========== Helmets ===========
		_plebHelmetArray = ["rhs_6b28_digi","rhs_6b27m_digi","rhs_6b28_digi","rhs_6b28_digi_bala","rhs_6b28_digi","rhs_6b27m_digi_bala","rhs_6b28_digi"];	
		_plebHRandom = (floor(random (count _plebHelmetArray)));
		_plebHelmet = _plebHelmetArray select _plebHRandom;	// enter single string value to remove randommess
		// ============ Vests ============
		_plebVest = "rhs_6b23_digi_6sh92_headset";
		_glVest = "rhs_6b23_digi_6sh92_vog_headset";
		_medVest = "rhs_6b23_digi_medic";
		_crewVest = "rhs_6b23_digi_crew";
		_sniperVest = "rhs_6b23_digi_sniper";
		// ============ Rucks ============
		_smallRuck = "rhs_sidor";
		_medRuck = "rhs_assault_umbts";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "O_UAV_01_backpack_F";
		// ==============================
	};
};
// ===============================
// ========== Clothing ===========
// ===== Non-Camo Specific =======
// ===============================
// ========== Veh Crews ==========
_rpilotUniform = "rhs_uniform_df15";
_fpilotUniform = "rhs_uniform_df15";
_rotaryPilotHelmet = "rhs_zsh7a_mike";
_fixedPilotHelmet = "rhs_zsh7a";
_crewmanHelmetArray = ["rhs_tsh4","rhs_tsh4_ess","rhs_tsh4","rhs_tsh4_bala","rhs_tsh4","rhs_tsh4_ess_bala","rhs_tsh4"];	
_crewmanHRandom = (floor(random (count _crewmanHelmetArray)));
_crewmanHelmet = _crewmanHelmetArray select _crewmanHRandom;	// enter single string value to remove randommess
_pilotVest = "rhs_vest_commander";
// ========= Sniper Team =========
_sniperUniform = "U_I_GhillieSuit";
_sniperRuck = "rhs_assault_umbts";
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
switch (_radioSelection) do {
	case "detection" : {
		private "_side";
		_side = toLower format ["%1", side player];
		// BLUFOR radios
		if (_side == "west") then { 
			_airRadioRuck = "tf_anarc210";
			_radioRuck = "tf_rt1523g_big";
			_diverRadioRuck = "tf_rt1523g_black";
		};
		// OPFOR radios
		if (_side == "east") then { 
			_airRadioRuck = "tf_mr6000l";
			_radioRuck = "tf_mr3000_rhs";
			_diverRadioRuck = "tf_mr3000_rhs";
		};
		// INDFOR radios
		if (_side == "guer") then { 
			_airRadioRuck = "tf_anarc164";
			_radioRuck = "tf_anprc155";
			_diverRadioRuck = "tf_anprc155";
		};
		// Civilian radios
		if (_side == "civ") then { 
			_airRadioRuck = "tf_mr6000l";
			_radioRuck = "tf_mr3000_rhs";
			_diverRadioRuck = "tf_mr3000_rhs";
		};
	};
	case "defined" : {
		_airRadioRuck = "tf_mr6000l";
		_radioRuck = "tf_mr3000_rhs";
		_diverRadioRuck = "tf_mr3000_rhs";
	};
	default {
		_airRadioRuck = "tf_mr6000l";
		_radioRuck = "tf_mr3000_rhs";
		_diverRadioRuck = "tf_mr3000_rhs";
	};
};
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
_lat = "rhs_weap_rpg26";
_latMag = "rhs_rpg26_mag";
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
_aaLaunch = "rhs_weap_igla";
_aaMag = "rhs_mag_9k38_rocket";
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
_generalAttachments = ["hlc_optic_kobra"];
_dmrAttachments = ["rhs_acc_pso1m2"];
_autoRifleAttachments = ["hlc_optic_kobra"];
_mmgAttachments = ["rhs_acc_pkas"];

_sniperAttachments = ["optic_SOS"];
_pistolAttachments = [];

_scoped_rifleAttachments = ["HLC_Optic_PSO1"];
_scoped_autoRifleAttachments = ["HLC_Optic_PSO1"];
_scoped_mmgAttachments = ["rhs_acc_1p29"];

_suppressed_generalAttachments = ["hlc_muzzle_545SUP_AK"];
_suppressed_dmrAttachments = [];
_suppressed_autoRifleAttachments = ["hlc_muzzle_762SUP_AK"];
_suppressed_mmgAttachments = [];

_suppressed_pistolAttachments = ["muzzle_snds_acp"];
// ===============================
// ===== Variable Processing =====
// ===============================
if ((!isNil "_suppressors") && _suppressors) then {
	_rifleMag = "hlc_30Rnd_545x39_S_AK";
	_rifleGLMag = "hlc_30Rnd_545x39_S_AK";
	_rifleScopedMag = "hlc_30Rnd_545x39_S_AK";
	_carbineMag = "hlc_30Rnd_545x39_S_AK";
	if (!_underwaterWeapons) then { 
		_rifleDiverMagOne = "hlc_30Rnd_545x39_S_AK";
		_rifleDiverMagTwo = "hlc_30Rnd_545x39_S_AK";
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

// ===============================
// ========== Functions ==========
// ===============================

// ==============================================================
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

// ==============================================================
// Adds the basic items and tools of the loadouts to a unit
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

// ==============================================================
// Empties a unit's ruck
// Example: call _clearRuck;
_clearRuck = {
	clearWeaponCargoGlobal (unitBackpack _unit);
	clearMagazineCargoGlobal (unitBackpack _unit);
	clearItemCargoGlobal (unitBackpack _unit);
	sleep _delay;
};

// ==============================================================
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
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,12];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,3];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,3];
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
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,12];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,3];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,3];
		};
		case "tl" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleGLMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleTracerMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,12];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeOne,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_glSmokeTwo,2];
		};
		case "ar" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoTracerMag,2];
		};
		case "aar" : {
			_unit addBackpack _smallRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoRifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_autoTracerMag,1];
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
			(unitBackpack _unit) addMagazineCargoGlobal [_glExplody,12];
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
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,2];		
		};
		case "hat" : {
			_unit addBackpack _largeRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,4];
			(unitBackpack _unit) addMagazineCargoGlobal [_hatMag,1];
		};
		case "hatass" : {
			_unit addBackpack _largeRuck;
			call _clearRuck;
			sleep _delay;
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
			(unitBackpack _unit) addMagazineCargoGlobal [_hatMag,2];
		};
		case "aa" : {
			_unit addBackpack _largeRuck;
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

// ==============================================================
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

// ==============================================================
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
// ==============================================================