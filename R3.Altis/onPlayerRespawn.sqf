// ====================================================================================
//	File: onPlayerRespawn.sqf
//	Last Modified By: Mr. Agnet
// https://community.bistudio.com/wiki/Arma_3_Respawn
// ====================================================================================

[false] call AGM_Core_fnc_disableUserInput;
[player, "AGM_Unconscious", false] call AGM_Interaction_fnc_setCaptivityStatus;
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

[player] execVM "scripts\spectator\specta.sqf";			// Initialise spectating script when player dies.
[player, true] call TFAR_fnc_forceSpectator;			// Force player into TFAR spectator mode
