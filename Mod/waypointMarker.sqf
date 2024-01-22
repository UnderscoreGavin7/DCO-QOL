//Creator: _Gavin
params [
	"_wpMarkerBool", 
	"_wpMarkerObjectBool",
	"_wpMarkerConfig"
];
wpMarkerBool = _wpMarkerBool;
wpMarkerConfig = _wpMarkerConfig;
wpMarkerObjectBool = _wpMarkerObjectBool;

private _wpPosASL = ATLToASL getWPPos[ group player, currentWaypoint group player];
private _wpMarker = createMarkerLocal ["wpMarker", player];
private _vrMarkerWaypoint = createSimpleObject ["VR_3DSelector_01_incomplete_F", _wpPosASL , true];

_vrMarkerWaypoint hideObject true;
_wpMarker setMarkerTypeLocal _wpMarkerConfig;
_wpMarker setMarkerTextLocal "Current Waypoint";

_vrMarkerWaypoint setObjectScale 2;

//Waypoint Update loop
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