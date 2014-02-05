// transition_titlecard(next_room, frames)
with instance_create(0, 0, objTitlecard) {next_room = argument0; image_speed = 1/argument1;}
audio_music_gain(0, argument1*(1000/60));
/* AUTHOR NOTE: instanciate your titlecard here!
It needs to work similarly to objFade with an initial fade-in phase, followed by a room change,
then whatever you want your titlecard to do afterwards.
Set objLevel.started to true when you want the player to be able to move.
*/
