// ====================================================================================
//	Author: Simwah
//	Created:   2014-09-14 17:37:16
//	Last Modified by:   Simwah
//	Last Modified time: 2014-10-02 21:44:50
//	File Name: init.sqf
//	Credits: Simwah, Agent
// ====================================================================================

if (!isServer && isNull player) then { isJIP = true; } else { isJIP = false; };
if (!isDedicated) then { waitUntil { !isNull player && isPlayer player }; };

// ====================================================================================
// ====================================================================================
// ================================CONFIGURABLE OPTIONS================================
// ====================================================================================
// ====================================================================================

// ====================================================================================

//	R3 - Gear Scripts Settings - AGeNT's Gear Scripts

agent_var_gear_3GLs = false; // 3GL rounds instead of regular 1GL rounds. This variable is specific to the NATO scripts.
agent_var_gear_underwaterWeapons = true; // divers assigned underwater rifles, if false then same rifle as everyone else.
agent_var_gear_nightGear = false; // night vision goggles and IR strobes equipped
agent_var_gear_scopes = false; // scopes replace regular attachments
agent_var_gear_suppressors = false; // suppressors & SD mags where applicable

// ====================================================================================

// R3 - Briefing Timer/Safe Start

// This timer is triggered at the start of the mission, during which weapons and explosives will cause not damage.
// This is good for enforcing a briefing timer (TvT) and stoping friendly fire during briefings
// This is connected to the mission's parameters, so a value can be set at the beginning of a mission.

// Change the following time to the number of minutes for the Briefing/Safe Start timer
// Set to 0 to disable.

f_param_mission_timer = (paramsArray select 0);

// ====================================================================================

// R3 - Settings for MURK

// See first_group.sqf for the actual trigger condition, middle of the file

first_group = false;
second_group = false;
third_group = false;
fourth_group = false;
fifth_group = false;

//=====================================================================================

// R3 - JIP Menu Option

// Change the assign gear script to the one your are using in the mission.sqm on your units to give JIP users the same loadout.

assignGearScript = compile preprocessfilelinenumbers "scripts\assignGear_US.sqf";

//=====================================================================================

// R3 - Briefing Variable

// Set to true so different sides have different briefings (e.g. in TvTs) or set to false so ALL sides have the same briefing (e.g. Coops).
// Edit relevant briefingSIDE.sqf with your intended SMEAC in the scripts\briefing folder.
// If you've left the 'agent_var_brief_separateBriefings' variable false, use briefingGeneric.sqf.
// If set to true, use the relevant side's scripts.

agent_var_brief_separateBriefings = false;

//=====================================================================================

// ====================================================================================
// ====================================================================================
// ============DO NOT CHANGE ANYTHING BELOW UNLESS YOU KNOW WHAT YOUR DOING============
// ====================================================================================
// ====================================================================================

// R3 - Disable Saving and Auto Saving

enableSaving [false, false];

// ====================================================================================

// R3 - Mute Orders and Reports

enableSentences false;

// ====================================================================================

// R3 - Briefing Timer/Safe Start

[] execVM "scripts\safeStart\f_safeStart.sqf";

// ====================================================================================

// R2 - CO Briefing

// Edit briefing.sqf with your intended SMEAC

[] execVM "briefing.sqf";

//=====================================================================================

// R3 - Dead Cleanup

// [60,0,true] execVM "scripts\cly_removedead.sqf";
// [wait time for men,wait time for vehicles,remove units with gear (optional, default true)] execVM "scripts\cly_removedead.sqf";
// A wait time of 0 prevents that type from being removed.
// Prevent an individual unit from being removed:  this setVariable ["CLY_removedead",false,true]
// Remove an individual unit immediately upon death:  this setVariable ["CLY_removedead",true,true]

[180,0,true] execVM "scripts\cly_removedead.sqf";

//===================================================================================

// R3 - AGM Jamming/Overheating Disable

AGM_Overheating_fnc_overheat = {};

//===================================================================================

// R3 - JIP KitPicker Initialisation

// Gives any JIP player the JIP menu option, whether they join one second into the mission or one hour.
// Works in conjuction with the variables at the very top of this script. 
// Technically shouldn't double up the action. 

if (isJIP) then {
	if (isNil "F3_JIP_reinforcementOptionsAction") then {
		[player] execVM "scripts\kitPicker\f_JIP_addReinforcementOptionsAction.sqf";
	};
};
//===================================================================================