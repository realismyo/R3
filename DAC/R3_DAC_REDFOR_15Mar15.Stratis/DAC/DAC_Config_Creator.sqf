//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};

scalar = "any";DAC_Init_Camps = 0;

waitUntil {time > 0.3};

if (isServer || (!hasInterface && !isServer)) then { if (local player) then {DAC_Code = 1} else {DAC_Code = 0}} else { if (isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

	if(isNil "DAC_STRPlayers")		then {		DAC_STRPlayers		= [	"RED_COY_CO","RED_COY_2IC","RED_COY_MEDIC1","RED_COY_MEDIC2","RED_COY_JTACFO","RED_COY_ENG","RED_COY_RM",
																		"RED_PLT11_CO","RED_PLT11_SGT","RED_PLT11_MEDIC","RED_PLT11_JTACFO","RED_PLT11_RM",
																		"RED_A11_SECCO","RED_A11_AR1","RED_A11_AAR1","RED_A11_GREN","RED_A11_FTL","RED_A11_AR2","RED_A11_AAR2","RED_A11_RMAT",
																		"RED_B11_SECCO","RED_B11_AR1","RED_B11_AAR1","RED_B11_GREN","RED_B11_FTL","RED_B11_AR2","RED_B11_AAR2","RED_B11_RMAT",
																		"RED_C11_SECCO","RED_C11_AR1","RED_C11_AAR1","RED_C11_GREN","RED_C11_FTL","RED_C11_AR2","RED_C11_AAR2","RED_C11_RMAT",
																		"RED_D11_SECCO","RED_D11_MMG1","RED_D11_MMGASS1","RED_D11_GREN1","RED_D11_FTL2","RED_D11_MMG2","RED_D11_MMGASS2","RED_D11_GREN2","RED_D11_FTL3","RED_D11_MMG3","RED_D11_MMGASS3","RED_D11_GREN3",
																		"RED_PLT12_CO","RED_PLT12_SGT","RED_PLT12_MEDIC","RED_PLT12_JTACFO","RED_PLT12_RM",
																		"RED_A12_SECCO","RED_A12_AR1","RED_A12_AAR1","RED_A12_GREN","RED_A12_FTL","RED_A12_AR2","RED_A12_AAR2","RED_A12_RMAT",
																		"RED_B12_SECCO","RED_B12_AR1","RED_B12_AAR1","RED_B12_GREN","RED_B12_FTL","RED_B12_AR2","RED_B12_AAR2","RED_B12_RMAT",
																		"RED_C12_SECCO","RED_C12_AR1","RED_C12_AAR1","RED_C12_GREN","RED_C12_FTL","RED_C12_AR2","RED_C12_AAR2","RED_C12_RMAT",
																		"RED_D12_SECCO","RED_D12_MMG1","RED_D12_MMGASS1","RED_D12_GREN1","RED_D12_FTL2","RED_D12_MMG2","RED_D12_MMGASS2","RED_D12_GREN2","RED_D12_FTL3","RED_D12_MMG3","RED_D12_MMGASS3","RED_D12_GREN3",
																		
																		"RED_SUPP_1","RED_SUPP_2","RED_SUPP_3","RED_SUPP_4","RED_SUPP_5","RED_SUPP_6","RED_SUPP_7","RED_SUPP_8",
																		"RED_SUPP_9","RED_SUPP_10","RED_SUPP_11","RED_SUPP_12","RED_SUPP_13","RED_SUPP_14","RED_SUPP_15","RED_SUPP_16",
																		
																		"RED_JIP_1","RED_JIP_2","RED_JIP_3","RED_JIP_4","RED_JIP_5","RED_JIP_6","RED_JIP_7","RED_JIP_8",
																		"RED_JIP_9","RED_JIP_10","RED_JIP_11","RED_JIP_12","RED_JIP_13","RED_JIP_14","RED_JIP_15","RED_JIP_16",
																		"RED_JIP_17","RED_JIP_18","RED_JIP_19","RED_JIP_20","RED_JIP_21","RED_JIP_22","RED_JIP_23","RED_JIP_24",
																		
																		"RED_ARM1_CO","RED_ARM1_CREW2","RED_ARM1_CREW3","RED_ARM1_CREW4",
																		"RED_ARM2_CO","RED_ARM2_CREW2","RED_ARM2_CREW3","RED_ARM2_CREW4",
																		"RED_ARM3_CO","RED_ARM3_CREW2","RED_ARM3_CREW3","RED_ARM3_CREW4",
																		"RED_ARM4_CO","RED_ARM4_CREW2","RED_ARM4_CREW3","RED_ARM4_CREW4",
																		
																		"RED_IFV1_CO","RED_IFV1_CREW2","RED_IFV1_CREW3",
																		"RED_IFV2_CO","RED_IFV2_CREW2","RED_IFV2_CREW3",
																		"RED_IFV3_CO","RED_IFV3_CREW2","RED_IFV3_CREW3",
																		"RED_IFV4_CO","RED_IFV4_CREW2","RED_IFV4_CREW3",
																		
																		"RED_RPILOT1","RED_RPILOT2","RED_RPILOT3","RED_RPILOT4","RED_RPILOT5","RED_RPILOT6","RED_RPILOT7","RED_RPILOT8",
																		"RED_FPILOT1","RED_FPILOT2","RED_FPILOT3","RED_FPILOT4","RED_FPILOT5","RED_FPILOT6","RED_FPILOT7","RED_FPILOT8",
																		"Numpty"
																		] };
	if(isNil "DAC_AI_Count_Level")	then {		DAC_AI_Count_Level  = [[2,4],[3,6],[4,8],[6,10],[8,12]]						};
	if(isNil "DAC_Dyn_Weather") 	then {		DAC_Dyn_Weather		= [0,0,0,[0, 0, 0],0]									};
	if(isNil "DAC_Reduce_Value") 	then {		DAC_Reduce_Value	= [1600,1800,0.3]										};
	if(isNil "DAC_AI_Spawn") 		then {		DAC_AI_Spawn		= [[10,5,5],[10,5,15],0,120,250,0]						};
	if(isNil "DAC_Delete_Value") 	then {		DAC_Delete_Value	= [[180,150],[180,150],6000]							};
	if(isNil "DAC_Del_PlayerBody") 	then {		DAC_Del_PlayerBody	= [0,0]													};
	if(isNil "DAC_Com_Values") 		then {		DAC_Com_Values		= [1,2,0,0]												};
	if(isNil "DAC_AI_AddOn") 		then {		DAC_AI_AddOn		= 1														};
	if(isNil "DAC_AI_Level") 		then {		DAC_AI_Level		= 3														};
	if(isNil "DAC_Res_Side") 		then {		DAC_Res_Side		= 0														};
	if(isNil "DAC_Marker") 			then {		DAC_Marker			= ["DAC_TestMarkers",0] call BIS_fnc_GetParamValue)		};
	if(isNil "DAC_WP_Speed") 		then {		DAC_WP_Speed		= 0.01													};
	if(isNil "DAC_Join_Action")		then {		DAC_Join_Action		= false													};
	if(isNil "DAC_Fast_Init") 		then {		DAC_Fast_Init		= false													};
	if(isNil "DAC_Player_Marker")	then {		DAC_Player_Marker	= false													};
	if(isNil "DAC_Direct_Start")	then {		DAC_Direct_Start	= false													};
	if(isNil "DAC_Activate_Sound")	then {		DAC_Activate_Sound	= false													};
	if(isNil "DAC_Auto_UnitCount")	then {		DAC_Auto_UnitCount	= [8,10]												};
	if(isNil "DAC_Player_Support")	then {		DAC_Player_Support	= [10,[4,2000,3,1000]]									};
	if(isNil "DAC_SaveDistance")	then {		DAC_SaveDistance	= [500,["DAC_Save_Pos"]]								};
	if(isNil "DAC_Radio_Max")		then {		DAC_Radio_Max		= DAC_AI_Level											};

	DAC_BadBuildings 	= 	[];
	DAC_GunNotAllowed	= 	[];
	DAC_VehNotAllowed	= 	[];
	DAC_Locked_Veh		=	[];
	DAC_SP_Soldiers     =   ["B_soldier_AR_F","B_G_soldier_AR_F","O_soldier_AR_F","O_soldierU_AR_F","O_G_soldier_AR_F","I_soldier_AR_F","I_G_soldier_AR_F","rhsusf_army_ocp_autorifleman","rhsusf_army_ucp_autorifleman","rhsusf_usmc_marpat_wd_autorifleman_m249",
							"rhsusf_usmc_marpat_d_autorifleman_m249","ACR_Vojak03","ACR_DES_Vojak03","B_G_Soldier_AR_F","TEC_O_soldier_AR_F","TEC_O_Soldier_Semiarid_AR_F","TEC_O_Soldier_Urban_AR_F","TEC_O_Soldier_Woodland_AR_F","rhs_msv_machinegunner",
							"rhs_msv_emr_machinegunner","rhs_vdv_machinegunner","rhs_vdv_flora_machinegunner","rhs_vdv_mflora_machinegunner","O_G_Soldier_AR_F","I_soldier_AR_F","AFR_PARAMIL_AR_RPK47","EURO_PARAMIL_AR_RPK47","EAST_PARAMIL_AR_RPK47"];
	DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
	DAC_Marker_Val		= 	[];
	DAC_Zones			=	[];

	//=============================================================================================================|

	_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Start_Creator.sqf");
	waituntil {scriptdone _scr};
	sleep 0.1;
	waituntil {(DAC_Basic_Value > 0)};

if (DAC_Code < 2) then {
	//===========================================|
	// StartScriptOnServer                       |
	//===========================================|
	//player sidechat "ServerStart"
	//[] execVM "myServerScript.sqf";
	//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
} else {
	if (DAC_Code == 3) then {
		//===========================================|
		// StartScriptOnJipClient                    |
		//===========================================|
		//player sidechat "JipClientStart"
		//[] execVM "myJipClientScript.sqf";
	} else {
		//===========================================|
		// StartScriptOnClient                       |
		//===========================================|
		//player sidechat "ClientStart"
		//[] execVM "myClientScript.sqf";
		//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	};
};