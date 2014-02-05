// player_reset()

// clear rings
objGameData.rings[player_id] = 0;

// lose a life
if not debug_mode objGameData.player_lives[player_id] -= 1;

// handle lives based on mode
switch objProgram.game_mode
{
case 1: // single player

    // are we player one?
    if player_id==0
    {
        // stop everything
        objLevel.timer_enabled = false;
        objLevel.cleared = false;

        // did we lose all our lives?
        if objGameData.player_lives[player_id] objLevel.alarm[0] = 60; else
        instance_create(0, 0, objGameOver);
    }

    // remove the player
    instance_destroy();
    break;

case 2:
    // teleport to spawn point
    player_is_reset();
}
