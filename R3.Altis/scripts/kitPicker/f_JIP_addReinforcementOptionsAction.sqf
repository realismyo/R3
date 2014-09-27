// F3 - JIP Add Reinforcement Options Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// DECLARE VARIABLES AND FUNCTIONS

private ["_unit"];

// ====================================================================================
// SET KEY VARIABLES

_unit = _this select 0;

// PREVENT THE JIP AI UNITS FROM FOLLOWING THEIR LEADER/MOVING AWAY

_unit disableAI "move";

// ====================================================================================
// ADD REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We add the action to the player's action menu.

if (_unit == player) then {
	if (isNil "F3_JIP_reinforcementOptionsAction") then {
		F3_JIP_reinforcementOptionsAction = player addaction ["<t color='#dddd00'>" + "Select Loadout" + "</t>","scripts\kitPicker\f_JIP_reinforcementOptions.sqf",[],6,true,false,"","_target == player"];
	};
};