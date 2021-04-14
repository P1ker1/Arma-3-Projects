/*
 * REQUIRES ACE3
 *
 * Author: P1ker / Ari Hietanen
 * 
 * Displays the wind values at player's position, e.g. true wind speed, 
 * sensed = measurable wind speed, respective crosswind- and headwind values
 * 
 * Return Value:
 * True Crosswind <NUMBER>
 *
 * Example:
 * execVM "fn_display_wind_info_at_plr_pos.sqf";
 * ^ Requires the .sqf to be in the mission folder
 */

// If in multiplayer, remember to execute locally on an unit if you want to avoid from adding the action to every player entity

private _ownWS = [eyePos ACE_player, true, true, true] call ace_weather_fnc_calculateWindSpeed; 
private _trueWS = vectorMagnitude wind;  

private _wd = abs((ACE_player call CBA_fnc_headDir select 0) - windDir);  
if (_wd > 90) then {
	_wd = abs(_wd-180);
};
private _truecwspeed = sin(_wd) * (_trueWS);
private _senscwspeed = sin(_wd) * (_ownWS);

private _truehwspeed = cos(_wd) * (_trueWS);
private _senshwspeed = cos(_wd) * (_ownWS); 

// Displays a text box with formatted info based on values defined above
hint composeText
[
	format ["Player's direction: " + str(getDir player)],
	lineBreak,
	format ["Wind's direction: "+ str(abs(180-windDir))],
	lineBreak,
	format["Delta from wind dir (+-):  " + str(_wd)],
	lineBreak,
	lineBreak,
	format ["Sensed wind: %1", _ownWS],
	lineBreak,
	format["True wind: %1", _trueWS],
	lineBreak,
	format["Sensed/True: %1", _ownWS/_trueWS],
	lineBreak,
	format["True_HW/True_Full: %1", _truehwspeed/_trueWS],
	lineBreak,
	lineBreak,
	format["True Crosswind:  " + str(_truecwspeed)],
	lineBreak,
	format["Sensed Crosswind:  " + str(_senscwspeed)],
	lineBreak,
	lineBreak,
	format["True Headwind:  " + str(_truehwspeed)],
	lineBreak,
	format["Sensed Headwind:  " + str(_senshwspeed)]
];

_truecwspeed
