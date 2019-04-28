var _content = []; // Temporary storage. Show_article loop content
var left_part = {
	_default : 4, // The number of articles is displayed by default
	_loading : 3, // The number of loads each time the button is clicked
	init : function() {
		var lis = $(".left_part .hidden .show_article");
		$(".left_part div.list").html("");
		for (var n = 0; n < left_part._default; n++) {
			lis.eq(n).appendTo(".left_part div.list");
		}
		$(".left_part div.list .show_article_go").each(function() {
			$(this).attr('src', $(this).attr('realSrc'));
		})
		for (var i = left_part._default; i < lis.length; i++) {
			_content.push(lis.eq(i));
		}
		$(".left_part .hidden").html("");
	},
	loadMore : function() {
		var mLis = $(".left_part div.list .show_article").length;
		for (var i = 0; i < left_part._loading; i++) {
			var target = _content.shift();
			if (!target) {
				$('.left_part .more').html("<p class='text-danger'>Ooops!No more posts!</p>");
				break;
			}
			$(".left_part div.list").append(target);
			$(".left_part div.list show_article_go").eq(mLis + i).each(function() {
				$(this).attr('src', $(this).attr('realSrc'));
			});
		}
	}
}
left_part.init();