/* 
Gear Assign Script for Arma 3
by AGeNT

- Covers most standard RIFM platoon roles, if you want to add more just ask me or do so by observation of how the others work.
- Current Loadouts: pltld, pltmed, pltfac, pltuavop, secco, sectl, ar, aar, rm, rmat, rmsc, dm, gren, mmg, mmgass, rotarypilot, fixedpilot, crewmander, crewman, hmggun, hmgass, gmggun, gmgass, hatgun, hatammo, aagun, aaammo, divertl, diver, sniper, spotter
- Adapted for Arma 3, still technically WIP. Report any and all issues to Agent via the forums, steam, ts etc.
- Current Side, Faction: BLUFOR, US

===== Using the Scripts =====
- In their current state, the scripts will not work for AI, simply for testing purposes. In fact a whole different script will be required.
- If called from unit init field, needs to look similar to below, with the desired loadout in ""
- nul = [this,"desiredloadouthere"] execVM "scripts\assignGear_US.sqf";
e.g. - nul = [this,"pltld"] execVM "scripts\assignGear_US.sqf";

- Additional cases can be added below to support additional roles.
- Check the assignGearDefines_FACTION.sqf for defined variables, alter them in that script. 
- The variables at the beginning of this script can influence what gear players will receive, they should be fairly straightforward
=============================
*/ 

private [
"_delay","_unit","_loadout",
"_3GLs","_underwaterWeapons","_nightGear","_scopes","_suppressors"
];

// ==== gear script variables ====
_3GLs = true;						// 3GL rounds instead of regular 1GL rounds. This variable is specific to the NATO scripts.
_underwaterWeapons = true;			// divers assigned underwater rifles, if false then same rifle as everyone else. 
_nightGear = false;					// night vision goggles and IR strobes equipped
_scopes = false;					// scopes replace regular attachments
_suppressors = false;				// suppressors & SD mags where applicable
// ===============================

// variable assignment
_delay = 0.1;
_unit = _this select 0;
_loadout = toLower (_this select 1);

if (!(local _unit)) exitWith {};							// script needs to run on the unit/player's computer. 
if (isMultiplayer && isServer) exitWith {};

#include "assignGearDefines_US.sqf";						// faction specific script with all of the variables

waitUntil {time > 1};										// waits until mission has started

if (_unit != _unit) then { waitUntil {!isNull _unit}; };	// make sure unit exists, or wait until it does
if !(isPlayer _unit) then { {_unit disableAI _x} forEach ["TARGET","AUTOTARGET","MOVE","FSM","ANIM"]; };

if (_plebUniform != "") then { removeUniform _unit; };
if (_goggles != "") then { removeGoggles _unit; };

// gear removal
removeVest _unit;
removeHeadgear _unit;
removeAllItems _unit;
removeAllWeapons _unit; 
removeBackpack _unit;
removeAllAssignedItems _unit;

