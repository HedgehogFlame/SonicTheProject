// player_state_glide()

// acceleration
if not (abs(glide_angle) mod 180) and glide_speed<16 {glide_speed += 0.015625; if glide_speed>16 glide_speed = 16;}

// motion direction
if input_check(player_id, cLEFT) glide_direction = -1; else
if input_check(player_id, cRIGHT) glide_direction = 1;

// turning
glide_angle = median(glide_angle-(2.8125*glide_direction), 0, 180);

// speed
xspeed = glide_speed*cosine[glide_angle];

// update position
if not player_movement_air() return false;

// glide pressure
if glide_force<0.5 {glide_force += 0.125; if glide_force>0.5 glide_force = 0.5;}

// gravity
if abs(glide_force-yspeed)>0 yspeed += min(abs(glide_force-yspeed), 0.125)*sign(glide_force-yspeed);

// falling
if input_check_released(player_id, cACTION) return player_is_glide_falling();

// landing
if landed return player_is_glide_sliding();

// climbing
if (wall_direction!=0) and (wall_direction==glide_direction) return player_is_climbing();

// animate
if xspeed!=0 facing = sign(xspeed);
if (abs(glide_angle-90)>67.5) image_index = 0; else
if (abs(glide_angle-90)>22.5) image_index = 1; else
image_index = 2;
