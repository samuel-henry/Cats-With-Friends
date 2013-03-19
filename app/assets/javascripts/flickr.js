
$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=cat,cats,kitten,kittie,kitty&tagmode=any&format=json&jsoncallback=?",
        function(data){
          //make sure the #images div is on the page and that it doesn't have anything in it yet
          if ($("#images").length > 0 && $("#images")[0].childNodes.length == 1) {
          		
          		//get a random cat from the results
          		var image = data.items[Math.floor(Math.random() * data.items.length)];
          		$("<img/>").attr("src", image.media.m).appendTo("#images");
	            $("#post_url")[0].value = image.media.m;

	       }
	       return false;
        });