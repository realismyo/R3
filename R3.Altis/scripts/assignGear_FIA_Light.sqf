/* 
Gear Assign Script for Arma 3
by AGeNT

- Covers most standard RIFM platoon roles, if you want to add more just ask me or do so by observation of how the others work.
- Current Loadouts: "pltld", "pltmed", ""pltfac", "pltuavop", "secco", "sectl", "ar", "aar", "rm", "rmat", "rmsc", "dm", "gren", "mmg", "mmgass", "rotarypilot", "fixedpilot", "crewmander", "crewman", "hmggun", "hmgass", "gmggun", "gmgass", "hatgun", "hatammo", "aagun", "aaammo", "divertl", "diver", "sniper", "spotter"
- Adapted for Arma 3, still technically WIP. Report any and all issues to Agent via the forums, steam, ts etc.
- Current Side, Faction: BLUFOR, FIA, Random 'light' weapons.
- Required Mods: @AGM, @task_force_radio, @HLCMods_Core, @HLCMods_AK, @HLCMods_G3, @HLCMods_FAL, @RH_M4_A3

===== Using this Script =====
- This script in particular randomises weapons and gear given to players. If you do not wish to have this functionality, use the normal assignGear_FIA scripts.
- Editing this pair of scripts will probably require a decent proficiency in scripting. Be warned I guess. 
- In their current state, the scripts will not work for AI. In fact a whole different script will be required.

- If called from unit init field, needs follow the following format, with the desired loadout as a lower case string value (in "").
- nul = [this,"loadout"] execVM "scripts\assignGear_FIA.sqf";
e.g. - nul = [this,"pltld"] execVM "scripts\assignGear_FIA.sqf";
- This would equip a FIA platoon leader with the gear defined below.
- All available loadout options are annotated above.

- You may include up to three extra paramters for this script, corresponding with variables in the script, in the following format:
- nul = [this,"loadout",nightGear,scopes,suppressors] execVM "scripts\assignGear_FIA.sqf";
e.g. - nul = [this,"pltld",false,false,true] execVM "scripts\assignGear_FIA.sqf";
- This example would equip a FIA platoon leader with no night gear, no scope.
- This system allows for individual cases - you may still change the variables below for a 'global' effect.

- Additional cases can be added below to support additional roles.
- Check the assignGearDefines_FIA.sqf for defined variables, alter them in that script. 
- The variables at the beginning of this script can influence what gear players will receive, they should be fairly straightforward
=============================
*/ 

private [
"_nightGear","_scopes","_camoPattern","_underwaterWeapons",
"_delay","_unit","_loadout"
];

// ==== gear script variables ====
_nightGear = false;					// night vision goggles and IR strobes equipped
_scopes = false;					// scopes replace regular attachments
_suppressors = false;				// suppressors & SD mags where applicable
_underwaterWeapons = true;			// divers assigned underwater rifles, if false then same rifle as everyone else. 
// ===============================

