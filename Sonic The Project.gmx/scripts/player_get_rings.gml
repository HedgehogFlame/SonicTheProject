// player_get_rings(rings)
audio_stop_sound(sndRing);
audio_play_sound_on(audio, sndRing, false, 0);
repeat argument0
{
    if (objGameData.rings[player_id]>=999) return 0;
    objGameData.rings[player_id] += 1;
    if not (objGameData.rings[player_id] mod 100) player_get_lives(1);
}
