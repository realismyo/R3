// F3 - JIP Reinforcement Options
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction","_grp","_joinDistance","_loadout"];

// ====================================================================================
// ALLOW PLAYER TO SELECT LOADOUT
// Using a dialog we allow the player to select the loadout s/he requires.

f_var_JIP_state = 2;

["JIP",["Select your gear kit."]] call BIS_fnc_showNotification;

createDialog "KitPicker";
waitUntil {f_var_JIP_state == 3};
_loadout = (player getVariable "f_var_JIP_loadout");
[player,_loadout] call r_fnc_assignGear;

// ====================================================================================
// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F3_JIP_reinforcementOptionsAction;
F3_JIP_reinforcementOptionsAction = nil;
[player] joinSilent grpNull;