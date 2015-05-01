// ===============================
// ===== Defines_FACTION.sqf =====
// ===============================
/*
- This part of the scripts defines all of the variables and functions required to equip the units.  

- Default behaviour DOES NOT replace goggles (aside from divers), players will have their default goggles.
- Make sure you test locally to ensure your loadouts work.
- Current Side, Faction: BLUFOR, FIA, Random 'light' weapons.
- Required Mods: @AGM, @task_force_radio, @HLCMods_Core, @HLCMods_AK, @HLCMods_G3, @HLCMods_FAL, @RHS_USF
*/
// ===============================
// ========== Variables ==========
// ===============================

private [
"_rifleArray","_rifleGLArray","_rifleScopedArray","_carbineArray","_dmrArray","_smgArray",
"_rifleMagArray","_rifleTracerMagArray","_rifleGLMagArray","_rifleScopedMagArray","_carbineMagArray","_dmrMagArray","_smgMagArray",
"_rifleRandom","_rifleGLRandom","_rifleScopedRandom","_carbineRandom","_dmrRandom","_smgRandom",
"_rifle","_rifleGL","_rifleScoped","_autoRifle","_carbine","_dmr","_mmg","_smg","_pistol",
"_grenade","_smoke","_throwG","_chemlightOne","_chemlightTwo","_flashbang",
"_rifleMag","_rifleTracerMag","_rifleGLMag","_rifleScopedMag","_autoRifleMag","_autoTracerMag","_carbineMag","_dmrMag","_mmgMag","_smgMag","_pistolMag",
"_glRoundsArray","_glRounds","_glExplody","_glSmokeOne","_glSmokeTwo","_glFlareOne","_glFlareTwo",
"_plebUniforms","_uniformNumber","_plebUniform","_crewUniform",
"_plebHelmets","_helmetNumber","_plebHelmet",
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
"_rifleAttachmentArray","_rifleAttachments","_rifleGLAttachmentArray","_rifleGLAttachments","_rifleScopedAttachmentArray","_rifleScopedAttachments","_carbineAttachmentArray","_carbineAttachments","_dmrAttachmentArray","_dmrAttachments",
"_autoRifleAttachments","_mmgAttachments","_sniperAttachments","_pistolAttachments",
"_scoped_rifleAttachmentArray","_scoped_rifleAttachments","_scoped_rifleGLAttachmentArray","_scoped_rifleGLAttachments","_scoped_rifleScopedAttachmentArray","_scoped_rifleScopedAttachments","_scoped_carbineAttachmentArray","_scoped_carbineAttachments",
"_scoped_autoRifleAttachments","_scoped_mmgAttachments","_scoped_pistolAttachments",
"_suppressed_rifleAttachmentArray","_suppressed_rifleAttachments","_suppressed_rifleGLAttachmentArray","_suppressed_rifleGLAttachments","_suppressed_rifleScopedAttachmentArray","_suppressed_rifleScopedAttachments",
"_suppressed_carbineAttachmentArray","_suppressed_carbineAttachments","_suppressed_dmrAttachmentArray","_suppressed_carbineAttachments",
"_suppressed_autoRifleAttachments","_suppressed_mmgAttachments","_suppressed_pistolAttachments",
"_addClothes","_addBasics","_clearRuck","_addRuck","_addAttachments","_IFAK"
];

// ===============================
// =========== Defines ===========
// ===============================
// ======= General Weapons =======
_rifleArray = ["hlc_rifle_l1a1slr","hlc_rifle_SLR","hlc_rifle_STG58F","hlc_rifle_c1A1","hlc_rifle_LAR","hlc_rifle_SLRchopmod","hlc_rifle_g3a3","hlc_rifle_g3sg1"];
_rifleRandom = (floor(random (count _rifleArray)));
_rifle = _rifleArray select _rifleRandom;

_rifleGLArray = ["HLC_Rifle_g3ka4_GL","hlc_rifle_osw_GL","HLC_Rifle_g3ka4_GL","hlc_rifle_osw_GL","HLC_Rifle_g3ka4_GL"];
_rifleGLRandom = (floor(random (count _rifleGLArray)));
_rifleGL = _rifleGLArray select _rifleGLRandom;

