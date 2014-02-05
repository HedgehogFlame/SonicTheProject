// player_reaction_enemy(local_id)
var bonus_score;

// if not spinning or invincible
if argument0.invulnerable or not (spinning or spindashing or invincibility) or ((state==player_state_glide or state==player_state_glide_slide) and abs(argument1)!=1)
{
    // abort if already hit
    if invulnerable or (state==player_state_hurt) return false;

    // take hit
    player_hit(sign(x-argument0.x), sndHurt);

    // hard collision found
    return true;
}

// rebound in air
if not landed
{
    // if bottom collision or moving upward, weigh down velocity
    if collision_ray(offset_x, -offset_y, mask_rotation, argument0) or yspeed<0 yspeed -= sign(yspeed); else

    //  if top collision and moving downward, bounce
    if collision_ray(offset_x, offset_y, mask_rotation, argument0) and yspeed>0
    {
        // increase force while holding jump or not jumping
        if input_check(player_id, cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
    }
}

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

// destroy enemy
with argument0 instance_destroy();

// sound
audio_play_sound_on(audio, sndPop, false, 0);

// hard collision found
return true;
