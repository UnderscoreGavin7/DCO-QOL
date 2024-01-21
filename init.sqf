//Creator: _Gavin
#define Loop while {true} do 

[
    "leaderDistanceConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", 					// setting type
    "Leader Distance", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 500, 100, 0], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    true, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "leaderMarkerConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", 					// setting type
    "Leader Marker Type", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["b_unknown"], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    true, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "wpMarkerConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", 					// setting type
    "Waypoint Marker Type", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["mil_marker"], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    true, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

//Executions
execVM "Mod\unitShutterUpper.sqf";
_deaths = [] execVM "Mod\sideDeathCount.sqf";
hint str [leaderDistanceConfig,leaderMarkerConfig,wpMarkerConfig];
 null = [leaderDistanceConfig,leaderMarkerConfig,wpMarkerConfig] execVM "Mod\bft_waypoint.sqf";

//----------------------------------------------------------------//
//LOOP
//----------------------------------------------------------------//

// Loop {

// };