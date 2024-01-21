//Creator: _Gavin 

//-----------------------------------------------------------------//
//BASIC DCO BFT & Waypoint Marker System 
//-----------------------------------------------------------------//

private _condition = "_target distance (leader group _target) > 100 && !isNull(leader player);";
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
			_leaderMarker setMarkerType "b_unknown";
			_leaderMarker setMarkerText ( groupId (group player) + " SL");
			_leaderMarker setMarkerPos leader player;
			sleep 15;
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
_wpMarker setMarkerType "mil_marker";
_wpMarker setMarkerText "Current Waypoint";

//MAIN LOOP

while {true} do {

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