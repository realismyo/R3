/* 
Crate Filler Script
by AGeNT

- Designed to fill ammoboxes.
- Current Selections: hqammo, sectionammo, rifleammo, glammo, mmgammo, latammo, hatammo, aaammo, hqmeds, secmeds, marskmancrate, latcrate, hatteam, diverpair, hmgtripod, hmgweapon, gmgtripod, gmgweapon, hqtools, sectiontools, nightvisions, nightgear
- Is the only cratePicker script not in the cratePicker folder.
*/ 

// define variables
private [
"_3GLs","_nightGear","_scopes","_suppressors","_camoPattern","_underwaterWeapons","_flashbangs",
"_crate","_selection"];

if (!isServer) exitWith {};

// ==== all gear script variables, just to prevent null issues. ====
_3GLs = false;						// 3GL rounds instead of regular 1GL rounds.
_nightGear = false;					// night vision goggles and IR strobes equipped.
_scopes = false;					// scopes replace regular attachments.
_suppressors = false;				// suppressors & SD mags where applicable.
_camoPattern = "woodland";			// Camo pattern for forces. Default: "woodland". Available cases: "woodland", "desert", "moutwood", "moutdes". Requires lower case string value.
_underwaterWeapons = true;			// divers assigned underwater rifles, if false then same rifle as everyone else. 
_flashbangs = 0;					// amount of flashbangs, integer required. Set to 0 for none. Set to something >0 for however many flashabangs you want to give people. wow. 
// =================================================================

#include "assignGearDefines_NATO.sqf";	// alter to include whichever assignGearDefines you want to use.

// assign crate variables.
_crate = _this select 0;
_selection = toLower(_this select 1);

if (_crate != _crate) then { waitUntil { !isNull _crate; }; };

// clear crate cargo
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearItemCargoGlobal _crate;

