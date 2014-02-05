// player_update_underwater()

// abort if no water
if not instance_exists(objWater) return false;

// entering water
if not underwater and y>objWater.y
{
    // animate
    if state==player_state_fly {if alarm[0] animation_new = "swim"; else animation_new = "swim_end";}

    // set timer
    underwater = true;
    underwater_count = 1800;

    // cut fall speed
    yspeed /= 4;

    // modify stats
    player_reset_physics();

    // splash particle
    part_particles_create(objLevel.particles, x, objWater.y, objResources.splash, 1);

    // splash sound
    audio_play_sound_on(audio, sndSplash, false, 0); 
}

// exiting water
if underwater and y<=objWater.y
{
    // animate
    if state==player_state_fly {if alarm[0] animation_new = "flight"; else animation_new = "flight_end";}

    // clear timer
    underwater = false;
    underwater_count = -1;

    // double rising speed
    yspeed *= 2;

    // modify stats
    player_reset_physics();

    // splash particle
    part_particles_create(objLevel.particles, x, objWater.y, objResources.splash, 1);

    // splash sound
    audio_play_sound_on(audio, sndSplash, false, 0); 

    // cancel drowning music
    if player_id==0 {audio_clear_priority(bgmDrowning); audio_play_priority(true);}
}
