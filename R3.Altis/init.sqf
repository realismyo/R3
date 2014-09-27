// ====================================================================================
// Wow lets wait until the player is in the game, but set them to JIP if necessary.

if (!isServer && isNull player) then { isJIP = true; } else { isJIP = false; };
if (!isDedicated) then { waitUntil { !isNull player && isPlayer player }; };

// ====================================================================================
// ============================== CONFIGURABLE VARIABLES ==============================
// ====================================================================================
// R3 - Briefing Timer/Safe Start
// This timer is triggered at the start of the mission, during which weapons and explosives will cause not damage.
// This is good for enforcing a briefing timer (TvT) and/or stopping friendly fire during briefings.
// This is connected to the mission's parameters, so a value can be set at the beginning of a mission.
// Can set it to 0 here to disable completely.

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

f_fnc_assignGear = compile preprocessfilelinenumbers "scripts\assignGear_US.sqf";

//=====================================================================================
// R3 - Briefing Variable
// Set to true so different sides have different briefings (e.g. in TvTs) or set to false so ALL sides have the same briefing (e.g. Coops).

agent_var_brief_separateBriefings = false;

//=====================================================================================
// R3 - AGM Jamming/Overheating Disable
// Fuck that. Until they rework it, I'd say leave this line in. Bit of a brutish way of doing it.

AGM_Overheating_fnc_overheat = {};

// ====================================================================================
// =========== DO NOT CHANGE ANYTHING BELOW UNLESS YOU KNOW WHAT YOU'RE DOING =========
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
// R3 - Briefing Scripts
// Edit relevant briefingSIDE.sqf with your intended SMEAC.
// If you've left the 'agent_var_brief_separateBriefings' variable false, use briefingGeneric.sqf.
// If set to true, use the relevant side's scripts.

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