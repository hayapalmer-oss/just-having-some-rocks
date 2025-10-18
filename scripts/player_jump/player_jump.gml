function player_jump(){
	show_debug_message("jumping")
	// power of initial leap
	var jump_force = 10;
	
	// keep floating up a bit after jumping when up is held
	var float_force = 0.01;
	
	// if we are on the ground
	if (place_meeting(x, y+3, layer_get_all())) {
		show_debug_message("jump from ground")
		global.y_vel = jump_force;
	}
	
	// if we are not on the ground
	else {
		//global.y_vel -= float_force * delta_time;
	}
}