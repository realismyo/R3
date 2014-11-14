// F3 - Safe Start, Server Loop Notification
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Run the hint on all clients
if (!isDedicated) then {

	// Display hint while timer is active
	while {pv_mission_timer > 0} do {
		["SafeStart",[format["Weapons are on Safe<br/>Time Remaining: %1 min",pv_mission_timer]]] call bis_fnc_showNotification;
		if (pv_mission_timer == 0) exitWith {};
 		sleep 60;
	};

	// Display notification when the mission starts
	["SafeStartMissionStarting",["Start Timer Ending Now!"]] call bis_fnc_showNotification;
};