// player_state_climb()
var hit_floor;

// speed
if input_check(player_id, cUP) yspeed = -1; else
if input_check(player_id, cDOWN) yspeed = 1; else
yspeed = 0;

// handle terrain movement
if instance_exists(climb_id)
{
    // horizontal terrain motion
    if (climb_id.x-climb_id.xprevious!=0)
    {
        x += cosine[relative_angle]*(climb_id.x-climb_id.xprevious);
        y -= sine[relative_angle]*(climb_id.x-climb_id.xprevious);
    }

    // vertical terrain motion
    if (climb_id.y-climb_id.yprevious!=0)
    {
        x += sine[relative_angle]*(climb_id.y-climb_id.yprevious);
        y += cosine[relative_angle]*(climb_id.y-climb_id.yprevious);
    }
}
else
{
    // release terrain
    return player_is_glide_falling();
}

// apply movement step
x += sine[angle]*yspeed;
y += cosine[angle]*yspeed;

// keep in bounds
if not player_update_bounds() return false;

// update underwater state
player_update_underwater();

// non-terrain object collision
if player_collision_object() return false;

// reset local terrain list
player_get_terrain_list();

// wall collision
climb_id = player_collision_wall(offset_wall+1);

// handle wall collision
if climb_id {if not climb_id.climbable return player_is_glide_falling();}

// collide based on velocity
if yspeed>=0
{
    // floor collision
    hit_floor = player_collision_floor(offset_y);

    // handle floor collision
    if hit_floor
    {
        // execute reaction
        if player_get_reaction(hit_floor, 2) return false;
        
        // get terrain data
        player_get_terrain(hit_floor);

        // confirm terrain landing
        landed |= 1;

        // handle mask rotation
        player_floor_transfer();
    }
}
else
{
    // ceiling collision
    hit_floor = player_collision_ceiling(offset_y);

    // handle ceiling collision
    if hit_floor
    {
        // execute reaction
        if player_get_reaction(hit_floor, -2) return false;

        // stop falling
        yspeed = 0;
    }
}

// landing
if landed {yspeed = 0; return player_is_standing();}

// falling
if climb_id<0 {if (yspeed>0) return player_is_glide_falling(); else if (yspeed<0) return player_is_clambering();}

// jumping
if input_check_pressed(player_id, cACTION) and not player_collision_ceiling(offset_y+5)
{
    player_is_jumping();
    facing = -facing;
    xspeed = 4*facing;
    yspeed = -4;
    return 0;
}

// animate
if input_check_pressed(player_id, cUP) {image_index = 0; timeline_position = 0;}
timeline_speed = yspeed*0.25;
