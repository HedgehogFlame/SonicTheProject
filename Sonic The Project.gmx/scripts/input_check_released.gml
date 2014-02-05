// input_check_released(port, code)
if objProgram.controller[argument0]<0 return 0;
return objProgram.controller[argument0].state_release&argument1>0;
