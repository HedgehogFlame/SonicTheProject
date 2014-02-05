// player_is_climbing()

// animate
animation_new = "climb";

// states and flags
state = player_state_climb;

// movement and collision
xspeed = 0;
yspeed = 0;
y = floor(y);

// character values
climb_id = player_collision_wall(offset_wall+1);
