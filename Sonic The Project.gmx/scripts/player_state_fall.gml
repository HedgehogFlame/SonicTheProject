// player_state_fall()

// ignore if rolling from a jump
if not rolling_jump
{
    // aerial acceleration
    if input_check(player_id, cLEFT) {facing = -1; if xspeed>-speed_cap xspeed = max(xspeed-air_acceleration, -speed_cap);}
    if input_check(player_id, cRIGHT) {facing = 1; if xspeed<speed_cap xspeed = min(xspeed+air_acceleration, speed_cap);}
}

// update position
if not player_movement_air() return false;

// jump height
if jumping and input_check_released(player_id, cACTION) and yspeed<-jump_release yspeed = -jump_release;

// air friction
if yspeed<0 and yspeed>-jump_release xspeed *= air_friction;

// gravity
yspeed += gravity_force;

// landing
if landed
{
    // check character id
    switch character_id
    {
    case 1: // Sonic
        // bubble shield bounce here
        break;

    case 3: // Knuckles
        if glide_falling return player_is_glide_standing();
        break;
    }

    // maintain spindash
    if spindashing return player_is_spindashing();

    // land normally
    if xspeed!=0 return player_is_running(); else return player_is_standing();
}

// jump action
if input_check_pressed(player_id, cACTION) and jump_action
{
    // check character id
    switch character_id
    {
    case 1: // Sonic
        if invincibility or shield<0 break;
        switch shield.type
        {
        case 2: return player_is_double_jumping(); break;
        }
        break;

    case 2: // Tails
        return player_is_flying();
        break;

    case 3: // Knuckles
        return player_is_gliding();
        break;
    }
}

// animate
if (animation=="rise") and (yspeed>=0) {animation_new = "walk"; timeline_speed = 0.125;}
if not spinning and (image_angle!=angle) image_angle = angle_wrap(image_angle+2.8125*sign(angle_distance(image_angle, angle)));
