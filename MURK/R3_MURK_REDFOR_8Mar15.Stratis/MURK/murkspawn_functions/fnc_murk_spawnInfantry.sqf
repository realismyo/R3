// This script recreate the deleted infantry with proper waypoints 
// By Murklor (copyright my arse)

_origPosition = _this select 0;
_newgroup = _this select 1;
_AI_varArray = _this select 2;

_AI_unitArray  = _AI_varArray select 0;
_AI_nameArray  = _AI_varArray select 1;
_AI_magArray   = _AI_varArray select 2;
_AI_wepArray   = _AI_varArray select 3;
_AI_skillArray = _AI_varArray select 4;

// Recreate the new group
{ _x createUnit [_origposition, _newgroup]; } forEach _AI_unitArray;

sleep 1;

// Disable move and restock them
_unitsGroup = units _newgroup;
{_x disableAI "MOVE"} forEach _unitsGroup;

for [{ _loop = 0 },{ _loop < count  _unitsGroup},{ _loop = _loop + 1}] do {

	_guy = _unitsGroup select _loop;
	
	//_guy setvehiclevarName (_AI_namearray select _loop);
	
	removeAllWeapons _guy;
	removeAllItems _guy;
	{_guy removeMagazine _x} forEach magazines _guy;
	
	{_guy addMagazine _x} forEach (_AI_magArray select _loop);
	{_guy addWeapon _x}   forEach (_AI_wepArray select _loop);
	_guy selectWeapon (primaryWeapon _guy);
	
	_guy setSkill (_AI_skillArray select _loop);
	
	sleep 0.1;
};

{ _x enableAI "MOVE" } forEach _unitsGroup;

_unitsGroup;