// level_goto_next()

// get next room
if not ds_queue_empty(objProgram.level_list) objProgram.level = ds_queue_dequeue(objProgram.level_list);

// start level
transition_titlecard(objProgram.level, 24);
