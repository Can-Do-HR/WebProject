$('document').ready(function () {
    //모달 띄우는 함수            
    $(".UpdateBtn").click(function(){
        event.preventDefault();
        
        $("#replyModal").modal("show");
        
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

});