// input_check_pressed(port, code)
if objProgram.controller[argument0]<0 return 0;
return objProgram.controller[argument0].state_press&argument1>0;
