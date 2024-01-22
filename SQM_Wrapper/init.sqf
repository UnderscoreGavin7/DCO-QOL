//Creator: _Gavin
#define Loop while {true} do 

//----------------------------------------------------------------//
//CBA Options
//----------------------------------------------------------------//

[
    "leaderMarkerBool", 		    // Internal setting name
    "CHECKBOX", 					// setting type
    "Enable Leader BFT Action",     // Pretty name 
    "DCO Extras: QOL Settings", 	// Pretty name of the category 
    [true], 		                // data 
    false, 						    // "_isGlobal" flag
    {  
        params ["_value"];
    }, 							    // Statement
    true
] call CBA_fnc_addSetting;      //leaderMarkerBool

[
    "leaderMarkerAceBool", 		    // Internal setting name
    "CHECKBOX", 					// setting type
    "Enable Leader BFT Ace Action", // Pretty name 
    "DCO Extras: QOL Settings", 	// Pretty name of the category 
    [true], 		                // data 
    false, 						    // "_isGlobal" flag
    {  
        params ["_value"];
    }, 							    // Statement
    true
] call CBA_fnc_addSetting;      //leaderMarkerAceBool

[
    "wpMarkerBool", 		            // Internal setting name
    "CHECKBOX", 					    // setting type
    "Enable Current Waypoint Marker", 	// Pretty name 
    "DCO Extras: QOL Settings", 		// Pretty name of the category 
    [true], 		                    // data 
    false, 						        // "_isGlobal" flag
    {  
        params ["_value"];
    }, 							        // Statement
    true
] call CBA_fnc_addSetting;      //wpMarkerBool

[
    "wpMarkerObjectBool", 		                // Internal setting name
    "CHECKBOX", 					            // setting type
    "Enable Current Waypoint VR Object Marker", // Pretty name 
    "DCO Extras: QOL Settings", 		        // Pretty name of the category 
    [true], 		                            // data 
    false, 						                // "_isGlobal" flag
    {  
        params ["_value"];
    }, 							                // Statement
    true
] call CBA_fnc_addSetting;      //wpMarkerObjectBool

[
    "leaderSleepConfig", 		    // Internal setting name
    "SLIDER", 					    // setting type
    "Leader Marker Time-On-Map", 	// Pretty name 
    "DCO Extras: QOL Settings", 	// Pretty name of the category 
    [
        0, 
        60, 
        15, 
        0
    ], 		                        // data 
    true, 						    // "_isGlobal" flag
    {  
        params ["_value"];
    } 							    // Statement
] call CBA_fnc_addSetting;      //leaderSleepConfig

[
    "leaderDistanceConfig", 		    // Internal setting name
    "SLIDER", 					        // setting type
    "Leader BFT Action Init Distance", 	// Pretty name 
    "DCO Extras: QOL Settings", 		// Pretty name of the category 
    [
        0, 
        500, 
        100, 
        0
    ], 		                            // data 
    true, 						        // "_isGlobal" flag
    {  
        params ["_value"];
    } 							        // Statement
] call CBA_fnc_addSetting;      //leaderDistanceConfig

[
    "leaderMarkerConfig", 		// Internal setting name
    "EDITBOX", 					// setting type
    "Leader Marker Type", 		// Pretty name 
    "DCO Extras: QOL Settings", // Pretty name of the category 
    ["b_unknown"], 		        // data 
    false, 						// "_isGlobal" flag
    {  
        params ["_value"];
    }, 							// Statement
    true
] call CBA_fnc_addSetting;      //leaderMarkerConfig

[
    "wpMarkerConfig", 		    // Internal setting name
    "EDITBOX", 					// setting type
    "Waypoint Marker Type", 	// Pretty name 
    "DCO Extras: QOL Settings", // Pretty name of the category 
    ["mil_marker"], 		    // data 
    false, 						// "_isGlobal" flag
    {  
        params ["_value"];
    }, 							// Statement
    true
] call CBA_fnc_addSetting;      //wpMarkerConfig

//----------------------------------------------------------------//
//CBA Options End
//----------------------------------------------------------------//



//----------------------------------------------------------------//
//Module Execution
//----------------------------------------------------------------//

null = [
	leaderMarkerBool, 
    leaderMarkerAceBool,
	leaderMarkerConfig, 
	leaderDistanceConfig, 
	leaderSleepConfig
] execVM "Mod\leaderMarker.sqf";

null = [] execVM "Mod\sideDeathCount.sqf";

null = [] execVM "Mod\unitShutterUpper.sqf";

null = [
	wpMarkerBool, 
	wpMarkerObjectBool,
	wpMarkerConfig
] execVM "Mod\waypointMarker.sqf";


//----------------------------------------------------------------//
//LOOP
//----------------------------------------------------------------//


Loop {
    sleep 2;
};