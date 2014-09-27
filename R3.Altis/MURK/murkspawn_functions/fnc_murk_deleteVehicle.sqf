// This script delete the editor placed vehicles while saving the data, so that they can be remade on command 
// By Murklor (copyright my arse)

_unit = _this select 0;

_vehiclesGroup = [];

_allvclUnits = units (group _unit);

_origdir = getDir _unit;

// AI variables for vechicles
_AI_vclposArray = [];
_AI_vcltypeArray = [];
_AI_vclskillArray = [];
_AI_vclnameArray = [];

// Save the vehicle types, crew and positions for the group
{
	_vcl = vehicle _x;
	if (!(_vcl in _vehiclesGroup) AND (typeOf _vcl != "")) then {
		_crew = crew _vcl;
		_AI_vcltypearray = _AI_vcltypearray + [typeOf _vcl]; 
		_AI_vclposarray = _AI_vclposarray + [getPos _vcl];
		_AI_vclskillArray = _AI_vclskillArray + [skill _vcl];
		_AI_vclnamearray = _AI_vclnamearray + [vehiclevarName _vcl];
		_vehiclesgroup = _vehiclesgroup + [_vcl];
		// Delete the crew and vehicle
		{ 
			deleteVehicle _x;
		} forEach _crew;
		deleteVehicle _vcl;
	};
	sleep 0.01;
} forEach _allvclUnits;

_AI_varArray = [_AI_vcltypearray,_AI_vclnamearray,_AI_vclposarray,_AI_vclskillarray,_origDir];

// Test to read the entire array
//hint format ["Vehicles: %1\nName: %2",_AI_vararray select 0,_AI_vararray select 1]; sleep 1;

_AI_varArray;