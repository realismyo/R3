// ====================================================================================
//	File: init.sqf
//	Last Modified By: Mr. Agnet
// https://community.bistudio.com/wiki/init.sqf
// ====================================================================================
// JIP Variable
// If player joins after map screen, this variable will be true, otherwise, false.

if (hasInterface && isNull player) then { r_isJIP = true; } else { r_isJIP = false; };

// ====================================================================================

if (hasInterface) then { waitUntil { !isNull player && isPlayer player }; };

// ====================================================================================
// =============================== CONFIGURABLE VARIABLES =============================
// ====================================================================================
// Briefing Timer/Safe Start
// This timer is triggered at the start of the mission, during which weapons and explosives will cause not damage.
// This is good for enforcing a briefing timer (TvT) and/or stopping friendly fire during briefings.
// This is connected to the mission's parameters, so a value can be set during the lobby period of a mission.
// Can set it to equal 0 here to disable completely.

r_param_mission_timer = (["SafeStart_Timer",0] call BIS_fnc_GetParamValue);

//=====================================================================================
// JIP Menu Script
// Needs to be changed to the respective gear script you are using, so JIP players can have the same gear as other players.

r_fnc_assignGear = compile preprocessfilelinenumbers "scripts\assignGear_CSAT.sqf";

//=====================================================================================
// Briefing Variable
// Set to true so different sides have different briefings (e.g. in TvTs) or set to false so ALL sides have the same briefing (e.g. Coops).
// Edit relevant briefingSIDE.sqf with your intended SMEAC in the scripts\briefing folder.
// If you've left the 'r_var_brief_separateBriefings' variable false, use briefingGeneric.sqf.
// If set to true, use the relevant side's scripts.

r_var_brief_separateBriefings = false;

//=====================================================================================
// Plank Variable
// Set to true to enable Plank Fortification scripts.
// When true, the script assigns each player unit a selection of fortifications to place.

r_var_plankForts = false;

// ====================================================================================
// ========================== SCRIPTS AND FUNCTIONS ===================================
// ====================================================================================
// Disable Saving and Auto Saving

enableSaving [false, false];

// ====================================================================================
// Mute Orders and Reports

enableSentences false;

//===================================================================================
// AGM Jamming/Overheating Disable

AGM_Overheating_fnc_overheat = {};

//===================================================================================
// CLY remvoveDead disable for players

if (hasInterface) then { player setVariable ["CLY_removedead",false,true]; };

// ====================================================================================
// Briefing Timer/Safe Start

[] execVM "scripts\safeStart\f_safeStart.sqf";

// ====================================================================================
// Briefing Scripts
// Edit relevant briefingSIDE.sqf with your intended SMEAC.
// If you've left the 'r_var_brief_separateBriefings' variable false, use briefingGeneric.sqf.
// If set to true, use the relevant side's scripts.

[] execVM "r_briefing.sqf";

// ====================================================================================
// Plank Initialisation Script
// If you've set the 'r_var_brief_separateBriefings' variable true, this will assign players their relevant fortification actions.

[] execVM "r_plank.sqf";

//=====================================================================================
// Dead Cleanup
// [60,0,true] execVM "scripts\cly_removedead.sqf";
// [wait time for men,wait time for vehicles,remove units with gear (optional, default true)] execVM "scripts\cly_removedead.sqf";
// A wait time of 0 prevents that type from being removed.
// Prevent an individual unit from being removed:  this setVariable ["CLY_removedead",false,true]
// Remove an individual unit immediately upon death:  this setVariable ["CLY_removedead",true,true]

[180,0,true] execVM "scripts\cly_removeDead.sqf";

//===================================================================================
// JIP KitPicker Initialisation
// Gives any JIP player the JIP menu option, whether they join one second into the mission or one hour.
// Works in conjuction with the variable 'r_fnc_assignGear'.
// Technically shouldn't double up the action. 

if (r_isJIP) then {
	if (isNil "F3_JIP_reinforcementOptionsAction") then {
		[player] execVM "scripts\kitPicker\f_JIP_addReinforcementOptionsAction.sqf";
	};
};

//===================================================================================