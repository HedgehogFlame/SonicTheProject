// player_reaction_trail(local_id)

// set path
path_start(argument0.path, argument0.path_force, argument0.path_finish, argument0.path_absolute);

// animate
animation_new = "dash";
timeline_speed = 0.2;
image_angle = 0;

// states and flags
state = player_state_path;
rolling_jump = false;

// motion planning
xspeed = 0;
yspeed = 0;

// character values
if character_id==3 glide_falling = false;

// hard collision occured
return true;
