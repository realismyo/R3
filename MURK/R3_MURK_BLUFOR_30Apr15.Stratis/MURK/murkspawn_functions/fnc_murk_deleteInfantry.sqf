// This script delete the infantry and save it for recreation
// By Murklor (copyright my arse)

_unit = _this select 0;

_unitsGroup = units (group _unit);
	
_AI_unitArray  = [];
_AI_nameArray  = [];
_AI_magArray   = [];
_AI_wepArray   = [];
_AI_skillArray = [];

// Gather the infantry info
{
	_AI_unitArray = _AI_unitArray + [typeOf _x];
	_AI_nameArray = _AI_nameArray + [vehiclevarname _x];
 	_AI_magArray = _AI_magArray + [(magazines _x)];
 	_AI_wepArray = _AI_wepArray + [(weapons _x)];
 	_AI_skillArray = _AI_skillArray + [skill _x]
} forEach _unitsGroup;

// Delete all units
{ deleteVehicle _x; } forEach _unitsGroup;

_AI_varArray = [_AI_unitArray,_AI_nameArray,_AI_magArray,_AI_wepArray,_AI_skillArray];

_AI_varArray;