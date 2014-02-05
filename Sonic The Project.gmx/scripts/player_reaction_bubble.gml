// player_reaction_bubble(local_id)

// abort if not underwater or landed
if not underwater or landed return false;

// skip if too small
if argument0.image_index<5 return false;

// states and flags
state = player_state_fall;
rolling_jump = false;

// motion planning
xspeed = 0;
yspeed = 0;

// character values
if character_id==3 glide_falling = false;

// reset timer
underwater_count = 1800;

// animate
animation_new = "get_air";

// particles
part_particles_create(objLevel.particles, argument0.x, argument0.y, objResources.bubble_pop, 1);

// destroy bubble
with argument0 instance_destroy();

// air sound
audio_play_sound_on(audio, sndGetAir, false, 0);

// reset music
if player_id==0 {audio_clear_priority(bgmDrowning); audio_play_priority(true);}

// hard collision occured
return true;
