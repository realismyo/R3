#define DLG (uiNamespace getVariable "KitPick_Dlg")
#define COMBO (uiNamespace getVariable "KitPick_Combo")
#define USEBUTTON (uiNamespace getVariable "KitPick_UseBtn")

KitPickInit = {
    uiNamespace setVariable ["KitPick_Dlg", _this select 0];
    uiNamespace setVariable ["KitPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["KitPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";
	
	// Command Roles
	COMBO lbAdd "--Platoon HQ Roles--";
    _idx = COMBO lbAdd "Platoon Commander"; COMBO lbSetData [_idx, "pltld"];
    _idx = COMBO lbAdd "Platoon Sergeant"; COMBO lbSetData [_idx, "pltld"];
    _idx = COMBO lbAdd "Platoon FAC"; COMBO lbSetData [_idx, "pltfac"];
    _idx = COMBO lbAdd "Platoon UAV Operator"; COMBO lbSetData [_idx, "pltuavop"];
    _idx = COMBO lbAdd "Platoon Medic"; COMBO lbSetData [_idx, "pltmed"];
	
	// General Section Roles
    COMBO lbAdd "--Section Roles--";
    _idx = COMBO lbAdd "Section Commander"; COMBO lbSetData [_idx, "secco"];
    _idx = COMBO lbAdd "Team Leader (2iC)"; COMBO lbSetData [_idx, "sectl"];
    _idx = COMBO lbAdd "Automatic Rifleman"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Asst. Automatic Rifleman"; COMBO lbSetData [_idx, "aar"];
	_idx = COMBO lbAdd "Rifleman"; COMBO lbSetData [_idx, "rm"];
    _idx = COMBO lbAdd "Rifleman (AT)"; COMBO lbSetData [_idx, "rmat"];
	_idx = COMBO lbAdd "Grenadier"; COMBO lbSetData [_idx, "gren"];
    _idx = COMBO lbAdd "Machinegunner"; COMBO lbSetData [_idx, "mmg"];
    _idx = COMBO lbAdd "Asst. Machinegunner"; COMBO lbSetData [_idx, "mmgass"];
	
	// Vehicle Crew Roles
    COMBO lbAdd "--Crew Roles--";
    _idx = COMBO lbAdd "Crew Commander"; COMBO lbSetData [_idx, "crewmander"];
    _idx = COMBO lbAdd "Crewman"; COMBO lbSetData [_idx, "crewman"];
    _idx = COMBO lbAdd "Rotary Wing Pilot"; COMBO lbSetData [_idx, "rotarypilot"];
    _idx = COMBO lbAdd "Fixed Wing Pilot"; COMBO lbSetData [_idx, "fixedpilot"];
	
	// CSW and Heavy Weapon Team Roles
    COMBO lbAdd "--Weapons Team Roles--";
    _idx = COMBO lbAdd "HAT Gunner"; COMBO lbSetData [_idx, "hatgun"];
    _idx = COMBO lbAdd "HAT Assistant"; COMBO lbSetData [_idx, "hatammo"];
	_idx = COMBO lbAdd "AA Gunner"; COMBO lbSetData [_idx, "aagun"];
	_idx = COMBO lbAdd "AA Assistant"; COMBO lbSetData [_idx, "aaammo"];
	_idx = COMBO lbAdd "HMG Gunner"; COMBO lbSetData [_idx, "hmggun"];
	_idx = COMBO lbAdd "HMG Assistant"; COMBO lbSetData [_idx, "hmgass"];
	_idx = COMBO lbAdd "GMG Gunner"; COMBO lbSetData [_idx, "gmggun"];
	_idx = COMBO lbAdd "GMG Assistant"; COMBO lbSetData [_idx, "gmgass"];
	
	// Special Roles
	COMBO lbAdd "--Specialist Roles--";
	_idx = COMBO lbAdd "Scoped Rifleman"; COMBO lbSetData [_idx, "rmsc"];
    _idx = COMBO lbAdd "Designated Marksman"; COMBO lbSetData [_idx, "dmr"];
    _idx = COMBO lbAdd "Diver Team Leader"; COMBO lbSetData [_idx, "divertl"];
    _idx = COMBO lbAdd "Diver"; COMBO lbSetData [_idx, "diver"];
	_idx = COMBO lbAdd "Sniper"; COMBO lbSetData [_idx, "sniper"];
    _idx = COMBO lbAdd "Spotter"; COMBO lbSetData [_idx, "spotter"];
    _idx = COMBO lbAdd "Engineer"; COMBO lbSetData [_idx, "engi"];
	
    _sel = player getVariable "KitPicker_Selection";
    if (!isNil '_sel') then {
        COMBO lbSetCurSel _sel;
    };
};

KitPicker_Pick = {
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {};

    closeDialog 0;
    player setVariable ["f_var_JIP_loadout", _data];
    player setVariable ["KitPicker_Selection", _idx];
    f_var_JIP_state = 3;
};

KitPicker_OnSelChanged = {
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
