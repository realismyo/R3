/*
Briefing Picker Script
By AGeNT
If variable 'agent_var_brief_separateBriefings' is true, runs separate briefing files for different sides
Variable 'agent_var_brief_separateBriefings' is default false
*/

private ["_side"];

// Server and Numpty don't need to deal with this shit
if (!hasInterface) exitWith {};

// Define variable if it doesn't exist - default false
if (isNil "agent_var_brief_separateBriefings") then { agent_var_brief_separateBriefings = false; };

if (agent_var_brief_separateBriefings) then {

	_side = toLower format ["%1", side player];
	
	// BLUFOR Briefing
	if (_side == "west") then { 
		#include "scripts\briefing\briefingBLUFOR.sqf" 
	};
	// OPFOR Briefing
	if (_side == "east") then { 
		#include "scripts\briefing\briefingOPFOR.sqf" 
	};
	// INDFOR Briefing
	if (_side == "guer") then { 
		#include "scripts\briefing\briefingINDFOR.sqf" 
	};
	// Civilian Briefing
	if (_side == "civ") then { 
		#include "scripts\briefing\briefingCIV.sqf" 
	};
} else {
	// ALL SIDES Briefing
	#include "scripts\briefing\briefingGeneric.sqf"
};