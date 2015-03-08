// F3 - JIP Add Reinforcement Options Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// DECLARE VARIABLES AND FUNCTIONS

private ["_unit"];

// ====================================================================================
// SET KEY VARIABLES

_unit = _this select 0;
waitUntil {time > 1};																			
if (_unit != _unit) then { waitUntil { !isNull _unit; }; };
if (!isDedicated && isMultiplayer) then { waitUntil { !isNull _unit && isPlayer _unit; }; };

// ====================================================================================
// ADD REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We add the action to the player's action menu.

if (_unit == player) then {
	if (isNil "F3_JIP_reinforcementOptionsAction") then {
		F3_JIP_reinforcementOptionsAction = player addaction ["<t color='#dddd00'>" + "Select Loadout" + "</t>","scripts\kitPicker\f_JIP_reinforcementOptions.sqf",[],6,true,false,"","_target == player"];
	};
};