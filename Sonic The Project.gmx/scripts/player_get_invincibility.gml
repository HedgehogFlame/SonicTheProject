// player_get_invincibility()

// hide shield
with shield visible = false;

// refresh if already created
if invincibility invincibility.alarm[0] = 1200; else
{
    // create invincibility
    invincibility = instance_create(floor(x), floor(y), objInvincibility);
    invincibility.player_id = id;
    invincibility.depth = depth-1;

    // music
    if player_id==0 {audio_set_priority(bgmInvincibility, 2); audio_play_priority(true);}
}


