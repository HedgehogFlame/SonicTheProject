// player_state_spindash()

// update position
if not player_movement_ground() return false;

// falling
if not landed return player_is_falling();

// slide if moving too slow
if relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else return player_is_running();
}

// abort on movement or releasing down
if input_check_released(player_id, cUP)
{
    // release charge
    xspeed = facing*(8+(spindash_charge div 2));
    spindash_charge = 0;

    // camera
    camera.alarm[0] = floor(24-abs(xspeed));

    // spindash sound
    if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);
    audio_play_sound_on(audio, sndSpinDash, false, 0);

    // roll
    return player_is_peel();
}

// charging
if input_check_pressed(player_id, cACTION) and spindash_charge<8
{
    spindash_charge += 2;
    if spindash_charge>8 spindash_charge = 8;

    // spindash sound
    if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);
    reserved_sound = audio_play_sound_on(audio, sndSpinRev, false, 0);
}

// atrophy
if spindash_charge>0 spindash_charge *= spindash_friction;
