

//Add our room manager to all of our rooms
mcs_add_controllers([rm_start, rm_a_jungle_1, rm_a_jungle_2, rm_a_beach_1], mc_room_control);

//Add one to a specific room
mcs_add_controllers(rm_start, mc_start);

//Add one controller to many rooms
//mcs_add_controllers([rm_a_jungle_1, rm_a_jungle_2, rm_a_beach_1], mc_common_controller);

//Add many controllers into one room
//mcs_add_controllers(rm_a_beach_1, [mc_pink_controller, mc_green_controller]);

//Automatically manage some for us
mcs_auto_add("a_jungle");
//mcs_auto_add("a_beach");

//Yes, you can also add many controllers to many rooms.

//Remove a controller from a room
mcs_remove_controller(rm_a_beach_1, mc_pink_controller);



