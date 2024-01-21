//Creator: _Gavin

_bluforDeaths = 0;
_opforDeaths = 0;
_indforDeaths = 0;
_civilianDeaths = 0;
{
	if((side _x) == WEST) then {
		_x addEventHandler ["Killed",{
			_bluforDeaths = _bluforDeaths + 1; 
		}];
	};

	if ((side _x) == EAST) then {
		_x addEventHandler ["Killed",{
			_opforDeaths = _opforDeaths + 1;
		}];	
	};
	if ((side _x) == independent) then {
		_x addEventHandler ["Killed",{
			_indforDeaths = _indforDeaths + 1;
		}];	
	};
	if ((side _x) == civilian) then {
		_x addEventHandler ["Killed",{
			_civilianDeaths = _civilianDeaths + 1;
		}];	
	};

} forEach allUnits;


hint format ["Blufor: %1\nOpfor: %2\nIndependent: %3\nCivilian: %4",str _bluforDeaths,str _opforDeaths,str _indforDeaths,str _civilianDeaths];


deathArray = [_bluforDeaths,_opforDeaths,_indforDeaths,_civilianDeaths];

//player globalChat "false";