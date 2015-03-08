#define DLG (uiNamespace getVariable "CratePicker_Dlg")
#define COMBO (uiNamespace getVariable "CratePicker_Combo")
#define USEBUTTON (uiNamespace getVariable "CratePicker_UseBtn")

r_initCratePicker = {
    uiNamespace setVariable ["CratePicker_Dlg", _this select 0];
    uiNamespace setVariable ["CratePicker_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["CratePicker_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";
    COMBO lbAdd "--Ammo Supply Crates--";
    _idx = COMBO lbAdd "HQ Supply"; COMBO lbSetData [_idx, "hqammo"];
    _idx = COMBO lbAdd "Section Supply"; COMBO lbSetData [_idx, "sectionammo"];
	_idx = COMBO lbAdd "Rifle Ammo"; COMBO lbSetData [_idx, "rifleammo"];
    _idx = COMBO lbAdd "GL Ammo"; COMBO lbSetData [_idx, "glammo"];
    _idx = COMBO lbAdd "AR Ammo"; COMBO lbSetData [_idx, "arammo"];
    _idx = COMBO lbAdd "MMG Ammo"; COMBO lbSetData [_idx, "mmgammo"];
    _idx = COMBO lbAdd "LAT Ammo"; COMBO lbSetData [_idx, "latammo"];
    _idx = COMBO lbAdd "HAT Ammo"; COMBO lbSetData [_idx, "hatammo"];
    _idx = COMBO lbAdd "AA Ammo"; COMBO lbSetData [_idx, "aaammo"];
	COMBO lbAdd "--Medical Supply Crates--";
    _idx = COMBO lbAdd "HQ Meds"; COMBO lbSetData [_idx, "hqmeds"];
    _idx = COMBO lbAdd "Section Meds"; COMBO lbSetData [_idx, "secmeds"];
    COMBO lbAdd "--Weapons Crates--";
	_idx = COMBO lbAdd "Marskman Crate"; COMBO lbSetData [_idx, "marskmancrate"];
	_idx = COMBO lbAdd "Sniper Team"; COMBO lbSetData [_idx, "snipercrate"];
	_idx = COMBO lbAdd "LAT Crate"; COMBO lbSetData [_idx, "latcrate"];
    _idx = COMBO lbAdd "HAT Team"; COMBO lbSetData [_idx, "hatteam"];
    _idx = COMBO lbAdd "Diver Pair"; COMBO lbSetData [_idx, "diverpair"];
    _idx = COMBO lbAdd "HMG Weapon"; COMBO lbSetData [_idx, "hmgweapon"];
    _idx = COMBO lbAdd "HMG Tripod"; COMBO lbSetData [_idx, "hmgtripod"];
    _idx = COMBO lbAdd "GMG Weapon"; COMBO lbSetData [_idx, "gmgweapon"];
    _idx = COMBO lbAdd "GMG Tripod"; COMBO lbSetData [_idx, "gmgtripod"];
	COMBO lbAdd "--Tool Crates--";
	_idx = COMBO lbAdd "HQ Tools"; COMBO lbSetData [_idx, "hqtools"];
	_idx = COMBO lbAdd "Section Tools"; COMBO lbSetData [_idx, "sectiontools"];
	_idx = COMBO lbAdd "Night Visions"; COMBO lbSetData [_idx, "nightvisions"];
	_idx = COMBO lbAdd "Night Gear"; COMBO lbSetData [_idx, "nightgear"];
};

r_spawnSelectedCrate = {
    private ["_idx","_data"];
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {};

	_location = player modelToWorld [1,0,0];
	_box = "Box_NATO_Wps_F" createVehicle _location;
	
    closeDialog 0;
	[0, {
		private ["_s","_b"];
		_s = _this select 0;
		_b = _this select 1;
		[_b,_s] execVM "scripts\cratePicker_supplyCrates.sqf";
	}, [_data,_box]] call CBA_fnc_globalExecute;
};

r_cratePicker_OnSelChanged = {
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
