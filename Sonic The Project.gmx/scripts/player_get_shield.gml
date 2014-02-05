// player_get_shield(kind)

// remove previous shield
with shield instance_destroy();

// create new shield
switch argument0
{
case 2:
    shield = instance_create(floor(x), floor(y), objShieldLightning);
    audio_play_sound_on(audio, sndShieldLightning, false, 0);
    break;
default:
    shield = instance_create(floor(x), floor(y), objShield);
    audio_play_sound_on(audio, sndShield, false, 0);
}

// modify shield properties
shield.image_xscale = facing;
shield.depth = depth-1;
shield.player_id = id;
if invincibility shield.visible = false;
