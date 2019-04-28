/**
 * Comment deletion confirmation box
 * @returns
 */
function p_del() { 
	var msg = "Are you sure to delete this comment?\n\nIt cannot be restored after deletion!";
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

/**
 * Article deletion confirmation box
 * @returns
 */
function f_del() { 
	var msg = "Are you sure to delete this article?\n\nIt would also remove the comments below\n\nIt cannot be " +
		"restored after deletion!";
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

/**
 * Forum deletion confirmation box
 * @returns
 */
function b_del() { 
	var msg = "Are you sure to delete this forum?\n\nIt cannot be restored after deletion!";
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	}
}

