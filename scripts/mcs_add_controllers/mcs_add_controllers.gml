///mcs_add_conrollers( Rooms, Controllers );
///@param Rooms - The room(s), single or array, that are getting controllers added to
///@param Controllers - The Controllers to add to the room(s), single or array
#region //Details and Use
/*
    Add room controllers to the game. You can specify a room and the controllers
    that go into it. 
    
    Room ( or an array of rooms ) : What room(s) to put controller(s) into.
    
    Controller ( or an array of controllers ) : What controller(s) to put into the room(s). 
    
    Event : Game Config Script
    Object Type : None   
    Scope : Game 
*/
#endregion

#region //Check if the system has been initiated, if not then initiate it.
if( !instance_exists( mc_master ) ){
	instance_create_depth( 0,0, 0,mc_master ); 
}
#endregion

var rm = argument[0], i, j, k, l, obj = argument[1];

//If argument count is less than 1 you've dun fucked up
if argument_count > 1{
	
	#region //Main Processing
		//First, we check the rooms and see if they are indexed
		if( is_array( rm ) ){//We have an array of rooms
			
			//Loop through the entries, find our rooms, add if neccessary
			for( j=0; j < array_length_1d(rm); j++ ){
				for( i = 0; i <= array_height_2d(global.game_nor_con); i++ ){			
					if( i == array_height_2d(global.game_nor_con) || global.game_nor_con[i,0] == -1 ){//Add it 
						global.game_nor_con[i,0] = rm[j];
						break;
					}
					if( global.game_nor_con[i,0] == rm[j] ){
						break;//It's already listed, so stop
					}
				}
			}
			
			#region //Object processing
				//Now that we've handled our rooms, let's insert objects
				if( is_array(obj) ){//Array of rooms, Array of objects
					for( l=0; l < array_length_1d(obj); l++ ){
						for(k=0; k < array_length_1d(rm); k++ ){//We are going to loop through and perform this on all of htese
							for( i = 0; i < array_height_2d(global.game_nor_con); i++ ){			
								if( global.game_nor_con[i,0] == rm[k] ){//We've found our room
									for(j=1; j <= array_length_2d(global.game_nor_con, i); j++){//Loop through our controllers, add if not there
										if( j == array_length_2d(global.game_nor_con, i) || global.game_nor_con[i,j] == -1 ){
											global.game_nor_con[i,j] = obj[l]; // Put it on the end of our list
											break;
										}
										if( global.game_nor_con[i,j] == obj[l] ){
											break;//We're already listed, stop	
										}	
									}
								}
							}
						}
					}
				}else{//Array of rooms, only one object
					for(k=0; k < array_length_1d(rm); k++ ){//We are going to loop through and perform this on all of htese
						for( i = 0; i < array_height_2d(global.game_nor_con); i++ ){			
							if( global.game_nor_con[i,0] == rm[k] ){//We've found our room
								for(j=1; j <= array_length_2d(global.game_nor_con, i); j++){//Loop through our controllers, add if not there
									if( j == array_length_2d(global.game_nor_con, i) || global.game_nor_con[i,j] == -1 ){
										global.game_nor_con[i,j] = obj; // Put it on the end of our list
										break;
									}
									if( global.game_nor_con[i,j] == obj ){
										break;//We're already listed, stop	
									}	
								}
							}
						}
					}
				}
			#endregion
		
		}else{//We have just one room
			
			//First, we loop through and check each of the rooms to make sure it isn't already listed
			for( i = 0; i <= array_height_2d(global.game_nor_con); i++ ){			
				if( i == array_height_2d(global.game_nor_con) || global.game_nor_con[i,0] == -1 ){//Add it 
					global.game_nor_con[i,0] = rm;
					break;
				}
				if( global.game_nor_con[i,0] == rm ){
					break;//It's already listed, so stop
				}
			}
			
			#region //Object Processing	
				//Now that we've handled our rooms, let's insert objects
				if( is_array(obj) ){//One room, Array of objects
					for( k = 0; k < array_length_1d(obj); k++ ){
						for( i = 0; i <= array_height_2d(global.game_nor_con); i++ ){			
							if( global.game_nor_con[i,0] == rm ){//We've found our room
								for(j=1; j <= array_length_2d(global.game_nor_con, i); j++){//Loop through our controllers, add if not there
									if( j == array_length_2d(global.game_nor_con, i) || global.game_nor_con[i,j] == -1 ){
										global.game_nor_con[i,j] = obj[k]; // Put it on the end of our list
										break;
									}
									if( global.game_nor_con[i,j] == obj[k] ){
										break;//We'r already listed, stop	
									}	
								}
								break;
							}
						}
					}
				}else{//One room, only one object
					for( i = 0; i <= array_height_2d(global.game_nor_con); i++ ){			
						if( global.game_nor_con[i,0] == rm ){//We've found our room
							for(j=1; j <= array_length_2d(global.game_nor_con, i); j++){//Loop through our controllers, add if not there
								if( j == array_length_2d(global.game_nor_con, i) || global.game_nor_con[i,j] = -1 ){
									global.game_nor_con[i,j] = obj; // Put it on the end of our list
									break;
								}
								if( global.game_nor_con[i,j] == obj ){
									break;//We'r already listed, stop	
								}	
							}
							break;
						}
					}			
				}
			#endregion
		}
	#endregion
	
	event_perform(mc_master, ev_room_start);//Initialize objects
	
}else{
    show_error( "msc_add_controllers: Error, this script requires additional arguments", true );
}


