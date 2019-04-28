/*
 * User management
 */
$("#usermanage").click(function() {
	$(".usermanage").show();
	$(".articlemanage").hide(); // hide
	$(".forummanage").hide(); // hide
});

/*
 * Article Management
 */
$("#articlemanage").click(function() {
	$(".usermanage").hide();// hide
	$(".articlemanage").show();
	$(".forummanage").hide();// hide
});

/*
 * Forum Management
 */
$("#forummanage").click(function() {
	$(".usermanage").hide();// hide
	$(".articlemanage").hide();// hide
	$(".forummanage").show();
});