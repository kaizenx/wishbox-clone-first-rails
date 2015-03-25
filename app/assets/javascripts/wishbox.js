// $.setReadyEvent('page:change');

$(document).on('page:fetch', function() {
  $(".abc").spin();
});
$(document).on('page:change', function() {
  $(".abc").hide();
});

$('#product-share-on-fb').click(function() {
  var link = $(this).attr('data-link');
  var picture = $(this).attr('data-picture');
  var caption = $(this).attr('data-caption');
  var description = $(this).attr('data-description');
  FB.ui({
    method: 'feed',
    link: link,
    picture : picture,
    caption: caption,
    description: description,
  }, function(response){});
});

$(document).on('click', '#btn-feed-image', function(){
  var imageurl = $(this).attr('imageurl');  
  $("#product-image").attr("src", imageurl);
});

$(document).on('click', '#button-shop', function(){
  alert('Added to shopping cart');
});

$(document).on('click', '#imagebutton', function () {
  var base_url
  base_url = "http://ec2-54-254-69-170.ap-southeast-1.compute.amazonaws.com:3000"
  //base_url = "http://127.0.0.1:3000"
  var targeturl = $(this).attr('targeturl');
  var imageurl = $(this).attr('imageurl');
  var headertitle = $(this).attr('imagetitle');
  $(".modal-title").html(headertitle)
  $("#product-image").attr("src", imageurl);
  url = "/products/want/" + targeturl
  $("#button-want").attr("targeturl", url);
  var new_url = "/products/shop/" +targeturl
  var url = "/products/" + targeturl
  console.log(base_url+url)
  $('#like').html('<fb:like href="'+base_url+url+'" share="true" layout="button_count" show_faces="false" width="65" action="like" font="segoe ui" colorscheme="light" />');
  if (typeof FB !== 'undefined') {
      FB.XFBML.parse(document.getElementById('like'));
  }
});

$(document).on('click', '#currency-selection > li a', function(){
  // var link = $(this).attr('img-main');

  // $("#product-main-img").attr('src', '/assets/ajax-loader.gif');
  // var img = new Image();
  // img.onload = function () {
  //     $("#product-main-img").attr('src', link);
  // }
  // img.src = link;
 alert($(this).html())
 $.ajax({
     type: "POST",
     url: "/user_details_controller/change_currency/",
     data: { Quantity: quantity, Id: id }
   })
     .done(function( msg ) {
       alert( "Successfully updated" );
     })
     .fail(function() {
         alert( "There was an error updating" );
       });
});


$(document).on('click', '#preview-signup', function(){
  var formvalid = $('#preview-form')[0].checkValidity();
  if( formvalid ){
    $('#SubmitEmailSignUp').modal();
    $('#EmailSignUpModal').modal('hide')
  }
});

function ValidateDates(){
    var is_valid_date = false;
    var start_date = moment( $("#startdate").val(), 'DD-MM-YYYY');
    var end_date = moment( $("#enddate").val(),'DD-MM-YYYY' );
    var isbefore = start_date.isBefore( end_date ); 
    var start_date_el = $("#startdate")[0];
    var end_date_el = $("#enddate")[0];
    if( !isbefore ){
      alert("Chosen dates are invalid");
      //end_date_el.setCustomValidity("This date is before the start date")
    }
    else{
      is_valid_date = true;
    }
    return is_valid_date;
}


function change_quantity(quantity, id){
  $.ajax({
      type: "POST",
      url: "/user_shopping_carts/change_quantity/",
      data: { Quantity: quantity, Id: id }
    })
      .done(function( msg ) {
        alert( "Successfully updated" );
      })
      .fail(function() {
          alert( "There was an error updating" );
        });
}



$(function(){
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=565649096864957";
    // js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=225642087623549";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
    
  var $container = $('#masonry-container');
  
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.box',
      columnWidth: function( containerWidth ) {
        return containerWidth / 30;
      },
      gutterWidth: 31.5
    });
  });

  
   $('#location-submit').on('submit', function(event) {
     
      is_valid_date = ValidateDates();
      if( !is_valid_date ){
         event.preventDefault();
         // return is_valid_date; 
      }
       
  });
  
  $('#feed-listing-submit').on('submit', function(event){
    event.preventDefault();
    is_valid_date = ValidateDates();
    if( is_valid_date ){
      var start_date = $("#startdate").val()
      var end_date = $("#enddate").val()
      var trip_id = $("#data-tripid").val();
     
      $.ajax({
          type: "POST",
          url: "/trips/update_trip_date/"+trip_id,
          data: { StartDate: start_date, EndDate: end_date }
        })
          .done(function( msg ) {
            alert( "Successfully updated" );
          })
          .fail(function() {
              alert( "There was an error updating" );
            });
    }
    return false;  
  });



  $container.infinitescroll({
    navSelector  : '#page-nav',    // selector for the paged navigation 
    nextSelector : '#page-nav a',  // selector for the NEXT link (to page 2)
    itemSelector : '.box',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: 'No more pages to load.',
        img: 'http://i.imgur.com/6RMhx.gif'
      }
    },
    // trigger Masonry as a callback
    function( newElements ) {
      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout
      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true ); 
      });
    }
  );
    
});