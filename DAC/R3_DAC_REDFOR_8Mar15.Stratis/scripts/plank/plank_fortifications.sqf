// These are the available fortifications. Add or take as you wish.

// Action text      - The text displayed by the action
// Classname        - The classname of the object
// Distance         - Minimum distance of the object from the player, in metres
// Direction        - Direction the object will face, in degrees
// Direction range  - The range you can turn the object in degrees
// Code             - A piece of code that will be executed when the object placement is confirmed. Use {}, if you don't want to use it.
//                    The unit and object placed are passed as arguments to the code.

plank_deploy_fortData = [

// Action text					|  Classname				|  Distance		|  Direction     |  Direction Range  |  Code
//--------------------------------------------------------------------------------------------------------------------------------------
//["Action text",				"Classname",					Distance,		Direction,		Direction Range,	{Code}],
["Command Bunker",				"Fort_Barracks_USMC",			13,				180,			360,				{}],
["H-Barrier Tower",				"Land_HBarrierTower_F",			8.5,			180,			60,					{}],
["Sandbag Fence",				"Land_BagFence_Long_F",			4,				0,				360,				{}],
["Wide H-Barrier 5",			"Land_HBarrier_5_F",			7,				0,				360,				{}],
["Narrow Sandbag fence",		"Land_BagFence_Long_F",			3,				0,				360,				{}],
["Razor Wire",					"Fort_RazorWire",				6,				0,				360,				{}],
["H-Barrier",					"Land_HBarrier_5_F",			8,				0, 				360,				{}],
["Artillery Nest",				"Land_fort_artillery_nest",		6,				0,				60,					{}]

];
