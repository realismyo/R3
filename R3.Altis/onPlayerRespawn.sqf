[player] execVM "scripts\spectator\specta.sqf";		// Initialise spectating script when player dies.
[player, true] call TFAR_fnc_forceSpectator;
player call AGM_Medical_unitInit;			// Remove funky screen effects.