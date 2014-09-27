// F3 - Safe Start, Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// Make sure the component only starts after the mission has initialized
sleep 0.1;

// Have the server setup the variables and pv for JIPs
if (isServer) then {
	pv_mission_timer = f_param_mission_timer;
	publicVariable "pv_mission_timer";
};

// ====================================================================================
//wait until server has initialized pv_mission_timer OR f_param_mission_timer was not set

waituntil {sleep 3; ((!isNil "pv_mission_timer") || (f_param_mission_timer == 0));};

// ====================================================================================
// JIP clients are sent PVs before can init.sqf can process
if (pv_mission_timer > 0) then {

	// Start Mission Timer, Mission Timer Hint, turn on invincibility
	[] execVM "scripts\safeStart\f_safeStartLoop.sqf";
	[] execVM "scripts\safeStart\f_safeStartHint.sqf";
	[true] execVM "scripts\safeStart\f_safety.sqf";

	// Wait until timer hits 0, turn invincibility off
	waituntil {sleep 10; pv_mission_timer == 0};
	[false] execVM "scripts\safeStart\f_safety.sqf";
};
