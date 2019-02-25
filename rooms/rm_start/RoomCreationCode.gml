#region //Debug code for comparing IDs
/*
show_message( 
	"Rooms: \n" + 
	string(rm_start) + room_get_name(rm_start) + "\n" +  
	string(rm_a_beach_1) + room_get_name(rm_a_beach_1) + "\n" +
	string(rm_a_jungle_1) + room_get_name(rm_a_jungle_1) + "\n" +
	string(rm_a_jungle_2) + room_get_name(rm_a_jungle_2) + "\n" +
	"Controllers: \n" + 
	string(mc_a_jungle_score) + object_get_name(mc_a_jungle_score) + "\n" +
	string(mc_start) + object_get_name(mc_start) + "\n" +
	string(mc_a_beach_score) + object_get_name(mc_a_beach_score) + "\n" +
	string(mc_common_controller) + object_get_name(mc_common_controller) + "\n" +
	string(mc_pink_controller) + object_get_name(mc_pink_controller) + "\n" +
	string(mc_green_controller) + object_get_name(mc_green_controller) + "\n" +
	string(mc_room_control) + object_get_name(mc_room_control) + "\n"
);
*/
#endregion

//Automatically manage some for us
mcs_auto_add("a_jungle");
mcs_auto_add("a_beach");

//Add one to a specific room
mcs_add_controllers(rm_start, mc_start);

//Add one controller to many rooms
mcs_add_controllers([rm_a_jungle_1, rm_a_jungle_2, rm_a_beach_1], mc_common_controller);

//Add many controllers into one room
mcs_add_controllers(rm_a_beach_1, [mc_pink_controller, mc_green_controller]);

//Yes, you can also add many controllers to many rooms.

//Remove a controller from a room
mcs_remove_controller(rm_a_beach_1, mc_pink_controller);

//Add our room manager to all of our rooms
mcs_add_controllers([rm_start, rm_a_jungle_1, rm_a_jungle_2, rm_a_beach_1], mc_room_control);

