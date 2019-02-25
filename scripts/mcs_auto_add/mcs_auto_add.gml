///mcs_auto_add( "Slug" );
///@param Slug - A string containing the "word" to link everything together with
/*
    This script quite simply links all controllers and all rooms
    that have the unified "slug" in their names. For instance "Jungle" will
	add all objects that contain the word "Jungle" to all rooms that have
	the word "Jungle" in the name. 
	
	Higly recomend using some sort of convention that indicates you wish to
	include a controller.
	
	For instance, instead of just "jungle" do "a_jungle", then name your objects
	con_a_jungle_* and rm_a_jungle_* so you don't accidently include anything you
	don't wish to include. 
*/
#region//Check if the system has been initiated, if not then initiate it.
if( !instance_exists( mc_master ) ){
	instance_create_depth( 0,0,0,mc_master ); 
}
#endregion

var _s = argument[0], i, _n, _arr_r, _arr_o;

_arr_r[0] = -1; 
_arr_o[0] = -1; 

#region//Search for rooms

//Check for up to 1000 rooms.
for( i=0; i<1000; i++ ){
    if( room_exists(i) ){//Check this room
        _n = room_get_name(i); 
		if( string_pos( _s, _n ) != 0 ){//Check to see if our room has our slug
			if( _arr_r[0] == -1 ) _arr_r[0] = i;
			else _arr_r[array_length_1d( _arr_r )] = i;
		}
    }else{//We ran out of rooms
		break;	
	}
}

#endregion

#region//Search for controllers

//Check for up to 1000 controllers.
for( i=0; i<1000; i++ ){
    if( object_exists(i) ){//Check this controller
        _n = object_get_name(i); 
		if( string_pos( _s, _n ) != 0 ){//Check to see if our controller has our slug
			if( _arr_o[0] == -1 ) _arr_o[0] = i;
			else _arr_o[array_length_1d( _arr_o )] = i;
		}
    }else{//We ran out of controllers
		break;	
	}
}

#endregion

//Add our controllers to our rooms
if( _arr_r[0] != -1 && _arr_o[0] != -1 ){//Make sure we found stuff first
	mcs_add_controllers(_arr_r,_arr_o);
}else{
	show_debug_message("Error MCS: No controllers or rooms found for slug '" + _s + "'"  );	
}
