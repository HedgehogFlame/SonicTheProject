// player_is_jumping()
var ground_speed;

// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;

// states and flags
state = player_state_fall;
spinning = true;
jumping = true;
jump_action = true;
spindashing = false;

// movement and collision
ground_speed = xspeed;
xspeed = (cosine[relative_angle]*ground_speed)-(sine[relative_angle]*jump_constant);
yspeed = -(sine[relative_angle]*ground_speed)-(cosine[relative_angle]*jump_constant);

// set air state
player_in_air();

// sound
audio_play_sound_on(audio, sndJump, false, 0);
