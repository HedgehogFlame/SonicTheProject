// transition_fade(next_room, frames)
with instance_create(0, 0, objFade) {next_room = argument0; image_speed = 1/argument1;}
audio_music_gain(0, argument1*(1000/60));
