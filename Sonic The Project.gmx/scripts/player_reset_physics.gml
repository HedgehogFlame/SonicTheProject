// player_reset_physics()

// bounding box
offset_x = 8;
offset_y = 14-(character_id==2);
offset_wall = 10;
segment_width = offset_x*0.5;
segment_height = offset_y*0.5;

// speed values
speed_cap = 6;
acceleration = 0.046875;
deceleration = 0.5;
ground_friction = 0.046875;
air_acceleration = 0.09375;
roll_deceleration = 0.125;
roll_friction = 0.0234375;

// gravity values
jump_constant = 6.5-(character_id==3);
jump_release = 4;
gravity_force = 0.21875;
hit_force = 0.1875;

// superspeed modification
if superspeed
{
    // speed values
    speed_cap *= 2;
    acceleration *= 2;
    ground_friction *= 2;
    air_acceleration *= 2;
    roll_friction *= 2;
}

// underwater modification
if underwater
{
    // speed values
    speed_cap *= 0.5;
    acceleration *= 0.5;
    deceleration *= 0.5;
    ground_friction *= 0.5;
    air_acceleration *= 0.5;
    roll_friction *= 0.5;

    // gravity values
    jump_constant -= 3;
    jump_release *= 0.5;
    gravity_force = 0.0625;
    hit_force = 0.0625;
}
