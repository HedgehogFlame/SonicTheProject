// player_state_peel()

// ground motion
if not sliding
{
    // decelerate if moving in opposite direction
    if input_check(player_id, cLEFT) and xspeed>0 {xspeed -= roll_deceleration; if xspeed<0 xspeed = 0;} 
    if input_check(player_id, cRIGHT) and xspeed<0 {xspeed += roll_deceleration; if xspeed>0 xspeed = 0;} 
}

// friction
xspeed -= min(abs(xspeed), roll_friction)*sign(xspeed);

// update position
if not player_movement_ground() return false;

// falling
if not landed return player_is_falling();

// slide if moving too slow
if abs(xspeed)<slide_threshold and relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall instead
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else sliding = 32;
}

// slope factor
if sign(sine[relative_angle])==sign(xspeed) xspeed -= player_slope_factor(slope_friction_up, roll_friction); else
xspeed -= player_slope_factor(slope_friction_down, roll_friction);

// jumping
if input_check_pressed(player_id, cACTION) and not player_collision_ceiling(offset_y+5)
{
    rolling_jump = true;
    return player_is_jumping();
}

// uncurl
if abs(xspeed)<unroll_threshold return player_is_running();

// animate
timeline_speed = 1/max(5-abs(xspeed), 1);

// set facing
facing = sign(xspeed);
