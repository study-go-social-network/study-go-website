$(window).scroll(function() {
    var winScrollTop = $(window).scrollTop();
    var winHeight = $(window).height();
    var floaterHeight = $('#usermanual').outerHeight(true);
    //true so the function takes margins into account
    var fromBottom = 100;

    var top = winScrollTop + winHeight - floaterHeight - fromBottom;
    $('#usermanual').css({'top': top + 'px'});
});