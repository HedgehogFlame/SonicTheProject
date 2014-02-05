// player_reaction_lamp_post(local_id)

// ignore if already activated
if (argument0==objProgram.spawn_id) return false;

// animate
argument0.timeline_index = animLampPost;
argument0.timeline_running = true;

// setup checkpoint
objProgram.spawn_id = argument0;
objProgram.spawn_time = objLevel.timer;

// sound
audio_play_sound_on(audio, sndLampPost, false, 0);

// not a hard collision
return false;
