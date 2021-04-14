/*
 * Author: P1ker / Ari Hietanen
 * Calculates the offset between the impact of the bullet and the position aimed at when the weapon was fired
 * from the shooter's point of view.
 * The output is divided in vertical and horizontal components.
 *
 * Arguments (from Fired EH) https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Fired:
 * unit: Object - Object the event handler is assigned to
 * weapon: String - Fired weapon
 * muzzle: String - Muzzle that was used
 * mode: String - Current mode of the fired weapon
 * ammo: String - Ammo used
 * magazine: String - magazine name which was used
 * projectile: Object - Object of the projectile that was shot out
 * gunner: Object - gunner whose weapons are firing.
 * 
 * Return Value:
 * <ARRAY> [Horizontal(wind) offset in mrads <NUMBER>, Vertical(elevation) offset in mrads <NUMBER>]
 *
 * Example:
 * this addEventHandler ["fired", {_this execVM "fn_calculate_bullet_offset.sqf"}];
 * ^ Requires the .sqf to be in the mission folder
 */
 
params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
private "_impact_pos";  // Will get set after the flight of the bullet has ended
private _firing_pos = eyePos _gunner;

// The first closest surface the player is aiming at. 
// screenToWorld didn't work as smoothly
private _target_pos = (lineIntersectsSurfaces [
	AGLToASL positionCameraToWorld [0,0,0], 
	AGLToASL positionCameraToWorld [0,0,3000], 
	player, 
	objNull, 
	true, 
	2,
	"FIRE", 
	"VIEW", 
	true]) select 0 select 0;

// Problematic target position --> Return [0,0]
if (isNil "_target_pos") then {
	_target_pos = [0,0,0];
	hintSilent "Faulty target position received.";
	[0,0]
};

private _start_to_target = _target_pos vectorDiff _firing_pos;

// The impact position is figured by the 
private _previous_speed = speed _projectile;
private _min_ratio = (speed _projectile)/_previous_speed;

waitUntil {
	if (getPos _projectile select 0 != 0) then {
		_impact_pos = getPosASL _projectile;
		// systemChat str("Impact pos set to" + str(_impact_pos));
	};
	_min_ratio = (speed _projectile)/_previous_speed;
	_previous_speed = speed _projectile;
	getPos _projectile select 0 == 0 || (_min_ratio < 0.99);
};


private _start_to_impact = _impact_pos vectorDiff _firing_pos;

// Setting the horizontal component = Wind hold with dot product
private _projection_coefficient = (_start_to_target vectorDotProduct _start_to_impact)/((vectorMagnitude _start_to_impact)^2);
private _projection = _start_to_impact vectorMultiply _projection_coefficient;

private _horiz_offset_in_meters = _projection distance2d _start_to_target;
private _horiz_offset_in_mrads = _horiz_offset_in_meters/(0.001*(_firing_pos distance _target_pos));


// Delving into the inclination angle / azimuth...
// Sure, there are few additional variables, but it should be easier to follow at least :)
private _ffp_altitude = _firing_pos select 2;  // ffp -> forward firing position
private _target_altitude = _target_pos select 2;
private _impact_altitude = _impact_pos select 2;

private _d_h_ffp_tgt = _target_altitude - _ffp_altitude;
private _d_h_ffp_imp = _impact_altitude - _ffp_altitude;

// We have the opposite cathetus and hypotenuse
// getting the difference from plane in mrads for both impact and target
private _d_angle_ffp_tgt = 1000 * (rad asin(_d_h_ffp_tgt/(vectorMagnitude _start_to_target)));
private _d_angle_ffp_imp = 1000 * (rad asin(_d_h_ffp_imp/(vectorMagnitude _start_to_impact)));

private _vert_offset_in_meters = _d_h_ffp_imp - _d_h_ffp_tgt;
private _vert_offset_in_mrads = _d_angle_ffp_imp - _d_angle_ffp_tgt;

hintSilent composeText
[
	/* Commenting unnecessary debug prints out
	format ["_firing_pos: %1", _firing_pos],
	lineBreak,
	format ["_target_pos: %1", _target_pos],
	lineBreak,
	format ["_impact_pos: %1", _impact_pos],
	lineBreak,
	format ["_start_to_target: %1, %2", _start_to_target, vectorMagnitude _start_to_target],
	lineBreak,
	format ["_start_to_impact: %1, %2", _start_to_impact, vectorMagnitude _start_to_impact],
	lineBreak,
	format ["_numerator/_delimeter: %1", _projection_coefficient],
	lineBreak,
	format ["_projection: %1", _projection],
	lineBreak,
	lineBreak,
	*/
	format ["The horizontal offset in meters: %1", _horiz_offset_in_meters],
	lineBreak,
	format ["The vertical offset in meters: %1", _vert_offset_in_meters],
	lineBreak,
	lineBreak,
	format ["The horizontal offset in mrads: %1", _horiz_offset_in_mrads],
	lineBreak,
	format ["The vertical offset in mrads: %1", _vert_offset_in_mrads]
];
// Returns the offsets in MRASs
[_horiz_offset_in_mrads, _vert_offset_in_mrads]
