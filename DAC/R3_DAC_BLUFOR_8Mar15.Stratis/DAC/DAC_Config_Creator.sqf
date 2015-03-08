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
waitUntil {scriptDone _scr};

scalar = "any";
DAC_Init_Camps = 0;

waitUntil {time > 0.3};

if (isServer || (!hasInterface && !isServer)) then { if (local player) then {DAC_Code = 1} else {DAC_Code = 0}} else { if (isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

	if(isNil "DAC_STRPlayers")		then {		DAC_STRPlayers		= [	"BLU_COY_CO","BLU_COY_2IC","BLU_COY_MEDIC1","BLU_COY_MEDIC2","BLU_COY_JTACFO","BLU_COY_ENG","BLU_COY_RM",
																		"BLU_PLT11_CO","BLU_PLT11_SGT","BLU_PLT11_MEDIC","BLU_PLT11_JTACFO","BLU_PLT11_RM",
																		"BLU_A11_SECCO","BLU_A11_AR1","BLU_A11_AAR1","BLU_A11_GREN","BLU_A11_FTL","BLU_A11_AR2","BLU_A11_AAR2","BLU_A11_RMAT",
																		"BLU_B11_SECCO","BLU_B11_AR1","BLU_B11_AAR1","BLU_B11_GREN","BLU_B11_FTL","BLU_B11_AR2","BLU_B11_AAR2","BLU_B11_RMAT",
																		"BLU_C11_SECCO","BLU_C11_AR1","BLU_C11_AAR1","BLU_C11_GREN","BLU_C11_FTL","BLU_C11_AR2","BLU_C11_AAR2","BLU_C11_RMAT",
																		"BLU_D11_SECCO","BLU_D11_MMG1","BLU_D11_MMGASS1","BLU_D11_GREN1","BLU_D11_FTL2","BLU_D11_MMG2","BLU_D11_MMGASS2","BLU_D11_GREN2","BLU_D11_FTL3","BLU_D11_MMG3","BLU_D11_MMGASS3","BLU_D11_GREN3",
																		"BLU_PLT12_CO","BLU_PLT12_SGT","BLU_PLT12_MEDIC","BLU_PLT12_JTACFO","BLU_PLT12_RM",
																		"BLU_A12_SECCO","BLU_A12_AR1","BLU_A12_AAR1","BLU_A12_GREN","BLU_A12_FTL","BLU_A12_AR2","BLU_A12_AAR2","BLU_A12_RMAT",
																		"BLU_B12_SECCO","BLU_B12_AR1","BLU_B12_AAR1","BLU_B12_GREN","BLU_B12_FTL","BLU_B12_AR2","BLU_B12_AAR2","BLU_B12_RMAT",
																		"BLU_C12_SECCO","BLU_C12_AR1","BLU_C12_AAR1","BLU_C12_GREN","BLU_C12_FTL","BLU_C12_AR2","BLU_C12_AAR2","BLU_C12_RMAT",
																		"BLU_D12_SECCO","BLU_D12_MMG1","BLU_D12_MMGASS1","BLU_D12_GREN1","BLU_D12_FTL2","BLU_D12_MMG2","BLU_D12_MMGASS2","BLU_D12_GREN2","BLU_D12_FTL3","BLU_D12_MMG3","BLU_D12_MMGASS3","BLU_D12_GREN3",
																		
																		"BLU_SUPP_1","BLU_SUPP_2","BLU_SUPP_3","BLU_SUPP_4","BLU_SUPP_5","BLU_SUPP_6","BLU_SUPP_7","BLU_SUPP_8",
																		"BLU_SUPP_9","BLU_SUPP_10","BLU_SUPP_11","BLU_SUPP_12","BLU_SUPP_13","BLU_SUPP_14","BLU_SUPP_15","BLU_SUPP_16",
																		
																		"BLU_JIP_1","BLU_JIP_2","BLU_JIP_3","BLU_JIP_4","BLU_JIP_5","BLU_JIP_6","BLU_JIP_7","BLU_JIP_8",
																		"BLU_JIP_9","BLU_JIP_10","BLU_JIP_11","BLU_JIP_12","BLU_JIP_13","BLU_JIP_14","BLU_JIP_15","BLU_JIP_16",
																		"BLU_JIP_17","BLU_JIP_18","BLU_JIP_19","BLU_JIP_20","BLU_JIP_21","BLU_JIP_22","BLU_JIP_23","BLU_JIP_24",
																		
																		"BLU_ARM1_CO","BLU_ARM1_CREW2","BLU_ARM1_CREW3","BLU_ARM1_CREW4",
																		"BLU_ARM2_CO","BLU_ARM2_CREW2","BLU_ARM2_CREW3","BLU_ARM2_CREW4",
																		"BLU_ARM3_CO","BLU_ARM3_CREW2","BLU_ARM3_CREW3","BLU_ARM3_CREW4",
																		"BLU_ARM4_CO","BLU_ARM4_CREW2","BLU_ARM4_CREW3","BLU_ARM4_CREW4",
																		
																		"BLU_IFV1_CO","BLU_IFV1_CREW2","BLU_IFV1_CREW3",
																		"BLU_IFV2_CO","BLU_IFV2_CREW2","BLU_IFV2_CREW3",
																		"BLU_IFV3_CO","BLU_IFV3_CREW2","BLU_IFV3_CREW3",
																		"BLU_IFV4_CO","BLU_IFV4_CREW2","BLU_IFV4_CREW3",
																		
																		"BLU_RPILOT1","BLU_RPILOT2","BLU_RPILOT3","BLU_RPILOT4","BLU_RPILOT5","BLU_RPILOT6","BLU_RPILOT7","BLU_RPILOT8",
																		"BLU_FPILOT1","BLU_FPILOT2","BLU_FPILOT3","BLU_FPILOT4","BLU_FPILOT5","BLU_FPILOT6","BLU_FPILOT7","BLU_FPILOT8",
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
	DAC_SP_Soldiers     =   ["B_soldier_AR_F","B_G_soldier_AR_F","O_soldier_AR_F","O_soldierU_AR_F","O_G_soldier_AR_F","I_soldier_AR_F","I_G_soldier_AR_F"];
	DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
	DAC_Marker_Val		= 	[];
	DAC_Zones			=	[];

	//=============================================================================================================|

	_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Start_Creator.sqf");
	waitUntil {scriptDone _scr};
	sleep 0.1;
	waitUntil {(DAC_Basic_Value > 0)};

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