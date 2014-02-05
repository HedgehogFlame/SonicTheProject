// player_reaction_bumper(local_id)
var bounce_direction;

// fall if hurt
if (state==player_state_hurt) player_is_falling();

// get bounce direction
bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());

// states and flags
rolling_jump = false;

// movement and collision
xspeed = cosine[bounce_direction]*7;
yspeed = -sine[bounce_direction]*7;

// character values
if character_id==3 glide_falling = false;

// trigger bumper
argument0.alarm[0] = 16;

// move outside
while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0) {x += sign(xspeed); y += sign(yspeed);}

// gain points
if argument0.counter[player_id]<10
{
    // scoring
    objGameData.player_score[player_id] += 10;
    argument0.counter[player_id] += 1;
    instance_create(argument0.x, argument0.y, objScorePopup);
}

// sound
audio_play_sound_on(audio, sndBumper, false, 0);

// hard collision found
return true;
