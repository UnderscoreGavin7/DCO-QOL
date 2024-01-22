//Creator: _Gavin

//----------------------------------------------------------------//
//DCO-QOL Unit Death Counter
//----------------------------------------------------------------//

bluforDeaths = 0;
opforDeaths = 0;
indforDeaths = 0;
civilianDeaths = 0;

{
	if((side _x) == WEST) 
	then {
		_x addEventHandler [
			"Killed",
			{
				bluforDeaths = bluforDeaths + 1; 
			}
		];
	};

	if ((side _x) == EAST) 
	then {
		_x addEventHandler [
			"Killed",
			{
				opforDeaths = opforDeaths + 1;
			}
		];	
	};

	if ((side _x) == independent) 
	then {
		_x addEventHandler [
			"Killed",
			{
				indforDeaths = indforDeaths + 1;
			}
		];	
	};

	if ((side _x) == civilian) 
	then {
		_x addEventHandler [
			"Killed",
			{
				civilianDeaths = civilianDeaths + 1;
			}
		];	
	};

} forEach allUnits;


deathCount = {
	hint format [
		"Blufor: %1\nOpfor: %2\nIndependent: %3\nCivilian: %4",
		str bluforDeaths,
		str opforDeaths,
		str indforDeaths,
		str civilianDeaths
	];
};
