//Creator: _Gavin 

//-----------------------------------------------------------------//
//BASIC DCO BFT & Waypoint Marker System 
//-----------------------------------------------------------------//

params [
	"_leaderDistanceConfig", 
	"_leaderMarkerConfig", 
	"_leaderMarkerBool", 
	"_wpMarkerBool", 
	"_wpMarkerConfig", 
	"_leaderSleepConfig",
	"_wpMarkerObjectBool",
	"_leaderMarkerAceBool"
];

leaderDistanceConfig = _leaderDistanceConfig;
leaderMarkerConfig = _leaderMarkerConfig;
leaderMarkerBool = _leaderMarkerBool;
wpMarkerConfig = _wpMarkerConfig;
wpMarkerBool = _wpMarkerBool;
leaderSleepConfig = _leaderSleepConfig;
wpMarkerObjectBool = _wpMarkerObjectBool;
leaderMarkerAceBool = _leaderMarkerAceBool;
/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
/*
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Parent path of the new action <ARRAY>
 * 3: Action <ARRAY>
 * 4: Use Inheritance (Default: False) <BOOL><OPTIONAL>
 */

private _condition = "leaderMarkerBool && _target distance (leader group _target) > leaderDistanceConfig && !isNull(leader _target);";
private _title = "<t color='#72d15a'>Where are you Squad Leader?</t>";
private statement = 
{
	_leaderPos = getPosATL (leader player); 
	(leader player) sideChat format["I am currently at Grid Coordinates: 0%1,0%2", floor (floor(_leaderPos #0)/100) ,floor (floor(_leaderPos #1)/100)];

	_leaderMarker = createMarkerLocal ["leaderMarker", player];
	_leaderMarker setMarkerTypeLocal leaderMarkerConfig;
	_leaderMarker setMarkerTextLocal ( groupId (group player) + " SL");
	_leaderMarker setMarkerPosLocal leader player;
	sleep leaderSleepConfig;
	deleteMarkerLocal _leaderMarker;
};
_action = 
[
	"getSLPos", // Action Name
	"Where are you Squad Leader?", // Shown Name
	"", // Icon
	{
		[] spawn statement;
	}, // statement
	{leaderMarkerAceBool && _target distance (leader group _target) > leaderDistanceConfig && !isNull(leader _target)} // Condition
] call ace_interact_menu_fnc_createAction;

[
	(typeOf player), // TypeOF
	1, // Type of action, 0 for actions, 1 for self-actions
	["ACE_SelfActions"], // Action Location
	_action // Ace Action
] call ace_interact_menu_fnc_addActionToClass;

[
	player,
	[
		_title,     // title
		{
			_leaderPos = getPosATL (leader player); 
			(leader player) sideChat format["I am currently at Grid Coordinates: 0%1,0%2", floor (floor(_leaderPos #0)/100) ,floor (floor(_leaderPos #1)/100)];
			
			_leaderMarker = createMarkerLocal ["leaderMarker", player];
			_leaderMarker setMarkerTypeLocal leaderMarkerConfig;
			_leaderMarker setMarkerTextLocal ( groupId (group player) + " SL");
			_leaderMarker setMarkerPosLocal leader player;
			
			sleep leaderSleepConfig;
			deleteMarker _leaderMarker;
		},			// statement
		nil,        // arguments
		1.5,        // priority
		false,      // showWindow
		true,       // hideOnUse
		"",         // shortcut
		_condition, // condition
		1,          // radius
		false,      // unconscious
		"",         // selection
		""          // memoryPoint
	]
]
remoteExecCall ["addAction", 0, true];

//Variables
private _wpPosASL = ATLToASL getWPPos[ group player, currentWaypoint group player];
private _wpMarker = createMarkerLocal ["wpMarker", player];
private _vrMarkerWaypoint = createSimpleObject ["VR_3DSelector_01_incomplete_F", _wpPosASL , true];

_wpMarker setMarkerTypeLocal _wpMarkerConfig;
_wpMarker setMarkerTextLocal "Current Waypoint";

//_vrMarkerWaypoint = "VR_3DSelector_01_incomplete_F" createVehicleLocal getWPPos[ group player, currentWaypoint group player ];
_vrMarkerWaypoint setObjectScale 2;
// _vrMarkerWaypoint enableSimulation false;
// _vrMarkerWaypoint enableDynamicSimulation false;
//Waypoint Update LOOP

while {wpMarkerBool || wpMarkerObjectBool} do {

	sleep 1;

	_posWP = getWPPos [ group player, currentWaypoint group player ];
	if (wpMarkerBool) then {

		_wpMarker setMarkerPosLocal _posWP;
		if (_posWP #0 == 0 && _posWP #1== 0) then {	_wpMarker setMarkerAlphaLocal 0;}
		else {_wpMarker setMarkerAlphaLocal 1;};
		
	};
	if (wpMarkerObjectBool) then {

		_vrMarkerWaypoint setPosATL [ (_posWP #0),(_posWP #1), 3];
		if (_posWP #0 == 0 && _posWP #1== 0) then {_vrMarkerWaypoint hideObject true;}
		else {_vrMarkerWaypoint hideObject false;};

	};
	
};