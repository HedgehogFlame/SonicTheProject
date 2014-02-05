// player_reaction_monitor(local_id, code)

// ignore if falling
if argument0.gravity>0 return false;

// handle bottom collision differently
if (argument1==-2)
{
    // cut vertical speed
    yspeed = 0;

    // knock down
    argument0.speed = 2;
    argument0.gravity = gravity_force;
    argument0.gravity_direction = gravity_direction;
    argument0.direction = gravity_direction+180

    // hard collision found
    return true;
}
else
{
    // ignore if not spinning
    if not (spinning or state==player_state_glide or state==player_state_glide_slide) return false;

    // check collision code
    if landed or (state==player_state_glide) or (state==player_state_glide_slide) {if (xspeed==0) or (abs(argument1)!=1) return false;} else
    if (argument1!=2) return false;
    
        // scoring
if chain_multiplier>15 bonus_score = 10000; else
if chain_multiplier>3 bonus_score = 1000; else
if chain_multiplier>2 bonus_score = 500; else
if chain_multiplier>1 bonus_score = 200; else
bonus_score = 100;
objGameData.player_score[player_id] += bonus_score;
with instance_create(argument0.x, argument0.y, objScorePopup)
{
    if other.chain_multiplier>1 image_index = 2; else
    image_index = 1;
}

    // break item
    with argument0 instance_destroy();
    
    // bounce if top collision
    if not landed and (argument1==2)
    {
        // increase force if holding jump
        if input_check(player_id, cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
    }

    // sound
    audio_play_sound_on(audio, sndCrate, false, 0);
}

// hard collision found
return true;
