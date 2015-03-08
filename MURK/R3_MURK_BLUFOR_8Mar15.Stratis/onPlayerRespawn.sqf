// ====================================================================================
//	File: onPlayerRespawn.sqf
//	Last Modified By: Mr. Agnet
// https://community.bistudio.com/wiki/Arma_3_Respawn
// ====================================================================================

// Spectator Variable
r_var_isSpectating = false;

// Reset AGM Variables
[false] call AGM_Core_fnc_disableUserInput;
[player, "AGM_Unconscious", false] call AGM_Interaction_fnc_setCaptivityStatus;

// Reset AGM Variables
player setVariable ["AGM_Diagnosed", false, true];
player setVariable ["AGM_CanTreat", true, false];
player setVariable ["AGM_Treatable", true, true];
player setVariable ["AGM_Blood", 1, true];
player setVariable ["AGM_Bleeding", false, true];
player setVariable ["AGM_Painkiller", 1, true];
player setVariable ["AGM_Pain", 0, true];
player setVariable ["AGM_InPain", false, true];
player setVariable ["AGM_NoLegs", false, true];
player setVariable ["AGM_NoArms", false, true];
player setVariable ["AGM_Unconscious", false, true];
player setVariable ["AGM_Overdosing", false];
player setVariable ["AGM_Dragging", objNull];
player setVariable ["AGM_Carrying", objNull];

// Move that pesky seagull the fuck elsewhere
(_this select 0) setPos [0,0,2];

// Force player into TFAR spectator mode
[player, true] call TFAR_fnc_forceSpectator;
	
// Enter spectating script
[player] execVM "scripts\spectator\enterSpectator.sqf";			
	
// Add Eventhandler to allow player to re-enter spectator
disableSerialization;
spectator_onKeyPressed = compile preprocessFile "scripts\spectator\specta_keyPressed.sqf";
_display = (findDisplay 46);
spectator_EH_keyPressed = _display displayAddEventHandler ["KeyDown","_this call spectator_onKeyPressed"];
