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

	if(isNil "DAC_STRPlayers")		then {		DAC_STRPlayers		= [	"IND_COY_CO","IND_COY_2IC","IND_COY_MEDIC1","IND_COY_MEDIC2","IND_COY_JTACFO","IND_COY_ENG","IND_COY_RM",
																		"IND_PLT11_CO","IND_PLT11_SGT","IND_PLT11_MEDIC","IND_PLT11_JTACFO","IND_PLT11_RM",
																		"IND_A11_SECCO","IND_A11_AR1","IND_A11_AAR1","IND_A11_GREN","IND_A11_FTL","IND_A11_AR2","IND_A11_AAR2","IND_A11_RMAT",
																		"IND_B11_SECCO","IND_B11_AR1","IND_B11_AAR1","IND_B11_GREN","IND_B11_FTL","IND_B11_AR2","IND_B11_AAR2","IND_B11_RMAT",
																		"IND_C11_SECCO","IND_C11_AR1","IND_C11_AAR1","IND_C11_GREN","IND_C11_FTL","IND_C11_AR2","IND_C11_AAR2","IND_C11_RMAT",
																		"IND_D11_SECCO","IND_D11_MMG1","IND_D11_MMGASS1","IND_D11_GREN1","IND_D11_FTL2","IND_D11_MMG2","IND_D11_MMGASS2","IND_D11_GREN2","IND_D11_FTL3","IND_D11_MMG3","IND_D11_MMGASS3","IND_D11_GREN3",
																		"IND_PLT12_CO","IND_PLT12_SGT","IND_PLT12_MEDIC","IND_PLT12_JTACFO","IND_PLT12_RM",
																		"IND_A12_SECCO","IND_A12_AR1","IND_A12_AAR1","IND_A12_GREN","IND_A12_FTL","IND_A12_AR2","IND_A12_AAR2","IND_A12_RMAT",
																		"IND_B12_SECCO","IND_B12_AR1","IND_B12_AAR1","IND_B12_GREN","IND_B12_FTL","IND_B12_AR2","IND_B12_AAR2","IND_B12_RMAT",
																		"IND_C12_SECCO","IND_C12_AR1","IND_C12_AAR1","IND_C12_GREN","IND_C12_FTL","IND_C12_AR2","IND_C12_AAR2","IND_C12_RMAT",
																		"IND_D12_SECCO","IND_D12_MMG1","IND_D12_MMGASS1","IND_D12_GREN1","IND_D12_FTL2","IND_D12_MMG2","IND_D12_MMGASS2","IND_D12_GREN2","IND_D12_FTL3","IND_D12_MMG3","IND_D12_MMGASS3","IND_D12_GREN3",
																		
																		"IND_SUPP_1","IND_SUPP_2","IND_SUPP_3","IND_SUPP_4","IND_SUPP_5","IND_SUPP_6","IND_SUPP_7","IND_SUPP_8",
																		"IND_SUPP_9","IND_SUPP_10","IND_SUPP_11","IND_SUPP_12","IND_SUPP_13","IND_SUPP_14","IND_SUPP_15","IND_SUPP_16",
																		
																		"IND_JIP_1","IND_JIP_2","IND_JIP_3","IND_JIP_4","IND_JIP_5","IND_JIP_6","IND_JIP_7","IND_JIP_8",
																		"IND_JIP_9","IND_JIP_10","IND_JIP_11","IND_JIP_12","IND_JIP_13","IND_JIP_14","IND_JIP_15","IND_JIP_16",
																		"IND_JIP_17","IND_JIP_18","IND_JIP_19","IND_JIP_20","IND_JIP_21","IND_JIP_22","IND_JIP_23","IND_JIP_24",
																		
																		"IND_ARM1_CO","IND_ARM1_CREW2","IND_ARM1_CREW3","IND_ARM1_CREW4",
																		"IND_ARM2_CO","IND_ARM2_CREW2","IND_ARM2_CREW3","IND_ARM2_CREW4",
																		"IND_ARM3_CO","IND_ARM3_CREW2","IND_ARM3_CREW3","IND_ARM3_CREW4",
																		"IND_ARM4_CO","IND_ARM4_CREW2","IND_ARM4_CREW3","IND_ARM4_CREW4",
																		
																		"IND_IFV1_CO","IND_IFV1_CREW2","IND_IFV1_CREW3",
																		"IND_IFV2_CO","IND_IFV2_CREW2","IND_IFV2_CREW3",
																		"IND_IFV3_CO","IND_IFV3_CREW2","IND_IFV3_CREW3",
																		"IND_IFV4_CO","IND_IFV4_CREW2","IND_IFV4_CREW3",
																		
																		"IND_RPILOT1","IND_RPILOT2","IND_RPILOT3","IND_RPILOT4","IND_RPILOT5","IND_RPILOT6","IND_RPILOT7","IND_RPILOT8",
																		"IND_FPILOT1","IND_FPILOT2","IND_FPILOT3","IND_FPILOT4","IND_FPILOT5","IND_FPILOT6","IND_FPILOT7","IND_FPILOT8",
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
	if(isNil "DAC_Marker") 			then {		DAC_Marker			= ["DAC_TestMarkers",0] call BIS_fnc_GetParamValue		};
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