switch (_selection) do {

	// ===== Ammo only Crates =====
	case "hqammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,30];
		_crate addMagazineCargoGlobal [_grenade,8];
		_crate addMagazineCargoGlobal [_smoke,8];
		_crate addMagazineCargoGlobal [_glExplody,12];
		_crate addMagazineCargoGlobal [_glSmokeOne,4];
		_crate addMagazineCargoGlobal [_glSmokeTwo,4];
		_crate addMagazineCargoGlobal [_designatorBat,2];
		_crate addItemCargoGlobal [_medOne,4];
		_crate addItemCargoGlobal [_medTwo,2];
	};
	case "sectionammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,40];
		_crate addMagazineCargoGlobal [_autoRifleMag,4];
		_crate addMagazineCargoGlobal [_grenade,8];
		_crate addMagazineCargoGlobal [_smoke,8];
		_crate addMagazineCargoGlobal [_glExplody,12];
		_crate addMagazineCargoGlobal [_glSmokeOne,4];
		_crate addMagazineCargoGlobal [_glSmokeTwo,4];
		_crate addMagazineCargoGlobal [_designatorBat,2];
		_crate addItemCargoGlobal [_medOne,4];
		_crate addItemCargoGlobal [_medTwo,2];
	};
	case "rifleammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,40];
		_crate addMagazineCargoGlobal [_grenade,8];
		_crate addMagazineCargoGlobal [_smoke,8];
	};
	case "glammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,20];
		_crate addMagazineCargoGlobal [_glExplody,16];
		_crate addMagazineCargoGlobal [_glSmokeOne,6];
		_crate addMagazineCargoGlobal [_glSmokeTwo,6];
	};
	case "arammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,16];
		_crate addMagazineCargoGlobal [_autoRifleMag,4];
		_crate addMagazineCargoGlobal [_grenade,4];
		_crate addMagazineCargoGlobal [_smoke,4];
	};
	case "mmgammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,16];
		_crate addMagazineCargoGlobal [_mmgMag,4];
		_crate addMagazineCargoGlobal [_grenade,4];
		_crate addMagazineCargoGlobal [_smoke,4];
	};
	case "latammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,8];
		_crate addMagazineCargoGlobal [_latMag,4];
	};
	case "hatammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,8];
		_crate addMagazineCargoGlobal [_hatMag,4];
	};
	case "aaammo" : {
		_crate addMagazineCargoGlobal [_rifleMag,8];
		_crate addMagazineCargoGlobal [_aaMag,4];
	};
	
	// ===== Medical Supplies =====
	case "hqmeds" : {
		_crate addItemCargoGlobal [_medThree,16];
		_crate addItemCargoGlobal [_medTwo,16];
		_crate addItemCargoGlobal [_medOne,20];
		_crate addItemCargoGlobal [_medFour,6];
	};
	case "secmeds" : {
		_crate addItemCargoGlobal [_medOne,16];
		_crate addItemCargoGlobal [_medTwo,8];
	};
	
	// ===== Weapons Teams =====
	case "marskmancrate" : {
		_crate addWeaponCargoGlobal [_rifleScoped,1];
		_crate addWeaponCargoGlobal [_rangeFinder,1];
		_crate addMagazineCargoGlobal [_rifleScopedMag,20];
		{ _crate addItemCargoGlobal [_x ,1]; } forEach _sniperItems;
		{ _crate addItemCargoGlobal [_x ,1]; } forEach _scoped_rifleAttachments;
	};
	case "snipercrate" : {
		_crate addWeaponCargoGlobal [_boltRifle,1];
		_crate addWeaponCargoGlobal [_designator,1];
		_crate addMagazineCargoGlobal [_designatorBat,2];
		_crate addMagazineCargoGlobal [_boltRifleMag,10];
		{ _crate addItemCargoGlobal [_x,1]; } forEach _sniperItems;
		{ _crate addItemCargoGlobal [_x,1]; } forEach _sniperAttachments;
		_crate addItemCargoGlobal [_radioRuck,2];
		{ _crate addItemCargoGlobal [_x,2]; } forEach _secTools;
		{ _crate addItemCargoGlobal [_x,2]; } forEach _secItems;
	};
	case "latcrate" : {
		_crate addWeaponCargoGlobal [_lat,1];
		_crate addWeaponCargoGlobal [_designator,1];
		_crate addMagazineCargoGlobal [_designatorBat,2];
		_crate addMagazineCargoGlobal [_latMag,4];
	};
	case "hatteam" : {
		_crate addWeaponCargoGlobal [_hatLaunch,1];
		_crate addWeaponCargoGlobal [_designator,1];
		_crate addMagazineCargoGlobal [_designatorBat,2];
		_crate addMagazineCargoGlobal [_hatMag,2];
	};
	case "diverpair" : {
		_crate addWeaponCargoGlobal [_rifleDiver,2];
		_crate addMagazineCargoGlobal [_rifleDiverMagOne,20];
		_crate addMagazineCargoGlobal [_rifleDiverMagTwo,20];
		_crate addMagazineCargoGlobal [_grenade,8];
		_crate addMagazineCargoGlobal [_smoke,8];
		_crate addItemCargoGlobal [_diverUniform,2];
		_crate addItemCargoGlobal [_diverVest,2];
		_crate addBackpackCargoGlobal [_diverRadioRuck ,1];
		_crate addBackpackCargoGlobal [_diverRuck ,1];
		{ _crate addItemCargoGlobal [_x ,2]; } forEach _basicTools;
		{ _crate addItemCargoGlobal [_x ,2]; } forEach _basicItems;
		{ _crate addItemCargoGlobal [_x,2]; } forEach _secTools;
		{ _crate addItemCargoGlobal [_x,2]; } forEach _secItems;
	};
	
	// ====== Heavy Weapons Teams =====
	case "hmgtripod" : {
		_crate addBackpackCargoGlobal [_hmgBarrel,1];
	};
	case "hmgweapon" : {
		_crate addBackpackCargoGlobal [_hmgTripod,1];
	};
	case "gmgtripod" : {
		_crate addBackpackCargoGlobal [_gmgTripod,1];
	};
	case "gmgweapon" : {
		_crate addBackpackCargoGlobal [_gmgBarrel,1];
	};
	
	// ===== Tools =====
	case "hqtools" : {
		{ _crate addItemCargoGlobal [_x ,8]; } forEach _basicTools;
		{ _crate addItemCargoGlobal [_x ,8]; } forEach _basicItems;
		{ _crate addItemCargoGlobal [_x ,5]; } forEach _pltTools;
		{ _crate addItemCargoGlobal [_x ,5]; } forEach _pltItems;
		_crate addBackpackCargoGlobal [_radioRuck ,4];
		_crate addBackpackCargoGlobal [_airRadioRuck ,2];
	};
	case "sectiontools" : {
		{ _crate addItemCargoGlobal [_x,8]; } forEach _basicTools;
		{ _crate addItemCargoGlobal [_x,8]; } forEach _basicItems;
		_crate addBackpackCargoGlobal [_radioRuck,2];
		_crate addItemCargoGlobal [_binos,4];
	};
	case "nightvisions" : {
		_crate addItemCargoGlobal [_nightVision,8];
	};
	case "nightgear" : {
		_crate addMagazineCargoGlobal [_glFlareOne,10];
		_crate addMagazineCargoGlobal [_glFlareTwo,10];
		_crate addMagazineCargoGlobal [_chemlightOne,10];
		_crate addMagazineCargoGlobal [_chemlightTwo,10];
	};
};