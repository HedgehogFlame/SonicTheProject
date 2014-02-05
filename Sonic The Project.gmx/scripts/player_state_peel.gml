// player_state_peel()
var motion_direction;

// motion direction
if input_check(player_id, cLEFT) motion_direction = -1; else
if input_check(player_id, cRIGHT) motion_direction = 1; else
motion_direction = 0;

// grouhd motion
if motion_direction!=0
{
    // moving in opposite direction
    if xspeed!=0 and sign(xspeed)!=motion_direction
    {
        // ignore if sliding
        if not sliding
        {
            // braking
            if abs(xspeed)>brake_threshold and mask_rotation==gravity_angle() {animation_new = "brake"; timeline_speed = 1;}

            // decelerate and reverse direction
            xspeed += deceleration*motion_direction;
            if xspeed!=0 and sign(xspeed)==motion_direction xspeed = deceleration*motion_direction;
        }
    } 
    else
    {
        // accelerate
        if abs(xspeed)<speed_cap
        {
            xspeed += acceleration*motion_direction;
            if abs(xspeed)>speed_cap xspeed = speed_cap*motion_direction;
        }
    }
}
else
{
    // decelerate
    xspeed -= min(abs(xspeed), ground_friction)*sign(xspeed);
}

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
if abs(xspeed)>speed_cap xspeed -= player_slope_factor(slope_friction_cap, ground_friction); else
xspeed -= player_slope_factor(slope_friction, ground_friction);

// standing
if motion_direction==0 and xspeed==0 return player_is_standing();

// jumping
if input_check_pressed(player_id, cACTION) and not player_collision_ceiling(offset_y+5) return player_is_jumping();

// rolling (ignore if holding forward/backward)
if input_check(player_id, cDOWN) and not input_check(player_id, cLEFT|cRIGHT) and abs(xspeed)>=roll_threshold
{
    audio_play_sound_on(audio, sndSpin, false, 0);
    return player_is_rolling();
}

// animate
if not ((animation_new=="push" and facing==motion_direction) or (animation_new=="brake" and facing!=motion_direction))
{
    // running
    if abs(xspeed)>=6 animation_new = "peel"; else
    animation_new = "peel";
    timeline_speed = 1/max(8-abs(xspeed), 1);
}
image_angle = angle;

// set facing
if motion_direction!=0 and sign(xspeed)==motion_direction facing = motion_direction;
