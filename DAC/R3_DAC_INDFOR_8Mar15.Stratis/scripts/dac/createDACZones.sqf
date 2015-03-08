// Headless Client DAC Initalisation Script
// by Mr. Agnet
// Creates the DAC zones that should be present at the beginning of the mission.
// Usage: [] execVM "scripts\dac\createDACZones.sqf"
// ========================================================
// - This is an alternative to spawning the zones through spawnDACZones.sqf. Creates the trigger from scratch at a defined point, using marker positions.
// - Make sure you set them to disabled, i.e. the second array parameter, of the second array parameter to 1.
// - This allows you to activate zones as they become necessary, via trigger. Reference the example trigger in the framework.

_westHQ = createCenter west;
_eastHQ = createCenter east;
_guerHQ = createCenter resistance;
_civHQ  = createCenter civilian;
_emptyHQ = createCenter civilian;
_createdTriggers = [];

// For example:
// exampleZone = createTrigger["EmptyDetector", (getMarkerPos "zonePos_exampleZone")];
// exampleZone setTriggerArea[100, 100, 0, true];
// exampleZone setTriggerActivation["NONE", "PRESENT", true];
// exampleZone setTriggerStatements["true", "exampleZoneDAC = [""exampleZone"",[1,1,0],[5,3,5,20],[2,2,5,20],[],[],[0,1,0,0,0]]spawn DAC_Zone", ""];
// exampleZone setTriggerTimeout[0, 0, 0, false];
// _createdTriggers = _createdTriggers + [exampleZone];











// return all created triggers in an array
[ _createdTriggers];