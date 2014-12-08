// This script borrows some stuff from Norrins AI respawn script, so thanks to him for lessening my pain
// -----------------------------------------------------------------------------------------------------
// !!!THIS SCRIPT USES THE BIS FUNCTION MODULE!!! Be sure to have one
//
// A NOTE ON THE LIMITATIONS OF THIS SCRIPT: It does not save vehicle name, so dont use them for complicated stuff... Or edit the script to save it.
// The purpose of this script is to create easily manageable AI units for triggered "missions". Such as if you want an ambush to take place in a town, you 
// place the units like usual with the ordinary waypoints, add the proper init and place a trigger that set the "mission" to true. Units will be created and go about their buisness. 
//
// V2
// - Added types of spawns: "once", "repeated", "wave" and "reset"
// - Cleaned up the script to make use of functions, much shorter group scripts this way and easier to add new modes
// - Can now be used on flying vehicles 
// - Made use of define to set the global trigger variable, easier user editing
// - Made use of BIS functions, can now recreate groups of vehicles instead of just one (much less scripts running)
// - Removed the need for a vehicle boolean
//
// V1
// - First basic script, place units in the editor and link to a spawn trigger
//------------------------------------------------------------------------------------------------------
// General usage (init): nul = [this,"SPAWNTYPE",LIVES,DELAY] execVM "SCRIPT_GROUP_NAME.sqf";
// Example: nul = [this,"once"] execVM "murk\spawn_groups\fifth_group.sqf"; ---- Will spawn the editor unit based on the trigger in fifth_group script
// Example: nul = [this,"repeated",4,30] execVM "murk\spawn_groups\fifth_group.sqf"; ---- Will spawn the editor unit based on the trigger in fifth_group script, then respawn it 4 times with a 30 second delay upon death
// Example: nul = [this,"wave",5,60] execVM "murk\spawn_groups\fifth_group.sqf"; ---- Will spawn the editor unit once based on the trigger in fifth_group script, then respawn the entire group (regardless of deaths) 5 times 60 seconds between
// Example: nul = [this,"reset",5] execVM "murk\spawn_groups\fifth_group.sqf"; ---- Will spawn the editor unit once based on the trigger in fifth_group script, then reset the trigger after a preset time (20 seconds default). The unit will be created when trigger is true again, maximum number of lives.
// -----------------------------------------------------------------------------------------------------

// Let players enter the mission.
waitUntil {time > 1};	
if (isMultiplayer && isNull Numpty) then { waitUntil { !isNull Numpty; }; };
if (player != Numpty) exitWith {};

// CHANGE THIS TRIGGER
#define SPAWN_TRIGGER_VARIABLE fifth_group
// CHANGE THIS TRIGGER

#ifndef MURK_SPAWN_RUNONCE
fnc_murk_deleteInfantry = compile preprocessFileLineNumbers "MURK\murkspawn_functions\fnc_murk_deleteInfantry.sqf";
fnc_murk_spawnInfantry = compile preprocessFileLineNumbers "MURK\murkspawn_functions\fnc_murk_spawnInfantry.sqf";
fnc_murk_deleteVehicle = compile preprocessFileLineNumbers "MURK\murkspawn_functions\fnc_murk_deleteVehicle.sqf";
fnc_murk_spawnVehicle = compile preprocessFileLineNumbers "MURK\murkspawn_functions\fnc_murk_spawnVehicle.sqf";
#endif
#define MURK_SPAWN_RUNONCE

#define WAITING_PERIOD 10
#define RESET_WAIT 20

_unit = _this select 0;
_spawntype = _this select 1;
_spawnlives = _this select 2;
_spawndelay = _this select 3;

// Check if its a vehicle
_vehicle = false;
_sim = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "simulation");
if (_sim in ["airplane","helicopter","car","motorcycle","tank","APC"]) then { _vehicle = true; };

// AI variables
_AI_varArray = [];
_origposition = getPos _unit;
_origdir = getDir _unit;
_origside = side _unit;
_unitsGroup = [];

// Create a dummy group and copy the editor created waypoints to this group
_newgroup = createGroup (side _unit);
_newgroup copyWaypoints (group _unit);

// This deletes the units, either infantry or vehicles
if (_vehicle) then { _AI_varArray = [_unit] call fnc_murk_deleteVehicle; }
else { _AI_varArray = [_unit] call fnc_murk_deleteInfantry; };

//------------------------------------------------------------------------
// Put the script on hold until the mission is active
while { !SPAWN_TRIGGER_VARIABLE } do {
	sleep WAITING_PERIOD;
};
//------------------------------------------------------------------------

// REPEAT MODE, ie basic respawn based on lives
if (_spawntype == "repeated") then {
	
	while { _spawnlives > 0 } do {
	
		_oldGroup = _newgroup;
		
		if(_vehicle) then { _unitsGroup = [_newgroup,_AI_varArray] call fnc_murk_spawnVehicle; }
		else { _unitsGroup = [_origPosition,_newGroup,_AI_varArray] call fnc_murk_spawnInfantry; };
		
		// This sleeps while the group still lives	
		while {(count _unitsGroup) > 0} do
		{	
			_remainingUnits = [];
			{if (alive _x) then {_remainingUnits = _remainingUnits + [_x]}} forEach _unitsGroup;
			_unitsGroup = _remainingUnits;
			sleep 2;
		};
	
		_spawnlives = _spawnlives - 1;
	
		sleep _spawndelay;
		
		_newgroup = createGroup _origside;
		_newgroup copyWaypoints _oldgroup;
	};
};

// WAVE MODE, this is fairly simple, just sleep a while then respawn. Spawnlives in this case is number of waves
if (_spawntype == "wave") then {
	
	while { _spawnlives > 0 } do {
		
		_oldGroup = _newGroup;
		
		if(_vehicle) then { _unitsGroup = [_newgroup,_AI_varArray] call fnc_murk_spawnVehicle; }
		else { _unitsGroup = [_origPosition,_newGroup,_AI_varArray] call fnc_murk_spawnInfantry; };	
		
		sleep _spawndelay;
		
		_spawnlives = _spawnlives - 1;
		
		_newgroup = createGroup _origside;
		_newgroup copyWaypoints _oldgroup;
	};
};

// RESET MODE, sleep a while then set the variable to false (even if you set it like 50 times over). Spawn lives is used to tick how many times its possible to reset.
if (_spawntype == "reset") then {
	
	while { _spawnlives > 0 } do {
		_oldGroup = _newGroup;

		if(_vehicle) then { _unitsGroup = [_newgroup,_AI_varArray] call fnc_murk_spawnVehicle; }
		else { _unitsGroup = [_origPosition,_newGroup,_AI_varArray] call fnc_murk_spawnInfantry; };
		sleep RESET_WAIT;
		SPAWN_TRIGGER_VARIABLE = false;
		
		while { !SPAWN_TRIGGER_VARIABLE } do {
			sleep WAITING_PERIOD;
		};
		
		_spawnlives = _spawnlives - 1;
		
		_newgroup = createGroup _origside;
		_newgroup copyWaypoints _oldgroup;
	};
};

// ONCE MODE
if (_spawntype == "once") then { 
	if(_vehicle) then { _unitsGroup = [_newGroup,_AI_varArray] call fnc_murk_spawnVehicle; }
	else { _unitsGroup = [_origPosition,_newGroup,_AI_varArray] call fnc_murk_spawnInfantry; };
};