_rifleScopedArray =  ["hlc_rifle_l1a1slr","hlc_rifle_SLR","hlc_rifle_STG58F","hlc_rifle_c1A1","hlc_rifle_LAR","hlc_rifle_SLRchopmod","hlc_rifle_g3a3","hlc_rifle_g3sg1"];
_rifleScopedRandom = (floor(random (count _rifleScopedArray)));
_rifleScoped = _rifleScopedArray select _rifleScopedRandom;

_carbineArray = ["hlc_rifle_aks74u","rhs_weap_m4","rhs_weap_m4a1","rhs_weap_m4","arifle_TRG20_F"];
_carbineRandom = (floor(random (count _carbineArray)));
_carbine = _carbineArray select _carbineRandom;

_dmrArray = ["hlc_rifle_l1a1slr","hlc_rifle_SLR","hlc_rifle_STG58F","hlc_rifle_c1A1","hlc_rifle_LAR","hlc_rifle_SLRchopmod","hlc_rifle_g3a3","hlc_rifle_g3sg1""srifle_EBR_F"];
_dmrRandom = (floor(random (count _dmrArray)));
_dmr = _dmrArray select _dmrRandom;

_smgArray = ["hlc_rifle_aks74u","rhs_weap_m4","hlc_rifle_hk53","hgun_PDW2000_F"];
_smgRandom = (floor(random (count _smgArray)));
_smg = _smgArray select _smgRandom;

_autoRifle = "LMG_Mk200_F";
_mmg = "LMG_Zafir_F";
_pistol = "hgun_ACPC2_F";
// ===== General Throwables ======
_grenade = "HandGrenade";
_smoke = "SmokeShell";
_throwG = [_grenade,_smoke];
_chemlightOne = "chemlight_green";
_chemlightTwo = "chemlight_red";
_flashbang = "AGM_M84";
// ====== General Magazines ======
_rifleMagArray = ["hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_G3","hlc_20Rnd_762x51_B_G3"];
_rifleMag = _rifleMagArray select _rifleRandom;

_rifleTracerMagArray = ["hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20rnd_762x51_T_G3","hlc_20rnd_762x51_T_G3"];
_rifleTracerMag = _rifleTracerMagArray select _rifleRandom;

_rifleGLMagArray = ["hlc_20Rnd_762x51_B_G3","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_G3","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_G3"];
_rifleGLMag = _rifleGLMagArray select _rifleGLRandom;

_rifleScopedMagArray = ["hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_B_G3","hlc_20Rnd_762x51_B_G3"];
_rifleScopedMag = _rifleScopedMagArray select _rifleScopedRandom;

_carbineMagArray = ["hlc_30Rnd_545x39_B_AK","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","30Rnd_556x45_Stanag"];
_carbineMag = _carbineMagArray select _carbineRandom;

_dmrMagArray = ["hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20Rnd_762x51_t_fal","hlc_20rnd_762x51_T_G3","hlc_20rnd_762x51_T_G3","20Rnd_762x51_Mag"];
_dmrMag = _dmrMagArray select _dmrRandom;

_smgMagArray = ["hlc_30Rnd_545x39_B_AK","rhs_mag_30Rnd_556x45_Mk318_Stanag","hlc_30rnd_556x45_b_HK33","30Rnd_9x21_Mag"];
_smgMag = _smgMagArray select _smgRandom;

