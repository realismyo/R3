// Headless Client DAC Initialisation Script
// By Mac/Mr. Agnet
// Spawns all the mission's DAC zones. This should be run from the init.sqf file
// Note that the headless client check is done in the init.sqf
// Usage: [] execVM "scripts\dac\spawnDACZones.sqf"
// ========================================================
// - This is where you put all of the DAC mission zones calls. 
// - Follows the standard DAC zone call, just isn't placed in the trigger's On Act field. 
// - Make sure you set them to disabled, i.e. the second array parameter, of the second array parameter to 1.
// - This allows you to activate zones as they become necessary, via trigger. Reference the example trigger in the framework.

// For example:
// _nil = ["exampleZone",[1,1,0],[4,1,10,10],[2,1,10,10],[],[],[1,4,6,0,4]] spawn DAC_Zone; 

