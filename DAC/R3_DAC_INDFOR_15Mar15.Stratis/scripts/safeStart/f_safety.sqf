// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Exit if server or HC
if (!hasInterface) exitwith {};

_switch = _this select 0;

switch (_switch) do {
	// Turn safety on
	case true:{
		f_safety = player addEventHandler["Fired", {deletevehicle (_this select 6);}];		// Delete bullets from fired weapons
		{ _x allowdamage false; } foreach playableunits;									// Make playable units invincible, clientside
	};
	// Turn safety off
	case false:{
		player removeEventHandler ["Fired", f_safety];		// Allow player to fire weapons
		{ _x allowdamage true; } foreach playableunits;		// Make playable units vulnerable, clientside
	};
};