_autoRifleMag = "200Rnd_65x39_cased_Box";
_autoTracerMag = "200Rnd_65x39_cased_Box_Tracer";
_mmgMag = "150Rnd_762x51_Box";
_pistolMag = "9Rnd_45ACP_Mag";
// ========== GL Rounds ==========
_glRoundsArray = [["1Rnd_HE_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"],["1Rnd_HE_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeRed_Grenade_shell"]];
_glRounds = _glRoundsArray select _rifleGLRandom;
_glExplody = _glRounds select 0;
_glSmokeOne = _glRounds select 1;
_glSmokeTwo = _glRounds select 2;
_glFlareOne = "UGL_FlareWhite_F";
_glFlareTwo = "UGL_FlareYellow_F";
// ===============================
// ========== Clothing ===========
// ======== Camo Specific ========
// ===============================
switch (_camoPattern) do {
	case "fia" : {
		// ========== Uniforms ===========
		_plebUniforms = ["U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_leader","U_BG_Guerrilla_6_1","U_BG_Guerilla3_1","U_BG_Guerilla2_1"];
		_uniformNumber = (floor(random (count _plebUniforms)));
		_plebUniform = _plebUniforms select _uniformNumber; // leave as "" for default
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmets = ["H_Booniehat_khk_hs","H_Bandanna_khk_hs","H_Cap_oli_hs","H_Shemag_olive_hs","H_Cap_headphones","H_Watchcap_blk"];
		_helmetNumber = (floor(random (count _plebHelmets)));
		_plebHelmet =  _plebHelmets select _helmetNumber; 
		// ============ Vests ============
		_plebVest = "V_Chestrig_oli";
		_glVest = "V_Chestrig_oli";
		_medVest = "V_Chestrig_oli";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "B_UAV_01_backpack_F";
		// ===============================
	};
	case "afr" : {
		// ========== Uniforms ===========
		_plebUniforms = ["Afr_paramil_uniform_02","Afr_paramil_uniform_02a","Afr_paramil_uniform_02b","Afr_paramil_uniform_03","Afr_paramil_uniform_03a","Afr_paramil_uniform_03b"];
		_uniformNumber = (floor(random (count _plebUniforms)));
		_plebUniform = _plebUniforms select _uniformNumber; // leave as "" for default
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmets = ["H_Booniehat_khk_hs","H_Bandanna_khk_hs","H_Cap_oli_hs","H_Shemag_olive_hs","H_Cap_headphones","H_Watchcap_blk"];
		_helmetNumber = (floor(random (count _plebHelmets)));
		_plebHelmet =  _plebHelmets select _helmetNumber; 
		// ============ Vests ============
		_plebVest = "V_Chestrig_blk";
		_glVest = "V_Chestrig_blk";
		_medVest = "V_Chestrig_blk";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_blk";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_cbr";
		_uavRuck = "B_UAV_01_backpack_F";
		// ===============================
	};
	case "east" : {
		// ========== Uniforms ===========
		_plebUniforms = ["East_paramil_uniform_02","East_paramil_uniform_02a","East_paramil_uniform_02b","East_paramil_uniform_03","East_paramil_uniform_03a","East_paramil_uniform_03b"];
		_uniformNumber = (floor(random (count _plebUniforms)));
		_plebUniform = _plebUniforms select _uniformNumber; // leave as "" for default
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmets = ["H_Booniehat_khk_hs","H_Bandanna_khk_hs","H_Cap_oli_hs","H_Shemag_olive_hs","H_Cap_headphones","H_Watchcap_blk"];
		_helmetNumber = (floor(random (count _plebHelmets)));
		_plebHelmet =  _plebHelmets select _helmetNumber; 
		// ============ Vests ============
		_plebVest = "V_Chestrig_blk";
		_glVest = "V_Chestrig_blk";
		_medVest = "V_Chestrig_blk";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_blk";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_cbr";
		_uavRuck = "B_UAV_01_backpack_F";
		// ===============================
	};
	case "euro" : {
		// ========== Uniforms ===========
		_plebUniforms = ["Euro_paramil_uniform_01","Euro_paramil_uniform_01a","Euro_paramil_uniform_01b","Euro_paramil_uniform_02","Euro_paramil_uniform_02a","Euro_paramil_uniform_02b","Euro_paramil_uniform_03","Euro_paramil_uniform_03a","Euro_paramil_uniform_03b"];
		_uniformNumber = (floor(random (count _plebUniforms)));
		_plebUniform = _plebUniforms select _uniformNumber; // leave as "" for default
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmets = ["H_Booniehat_khk_hs","H_Bandanna_khk_hs","H_Cap_oli_hs","H_Shemag_olive_hs","H_Cap_headphones","H_Watchcap_blk"];
		_helmetNumber = (floor(random (count _plebHelmets)));
		_plebHelmet =  _plebHelmets select _helmetNumber; 
		// ============ Vests ============
		_plebVest = "V_Chestrig_oli";
		_glVest = "V_Chestrig_oli";
		_medVest = "V_Chestrig_oli";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "B_UAV_01_backpack_F";
		// ===============================
	};
	default {
		// ========== Uniforms ===========
		_plebUniforms = ["U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_leader","U_BG_Guerrilla_6_1","U_BG_Guerilla3_1","U_BG_Guerilla2_1"];
		_uniformNumber = (floor(random (count _plebUniforms)));
		_plebUniform = _plebUniforms select _uniformNumber; // leave as "" for default
		_crewUniform = "U_B_CombatUniform_mcam_vest";
		// =========== Helmets ===========
		_plebHelmets = ["H_Booniehat_khk_hs","H_Bandanna_khk_hs","H_Cap_oli_hs","H_Shemag_olive_hs","H_Cap_headphones","H_Watchcap_blk"];
		_helmetNumber = (floor(random (count _plebHelmets)));
		_plebHelmet =  _plebHelmets select _helmetNumber; 
		// ============ Vests ============
		_plebVest = "V_Chestrig_oli";
		_glVest = "V_Chestrig_oli";
		_medVest = "V_Chestrig_oli";
		// ============ Rucks ============
		_smallRuck = "B_AssaultPack_rgr";
		_medRuck = "B_Kitbag_rgr";
		_largeRuck = "B_Carryall_oli";
		_uavRuck = "B_UAV_01_backpack_F";
		// ===============================
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
switch (_radioSelection) do {
	case "detection" : {
		private "_side";
		_side = toLower format ["%1", side player];
		// BLUFOR radios
		if (_side == "west") then { 
			_airRadioRuck = "tf_anarc210";
			_radioRuck = "tf_rt1523g_green";
			_diverRadioRuck = "tf_rt1523g_black";
		};
		// OPFOR radios
		if (_side == "east") then { 
			_airRadioRuck = "tf_mr6000l";
			_radioRuck = "tf_mr3000";
			_diverRadioRuck = "tf_mr3000";
		};
		// INDFOR radios
		if (_side == "guer") then { 
			_airRadioRuck = "tf_anarc164";
			_radioRuck = "tf_anprc155";
			_diverRadioRuck = "tf_anprc155";
		};
		// Civilian radios
		if (_side == "civ") then { 
			_airRadioRuck = "tf_anarc210";
			_radioRuck = "tf_rt1523g_green";
			_diverRadioRuck = "tf_rt1523g_black";
		};
	};
	case "defined" : {
		_airRadioRuck = "tf_anarc210";
		_radioRuck = "tf_rt1523g_green";
		_diverRadioRuck = "tf_rt1523g_black";
	};
	default {
		_airRadioRuck = "tf_anarc210";
		_radioRuck = "tf_rt1523g_green";
		_diverRadioRuck = "tf_rt1523g_black";
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
_hatLaunch = "launch_B_Titan_short_F";
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
_hmgBarrel = "I_HMG_01_weapon_F";
_hmgTripod = "I_HMG_01_support_F";
_hmgMag = "";	// no magazines as of yet
// ========== GMG Team ===========
_gmgBarrel = "I_GMG_01_weapon_F";
_gmgTripod = "I_HMG_01_support_F";
_gmgMag = "";	// no magazines as of yet
// =========== Tools =============
_nightVision = "NVGoggles_INDEP";
_basicTools = [_radio,"ItemCompass","ItemMap","ItemWatch"];
_basicItems = ["AGM_EarBuds"];
_autoItem = "AGM_SpareBarrel";
_secTools = ["itemGPS"];
_secItems = ["AGM_MapTools"];
_pltTools = ["itemGPS"];
_pltItems = ["AGM_MapTools"];
// ======== Attachments ==========
_rifleAttachmentArray = [[],[],[],[],[],[],[],[]];
_rifleAttachments = _rifleAttachmentArray select _rifleRandom;

_rifleGLAttachmentArray = [["optic_ACO_grn","acc_flashlight"],["optic_ACO_grn","acc_flashlight"],["optic_ACO_grn","acc_flashlight"],["optic_ACO_grn","acc_flashlight"],["optic_ACO_grn","acc_flashlight"]];
_rifleGLAttachments = _rifleGLAttachmentArray select _rifleGLRandom;

_rifleScopedAttachmentArray = [["hlc_optic_suit"],["hlc_optic_suit"],["optic_MRCO"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_accupoint_g3"],["hlc_optic_accupoint_g3"]];
_rifleScopedAttachments = _rifleScopedAttachmentArray select _rifleScopedRandom;

_carbineAttachmentArray = [["hlc_optic_kobra","acc_flashlight"],["rhsusf_acc_compm4","acc_flashlight"],["rhsusf_acc_compm4","acc_flashlight"],["rhsusf_acc_compm4","acc_flashlight"],["optic_ACO_grn","acc_flashlight"]];
_carbineAttachments = _carbineAttachmentArray select _carbineRandom;

_dmrAttachmentArray = [["hlc_optic_suit"],["hlc_optic_suit"],["optic_MRCO"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_accupoint_g3"],["hlc_optic_accupoint_g3"],["optic_MRCO","acc_flashlight"]];
_dmrAttachments = _dmrAttachmentArray select _dmrRandom;

_autoRifleAttachments = ["optic_ACO_grn","acc_flashlight"];
_mmgAttachments = ["optic_ACO_grn","acc_flashlight"];
_sniperAttachments = ["optic_SOS"];
_pistolAttachments = [];


_scoped_rifleAttachmentArray = [["hlc_optic_suit"],["hlc_optic_suit"],["optic_MRCO"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_accupoint_g3"],["hlc_optic_accupoint_g3"]];
_scoped_rifleAttachments = _scoped_rifleAttachmentArray select _rifleRandom;

_scoped_rifleGLAttachmentArray = [["optic_MRCO","acc_flashlight"],["optic_MRCO","acc_flashlight"],["optic_MRCO","acc_flashlight"],["optic_MRCO","acc_flashlight"],["optic_MRCO","acc_flashlight"]];
_scoped_rifleGLAttachments = _scoped_rifleGLAttachmentArray select _rifleGLRandom;

_scoped_rifleScopedAttachmentArray = [["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_suit"],["hlc_optic_accupoint_g3"],["hlc_optic_accupoint_g3"]];
_scoped_rifleScopedAttachments = _scoped_rifleScopedAttachmentArray select _rifleScopedRandom;

_scoped_carbineAttachmentArray = [["HLC_Optic_PSO1","acc_flashlight"],["rhsusf_acc_ACOG3","acc_flashlight"],["rhsusf_acc_ACOG3","acc_flashlight"],["rhsusf_acc_ACOG3","acc_flashlight"],["optic_MRCO","acc_flashlight"]];
_scoped_carbineAttachments = _scoped_carbineAttachmentArray select _carbineRandom;

_scoped_autoRifleAttachments = ["optic_MRCO","acc_flashlight"];
_scoped_mmgAttachments = ["optic_MRCO","acc_flashlight"];
_scoped_pistolAttachments = [];


_suppressed_rifleAttachmentArray = [["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_G3"],["hlc_muzzle_snds_G3"]];
_suppressed_rifleAttachments = _suppressed_rifleAttachmentArray select _rifleRandom;

_suppressed_rifleGLAttachmentArray = [["hlc_muzzle_snds_G3"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_G3"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_G3"]];
_suppressed_rifleGLAttachments = _suppressed_rifleGLAttachmentArray select _rifleGLRandom;

_suppressed_rifleScopedAttachmentArray = [["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_G3"],["hlc_muzzle_snds_G3"]];
_suppressed_rifleScopedAttachments = _suppressed_rifleScopedAttachmentArray select _rifleScopedRandom;

_suppressed_carbineAttachmentArray = [["hlc_muzzle_545SUP_AK"],["rhsusf_acc_rotex5_grey"],["rhsusf_acc_rotex5_grey"],["rhsusf_acc_rotex5_grey"],["muzzle_snds_M"]];
_suppressed_carbineAttachments = _suppressed_carbineAttachmentArray select _carbineRandom;

_suppressed_dmrAttachmentArray = [["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_fal"],["hlc_muzzle_snds_G3"],["hlc_muzzle_snds_G3"],["muzzle_snds_B"]];
_suppressed_dmrAttachments = _suppressed_dmrAttachmentArray select _dmrRandom;

_suppressed_autoRifleAttachments = ["muzzle_snds_H_MG"];
_suppressed_mmgAttachments = [];
_suppressed_pistolAttachments = ["muzzle_snds_acp"];

// ===============================
// ===== Variable Processing =====
// ===============================
if ((!isNil "_suppressors") && _suppressors) then {
	_rifleSDMagArray = ["hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20rnd_762x51_S_G3","hlc_20rnd_762x51_S_G3"];
	_rifleMag = _rifleSDMagArray select _rifleRandom;
	
	_rifleGLSDMagArray = ["hlc_20rnd_762x51_S_G3","hlc_20Rnd_762x51_S_fal","hlc_20rnd_762x51_S_G3","hlc_20Rnd_762x51_S_fal","hlc_20rnd_762x51_S_G3"];
	_rifleGLMag = _rifleGLSDMagArray select _rifleGLRandom;
	
	_rifleScopedSDMagArray = ["hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20Rnd_762x51_S_fal","hlc_20rnd_762x51_S_G3","hlc_20rnd_762x51_S_G3"];
	_rifleScopedMag = _rifleScopedSDMagArray select _rifleScopedRandom;
	
	_carbineSDMagArray = ["hlc_30Rnd_545x39_S_AK","30rnd_556x45_STANAG","30rnd_556x45_STANAG","30rnd_556x45_STANAG","AGM_30Rnd_556x45_Stanag_SD"];
	_carbineMag = _carbineSDMagArray select _carbineRandom;
	if (!_underwaterWeapons) then { 
		_rifleDiverMagOne = "AGM_30Rnd_556x45_Stanag_SD";
		_rifleDiverMagTwo = "AGM_30Rnd_556x45_Stanag_SD";
	};
};
if ((!isNil "_scopes") && _scopes) then {
	_rifleAttachments = _scoped_rifleAttachments;
	_rifleGLAttachments = _scoped_rifleGLAttachments;
	_carbineAttachments = _scoped_carbineAttachments;
	_autoRifleAttachments = _scoped_autoRifleAttachments;
	_mmgAttachments = _scoped_mmgAttachments;
	_pistolAttachments = _scoped_pistolAttachments;
};
if ((!isNil "_suppressors") && _suppressors) then {
	_rifleAttachments = _rifleAttachments + _suppressed_rifleAttachments;
	_rifleGLAttachments = _rifleGLAttachments + _suppressed_rifleGLAttachments;
	_rifleScopedAttachments = _rifleScopedAttachments + _suppressed_rifleScopedAttachments;
	_carbineAttachments = _carbineAttachments + _suppressed_carbineAttachments;
	_dmrAttachments = _dmrAttachments + _suppressed_dmrAttachments;
	_autoRifleAttachments = _autoRifleAttachments + _suppressed_autoRifleAttachments;
	_mmgAttachments = _mmgAttachments + _suppressed_mmgAttachments;
	_pistolAttachments = _pistolAttachments + _suppressed_pistolAttachments;
	
	_scoped_rifleAttachments = _scoped_rifleAttachments + _suppressed_rifleAttachments;
	_scoped_rifleGLAttachments = _scoped_rifleGLAttachments + _suppressed_rifleGLAttachments;
	_scoped_rifleScopedAttachments = _scoped_rifleScopedAttachments + _suppressed_rifleScopedAttachments;
	_scoped_carbineAttachments = _scoped_carbineAttachments + _suppressed_carbineAttachments;
	_scoped_autoRifleAttachments = _scoped_autoRifleAttachments + _suppressed_autoRifleAttachments;
	_scoped_mmgAttachments = _scoped_mmgAttachments + _suppressed_mmgAttachments;
	_scoped_pistolAttachments = _scoped_pistolAttachments + _suppressed_pistolAttachments;
};
if ((!isNil "_nightGear") && _nightGear) then { 
	_basicItems = _basicItems + ["AGM_IR_Strobe_Item"]; 
};
if ((!isNil "_nightGear") && _nightGear) then { 
	_basicTools = _basicTools + [_nightVision]; 
};
if ((!isNil "_nightGear") && _nightGear) then { 
	private "_test";	
	// ========================================
	{
		_test = _rifleAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleAttachments set [_test,"acc_pointer_IR"]};
		_test = _rifleAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleAttachments set [_test,"acc_pointer_IR"]};
	} forEach _rifleAttachments;
	{
		_test = _rifleGLAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleGLAttachments set [_test,"acc_pointer_IR"]};
		_test = _rifleGLAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleGLAttachments set [_test,"acc_pointer_IR"]};
	} forEach _rifleGLAttachments;
	{
		_test = _rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleScopedAttachments set [_test,"acc_pointer_IR"]};
		_test = _rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_rifleScopedAttachments set [_test,"acc_pointer_IR"]};
	} forEach _rifleScopedAttachments;
	{
		_test = _carbineAttachments find "acc_flashlight";
		if (_test != -1) then {_carbineAttachments set [_test,"acc_pointer_IR"]};
		_test = _carbineAttachments find "acc_flashlight";
		if (_test != -1) then {_carbineAttachments set [_test,"acc_pointer_IR"]};
	} forEach _carbineAttachments;
	{
		_test = _dmrAttachments find "acc_flashlight";
		if (_test != -1) then {_dmrAttachments set [_test,"acc_pointer_IR"]};
	} forEach _dmrAttachments;
	// ========================================
	{
		_test = _scoped_rifleAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleAttachments set [_test,"acc_pointer_IR"]};
		_test = _scoped_rifleAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleAttachments set [_test,"acc_pointer_IR"]};
	} forEach _scoped_rifleAttachments;
	{
		_test = _scoped_rifleGLAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleGLAttachments set [_test,"acc_pointer_IR"]};
		_test = _scoped_rifleGLAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleGLAttachments set [_test,"acc_pointer_IR"]};
	} forEach _scoped_rifleGLAttachments;
	{
		_test = _scoped_rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleScopedAttachments set [_test,"acc_pointer_IR"]};
		_test = _scoped_rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_rifleScopedAttachments set [_test,"acc_pointer_IR"]};
	} forEach _scoped_rifleScopedAttachments;
	{
		_test = _scoped_rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_carbineAttachments set [_test,"acc_pointer_IR"]};
		_test = _scoped_rifleScopedAttachments find "acc_flashlight";
		if (_test != -1) then {_scoped_carbineAttachments set [_test,"acc_pointer_IR"]};
	} forEach _scoped_carbineAttachments;
	// ========================================
	_test = _autoRifleAttachments find "acc_flashlight";
	if (_test != -1) then {_autoRifleAttachments set [_test,"acc_pointer_IR"]};
	_test = _mmgAttachments find "acc_flashlight";
	if (_test != -1) then {_mmgAttachments set [_test,"acc_pointer_IR"]};
	_test = _scoped_autoRifleAttachments find "acc_flashlight";
	if (_test != -1) then {_scoped_autoRifleAttachments set [_test,"acc_pointer_IR"]};
	_test = _scoped_mmgAttachments find "acc_flashlight";
	if (_test != -1) then {_scoped_mmgAttachments set [_test,"acc_pointer_IR"]};
	// ========================================
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
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
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
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,6];
			(unitBackpack _unit) addMagazineCargoGlobal [_mmgMag,2];		
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
			(unitBackpack _unit) addMagazineCargoGlobal [_rifleMag,2];
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

