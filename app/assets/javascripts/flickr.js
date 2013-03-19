
$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?",
        function(data){
          //only get the most recent cat
          if ($("#images").length > 0 && $("#images")[0].childNodes.length == 1) {
	          $.each(data.items, function(i,item){
	            	$("<img/>").attr("src", item.media.m).appendTo("#images");
	            	$("#post_url")[0].value = item.media.m;
	  			if (i==0) return false;
	            
	          });
	       }
	       return false;
        });