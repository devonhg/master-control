/// @description Initiate Controllers

var i,j, ind = array_height_2d(global.game_nor_con); 

for(i=0; i < ind; i++){
	//Check if our item here is for our room
    if(room == global.game_nor_con[i,0]){
		//If so, if it's a valid object go ahead and create it
        for(j=1; j < array_length_2d(global.game_nor_con, i); j++){
            if( global.game_nor_con[i, j] != -1 and global.game_nor_con[i, j] != -4 ){
                if( !instance_exists( global.game_nor_con[i, j] ) ){
                    instance_create_depth(0,0, 0, global.game_nor_con[i, j]); 
                }
            }
        }
    }
}

show_debug_message("MCS|||Control initiations ran.");