// player_hit()

// abort if immune or already hit
if invulnerable or invincibility or (state==player_state_hurt) return false;

// remove shield, if any
if shield {with shield instance_destroy(); shield = noone;} else

// drop rings, if any
if objGameData.rings[player_id]>0
{
    drop_rings(objGameData.rings[player_id], x, y);
    objGameData.rings[player_id] = 0;
}
else
{
    // die if no rings or shield
    audio_play_sound_on(audio, sndHurt, false, 0);
    return player_is_dead();
}

// recoil
if objGameData.rings[player_id]==0 audio_play_sound_on(audio, sndRingLoss, false, 0); else
audio_play_sound_on(audio, argument1, false, 0);
player_is_hurt(argument0);
