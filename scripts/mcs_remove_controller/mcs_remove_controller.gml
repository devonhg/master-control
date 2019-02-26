///mcs_remove_controller( room, controller );
///@param Room - The room we are removing a controller from
///@param Controller - The controller we are removing
/*
    Using this script you are able to remove a room controller from being
    generated, as well as delete its instance. 
*/

var con = argument[1], rm = argument[0], i, j;

for( j=0; j<array_height_2d( global.game_nor_con ); j++ ){
    if( global.game_nor_con[j, 0] == rm ){
        for( i=1; i<array_length_2d( global.game_nor_con, j ); i++ ){
            if( global.game_nor_con[j, i] == con ){ 
                if( instance_exists( global.game_nor_con[j, i] ) ){
                    with( global.game_nor_con[j, i] ) instance_destroy();
                }
                global.game_nor_con[j, i] = -1; 
                break; 
            }
        }
    }
}
