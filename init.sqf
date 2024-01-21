//Creator: _Gavin
#define Loop while {true} do 

[
    "leaderMarkerBool", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", 					// setting type
    "Enable Leader BFT Action", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [true], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "wpMarkerBool", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", 					// setting type
    "Enable Current Waypoint Marker", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [true], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "leaderMarkerActiveUpdateBool", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", 					// setting type
    "Enable Leader Marker Active Update", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [true], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;


[
    "leaderActiveUpdateInterval", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", 					// setting type
    "Leader Active Update Interval", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.1, 5, 0.2, 1], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "leaderSleepConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", 					// setting type
    "Leader Marker Time-On-Map", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 60, 15, 0], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
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
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "leaderDistanceConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", 					// setting type
    "Leader Action Init Distance", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 500, 100, 0], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
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
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;


//Executions
execVM "Mod\unitShutterUpper.sqf";
_deaths = [] execVM "Mod\sideDeathCount.sqf";
null = [
	leaderDistanceConfig, 
	leaderMarkerConfig, 
	leaderMarkerBool, 
	wpMarkerBool, 
	wpMarkerConfig, 
	leaderSleepConfig, 
	leaderMarkerActiveUpdateBool,
	leaderActiveUpdateInterval,
] execVM "Mod\bft_waypoint.sqf";
//d
//----------------------------------------------------------------//
//LOOP
//----------------------------------------------------------------//

Loop {

};