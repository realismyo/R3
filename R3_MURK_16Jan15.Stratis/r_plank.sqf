/*
Plank Player Initialisation Script
By Mr. Agnet/Sporkfist
If variable 'r_var_plankForts' is true, assigns players their relevant fortification actions.

==================== Usage ====================
- Script follows the unit naming standard of the R3 framework.
- If the units in your mission aren't named as such, this will not work unless you modify the calls.
- This is one massive script to allow for alterations to any and all roles.

Call: [player, [1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  
- Each number in the array corresponds to a certain fortification, and how many of those the player will get.
- Check plank_fortifications.sqf for respective fortifications.
*/

private ["_blu","_opf","_ind"];

// Let player get into the game first.
waitUntil {time > 1};
if (hasInterface) then { waitUntil { !isNull player && isPlayer player }; };

// Enable Plank per faction - set to false to exclude a side.
_blu = true;
_opf = true;
_ind = true;

// Define variable if it doesn't exist - default false.
if (isNil "r_var_plankForts") then { r_var_plankForts = false; };

// Compiles Functions
call compile preprocessFileLineNumbers "scripts\plank\plank_init.sqf";

if (r_var_plankForts) then {
	if (_blu) then {
		// ============================== BLUFOR ==============================
		if ((!isNull BLU_PLT11_CO) && player == BLU_PLT11_CO) then {  [player, 		[1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_PLT11_SGT ) && player == BLU_PLT11_SGT) then {  [player, 		[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_PLT11_MEDIC) && player == BLU_PLT11_MEDIC) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_PLT11_JTACFO) && player == BLU_PLT11_JTACFO) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_PLT11_RM) && player == BLU_PLT11_RM) then {  [player, 		[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull BLU_A11_SECCO) && player == BLU_A11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_AR1) && player == BLU_A11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_AAR1) && player == BLU_A11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_GREN) && player == BLU_A11_GREN) then {  [player,	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_FTL) && player == BLU_A11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_AR2) && player == BLU_A11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_AAR2) && player == BLU_A11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_A11_RMAT) && player == BLU_A11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull BLU_B11_SECCO) && player == BLU_B11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_AR1) && player == BLU_B11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_AAR1) && player == BLU_B11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_GREN) && player == BLU_B11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_FTL) && player == BLU_B11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_AR2) && player == BLU_B11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_AAR2) && player == BLU_B11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_B11_RMAT) && player == BLU_B11_RMAT)then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull BLU_C11_SECCO) && player == BLU_C11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_AR1) && player == BLU_C11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_AAR1) && player == BLU_C11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_GREN) && player == BLU_C11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_FTL) && player == BLU_C11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_AR2) && player == BLU_C11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_AAR2) && player == BLU_C11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_C11_RMAT) && player == BLU_C11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull BLU_D11_SECCO) && player == BLU_D11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMG1) && player == BLU_D11_MMG1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMGASS1) && player == BLU_D11_MMGASS1) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_GREN1) && player == BLU_D11_GREN1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_FTL2) && player == BLU_D11_FTL2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMG2) && player == BLU_D11_MMG2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMGASS2) && player == BLU_D11_MMGASS2) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_GREN2) && player == BLU_D11_GREN2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_FTL3) && player == BLU_D11_FTL3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMG3) && player == BLU_D11_MMG3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_MMGASS3) && player == BLU_D11_MMGASS3) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_D11_GREN3) && player == BLU_D11_GREN3) then {  [player,	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		
		if ((!isNull BLU_SUPP_1) && player == BLU_SUPP_1) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_2) && player == BLU_SUPP_2) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_3) && player == BLU_SUPP_3) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_4) && player == BLU_SUPP_4) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_5) && player == BLU_SUPP_5) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_6) && player == BLU_SUPP_6) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_7) && player == BLU_SUPP_7) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull BLU_SUPP_8) && player == BLU_SUPP_8) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	};
	if (_opf) then {
		// ============================== REDFOR ==============================
		if ((!isNull RED_PLT11_CO) && player == RED_PLT11_CO) then {  [player, 		[1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_PLT11_SGT) && player == RED_PLT11_SGT) then {  [player, 		[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_PLT11_MEDIC) && player == RED_PLT11_MEDIC) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_PLT11_JTACFO) && player == RED_PLT11_JTACFO) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_PLT11_RM) && player == RED_PLT11_RM) then {  [player, 		[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		
		if ((!isNull RED_A11_SECCO) && player == RED_A11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_AR1) && player == RED_A11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_AAR1) && player == RED_A11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_GREN) && player == RED_A11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_FTL) && player == RED_A11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_AR2) && player == RED_A11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_AAR2) && player == RED_A11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_A11_RMAT) && player == RED_A11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull RED_B11_SECCO) && player == RED_B11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_AR1) && player == RED_B11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_AAR1) && player == RED_B11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_GREN) && player == RED_B11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_FTL) && player == RED_B11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_AR2) && player == RED_B11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_AAR2) && player == RED_B11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_B11_RMAT) && player == RED_B11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull RED_C11_SECCO) && player == RED_C11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_AR1) && player == RED_C11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_AAR1) && player == RED_C11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_GREN) && player == RED_C11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_FTL) && player == RED_C11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_AR2) && player == RED_C11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_AAR2) && player == RED_C11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_C11_RMAT) && player == RED_C11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull RED_D11_SECCO) && player == RED_D11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMG1) && player == RED_D11_MMG1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMGASS1) && player == RED_D11_MMGASS1) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_GREN1) && player == RED_D11_GREN1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_FTL1) && player == RED_D11_FTL1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMG2) && player == RED_D11_MMG2) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMGASS2) && player == RED_D11_MMGASS2) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_GREN2) && player == RED_D11_GREN2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_FTL3) && player == RED_D11_FTL3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMG3) && player == RED_D11_MMG3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_MMGASS3) && player == RED_D11_MMGASS3) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_D11_GREN3) && player == RED_D11_GREN3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		
		if ((!isNull RED_SUPP_1) && player == RED_SUPP_1) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_2) && player == RED_SUPP_2) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_3) && player == RED_SUPP_3) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_4) && player == RED_SUPP_4) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_5) && player == RED_SUPP_5) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_6) && player == RED_SUPP_6) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_7) && player == RED_SUPP_7) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull RED_SUPP_8) && player == RED_SUPP_8) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	};
	if (_ind) then {
		// ============================== INDFOR ==============================
		if ((!isNull IND_PLT11_CO) && player == IND_PLT11_CO) then {  [player, 		[1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_PLT11_SGT) && player == IND_PLT11_SGT) then {  [player, 		[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_PLT11_MEDIC) && player == IND_PLT11_MEDIC) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_PLT11_JTACFO) && player == IND_PLT11_JTACFO) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_PLT11_RM) && player == IND_PLT11_RM) then {  [player, 		[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		
		if ((!isNull IND_A11_SECCO) && player == IND_A11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_AR1) && player == IND_A11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_AAR1) && player == IND_A11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_GREN) && player == IND_A11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_FTL) && player == IND_A11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_AR2) && player == IND_A11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_AAR2) && player == IND_A11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_A11_RMAT) && player == IND_A11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull IND_B11_SECCO) && player == IND_B11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_AR1) && player == IND_B11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_AAR1) && player == IND_B11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_GREN) && player == IND_B11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_FTL) && player == IND_B11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_AR2) && player == IND_B11_AR2) then {  [player,		[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_AAR2) && player == IND_B11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_B11_RMAT) && player == IND_B11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull IND_C11_SECCO) && player == IND_C11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_AR1) && player == IND_C11_AR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_AAR1) && player == IND_C11_AAR1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_GREN) && player == IND_C11_GREN) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_FTL) && player == IND_C11_FTL) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_AR2) && player == IND_C11_AR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_AAR2) && player == IND_C11_AAR2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_C11_RMAT) && player == IND_C11_RMAT) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

		if ((!isNull IND_D11_SECCO) && player == IND_D11_SECCO) then {  [player, 	[0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMG1) && player == IND_D11_MMG1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMGASS1) && player == IND_D11_MMGASS1) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_GREN1) && player == IND_D11_GREN1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_FTL1) && player == IND_D11_FTL1) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMG2) && player == IND_D11_MMG2) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMGASS2) && player == IND_D11_MMGASS2) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_GREN2) && player == IND_D11_GREN2) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_FTL3) && player == IND_D11_FTL3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMG3) && player == IND_D11_MMG3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_MMGASS3) && player == IND_D11_MMGASS3) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_D11_GREN3) && player == IND_D11_GREN3) then {  [player, 	[0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
		
		if ((!isNull IND_SUPP_1) && player == IND_SUPP_1) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_2) && player == IND_SUPP_2) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_3) && player == IND_SUPP_3) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_4) && player == IND_SUPP_4) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_5) && player == IND_SUPP_5) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_6) && player == IND_SUPP_6) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_7) && player == IND_SUPP_7) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
		if ((!isNull IND_SUPP_8) && player == IND_SUPP_8) then {  [player, 	[0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	};
};