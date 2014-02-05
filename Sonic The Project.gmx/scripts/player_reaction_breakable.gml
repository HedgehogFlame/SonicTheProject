// player_reaction_breakable(local_id, code)

// check collision code
switch argument1
{
case 2:
case -2:
    // ignore if not jumping
    if landed or not spinning return false;

    // generate debris
    with instance_create(argument0.x, argument0.y, objExampleBreakableDebris) {hspeed = -2; vspeed = -4;}
    with instance_create(argument0.x+16, argument0.y, objExampleBreakableDebris) {hspeed = 2; vspeed = -4;}
    with instance_create(argument0.x, argument0.y+16, objExampleBreakableDebris) {hspeed = -2; vspeed = -2;}
    with instance_create(argument0.x+16, argument0.y+16, objExampleBreakableDebris) {hspeed = 2; vspeed = -2;}

    // destroy object
    with argument0 instance_destroy();

    // bounce if top collision
    if (argument1==2) yspeed = -3;

    // sound
    audio_play_sound_on(audio, sndBreak, false, 0);

    // hard collision found
    return true;
}
