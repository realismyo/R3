/* 
Gear Assign Script for Arma 3
by Mr. Agnet

- Covers most standard RIFM platoon roles, if you want to add more just ask me or do so by observation of how the others work.
- Current Loadouts: "pltld", "pltmed", "pltfac", "pltuavop", "secco", "sectl", "ar", "aar", "rm", "rmat", "rmsc", "dmr", "gren", "mmg", "mmgass", "rotarypilot", "fixedpilot", "crewmander", "crewman", "hmggun", "hmgass", "gmggun", "gmgass", "hatgun", "hatammo", "aagun", "aaammo", "divertl", "diver", "sniper", "spotter", "engi"
- Adapted for Arma 3, still technically WIP. Report any and all issues to Mr. Agnet via the forums, steam, ts etc.
- Current Side, Faction: OPFOR, CSAT
- Required Mods: @AGM, @task_force_radio, @TEC_CSAT, @HLCMods_Core, @HLCMods_AK

===== Using this Script =====
- In their current state, the scripts will not work for AI. In fact a whole different script will be required.

- If called from unit init field, needs follow the following format, with the desired loadout as a lower case string value (in "").
- nul = [this,"loadout"] execVM "scripts\assignGear_CSAT_AK.sqf";
e.g. - nul = [this,"pltld"] execVM "scripts\assignGear_CSAT_AK.sqf";
- This would equip a CSAT platoon leader with the gear defined below.
- All available loadout options are annotated above.

- You may include up to four extra paramters for this script, corresponding with variables in the script, in the following format:
- nul = [this,"loadout",nightGear,scopes,suppressors,"camopattern"] execVM "scripts\assignGear_CSAT_AK.sqf";
e.g. - nul = [this,"pltld",true,false,true,"navy"] execVM "scripts\assignGear_CSAT_AK.sqf";
- This example would equip a CSAT platoon leader with night gear, no scope, a suppresssed weapon and navy camo equipment.
- This system allows for individual cases - you may still change the variables below for a 'global' effect.

- Additional cases can be added below to support additional roles.
- Check the assignGearDefines_CSAT_AK.sqf for defined variables, alter them in that script. 
- The variables at the beginning of the defines script influence what gear players will receive, they should be fairly straightforward.
=============================
*/ 

private [
"_nightGear","_scopes","_suppressors","_camoPattern","_underwaterWeapons","_flashbangs",
"_delay","_unit","_loadout"
];

// ==== gear script variables ====
_nightGear = false;					// Night vision goggles and IR strobes equipped.
_scopes = false;					// Scopes replace regular attachments.
_suppressors = false;				// Suppressors & SD mags where applicable.
_camoPattern = "arid";				// Camo pattern in accordance with @TEC_CSAT camo patterns. Default: "arid". Available cases: "arid", "navy", "semiarid", "sof", "urban", "woodland". Requires lower case string value.
_radioSelection = "detection";		// Radio assignment. "detection" for side detect & assignment, "defined" for script defined radio & assignment. 
_underwaterWeapons = true;			// Divers assigned underwater rifles, if false then same rifle as everyone else. 
_flashbangs = 0;					// amount of flashbangs, integer required. Set to 0 for none. Set to something >0 for however many flashabangs you want to give people. wow. 
// ===============================

// variable assignment
_delay = 0.1;
_unit = _this select 0;
_loadout = toLower (_this select 1);
if (count _this > 2) then { if (typeName (_this select 2) == "BOOL") then { _nightGear = _this select 2; }; };
if (count _this > 3) then { if (typeName (_this select 3) == "BOOL") then { _scopes = _this select 3; }; };
if (count _this > 4) then { if (typeName (_this select 4) == "BOOL") then { _suppressors = _this select 4; }; };
if (count _this > 5) then { if (typeName (_this select 5) == "STRING") then { _camoPattern = toLower(_this select 5); }; };

// waits until mission has started, make sure unit exists, or wait until it does
waitUntil {time > 1};																			
if (_unit != _unit) then { waitUntil { !isNull _unit; }; };
if (!isDedicated && isMultiplayer) then { waitUntil { !isNull _unit && isPlayer _unit; }; };

// disable AI stuffs
if !(isPlayer _unit) then { {_unit disableAI _x} forEach ["TARGET","AUTOTARGET","MOVE","FSM","ANIM"]; };