switch (_loadout) do {									// case switch for desired loadout
	
	// -- Platoon HQ Roles --
	// plt leader gear, doubles as plt sgt
	case "pltld" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _pltTools;
		{ _unit addItem _x } foreach _pltItems;
		_unit addMagazines [_rifleGLMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		if (_3GLs) then {
			_unit addMagazines [_glExplody,2];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		} else {
			_unit addMagazines [_glExplody,5];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		};
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
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
		_unit addMagazines [_smoke,4];
		for "_i" from 1 to 16 do {_unit addItem _medOne};
		for "_i" from 1 to 4 do {_unit addItem _medTwo};
		for "_i" from 1 to 4 do {_unit addItem _medThree};
		_unit addWeapon _rifle;
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
		_unit addMagazines [_rifleGLMag,9];
		_unit addMagazine _designatorBat;
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		if (_3GLs) then {
			_unit addMagazines [_glExplody,2];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		} else {
			_unit addMagazines [_glExplody,3];
			_unit addMagazines [_glSmokeOne,2];
			_unit addMagazines [_glSmokeTwo,2];
		};
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
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
		{ _unit addMagazines [_x,2]; } foreach _facSmokes;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["uavop"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	
	// -- Section Roles --
	// section leader
	case "secco" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_rifleGLMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		if (_3GLs) then {
			_unit addMagazines [_glExplody,2];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		} else {
			_unit addMagazines [_glExplody,5];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		};
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
		["plt"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Section Team Leader / 2iC
	case "sectl" : {
		["leader"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_rifleGLMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_glExplody,5];
		_unit addMagazines [_glSmokeOne,1];
		_unit addMagazines [_glSmokeTwo,1];
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
		["tl"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Automatic Rifleman
	case "ar" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_autoRifleMag,5];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _autoRifle;
		_unit addWeapon _pistol;
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
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["aar"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Rifleman
	case "rm" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["rm"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};	
	// Rifleman (disposable light AT)
	case "rmat" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
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
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleScoped;
		_unit addWeapon _pistol;
		["rmsc"] call _addRuck;
		["scopedgeneral"] call _addAttachments;
		call _IFAK;
	};
	// Designated Marksman
	case "dmr" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_dmrMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _dmr;
		_unit addWeapon _pistol;
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
		if (_3GLs) then {
			_unit addMagazines [_glExplody,2];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		} else {
			_unit addMagazines [_glExplody,5];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		};
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
		["gren"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// Machinegunner
	case "mmg" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_mmgMag,4];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _mmg;
		_unit addWeapon _pistol;
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
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["mmgass"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	
	// -- Vehicle Crews --
	// pilot
	case "rotarypilot" : {
		["rpilot"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_smgMag,6];
		_unit addMagazines [_smoke,2];
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _smg;
		_unit addWeapon _pistol;
		["aircrew"] call _addRuck;
		call _IFAK;
	};
	case "fixedpilot" : {
		["fpilot"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_smgMag,6];
		_unit addMagazines [_smoke,2];
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _smg;
		_unit addWeapon _pistol;
		["aircrew"] call _addRuck;
		call _IFAK;
	};
	// crewmans
	case "crewmander" : {
		["crew"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		{ _unit addItem _x } foreach _secItems;
		_unit addMagazines [_carbineMag,6];
		_unit addMagazines [_smoke,2];
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _carbine;
		_unit addWeapon _pistol;
		["crew"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// crewmans
	case "crewman" : {
		["crew"] call _addClothes;
		call _addBasics;
		{ _unit linkItem _x } foreach _secTools;
		_unit addMagazines [_carbineMag,6];
		_unit addMagazines [_smoke,2];
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _carbine;
		_unit addWeapon _pistol;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};

	// -- Static Weapons Teams --
	// HMG Gunner
	case "hmggun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["hmggun"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// HMG Assistant
	case "hmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["hmgass"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// GMG Gunner
	case "gmggun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["gmggun"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	// GMG Assistant
	case "gmgass" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["gmgass"] call _addRuck;
		["general"] call _addAttachments;
		for "_i" from 1 to 4 do {_unit addMagazine _medOne};
		for "_i" from 1 to 2 do {_unit addMagazine _medTwo};
	};
	
	// -- Launcher Teams --
	// HAT Gunner
	case "hatgun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		_unit addMagazine _latMag;
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
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		_unit addMagazine _latMag;
		["hat"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	// AA Gunner
	case "aagun" : {
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
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
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["aa"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
	
	// -- Extra Roles --
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
		["diver"] call _addRuck;
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
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _boltRifle;
		_unit addWeapon _pistol;
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
		if (_3GLs) then {
			_unit addMagazines [_glExplody,2];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		} else {
			_unit addMagazines [_glExplody,5];
			_unit addMagazines [_glSmokeOne,1];
			_unit addMagazines [_glSmokeTwo,1];
		};
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifleGL;
		_unit addWeapon _pistol;
		["spotter"] call _addRuck;
		["suppgeneral"] call _addAttachments;
		_unit setVariable ["AGM_IsMedic", true, true];
	};
	
	// if undefined or incorrectly defined, give hint and assign standard rifleman gear
	default {
		_unit sideChat format ["No or incorrectly defined loadout for unit: %1",_unit];
		["pleb"] call _addClothes;
		call _addBasics;
		_unit addMagazines [_rifleMag,9];
		{ _unit addMagazines [_x,2]; } foreach _throwG;
		_unit addMagazines [_pistolMag,2];
		_unit addWeapon _rifle;
		_unit addWeapon _pistol;
		["rm"] call _addRuck;
		["general"] call _addAttachments;
		call _IFAK;
	};
};

_unit selectWeapon (primaryWeapon _unit);
_unit switchMove "AmovPercMstpSlowWrflDnon";
sleep _delay;
_unit GroupChat format ["%1 completed gear assign", name _unit];