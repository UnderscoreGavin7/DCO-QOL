//Creator: _Gavin 

//-----------------------------------------------------------------//
//DCO-QOL BFT Marker System 
//-----------------------------------------------------------------//

params [
	"_leaderMarkerBool", 
	"_leaderMarkerAceBool",
	"_leaderMarkerConfig", 
	"_leaderDistanceConfig", 
	"_leaderSleepConfig"
];

leaderMarkerBool = _leaderMarkerBool;
leaderMarkerAceBool = _leaderMarkerAceBool;
leaderMarkerConfig = _leaderMarkerConfig;
leaderDistanceConfig = _leaderDistanceConfig;
leaderSleepConfig = _leaderSleepConfig;


private _condition = "leaderMarkerBool && _target distance (leader group _target) > leaderDistanceConfig && !isNull(leader _target);";
private _title = "<t color='#72d15a'>Where are you Squad Leader?</t>";

statement = {
	_leaderPos = getPosATL (leader player); 
	(leader player) sideChat format [
		"I am currently at Grid Coordinates: 0%1,0%2", 
		floor (floor(_leaderPos #0)/100),
		floor (floor(_leaderPos #1)/100)
	];

	_leaderMarker = createMarkerLocal [
		"leaderMarker", 
		player
	];
	_leaderMarker setMarkerTypeLocal leaderMarkerConfig;
	_leaderMarker setMarkerTextLocal ( groupId (group player) + " SL");
	_leaderMarker setMarkerPosLocal leader player;
	sleep leaderSleepConfig;
	deleteMarkerLocal _leaderMarker;
};



_action = [
	"getSLPos", 															// Action Name
	"Where are you Squad Leader?", 											// Shown Name
	"", 																	// Icon
	{
		[] spawn statement;
	}, 																		// Code
	{
		leaderMarkerAceBool 
		&& _target distance (leader group _target) > leaderDistanceConfig 
		&& !isNull(leader _target)
	} 																		// Condition
] call ace_interact_menu_fnc_createAction;

[
	[									
		(typeOf player), 				// TypeOF
		1, 								// Type of action, 0 = actions, 1 = self-actions
		["ACE_SelfActions"], 			// Action Location
		_action 						// Ace Action
	],
	ace_interact_menu_fnc_addActionToClass
] remoteExec [
	"call", 
	0, 
	true
];

[
	player,
	[
		_title,     			// title
		{
			[] spawn statement;
		}, 						// statements
		nil,        			// arguments
		1.5,        			// priority
		false,      			// showWindow
		true,       			// hideOnUse
		"",         			// shortcut
		_condition, 			// condition
		1,          			// radius
		false,      			// unconscious
		"",         			// selection
		""          			// memoryPoint
	]
]
remoteExecCall [
	"addAction", 
	0, 
	true
];