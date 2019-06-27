
// ON Document Ready
jQuery(document).ready(function ($)
{
	console.log('Document Ready');

	// function playVideo() {
	//   $('video[autoplay]').each(function(i, video) {
	//     var $vid = $(video);
	//     var vid = $vid[0];
	//     $vid.off('ended');
	//     vid.load();
	//     vid.play();
	//   });
	// }

	// On Ajax-Complete
	$( document ).ajaxComplete(function()
	{

		console.log('Ajax Ready');

		// playVideo();
	});
});

