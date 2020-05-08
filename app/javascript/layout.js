$(document).on('turbolinks:load', function() {
var isMobile = (/android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini/i.test(navigator.userAgent.toLowerCase()))

  $('#sidebar-toggler').click(function(event){
  	$('#app-sidebar').toggleClass('sidebar-toggle')
  	$('#main-content').toggleClass('with-sidebar')
  })

  $(".sidebar-tab").click(function () {    
    if (isMobile) {
    	setTimeout(function() { 
    	  $('#app-sidebar').removeClass('sidebar-toggle')
      }, 1000)
    }
	})
})
