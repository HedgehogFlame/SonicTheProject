// audio_set_priority(soundid, priority)
if ds_priority_find_priority(objProgram.music_queue, argument0) ds_priority_change_priority(objProgram.music_queue, argument0, argument1); else
ds_priority_add(objProgram.music_queue, argument0, argument1);
