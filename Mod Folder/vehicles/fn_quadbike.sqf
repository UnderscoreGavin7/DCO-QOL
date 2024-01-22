scriptName "fn_quadbike";
/*
	Author: Julien `Tom_48_97` VIDA

	Description:
	Apply a color to a quadbike

	Parameter(s):
	0 : Object - Quadbike
	1 : String - color
		Available colors are: black, blue, red, white

	Returns:
	NOTHING
*/

private ["_car", "_variant", "_result", "_color", "_colorList","_colorWheel"];

_car = 		param [0, false, [objNull]];
_variant = 	param [1, "NONE", [""]];

if (!(_car isKindOf "Quadbike_01_base_F")) exitWith {["%1 must be a Quadbike",_car] call BIS_fnc_error};

_colorList = [
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa"
];

_colorWheel = [
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa",
	"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"
];


_variant = toLower (_variant);
_variant = switch (_variant) do
{
    case "black":{0};
    case "blue"	:{1};
    case "red"	:{2};
    case "white":{3};
    default 	 {99};
};
if (_variant == 99) then {
	 _variant = 3;
	 ["%1: unknow variant OR color, white was selected as default",_variant] call BIS_fnc_error;
};
_car setObjectTextureGlobal [0, _colorList select _variant];
_car setObjectTextureGlobal [1, _colorWheel select _variant];