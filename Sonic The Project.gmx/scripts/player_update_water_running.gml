// player_update_water_running()

// reset flag
landed &= ~2;

// abort if no water
if not instance_exists(objWater) return false;

// abort if on terrain, oriented incorrectly or not enough speed
if (landed&1) or mask_rotation>0 or abs(xspeed)<waterrun_threshold return false;

// abort if too far below or above water surface
if underwater or y+offset_y+1<objWater.y return false;

// confirm water running
landed |= 2;

// setup if not already aligned
if (y!=objWater.y-offset_y-1)
{
    // align to water surface
    y = objWater.y-offset_y-1;

    // neutralize angle
    angle = 0;
    relative_angle = 0;
}
