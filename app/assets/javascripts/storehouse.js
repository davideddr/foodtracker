$(document).ready(function(){
	$('#nf').on("click",function(){
		$.get('/foods/new',function( data ){
			$('#content').html(data);
		})
	});
	$('#nm').on("click",function(){
		$.get('/meals/new',function( data ){
			$('#content').html(data);
		})
	});
	$('#lof').on("click",function(){
		$.get('/meals',function( data ){
			$('#content').html(data);
		})
	});
	//scomparsa alert successo dopo 2 sec.
	setTimeout(function() {
		$('.alert-success').fadeOut();
	}, 2000);
});
