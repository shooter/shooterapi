$(function(){
	$("div.filters a").click(function(){
		if($('div.sidebar').is(':hidden'))
		{
			$('div.sidebar').show()
			$('div.shooter-display').removeClass('dl65').addClass('dl45')
			$(this).html('Hide Filters')
		}
		else
		{
			$('div.sidebar').hide()
			$('div.shooter-display').removeClass('dl45').addClass('dl65')
			$(this).html('Show Filters')
		}
		
	})
})