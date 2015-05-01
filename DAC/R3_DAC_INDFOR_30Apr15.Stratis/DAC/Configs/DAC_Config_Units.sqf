//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do {
//-------------------------------------------------------------------------------------------------
// BLUFOR - NATO
	case 0:{
		_Unit_Pool_S = ["B_crew_F","B_Helipilot_F","B_Soldier_SL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_soldier_GL_F","B_soldier_GL_F","B_Soldier_F","B_Soldier_F","B_medic_F","B_Soldier_F","B_Soldier_F","B_soldier_repair_F","B_Soldier_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
		_Unit_Pool_V = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_F","B_MRAP_01_hmg_F","B_MRAP_01_F"];
		_Unit_Pool_T = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"];
		_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - RHS USF, US ARMY WOODLAND
	case 1:{
		_Unit_Pool_S = ["rhsusf_army_ocp_crewman","rhsusf_airforce_pilot","rhsusf_army_ocp_squadleader","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_medic","rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_engineer","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_teamleader","rhsusf_army_ocp_teamleader"];
		_Unit_Pool_V = ["rhsusf_m1025_w","rhsusf_m1025_w_m2","rhsusf_m1025_w","rhsusf_m1025_w_m2","rhsusf_m1025_w"];
		_Unit_Pool_T = ["RHS_M2A3_wd","rhsusf_m113_usarmy","RHS_M2A3_wd","rhsusf_m113_usarmy","RHS_M2A3_wd"];
		_Unit_Pool_A = ["rhs_uh60m","B_Heli_Light_01_armed_F","rhs_uh60m","rhs_ch_47f","rhs_uh60m"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - RHS USF, US ARMY DESERT
	case 2:{
		_Unit_Pool_S = ["rhsusf_army_ucp_crewman","rhsusf_airforce_pilot","rhsusf_army_ucp_squadleader","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_medic","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_engineer","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_teamleader","rhsusf_army_ucp_teamleader"];
		_Unit_Pool_V = ["rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d"];
		_Unit_Pool_T = ["RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3"];
		_Unit_Pool_A = ["rhs_uh60m_d","B_Heli_Light_01_armed_F","rhs_uh60m_d","rhs_ch_47f_light","rhs_uh60m_d"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - RHS USF, USMSC WOODLAND
	case 3:{
		_Unit_Pool_S = ["rhsusf_usmc_marpat_wd_crewman","rhsusf_airforce_pilot","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_medic","rhsusf_usmc_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_engineer","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_riflemanat","rhsusf_usmc_marpat_wd_riflemanat","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_teamleader"];
		_Unit_Pool_V = ["rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d"];
		_Unit_Pool_T = ["RHS_M2A3_wd","rhsusf_m113_usarmy","RHS_M2A3_wd","rhsusf_m113_usarmy","RHS_M2A3_wd"];
		_Unit_Pool_A = ["rhs_uh60m_d","B_Heli_Light_01_armed_F","rhs_uh60m_d","rhs_ch_47f","rhs_uh60m_d"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - RHS USF, USMSC DESERT
	case 4:{
		_Unit_Pool_S = ["rhsusf_usmc_marpat_d_crewman","rhsusf_airforce_pilot","rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_medic","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_engineer","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_teamleader"];
		_Unit_Pool_V = ["rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d"];
		_Unit_Pool_T = ["RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3"];
		_Unit_Pool_A = ["rhs_uh60m_d","B_Heli_Light_01_armed_F","rhs_uh60m_d","rhs_ch_47f_light","rhs_uh60m_d"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - RHS USF, SOCOM
	case 5:{
		_Unit_Pool_S = ["rhsusf_socom_marsoc_cso_mechanic","rhsusf_airforce_pilot","rhsusf_socom_marsoc_elementleader","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso_mechanic","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso_mechanic","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_cso","rhsusf_socom_marsoc_teamleader","rhsusf_socom_marsoc_teamleader"];
		_Unit_Pool_V = ["rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d","rhsusf_m1025_d_m2","rhsusf_m1025_d"];
		_Unit_Pool_T = ["RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3","rhsusf_m113d_usarmy","RHS_M2A3"];
		_Unit_Pool_A = ["rhs_uh60m_d","B_Heli_Light_01_armed_F","rhs_uh60m_d","rhs_ch_47f_light","rhs_uh60m_d"];
	};	
//-------------------------------------------------------------------------------------------------
// BLUFOR - ACR, WOODLAND
	case 6:{
		_Unit_Pool_S = ["ACR_Vojak01","ACR_Pilot","ACR_Vojak06","ACR_Vojak03","ACR_Vojak03","ACR_Vojak01","ACR_Vojak04","ACR_Vojak10","ACR_Vojak01","ACR_Vojak01","ACR_Vojak05","ACR_Vojak03","ACR_Vojak01","ACR_Vojak03","ACR_Vojak01","ACR_Vojak01","ACR_Vojak01at","ACR_Vojak10","ACR_Vojak10","ACR_Vojak06","ACR_Vojak06"];
		_Unit_Pool_V = ["ACR_Hunter_Unarmed","ACR_Hunter_HMG","ACR_Hunter_Unarmed","ACR_Hunter_GMG","ACR_Hunter_Unarmed"];
		_Unit_Pool_T = ["ACR_Pandur","ACR_Pandur","ACR_Pandur"];
		_Unit_Pool_A = ["ACR_Mohawk_FG","ACR_Mohawk_FG","ACR_Mohawk_FG"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - ACR, DESERT
	case 7:{
		_Unit_Pool_S = ["ACR_DES_Vojak01","ACR_Pilot_des","ACR_DES_Vojak06","ACR_DES_Vojak03","ACR_DES_Vojak03","ACR_DES_Vojak01","ACR_DES_Vojak04","ACR_DES_Vojak10","ACR_DES_Vojak01","ACR_DES_Vojak01","ACR_DES_Vojak05","ACR_DES_Vojak03","ACR_DES_Vojak01","ACR_DES_Vojak03","ACR_DES_Vojak01","ACR_DES_Vojak01","ACR_DES_Vojak01at","ACR_DES_Vojak10","ACR_DES_Vojak10","ACR_DES_Vojak06","ACR_DES_Vojak06"];
		_Unit_Pool_V = ["ACR_Hunter_Unarmed","ACR_Hunter_HMG","ACR_Hunter_Unarmed","ACR_Hunter_GMG","ACR_Hunter_Unarmed"];
		_Unit_Pool_T = ["ACR_Pandur","ACR_Pandur","ACR_Pandur"];
		_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"];
	};
//-------------------------------------------------------------------------------------------------
// BLUFOR - FIA
	case 8:{
		_Unit_Pool_S = ["B_crew_F","B_Pilot_F","B_G_Soldier_SL_F","B_G_Soldier_AR_F","B_G_Soldier_AR_F","B_G_Soldier_F","B_G_Soldier_GL_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_F","B_G_medic_F","B_G_Soldier_AR_F","B_G_Soldier_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_F","B_G_Soldier_TL_F","B_G_Soldier_TL_F"];
		_Unit_Pool_V = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F"];
		_Unit_Pool_T = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F"];
		_Unit_Pool_A = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
	};
//-------------------------------------------------------------------------------------------------
// OPFOR - CSAT, Arid
	case 9:{
		_Unit_Pool_S = ["TEC_O_crew_F","TEC_O_Helipilot_F","TEC_O_Soldier_SL_F","TEC_O_soldier_AR_F","TEC_O_soldier_AR_F","TEC_O_Soldier_F","TEC_O_soldier_GL_F","TEC_O_soldier_GL_F","TEC_O_Soldier_F","TEC_O_Soldier_F","TEC_O_medic_F","TEC_O_Soldier_F","TEC_O_Soldier_F","TEC_O_soldier_repair_F","TEC_O_Soldier_F","TEC_O_Soldier_F","TEC_O_soldier_LAT_F","TEC_O_soldier_LAT_F","TEC_O_Soldier_F","TEC_O_soldier_TL_F","TEC_O_soldier_TL_F"];
		_Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];
		_Unit_Pool_T = ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F"];
		_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_F"];
	};
//-------------------------------------------------------------------------------------------------
// OPFOR - CSAT, Semiarid
	case 10:{
		_Unit_Pool_S = ["TEC_O_Crew_Semiarid_F","TEC_O_Helipilot_F","TEC_O_Soldier_Semiarid_SL_F","TEC_O_Soldier_Semiarid_AR_F","TEC_O_Soldier_Semiarid_AR_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_GL_F","TEC_O_Soldier_Semiarid_GL_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_F","TEC_O_medic_Semiarid_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_repair_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_LAT_F","TEC_O_Soldier_Semiarid_LAT_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_TL_F","TEC_O_Soldier_Semiarid_TL_F"];
		_Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];
		_Unit_Pool_T = ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F"];
		_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_F"];
	};
//-------------------------------------------------------------------------------------------------
// OPFOR - CSAT, Urban
	case 11:{
		_Unit_Pool_S = ["TEC_O_Crew_Urban_F","TEC_O_Helipilot_F","TEC_O_Soldier_Urban_SL_F","TEC_O_Soldier_Urban_AR_F","TEC_O_Soldier_Urban_AR_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_GL_F","TEC_O_Soldier_Urban_GL_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_F","TEC_O_medic_Urban_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_repair_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_LAT_F","TEC_O_Soldier_Urban_LAT_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_TL_F","TEC_O_Soldier_Urban_TL_F"];
		_Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];
		_Unit_Pool_T = ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F"];
		_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_F"];
	};	
//-------------------------------------------------------------------------------------------------
// OPFOR - CSAT, Woodland
	case 12:{
		_Unit_Pool_S = ["TEC_O_Crew_Woodland_F","TEC_O_Helipilot_F","TEC_O_Soldier_Woodland_SL_F","TEC_O_Soldier_Woodland_AR_F","TEC_O_Soldier_Woodland_AR_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_GL_F","TEC_O_Soldier_Woodland_GL_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_F","TEC_O_medic_Woodland_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_repair_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_LAT_F","TEC_O_Soldier_Woodland_LAT_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_TL_F","TEC_O_Soldier_Woodland_TL_F"];
		_Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];
		_Unit_Pool_T = ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F"];
		_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_F"];
	};	
//-------------------------------------------------------------------------------------------------
// OPFOR - RHS AFRF, MSV FLORA
	case 13:{
		_Unit_Pool_S = ["rhs_msv_crew","rhs_pilot","rhs_msv_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner","rhs_msv_rifleman","rhs_msv_grenadier","rhs_msv_grenadier","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_medic","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_engineer","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_LAT","rhs_msv_LAT","rhs_msv_rifleman","rhs_msv_junior_sergeant","rhs_msv_junior_sergeant"];
		_Unit_Pool_V = ["rhs_tigr_msv","rhs_btr70_msv","rhs_tigr_msv","rhs_btr70_msv","rhs_tigr_msv"];
		_Unit_Pool_T = ["rhs_btr80_msv","rhs_bmp2_msv","rhs_btr80_msv","rhs_bmp2_msv","rhs_btr80_msv"];
		_Unit_Pool_A = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
	};	
//-------------------------------------------------------------------------------------------------
// OPFOR - RHS AFRF, MSV EMR
	case 14:{
		_Unit_Pool_S = ["rhs_msv_emr_crew","rhs_pilot","rhs_msv_emr_sergeant","rhs_msv_emr_machinegunner","rhs_msv_emr_machinegunner","rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_grenadier","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_medic","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_engineer","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_LAT","rhs_msv_emr_LAT","rhs_msv_emr_rifleman","rhs_msv_emr_junior_sergeant","rhs_msv_emr_junior_sergeant"];
		_Unit_Pool_V = ["rhs_tigr_msv","rhs_btr70_msv","rhs_tigr_msv","rhs_btr70_msv","rhs_tigr_msv"];
		_Unit_Pool_T = ["rhs_btr80_msv","rhs_bmp2_msv","rhs_btr80_msv","rhs_bmp2_msv","rhs_btr80_msv"];
		_Unit_Pool_A = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
	};	
//-------------------------------------------------------------------------------------------------
// OPFOR - RHS AFRF, VDV EMR
	case 15:{
		_Unit_Pool_S = ["rhs_vdv_crew","rhs_pilot","rhs_vdv_sergeant","rhs_vdv_machinegunner","rhs_vdv_machinegunner","rhs_vdv_rifleman","rhs_vdv_grenadier","rhs_vdv_grenadier","rhs_vdv_rifleman","rhs_vdv_rifleman","rhs_vdv_medic","rhs_vdv_rifleman","rhs_vdv_rifleman","rhs_vdv_engineer","rhs_vdv_rifleman","rhs_vdv_rifleman","rhs_vdv_LAT","rhs_vdv_LAT","rhs_vdv_rifleman","rhs_vdv_junior_sergeant","rhs_vdv_junior_sergeant"];
		_Unit_Pool_V = ["rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv"];
		_Unit_Pool_T = ["rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv"];
		_Unit_Pool_A = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
	};
//-------------------------------------------------------------------------------------------------
// OPFOR - RHS AFRF, VDV FLORA
	case 16:{
		_Unit_Pool_S = ["rhs_vdv_flora_crew","rhs_pilot","rhs_vdv_flora_sergeant","rhs_vdv_flora_machinegunner","rhs_vdv_flora_machinegunner","rhs_vdv_flora_rifleman","rhs_vdv_flora_grenadier","rhs_vdv_flora_grenadier","rhs_vdv_flora_rifleman","rhs_vdv_flora_rifleman","rhs_vdv_flora_medic","rhs_vdv_flora_rifleman","rhs_vdv_flora_rifleman","rhs_vdv_flora_engineer","rhs_vdv_flora_rifleman","rhs_vdv_flora_rifleman","rhs_vdv_flora_LAT","rhs_vdv_flora_LAT","rhs_vdv_flora_rifleman","rhs_vdv_flora_junior_sergeant","rhs_vdv_flora_junior_sergeant"];
		_Unit_Pool_V = ["rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv"];
		_Unit_Pool_T = ["rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv"];
		_Unit_Pool_A = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
	};	
//-------------------------------------------------------------------------------------------------
// OPFOR - RHS AFRF, VDV MOUNTAIN FLORA
	case 17:{
		_Unit_Pool_S = ["rhs_vdv_mflora_crew","rhs_pilot","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_medic","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_engineer","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_LAT","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_junior_sergeant"];
		_Unit_Pool_V = ["rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv","rhs_btr70_vdv","rhs_tigr_vdv"];
		_Unit_Pool_T = ["rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv","rhs_bmd1","rhs_btr80_vdv"];
		_Unit_Pool_A = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
	};
//-------------------------------------------------------------------------------------------------
// OPFOR - FIA
	case 18:{
		_Unit_Pool_S = ["O_crew_F","O_Pilot_F","O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_F","O_G_Soldier_GL_F","O_G_Soldier_GL_F","O_G_Soldier_F","O_G_Soldier_F","O_G_medic_F","O_G_Soldier_AR_F","O_G_Soldier_F","O_G_Soldier_GL_F","O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_F","O_G_Soldier_TL_F","O_G_Soldier_TL_F"];
		_Unit_Pool_V = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F"];
		_Unit_Pool_T = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_F"];
		_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_F"];
	};	
//-------------------------------------------------------------------------------------------------
// INDFOR - AAF
	case 19:{
		_Unit_Pool_S = ["I_crew_F","I_Helipilot_F","I_Soldier_SL_F","I_soldier_AR_F","I_soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_soldier_GL_F","I_Soldier_F","I_Soldier_F","I_medic_F","I_Soldier_F","I_Soldier_F","I_soldier_repair_F","I_Soldier_F","I_Soldier_F","I_soldier_LAT_F","I_soldier_LAT_F","I_soldier_lite_F","I_soldier_TL_F","I_soldier_TL_F"];
		_Unit_Pool_V = ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
		_Unit_Pool_T = ["I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
		_Unit_Pool_A = ["I_Heli_light_03_unarmed_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_unarmed_F"];
	};  
//-------------------------------------------------------------------------------------------------
// INDFOR - AFRICAN PARAMILITARY
	case 20:{
		_Unit_Pool_S = ["AFR_PARAMIL_R_AKS74","AFR_PARAMIL_R_AKS74","AFR_PARAMIL_SQL_AEK","AFR_PARAMIL_AR_RPK47","AFR_PARAMIL_AR_RPK47","AFR_PARAMIL_R_AK47","AFR_PARAMIL_GL_AKS74","AFR_PARAMIL_GL_AKS74","AFR_PARAMIL_R_AK74","AFR_PARAMIL_R_AK74","AFR_PARAMIL_MED_AK12","AFR_PARAMIL_GL_AKS74","AFR_PARAMIL_GL_AKS74","AFR_PARAMIL_MG_M60","AFR_PARAMIL_R_AK74","AFR_PARAMIL_R_AK74","AFR_PARAMIL_R_AKS74LAT","AFR_PARAMIL_R_AKS74LAT","AFR_PARAMIL_R_ENGAKS74U","AFR_PARAMIL_SQL_AK12","AFR_PARAMIL_SQL_AK12"];
		_Unit_Pool_V = ["afr_para_mil_cars_Hilux_Unarmed","afr_para_mil_cars_Hilux_MG","afr_para_mil_cars_Hilux_Unarmed","afr_para_mil_cars_Hilux_AGS30","afr_para_mil_cars_Hilux_Unarmed","afr_para_mil_cars_UAZ","afr_para_mil_cars_UAZ_MG","afr_para_mil_cars_UAZ","afr_para_mil_cars_UAZ_AGS30","afr_para_mil_cars_UAZ"];
		_Unit_Pool_T = ["AFR_PARA_BMP1_01","AFR_PARA_BMP2_01","AFR_PARA_BMP1_01","AFR_PARA_BMP1_01"];
		_Unit_Pool_A = [];
	};  
//-------------------------------------------------------------------------------------------------
// INDFOR - EUROPEAN PARAMILITARY
	case 21:{
		_Unit_Pool_S = ["EURO_PARAMIL_R_AKS74","EURO_PARAMIL_R_AKS74","EURO_PARAMIL_SQL_AEK","EURO_PARAMIL_AR_RPK47","EURO_PARAMIL_AR_RPK47","EURO_PARAMIL_R_AK47","EURO_PARAMIL_GL_AKS74","EURO_PARAMIL_GL_AKS74","EURO_PARAMIL_R_AK74","EURO_PARAMIL_R_AK74","EURO_PARAMIL_MED_AK12","EURO_PARAMIL_GL_AKS74","EURO_PARAMIL_GL_AKS74","EURO_PARAMIL_MG_M60","EURO_PARAMIL_R_AK74","EURO_PARAMIL_R_AK74","EURO_PARAMIL_R_AKS74LAT","EURO_PARAMIL_R_AKS74LAT","EURO_PARAMIL_R_ENGAKS74U","EURO_PARAMIL_SQL_AK12","EURO_PARAMIL_SQL_AK12"];
		_Unit_Pool_V = ["euro_para_mil_cars_Hilux_Unarmed","euro_para_mil_cars_Hilux_MG","euro_para_mil_cars_Hilux_Unarmed","euro_para_mil_cars_Hilux_AGS30","euro_para_mil_cars_Hilux_Unarmed","euro_para_mil_cars_UAZ","euro_para_mil_cars_UAZ_MG","euro_para_mil_cars_UAZ","euro_para_mil_cars_UAZ_AGS30","euro_para_mil_cars_UAZ"];
		_Unit_Pool_T = ["EURO_PARA_BMP1_01","EURO_PARA_BMP2_01","EURO_PARA_BMP1_01","EURO_PARA_BMP1_01"];
		_Unit_Pool_A = [];
	};  
//-------------------------------------------------------------------------------------------------
// INDFOR - EASTERN PARAMILITARY
	case 22:{
		_Unit_Pool_S = ["EAST_PARAMIL_R_AKS74","EAST_PARAMIL_R_AKS74","EAST_PARAMIL_SQL_AEK","EAST_PARAMIL_AR_RPK47","EAST_PARAMIL_AR_RPK47","EAST_PARAMIL_R_AK47","EAST_PARAMIL_GL_AKS74","EAST_PARAMIL_GL_AKS74","EAST_PARAMIL_R_AK74","EAST_PARAMIL_R_AK74","EAST_PARAMIL_MED_AK12","EAST_PARAMIL_GL_AKS74","EAST_PARAMIL_GL_AKS74","EAST_PARAMIL_MG_M60","EAST_PARAMIL_R_AK74","EAST_PARAMIL_R_AK74","EAST_PARAMIL_R_AKS74LAT","EAST_PARAMIL_R_AKS74LAT","EAST_PARAMIL_R_ENGAKS74U","EAST_PARAMIL_SQL_AK12","EAST_PARAMIL_SQL_AK12"];
		_Unit_Pool_V = ["east_para_mil_cars_Hilux_Unarmed","east_para_mil_cars_Hilux_MG","east_para_mil_cars_Hilux_Unarmed","east_para_mil_cars_Hilux_AGS30","east_para_mil_cars_Hilux_Unarmed","east_para_mil_cars_UAZ","east_para_mil_cars_UAZ_MG","east_para_mil_cars_UAZ","east_para_mil_cars_UAZ_AGS30","east_para_mil_cars_UAZ"];
		_Unit_Pool_T = ["EAST_PARA_BMP1_01","EAST_PARA_BMP2_01","EAST_PARA_BMP1_01","EAST_PARA_BMP1_01"];
		_Unit_Pool_A = [];
	};  
//-------------------------------------------------------------------------------------------------
// Civilians 
	case 23:{
		_Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
		_Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
		_Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
		_Unit_Pool_A = [];
	};
//-------------------------------------------------------------------------------------------------
  Default {
    if(DAC_Basic_Value != 5) then {
      DAC_Basic_Value = 5;
	  publicVariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if (count _this == 2) then {
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
} else {
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray