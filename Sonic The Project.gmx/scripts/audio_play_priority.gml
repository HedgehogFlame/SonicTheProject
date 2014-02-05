// audio_play_priority(loops)
var music;
music = ds_priority_find_max(objProgram.music_queue);
if music!=objProgram.music {objProgram.music = music; audio_play_music(music, argument0);}