// ==============================================================
// Addition of Attachments to a Unit's weapon
// Note that pistol attachments are done regardless of what is called
// Example: ["rifle"] call _addRuck;
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
		case "rifle" : {
			if (!isNil "_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _rifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "riflegl" : {
			if (!isNil "_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _rifleGLAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "riflescoped" : {
			if (!isNil "_scoped_rifleScopedAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleScopedAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "carbine" : {
			if (!isNil "_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _carbineAttachments;
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
		case "scopedrifle" : {
			if (!isNil "_scoped_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "scopedriflegl" : {
			if (!isNil "_scoped_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleGLAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		case "scopedcarbine" : {
			if (!isNil "_scoped_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_carbineAttachments;
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
		case "scopeddiver" : {
			if (!_underwaterWeapons) then { 
				if (!isNil "_scoped_rifleAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments;
				};
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
		};
		// ============================================================
		// ===== Suppressed - Redundant if '_suppressors' is true =====
		// ============================================================
		case "supprifle" : {
			if (!isNil "_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _rifleAttachments;
			};
			if (!isNil "_suppressed_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "suppriflegl" : {
			if (!isNil "_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _rifleGLAttachments;
			};
			if (!isNil "_suppressed_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleGLAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "suppriflescoped" : {
			if (!isNil "_rifleScopedAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _rifleScopedAttachments;
			};
			if (!isNil "_suppressed_rifleScopedAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleScopedAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "suppcarbine" : {
			if (!isNil "_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _carbineAttachments;
			};
			if (!isNil "_suppressed_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_carbineAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
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
			if (!isNil "_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _autoRifleAttachments;
			};
			if (!isNil "_suppressed_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_autoRifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "suppdiver" : {
			if (!_underwaterWeapons) then { 
				if (!isNil "_rifleAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _rifleAttachments;
				};
				if (!isNil "_suppressed_rifleAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleAttachments;
				};
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		// =========================================================================================
		// ===== Scoped & Suppressed - Redundant if both '_suppressors' and '_scopes' are true =====
		// =========================================================================================		
		case "scupprifle" : {
			if (!isNil "_scoped_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments;
			};
			if (!isNil "_suppressed_rifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "scuppriflegl" : {
			if (!isNil "_scoped_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleGLAttachments;
			};
			if (!isNil "_suppressed_rifleGLAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleGLAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "scupprifleccoped" : {
			if (!isNil "_scoped_rifleScopedAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleScopedAttachments;
			};
			if (!isNil "_suppressed_rifleScopedAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleScopedAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "scuppcarbine" : {
			if (!isNil "_scoped_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_carbineAttachments;
			};
			if (!isNil "_suppressed_carbineAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_carbineAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "scuppar" : {
			if (!isNil "_scoped_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _scoped_autoRifleAttachments;
			};
			if (!isNil "_suppressed_autoRifleAttachments") then {
				{ _unit addPrimaryWeaponItem _x } forEach _suppressed_autoRifleAttachments;
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
		};
		case "scuppdiver" : {
			if (!_underwaterWeapons) then { 
				if (!isNil "_scoped_rifleAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _scoped_rifleAttachments;
				};
				if (!isNil "_suppressed_rifleAttachments") then {
					{ _unit addPrimaryWeaponItem _x } forEach _suppressed_rifleAttachments;
				};
			};
			if (!isNil "_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _pistolAttachments;
			};
			if (!isNil "_suppressed_pistolAttachments") then {
				{ _unit addHandgunItem _x } forEach _suppressed_pistolAttachments;
			};
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
	if (!isNull (unitBackpack _unit) && !(_loadout in ["pltuavop"])) then {
		(unitBackpack _unit) addItemCargoGlobal [_medOne,4];
		(unitBackpack _unit) addItemCargoGlobal [_medTwo,2];
	} else {
		for "_i" from 1 to 4 do {_unit addItem _medOne};
		for "_i" from 1 to 2 do {_unit addItem _medTwo};
	};
};
// ==============================================================