// variable assignment
_delay = 0.1;
_unit = _this select 0;
_loadout = toLower (_this select 1);
if (count _this > 2) then { if (typeName (_this select 2) == "BOOL") then { _nightGear = _this select 2; }; };
if (count _this > 3) then { if (typeName (_this select 3) == "BOOL") then { _scopes = _this select 3; }; };
if (count _this > 4) then { if (typeName (_this select 4) == "BOOL") then { _suppressors = _this select 4; }; };

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
#include "assignGearDefines_FIA_Light.sqf";

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
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		["plt"] call _addRuck;
		["riflegl"] call _addAttachments;
		call _IFAK;
	};
	// Plt Medic
	case "pltmed" : {
		["medic"] call _addClothes;
		call _addBasics; 
		{ _unit linkItem _x } foreach _pltTools;
		_unit addMagazines [_rifleMag,9];
		_unit addMagazines [_smoke,4];
		for "_i" from 1 to 16 do {_unit addItem _medOne};
		for "_i" from 1 to 4 do {_unit addItem _medTwo};
		for "_i" from 1 to 4 do {_unit addItem _medThree};
		_unit addWeapon _rifle;
		["medic"] call _addRuck;
		["rifle"] call _addAttachments;
		_unit setVariable ["AGM_IsMedic", true, true];
	};
	// Plt FAC/FO
	case "pltfac" : {
		["pleb"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _pltTools;
		{ _unit addItem _x } foreach _facItems;
		_unit addMagazines [_rifleGLMag,9];
		_unit addMagazine _designatorBat;
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		_unit addMagazines [_glSmokeOne,5];
		_unit addMagazines [_glSmokeTwo,5];
		_unit addWeapon _rifleGL;
		["fac"] call _addRuck;
		["riflegl"] call _addAttachments;
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
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		_unit addWeapon _rifle;
		["uavop"] call _addRuck;
		["rifle"] call _addAttachments;
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
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		["plt"] call _addRuck;
		["riflegl"] call _addAttachments;
		call _IFAK;
	};
	// Section Team Leader / 2iC
	case "sectl" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_rifleGLMag,7];
		_unit addMagazines [_rifleTracerMag,2];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		["tl"] call _addRuck;
		["riflegl"] call _addAttachments;
		call _IFAK;
	};
	// Automatic Rifleman
	case "ar" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_autoRifleMag,3];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _autoRifle;
		["ar"] call _addRuck;
		["ar"] call _addAttachments;
		call _IFAK;
	};
	// Assistant Automatic Rifleman
	case "aar" : {
		["assistant"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["aar"] call _addRuck;
		["rifle"] call _addAttachments;
		call _IFAK;
	};
	// Rifleman
	case "rm" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["rm"] call _addRuck;
		["rifle"] call _addAttachments;
		call _IFAK;
	};	
	// Rifleman (disposable light AT)
	case "rmat" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["rmat"] call _addRuck;
		["rifle"] call _addAttachments;
		_unit addWeapon _lat;
		call _IFAK;
	};
	// Scoped Rifleman
	case "rmsc" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleScopedMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifleScoped;
		["rmsc"] call _addRuck;
		["riflescoped"] call _addAttachments;
		call _IFAK;
	};
	// Designated Marksman
	case "dmr" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_dmrMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _dmr;
		["dmr"] call _addRuck;
		["dmr"] call _addAttachments;
		call _IFAK;
	};
	// Grenadier
	case "gren" : {
		["gren"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleGLMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addWeapon _rifleGL;
		["gren"] call _addRuck;
		["riflegl"] call _addAttachments;
		call _IFAK;
	};
	// Machinegunner
	case "mmg" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_mmgMag,4];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _mmg;
		["mmg"] call _addRuck;
		["mmg"] call _addAttachments;
		call _IFAK;
	};
	// Assistant Machinegunner
	case "mmgass" : {
		["assistant"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["mmgass"] call _addRuck;
		["rifle"] call _addAttachments;
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
		_unit addMagazines [_smoke,2];
		_unit addWeapon _smg;
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
		_unit addMagazines [_smoke,2];
		_unit addWeapon _smg;
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
		_unit addMagazines [_smoke,2];
		_unit addWeapon _carbine;
		["crew"] call _addRuck;
		["carbine"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// Crewman
	case "crewman" : {
		["crew"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_carbineMag,6];
		_unit addMagazines [_smoke,2];
		_unit addWeapon _carbine;
		["carbine"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
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
		["rifle"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// HMG Assistant
	case "hmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["hmgass"] call _addRuck;
		["rifle"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// GMG Gunner
	case "gmggun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["gmggun"] call _addRuck;
		["rifle"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// GMG Assistant
	case "gmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["gmgass"] call _addRuck;
		["rifle"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
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
		_unit addMagazine _latMag;
		["hat"] call _addRuck;
		["rifle"] call _addAttachments;
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
		_unit addMagazine _latMag;
		["hat"] call _addRuck;
		["rifle"] call _addAttachments;
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
		["rifle"] call _addAttachments;
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
		["aa"] call _addRuck;
		["rifle"] call _addAttachments;
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
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,2];
		_unit addMagazines [_glSmokeTwo,2];
		_unit addWeapon _rifleGL;
		["spotter"] call _addRuck;
		["suppriflegl"] call _addAttachments;
		_unit setVariable ["AGM_IsMedic", true, true];
	};
	// ================================
	// if undefined or incorrectly defined, give hint and assign standard rifleman gear
	default {
		_unit sideChat format ["No or incorrectly defined loadout for unit: %1",_unit];
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addWeapon _rifle;
		["rm"] call _addRuck;
		["rifle"] call _addAttachments;
		call _IFAK;
	};
};

_unit selectWeapon (primaryWeapon _unit);
_unit switchMove "AmovPercMstpSlowWrflDnon";
sleep _delay;
_unit groupChat format ["%1 completed gear assign", name _unit];