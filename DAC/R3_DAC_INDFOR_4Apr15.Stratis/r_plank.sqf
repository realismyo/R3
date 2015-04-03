/*
Plank Player Initialisation Script
By Mr. Agnet/Sporkfist
If variable 'r_var_plankForts' is true, assigns players their relevant fortification actions.
Is configured for whichever framework side the script is in. Current: BLUFOR.
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

// Define variable if it doesn't exist - default false.
if (isNil "r_var_plankForts") then { r_var_plankForts = false; };

// Compiles Functions
call compile preprocessFileLineNumbers "scripts\plank\plank_init.sqf";

if (r_var_plankForts) then {

	// ============================== Company Command ==============================

	if ((!isNull IND_COY_CO) && player == IND_COY_CO) then {  			[player, [1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_2IC) && player == IND_COY_2IC) then {  		[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_MEDIC1) && player == IND_COY_MEDIC1) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_MEDIC2) && player == IND_COY_MEDIC2) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_JTACFO) && player == IND_COY_JTACFO) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_ENG) && player == IND_COY_ENG) then {  		[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_COY_RM) && player == IND_COY_RM) then {  			[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init; };

	
	// ============================== First Platoon ==============================
	
	if ((!isNull IND_PLT11_CO) && player == IND_PLT11_CO) then {  			[player, [1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT11_SGT) && player == IND_PLT11_SGT) then {  		[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT11_MEDIC) && player == IND_PLT11_MEDIC) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT11_JTACFO) && player == IND_PLT11_JTACFO) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT11_RM) && player == IND_PLT11_RM) then {  			[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init; };

	if ((!isNull IND_A11_SECCO) && player == IND_A11_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_AR1) && player == IND_A11_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_AAR1) && player == IND_A11_AAR1) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_GREN) && player == IND_A11_GREN) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_FTL) && player == IND_A11_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_AR2) && player == IND_A11_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_AAR2) && player == IND_A11_AAR2) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A11_RMAT) && player == IND_A11_RMAT) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_B11_SECCO) && player == IND_B11_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_AR1) && player == IND_B11_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_AAR1) && player == IND_B11_AAR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_GREN) && player == IND_B11_GREN) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_FTL) && player == IND_B11_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_AR2) && player == IND_B11_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_AAR2) && player == IND_B11_AAR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B11_RMAT) && player == IND_B11_RMAT)then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_C11_SECCO) && player == IND_C11_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_AR1) && player == IND_C11_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_AAR1) && player == IND_C11_AAR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_GREN) && player == IND_C11_GREN) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_FTL) && player == IND_C11_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_AR2) && player == IND_C11_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_AAR2) && player == IND_C11_AAR2) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C11_RMAT) && player == IND_C11_RMAT) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_D11_SECCO) && player == IND_D11_SECCO) then {  	[player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMG1) && player == IND_D11_MMG1) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMGASS1) && player == IND_D11_MMGASS1) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_GREN1) && player == IND_D11_GREN1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_FTL2) && player == IND_D11_FTL2) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMG2) && player == IND_D11_MMG2) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMGASS2) && player == IND_D11_MMGASS2) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_GREN2) && player == IND_D11_GREN2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_FTL3) && player == IND_D11_FTL3) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMG3) && player == IND_D11_MMG3) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_MMGASS3) && player == IND_D11_MMGASS3) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D11_GREN3) && player == IND_D11_GREN3) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	
	
	// ============================== Second Platoon ==============================
	
	if ((!isNull IND_PLT12_CO) && player == IND_PLT12_CO) then {  			[player, [1, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT12_SGT) && player == IND_PLT12_SGT) then {  		[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT12_MEDIC) && player == IND_PLT12_MEDIC) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT12_JTACFO) && player == IND_PLT12_JTACFO) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init; };
	if ((!isNull IND_PLT12_RM) && player == IND_PLT12_RM) then {  			[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init; };

	if ((!isNull IND_A12_SECCO) && player == IND_A12_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_AR1) && player == IND_A12_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_AAR1) && player == IND_A12_AAR1) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_GREN) && player == IND_A12_GREN) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_FTL) && player == IND_A12_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_AR2) && player == IND_A12_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_AAR2) && player == IND_A12_AAR2) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_A12_RMAT) && player == IND_A12_RMAT) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_B12_SECCO) && player == IND_B12_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_AR1) && player == IND_B12_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_AAR1) && player == IND_B12_AAR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_GREN) && player == IND_B12_GREN) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_FTL) && player == IND_B12_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_AR2) && player == IND_B12_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_AAR2) && player == IND_B12_AAR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_B12_RMAT) && player == IND_B12_RMAT)then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_C12_SECCO) && player == IND_C12_SECCO) then {  [player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_AR1) && player == IND_C12_AR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_AAR1) && player == IND_C12_AAR1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_GREN) && player == IND_C12_GREN) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_FTL) && player == IND_C12_FTL) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_AR2) && player == IND_C12_AR2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_AAR2) && player == IND_C12_AAR2) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_C12_RMAT) && player == IND_C12_RMAT) then { 	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };

	if ((!isNull IND_D12_SECCO) && player == IND_D12_SECCO) then {  	[player, [0, 1, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMG1) && player == IND_D12_MMG1) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMGASS1) && player == IND_D12_MMGASS1) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_GREN1) && player == IND_D12_GREN1) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_FTL2) && player == IND_D12_FTL2) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMG2) && player == IND_D12_MMG2) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMGASS2) && player == IND_D12_MMGASS2) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_GREN2) && player == IND_D12_GREN2) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_FTL3) && player == IND_D12_FTL3) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMG3) && player == IND_D12_MMG3) then {  		[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_MMGASS3) && player == IND_D12_MMGASS3) then {  [player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_D12_GREN3) && player == IND_D12_GREN3) then {  	[player, [0, 0, 3, 1, 0, 2, 0, 0]] call plank_deploy_fnc_init;  };
	
	
	// ============================== Support Sections ==============================
	
	if ((!isNull IND_SUPP_1) && player == IND_SUPP_1) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_2) && player == IND_SUPP_2) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_3) && player == IND_SUPP_3) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_4) && player == IND_SUPP_4) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_5) && player == IND_SUPP_5) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_6) && player == IND_SUPP_6) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_7) && player == IND_SUPP_7) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_8) && player == IND_SUPP_8) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	
	if ((!isNull IND_SUPP_9) && player == IND_SUPP_9) then {  	[player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_10) && player == IND_SUPP_10) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_11) && player == IND_SUPP_11) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_12) && player == IND_SUPP_12) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_13) && player == IND_SUPP_13) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_14) && player == IND_SUPP_14) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_15) && player == IND_SUPP_15) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	if ((!isNull IND_SUPP_16) && player == IND_SUPP_16) then {  [player, [0, 0, 0, 0, 0, 0, 0, 0]] call plank_deploy_fnc_init;  };
	
};