// script needs to run on the unit/player's computer. 
if (!(local _unit)) exitWith {};						
if (isMultiplayer && isServer) exitWith {};

// faction specific script with all of the variables
#include "assignGearDefines_CSAT_AK.sqf";					

// gear removal
if (_plebUniform != "") then { removeUniform _unit; };
if (_goggles != "") then { removeGoggles _unit; };
removeAllItems _unit;
removeAllWeapons _unit; 
removeAllAssignedItems _unit;
removeVest _unit;
removeHeadgear _unit;
removeBackpack _unit;

// case switch for desired loadout
switch (_loadout) do {									
	// ================================
	// ======= Platoon HQ Roles =======
	// PltCO gear, doubles as PltSGT
	case "pltld" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _pltTools;
		{ _unit addItem _x } foreach _pltItems;
		_unit addMagazines [_rifleGLMag,7];
		_unit addMagazines [_rifleTracerMag,2];
		_unit addMagazines [_glExplody,3];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["plt"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Plt Medic
	case "pltmed" : {
		["medic"] call _addClothes;
		call _addBasics; 
		{ _unit linkItem _x } foreach _pltTools;
		_unit addMagazines [_rifleMag,9];
		for "_i" from 1 to 16 do {_unit addItem _medOne};
		for "_i" from 1 to 4 do {_unit addItem _medTwo};
		for "_i" from 1 to 4 do {_unit addItem _medThree};
		_unit addWeapon _rifle;
		_unit addMagazines [_smoke,4];
		["medic"] call _addRuck;
		["general"] call _addAttachments;
		_unit setVariable ["AGM_IsMedic", true, true];
	};
	// Plt FAC/FO
	case "pltfac" : {
		["pleb"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _pltTools;
		{ _unit addItem _x } foreach _facItems;
		_unit addMagazines [_rifleGLMag,7];
		_unit addMagazines [_rifleTracerMag,2];
		_unit addMagazine _designatorBat;
		_unit addMagazines [_glSmokeOne,5];
		_unit addMagazines [_glSmokeTwo,5];
		_unit addWeapon _rifleGL;
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		["fac"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Plt UAV Operator
	case "pltuavop" : {
		["pleb"] call _addClothes;
		call _addBasics;
		{ _unit addItem _x } foreach _pltTools;
		_unit linkItem _uavTool;
		_unit addMagazines [_rifleMag,9];
		_unit addMagazine _uavBat;
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		["uavop"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// ================================
	// ======== Section Roles =========
	// Section Commander
	case "secco" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_rifleGLMag,7];
		_unit addMagazines [_rifleTracerMag,2];
		_unit addMagazines [_glExplody,3];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["plt"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Section Team Leader / 2iC
	case "sectl" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_rifleGLMag,7];
		_unit addMagazines [_rifleTracerMag,2];
		_unit addMagazines [_glExplody,3];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["tl"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Automatic Rifleman
	case "ar" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_autoRifleMag,3];
		_unit addWeapon _autoRifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["ar"] call _addRuck;
		["ar"] call _addAttachments;
		call _IFAK;
	};
	// Assistant Automatic Rifleman
	case "aar" : {
		["assistant"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["aar"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Rifleman
	case "rm" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["rm"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};	
	// Rifleman (disposable light AT)
	case "rmat" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["rmat"] call _addRuck;
		["general"] call _addAttachments;
		_unit addWeapon _lat;
		call _IFAK;
	};
	// Scoped Rifleman
	case "rmsc" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleScopedMag,9];
		_unit addWeapon _rifleScoped;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["rmsc"] call _addRuck;
		["scopedgeneral"] call _addAttachments;
		call _IFAK;
	};
	// Designated Marksman
	case "dmr" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_dmrMag,13];
		_unit addWeapon _dmr;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["dmr"] call _addRuck;
		["dmr"] call _addAttachments;
		call _IFAK;
	};
	// Grenadier
	case "gren" : {
		["gren"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleGLMag,9];
		_unit addMagazines [_glExplody,3];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["gren"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Machinegunner
	case "mmg" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_mmgMag,3];
		_unit addWeapon _mmg;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["mmg"] call _addRuck;
		["mmg"] call _addAttachments;
		call _IFAK;
	};
	// Assistant Machinegunner
	case "mmgass" : {
		["assistant"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["mmgass"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// ================================
	// ======== Vehicle Crews =========
	// Rotary Wing Pilot
	case "rotarypilot" : {
		["rpilot"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_smgMag,6];
		_unit addWeapon _smg;
		_unit addMagazines [_smoke,2];
		["aircrew"] call _addRuck;
		call _IFAK;
	};
	// Fixed Wing Pilot
	case "fixedpilot" : {
		["fpilot"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_smgMag,6];
		_unit addWeapon _smg;
		_unit addMagazines [_smoke,2];
		["aircrew"] call _addRuck;
		call _IFAK;
	};
	// Crew Commander
	case "crewmander" : {
		["crew"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_carbineMag,6];
		_unit addWeapon _carbine;
		_unit addMagazines [_smoke,2];
		["crew"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// Crewman
	case "crewman" : {
		["crew"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_carbineMag,6];
		_unit addWeapon _carbine;
		_unit addMagazines [_smoke,2];
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// ================================
	// ===== Static Weapons Teams =====
	// HMG Gunner
	case "hmggun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["hmggun"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// HMG Assistant
	case "hmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["hmgass"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// GMG Gunner
	case "gmggun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["gmggun"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// GMG Assistant
	case "gmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["gmgass"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
		call _IFAK;
	};
	// ================================
	// ======== Launcher Teams ========
	// HAT Gunner
	case "hatgun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["hat"] call _addRuck;
		["general"] call _addAttachments;
		_unit addWeapon _hatLaunch;
		call _IFAK;
	};
	// HAT Assistant
	case "hatammo" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["hatass"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// AA Gunner
	case "aagun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["aa"] call _addRuck;
		["general"] call _addAttachments;
		_unit addWeapon _aaLaunch;
		call _IFAK;
	};
	// AA Assistant
	case "aaammo" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["aaass"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// ================================
	// ========== Extra Roles =========
	// Diver Team Leader
	case "divertl" : {
		["diver"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_rifleDiverMagOne,3];
		_unit addMagazines [_rifleDiverMagTwo,3];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifleDiver;
		["divertl"] call _addRuck;
		["diver"] call _addAttachments;
		call _IFAK;
	};
	// Diver General
	case "diver" : {
		["diver"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleDiverMagOne,3];
		_unit addMagazines [_rifleDiverMagTwo,3];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifleDiver;
		["diver"] call _addRuck;
		["diver"] call _addAttachments;
		call _IFAK;
	};
	// Sniper
	case "sniper" : {
		["sniper"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _sniperItems;
		_unit addMagazines [_boltRifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _boltRifle;
		["sniper"] call _addRuck;
		["sniper"] call _addAttachments;
		call _IFAK;
	};
	// Spotter
	case "spotter" : {
		["sniper"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		{ _unit addItem _x } foreach _sniperItems;
		_unit addMagazines [_rifleGLMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,3];
		_unit addMagazines [_glSmokeOne,2];
		_unit addMagazines [_glSmokeTwo,2];
		_unit addWeapon _rifleGL;
		["spotter"] call _addRuck;
		["suppgeneral"] call _addAttachments;
		_unit setVariable ["AGM_IsMedic", true, true];
	};
	// Engineer
	case "engi" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["engi"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};	
	// ================================
	// if undefined or incorrectly defined, give hint and assign standard rifleman gear
	default {
		_unit sideChat format ["No or incorrectly defined loadout for unit: %1",_unit];
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		_unit addWeapon _rifle;
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		["rm"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
};

// flashbang stuff
// add extra role strings to this array for those units to be equipped with flashbangs.
if (_loadout in ["pltld","secco","sectl","ar","aar","rm","rmat","rmsc","dmr","gren","mmg","mmgass","divertl","diver"]) then {
	if (!isNil "_flashbangs" && _flashbangs > 0) then {
		for "_i" from 1 to (round _flashbangs) do { (unitBackpack _unit) addMagazineCargoGlobal [_flashbang,1]; }; 
	};
};

[_unit,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
_unit selectWeapon (primaryWeapon _unit);
_unit switchMove "AmovPercMstpSlowWrflDnon";
sleep _delay;
_unit groupChat format ["%1 completed gear assign", name _unit];