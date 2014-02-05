// player_is_peeling()

// animate
animation_new = "peel";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;

// states and flags
state = player_state_peel;
spinning = true;
spindashing = false;

// counters
chain_multiplier = 0;
