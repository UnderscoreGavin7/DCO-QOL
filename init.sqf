//Creator: _Gavin

//----------------------------------------------------------------//
//CBA Options
//----------------------------------------------------------------//

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
] call CBA_fnc_addSetting; //leaderMarkerBool

[
    "leaderMarkerAceBool", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", 					// setting type
    "Enable Leader BFT Ace Action", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [true], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting; //leaderMarkerAceBool

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
] call CBA_fnc_addSetting; //wpMarkerBool

[
    "wpMarkerObjectBool", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", 					// setting type
    "Enable Current Waypoint VR Object Marker", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [true], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting; //wpMarkerObjectBool

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
] call CBA_fnc_addSetting; //leaderSleepConfig

[
    "leaderDistanceConfig", 		// Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", 					// setting type
    "Leader BFT Action Init Distance", 			// Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "DCO Extras: QOL Settings", 		// Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 500, 100, 0], 		// data for this setting: [min, max, default, number of shown trailing decimals]
    false, 						// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } 							// function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting; //leaderDistanceConfig

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
] call CBA_fnc_addSetting; //leaderMarkerConfig

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
] call CBA_fnc_addSetting; //wpMarkerConfig

//----------------------------------------------------------------//
//CBA Options End
//----------------------------------------------------------------//

// 0	Action name	                                                                                STRING	 
// 1	Name of the action shown in the menu	                                                    STRING	 
// 2	Icon file path or Array of icon file path and hex color (“” for default icon)	            STRING	ARRAY
// 3	Statement	                                                                                CODE	 
// 4	Condition	                                                                                CODE	 
// 5	Insert children code	                                                                    CODE	{}
// 6	Action parameters	                                                                        ANY	[]
// 7	Position                                                                                    (Position array, Position code or Selection Name) , or	STRING	{[0, 0, 0]}
// 8	Distance	                                                                                NUMBER	2
// 9	Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS]	        ARRAY	all false
// 10	Modifier function	                                                                        CODE	{}

_condition = {
    true;
};
_statement = {
    hint "hi";
};


//----------------------------------------------------------------//
//Module Execution
//----------------------------------------------------------------//
null = [] execVM "Mod\unitShutterUpper.sqf";
_deaths = [] execVM "Mod\sideDeathCount.sqf";
null = [
	leaderDistanceConfig, 
	leaderMarkerConfig, 
	leaderMarkerBool, 
	wpMarkerBool, 
	wpMarkerConfig, 
	leaderSleepConfig,
	wpMarkerObjectBool,
    leaderMarkerAceBool
] execVM "Mod\bft_waypoint.sqf";

//----------------------------------------------------------------//
//LOOP
//----------------------------------------------------------------//

#define Loop while {true} do 

Loop {

};