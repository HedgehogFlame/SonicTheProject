// player_get_lives(lives)
if not audio_is_playing(objProgram.jingle)
{
    audio_music_gain(0, 0);
    objProgram.jingle = audio_play_sound(sndLife, 0, false);
}
repeat argument0
{
    if (objGameData.player_lives[player_id]>=99) return 0;
    objGameData.player_lives[player_id] += 1;
}
