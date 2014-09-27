[player] execVM "spectator\specta.sqf";		// Initialise spectating script when player dies.
[true] call acre_api_fnc_setSpectator;		// Put player into ACRE spectating mode.
player call AGM_Medical_unitInit;			// Remove funky screen effects.