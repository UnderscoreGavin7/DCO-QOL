/*  */
#include "basicDefines_A3.hpp"
#include "cfgPatches.hpp"

class cfgFunctions
{
	class A3_samples
	{
		tag="BIS"; // Custom tag name
		class vehicles
		{
			file="Samples_F\Test_Functions_01\vehicles"; // function will be loaded from this folder.
			class quadbike {}; // [this, "black"] call BIS_fnc_quadbike;
		};
	};
	class myTag // project or person tag
	{
		class myCategory // This represent a group of function
		{
			file="Samples_F\Test_Functions_01\myCategory"; // Where my functions are
			class myFunction1 {}; // [] call myTag_fnc_myFunction1
			class myFunction2 {}; // [] call myTag_fnc_myFunction2
		};
		class myCategory2
		{
			file="Samples_F\Test_Functions_01\myCategory2";
			class myFunction3 {}; // [] call myTag_fnc_myFunction3
			class myFunction4 {}; // [] call myTag_fnc_myFunction4
			class myFunction5 // [] call myTag_fnc_myFunction5
			{
				description = "Function description"; // You can write some words about your fonction
				preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
				postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
				preStart = 1; // 1 to call the function upon game start, before title screen, but after all addons are loaded.
				recompile = 1; // 1 to recompile the function upon mission start
				ext = ".fsm"; // Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
				headerType = -1; // Set function header type: -1 - no header; 0 - default header; 1 - system header.
			};
		};
	};
};