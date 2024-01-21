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
	"_leaderSleepConfig"
];

leaderDistanceConfig = _leaderDistanceConfig;
leaderMarkerConfig = _leaderMarkerConfig;
leaderMarkerBool = _leaderMarkerBool;
wpMarkerConfig = _wpMarkerConfig;
wpMarkerBool = _wpMarkerBool;
leaderSleepConfig = _leaderSleepConfig;

private _condition = "leaderMarkerBool && _target distance (leader group _target) > leaderDistanceConfig && !isNull(leader _target);";
private _title = "<t color='#72d15a'>Where are you Squad Leader?</t>";

//Events
[
	player,
	[
		_title,     // title
		{
			_leaderPos = getPosATL (leader player); 
			(leader player) sideChat format["I am currently at Grid Coordinates: 0%1,0%2", floor (floor(_leaderPos #0)/100) ,floor (floor(_leaderPos #1)/100)];
			
			_leaderMarker = createMarker ["leaderMarker", player];
			_leaderMarker setMarkerType leaderMarkerConfig;
			_leaderMarker setMarkerText ( groupId (group player) + " SL");
			_leaderMarker setMarkerPos leader player;
			
			sleep leaderSleepConfig;
			deleteMarker _leaderMarker;
		
		},
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

_wpMarker = createMarker ["wpMarker", player];
_wpMarker setMarkerType _wpMarkerConfig;
_wpMarker setMarkerText "Current Waypoint";

//Waypoint Update LOOP

while {wpMarkerBool} do {

	sleep 1;

	_posWP = getWPPos [(group player), (currentWaypoint (group player))];
	_wpMarker setMarkerPos _posWP;

	if (_posWP #0 == 0 && _posWP #1== 0) then {
		_wpMarker setMarkerAlpha 0;
	}
	else {
		_wpMarker setMarkerAlpha 1;
	}

};