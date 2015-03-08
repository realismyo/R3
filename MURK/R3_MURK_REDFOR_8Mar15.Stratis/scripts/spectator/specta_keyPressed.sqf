// ====================================================================================
//	File: specta_keyPressed.sqf
//	Last Modified By: Mr. Agnet
// https://community.bistudio.com/wiki/Arma_3_Respawn
// ====================================================================================

private["_key"];

_key = (_this select 1);

disableSerialization;

switch (_key) do {
	case 16: {
		if (isNil "r_var_isSpectating" || !r_var_isSpectating) then {
			[] execVM "scripts\spectator\enterSpectator.sqf";			// Initialise spectating script when player dies.
		};
	};
};

false;