/// @description Initiation and Description
#region // Details
/*
    This object is created when the controller engine is initiated. This handles all the
    controller inclusions based on what is in global values. 
    
	Upon creation, it initiatizes the neccessary global variables and launches the controller
	creation code.
	
	The structure of the global 2d array is as follows (OLD)
		game_nor_con[#,0] = Room ID
		game_nor_con[#,1..2..3..] = Controller Instance IDs
		
	gameControllers[RoomID, 1..2..3..] = Controller instance ids
	
*/
#endregion

global.game_nor_con[0,0] = -1;
event_perform(mc_master, ev_room_start);//Use this code to manually initiate controllers

show_debug_message("MCS|||Master Control System initiated.");