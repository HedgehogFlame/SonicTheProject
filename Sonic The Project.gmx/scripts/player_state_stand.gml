// player_state_stand()

// update position
if not player_movement_ground() return false;

// falling
if not landed return player_is_falling();

// slide if moving too slow
if relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall instead
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else sliding = 32;
}

// running
if input_check(player_id, cLEFT) or input_check(player_id, cRIGHT) or xspeed!=0 or sliding player_is_running();

// jumping
if input_check_pressed(player_id, cACTION) and not player_collision_ceiling(offset_y+5) return player_is_jumping();

// looking / crouching
if cliff==0 and mask_rotation==gravity_angle()
{
    if input_check(player_id, cUP) return player_is_looking();
    if input_check(player_id, cDOWN) return player_is_crouching();
}

// animate
if (character_id==2) {if (cliff!=0) animation_new = "cliff"; else animation_new = "idle";} else
if (cliff==facing) animation_new = "cliff"; else
if (cliff==-facing) animation_new = "cliff_b"; else
animation_new = "idle";

// set facing
if (cliff!=0) and ((character_id==2) or (character_id==3)) facing = cliff;
