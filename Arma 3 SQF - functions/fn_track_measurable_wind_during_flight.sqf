/*
 *	REQUIRES ACE3
 *
 *	Author: P1ker / Ari Hietanen
 *
 *	Purpose:
 *	This script was created to study wind mechanics in modded Arma.
 *
 *	Description + information about SQF:
 *
 *	This function is a script ran by an event handler --> the parameters are 
 *	automatically gathered by the EH in this case and stored to _this
 *
 *	Function calculates the wind speed every 0.01 seconds at the location of a 
 *	bullet fired from the gun of the player and writes the wind speed down (row 45)
 *	At the end the function calculates the average wind speed, the frequency 
 *	of "no wind" and the altitudes above the ground level.
 *
 *
 *	Parameters:
 *	0: OBJECT - The unit who fires a bullet
 *	1: OBJECT - The bullet
 *
 *	Returns:
 *	Nil
 */


private ["_unit", "_bullet"];  
_unit = _this select 0;  
_bullet = _this select 6;  
private _windSpeeds = [];  
private _altitudesInWhichWindAffects =[]; 
  
while {alive _bullet} do   
{  
 sleep 0.01; 
 _windSpeeds pushBack ([getPos _bullet, true, true, true] call ace_weather_fnc_calculateWindSpeed);
 systemChat str ([getPos _bullet, true, true, true] call ace_weather_fnc_calculateWindSpeed);
 if ([getPos _bullet, true, true, true] call ace_weather_fnc_calculateWindSpeed >0) then {
	_altitudesInWhichWindAffects pushBack ((getPosATL _bullet) select 2)
 }
 //diag_log ([getPos _bullet, true, true, true] call ace_weather_fnc_calculateWindSpeed);
 //diag_log (getPos _bullet select 2);
}; 

// Display the mean of the wind speeds
systemChat ("Average wind speed of all values = "
	+str (_windSpeeds call BIS_fnc_arithmeticMean));
	
// Calculate the amount of zeros out of all values
systemChat ("Out of "
	+str (count _windSpeeds )+" values "
	+str ({_x == 0} count _windSpeeds)+" were 0. Thus "
	+str (({_x == 0} count _windSpeeds)/(count _windSpeeds))+" were = 0");
	
// Average on non-zeros
systemChat ("The Average of the "
	+ str ({_x != 0} count _windSpeeds)+" values that weren't 0, is "
	+ str ((_windSpeeds select {_x != 0}) call BIS_fnc_arithmeticMean)+"m/s");

// The first altitudes where 
systemChat ("The first altitudes above terrain level when wind affected the bullet are "
	+str (_altitudesInWhichWindAffects select 0)+" and "
	+str (_altitudesInWhichWindAffects select 1)+" and "
	+str (_altitudesInWhichWindAffects select 2));
