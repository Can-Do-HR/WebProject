function fnMove(seq){
    var offset = $().offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}

$("document").ready(function(){
    let contentMenu = $(".sticky-tab").children("div");
    console.log(contentMenu)
    
   contentMenu.click(function() {
        let scrollPosition;
        if($(this).text() == "클래스 소개"){
            scrollPosition = $(".item-content-introduce").offset().top;
            console.log("클래스소개")
        } else if ($(this).text() == "커리큘럼"){
            scrollPosition = $(".item-content-curriculum").offset().top;
            console.log("커리큘럼")
        }else if ($(this).text() == "패키지"){
            scrollPosition = $(".item-content-package").offset().top;
            console.log("패키지")
        }else if ($(this).text() == "수강후기"){
            scrollPosition = $(".item-content-postscript").offset().top;
            console.log("수강후기")
        }
        console.log(scrollPosition)
        $("html").animate({
            scrollTop: scrollPosition
        }, 500);
    })


    var swiper = new Swiper('.swiper-container', {
        spaceBetween: 0, //마진값
        slidesPerView: 4,
        loop: false,
        rebuildOnUpdate: true,
        direction: getDirection(),
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        on: {
            resize: function () {
                swiper.changeDirection(getDirection());
            },
        },
    });
    
    function getDirection() {
        var windowWidth = window.innerWidth;
        var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
    
        return direction;
    }
})

