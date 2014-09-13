$(document).ready(function(){

        $(".ProfileImage").click(function(){
               if(!$(this).hasClass('Open')){
                       $(this).addClass("Open");
                       $(".UserStatsSection").slideDown();
                       $("article.Layout").css("margin-top", "+=200");
               } else {
                       $(this).removeClass("Open");
                       $(".UserStatsSection").slideUp();
                       $("article.Layout").css("margin-top", "-=200");
               }
        });


        $("#TouchMenu").click(function() {
                if(!$(this).hasClass('Open')){
                        $(".MenuList").slideDown();
                        $(this).addClass("Open");
                } else {
                        $(".MenuList").slideUp();
                        $(this).removeClass("Open");
                }
        });

        $(".FitVidWrapper").fitVids();

        var owl = $("#owl-demo");

        owl.owlCarousel({
                items : 5, //10 items above 1000px browser width
                itemsDesktop : [1000,5], //5 items between 1000px and 901px
                itemsDesktopSmall : [900,4], // betweem 900px and 601px
                itemsTablet: [600,3], //2 items between 600 and 0
                itemsMobile : [480,1],
                pagination: false// itemsMobile disabled - inherit from itemsTablet option
        });

        $(".next").click(function(){
                owl.trigger('owl.next');
        })

        $(".prev").click(function(){
                owl.trigger('owl.prev');
        })
});