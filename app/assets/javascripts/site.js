var request= $.ajax({
    url:"/930",
    type:"GET",
    dataType:"json",
    success:function(response){
        console.log(response);
        for (var i=0;i<response.length;i++) {
          $('.events').append( 
            '<h4 class="date">' + response[i].date +'</h4>'+ 
            '<div class="concert" id="'+i+'">' +
            '<img class="band-pic" src="'+response[i].image+'">'+
            '<h2 class="headliner-name">' + response[i].headliner +'</h2>'+
            '<a class="btn btn-flat playtunez" id="'+i+'">Listen to Tunez</a>'+
            '<a class="btn btn-flat purchase-url" id="'+response[i].purchase_url+'">Buy Tickets'+'</div>');
            console.log(i);
        }
        $('.playtunez').on('click', function(){
            if (this.id != ''){   
              $(this).append('<div class="tunez"><iframe src="https://embed.spotify.com/?uri=spotify%3Aartist%3A'+response[parseInt(this.id)].playlist+'"width="300" height="380" frameborder="0" allowtransparency="true"></iframe>')
            }
          });
        $('.purchase-url').on('click',function(){
          window.open(this.id,'_blank');
        });
    }
  })

// btn active
  $('.btn').on('mousedown touchstart', function() {
    var $this = $(this);
    if (!$this.hasClass('btn-active')) {
      $this.addClass('btn-active');
      setTimeout(function() {
        $this.removeClass('btn-active');
      }, 450);
    }
  })
