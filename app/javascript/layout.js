$(window).ready(function () {
  $('#sidebar-toggler').click(function(event){
  	$('#app-sidebar').toggleClass('sidebar-toggle');
  	$('#main-content').toggleClass('with-sidebar');
  });

  $(".sidebar-tab").click(function () {
    $(".sidebar-tab").removeClass("active");
    $(this).addClass("active");
    var isMobile = (/android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini/i.test(navigator.userAgent.toLowerCase()));
    if (isMobile) {
    	setTimeout(function() { 
    	  $('#app-sidebar').toggleClass('sidebar-toggle');
      }, 1000);
    }
	});
});