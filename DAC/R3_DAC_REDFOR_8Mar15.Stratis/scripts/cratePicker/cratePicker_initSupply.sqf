/* 
Crate Filler Script
by AGeNT

- Designed to fill the ACE Empty Boxes with supplies to be dropped.
- Current Selections: plthq, section, rifle, ar, mmg, hmg, lat, mat, hat, explosives, pltmeds, secmeds
*/ 

// define variables
private ["_flag"];

_flag = _this select 0;
r_cratePicker_spawnCrateOption = _flag addaction ["<t color='#dddd00'>" + "Spawn Crate" + "</t>","scripts\cratePicker\cratePicker_options.sqf",[],6,true,false,"",""];