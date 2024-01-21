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
			
			_leaderMarker = createMarkerLocal ["leaderMarker", player];
			_leaderMarker setMarkerTypeLocal leaderMarkerConfig;
			_leaderMarker setMarkerTextLocal ( groupId (group player) + " SL");
			_leaderMarker setMarkerPosLocal leader player;
			
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
private _wpPosASL = ATLToASL getWPPos[ group player, currentWaypoint group player];
private _wpMarker = createMarkerLocal ["wpMarker", player];
private _vrMarkerWaypoint = createSimpleObject ["VR_3DSelector_01_incomplete_F", _wpPosASL , true];

_wpMarker setMarkerTypeLocal _wpMarkerConfig;
_wpMarker setMarkerTextLocal "Current Waypoint";

//_vrMarkerWaypoint = "VR_3DSelector_01_incomplete_F" createVehicleLocal getWPPos[ group player, currentWaypoint group player ];
_vrMarkerWaypoint setObjectScale 2;
_vrMarkerWaypoint enableSimulation false;
_vrMarkerWaypoint enableDynamicSimulation false;
//Waypoint Update LOOP

while {wpMarkerBool} do {

	sleep 1;

	_posWP = getWPPos [ group player, currentWaypoint group player ];
	_vrMarkerWaypoint setPosATL [ (_posWP #0),(_posWP #1), 3];
	_wpMarker setMarkerPosLocal _posWP;

	if (_posWP #0 == 0 && _posWP #1== 0) then {
		_wpMarker setMarkerAlphaLocal 0;
		_vrMarkerWaypoint hideObject true;
	}
	else {
		_wpMarker setMarkerAlphaLocal 1;
		_vrMarkerWaypoint hideObject false;
	};
};