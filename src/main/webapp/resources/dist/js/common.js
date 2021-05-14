$(function(){	
	/*헤더*/
	$(".pf-left .pf-ham").on('mouseenter',function(e){
		e.preventDefault();
		$(this).removeClass("off");
		$(this).addClass("on");
	});
	$(".pf-left .pf-ham").on('mouseleave',function(e){
		e.preventDefault();
		$(this).removeClass("on");
		$(this).addClass("off");
	});	//햄버거 막대기 움직이는거

	/*pf-center에 메뉴가 화면축소하면 검색창이랑 겹쳐서, 1680이하부터는 센터위치가 아니고 레프트로 움직이도록 아래에 resize 함수안에 한번더 작성*/
	var wwidth = $(window).width();
	if(wwidth<1780){
		var pfc = 1780-wwidth;
		var pfcwidth = 580-pfc; //639는 1680사이즈일때 메뉴가 위치하는 left값, pfc를 빼주면서 레프트 값이 계속 작아지면서 왼쪽으로 이동하도록작성
		if(pfcwidth>=230){ // left 값이 계속 줄어들지만 230 이하로는 안줄도록
			$(".pf-center").css({"left":pfcwidth+"px","transform":"none"});
		}else{
			$(".pf-center").css({"left":"230px","transform":"none"});
		}			
	}else{//1680 이상에선 메뉴가 센터에 위치
		$(".pf-center").css({"left":"50%","transform":"translate(-50%,0)"});
	}	
	/*햄버거gnb*/
	$(".pf-gnb-list1 > li").on('mouseenter',function(){
		$(".pf-gnb-list1 li").find(".pf-gnb-2depth").stop().slideUp(500);
		$(".pf-gnb-list1 li h2 a").removeClass("on");
		$(".pf-gnb-list1 li").removeClass("on");
		$(this).addClass("on");
		$(this).find("h2 a").addClass("on");
		$(this).find(".pf-gnb-2depth").stop().slideDown(500);
	});
	$(".pf-gnb-list1 > li").on('mouseleave',function(){
		$(".pf-gnb-list1 li").find(".pf-gnb-2depth").stop().slideUp(500);
		$(".pf-gnb-list1 li h2 a").removeClass("on");
		$(".pf-gnb-list1 li").removeClass("on");
	});

	//햄버거 메뉴안에 들어있는 슬라이드 2개 
	//스와이프라이브러리 사용
	var gnbSlide1 = new Swiper('.gnbslide1 .swiper-container', {
		loop: true,
      pagination: {
        el: '.gnbslide1 .swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.gnbslide1 .swiper-button-next',
        prevEl: '.gnbslide1 .swiper-button-prev',
      },
    });
	var gnbSlide2 = new Swiper('.gnbslide2 .swiper-container', {
		loop: true,
      pagination: {
        el: '.gnbslide2 .swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.gnbslide2 .be-list .swiper-button-next',
        prevEl: '.gnbslide2 .be-list .swiper-button-prev',
      },
    });		

	//햄버거 누르면 왼쪽에서 메뉴 나오도록
	$(".pf-left .pf-ham").on('click',function(e){	
		e.preventDefault();
		
		$(".pf-gnb-wrap").removeClass("off");
		$(".pf-gnb-wrap").addClass("on");
		$(".pf-gnb-wrap").stop().animate({
			left: 0
		 }, 500);	
		$(".pf-gnb-list1 li").removeClass("on");
		$(".pf-gnb-list1 li").find(".pf-gnb-2depth").css("display","none");
        
        //fax_GetRecentItem();

		//e.preventDefault();
		/*
        if(typeof playerFocusOn !== 'undefined')
        {
		    playerFocusOn.pauseVideo();
		    playerBigBanner.pauseVideo();
        }
        */
	});
	//엑스버튼 누르면 왼쪽메뉴 다시 들어가도록
	$(".pf-gnb-close").on('click',function(e){
		e.preventDefault();
		$(".pf-gnb-wrap").removeClass("on");
		$(".pf-gnb-wrap").addClass("off");	
		$(".pf-gnb-wrap").stop().animate({
			left: -209
		 }, 500);
	});
	//왼쪽 메뉴의 햄거거 눌러도 왼쪽메뉴 다시 들어가도록
	$(".pf-gnb-top .pf-ham").on('click',function(e){
		e.preventDefault();
		$(".pf-gnb-wrap").removeClass("on");
		$(".pf-gnb-wrap").addClass("off");	
		$(".pf-gnb-wrap").stop().animate({
			left: -209
		 }, 500);
	});
	
	$("input[type=text]").attr("autocomplete","off");
	/*검색창*/
	$(".pf-top-srch input").attr("autocomplete","off");
    var cursorIn = false;
    $(".pf-srch-drop").on("mouseenter", function(){
       cursorIn = true; 
    });
    $(".pf-srch-drop").on("mouseleave", function(){
       cursorIn = false; 
    });
	//포커스하면 팝업뜨도록
	$(".pf-right .pf-top-srch input").on('focusin',function(){
		$(this).attr("placeholder","검색어를 입력해주세요.");
		$(".pf-srch-drop").css("display","block");
		$(".pf-top-srch").addClass("on");

        fax_GetFavoriteSearchWord();
        fax_GetRecentSearchWord();
	});
	//포커스 아웃됐을때 팝업도 숨김
	$(".pf-right .pf-top-srch input").on('focusout',function(){
        if(!cursorIn){
		    $(this).removeAttr("placeholder");
		    $(".pf-srch-drop").css("display","none");
		    $(".pf-top-srch").removeClass("on");
        }
	});
	//엑스버튼 눌러도 팝업 숨김
	$(".drop-close").on('click',function(e){
		e.preventDefault();
		$(".pf-srch-drop").css("display","none");
		$(".pf-top-srch").removeClass("on");
		$(".pf-right .pf-top-srch input").removeAttr("placeholder");
	});

	//위로 올라가는 버튼 클릭하면
	$(".return-top").on('click',function(e){
		e.preventDefault();
		$(window).scrollTop(0);
	});
	

	/*스크롤하면 600px쯤에서 헤더부분 다시 보이게*/
	$(window).on('scroll',function(){
		var sctop = $(this).scrollTop();
		var sPath = window.location.pathname;
		var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);

		//console.log(sPage);
		if(sctop>=600){
			$("#perform-top").addClass("fixed");
			$("#pf-gnb-wrap").addClass("re-top");
			$("#pf-gnb-wrap").removeClass("sub-top");

			if($.cookie("EXanadu") != null || $.cookie("Benefit") == "2314"){
				$("#perform-top").css("top","0px");
				$("#pf-gnb-wrap").css("top","0px"); 
				$("#consice").hide();
			}
			else{
				$("#consice").addClass("on");
				$("#consice").css("position","fixed");
			}

			$("body").css("padding-top","134px");
		}else{
			$("#perform-top").removeClass("fixed");
			$("#pf-gnb-wrap").removeClass("re-top");
			$("#pf-gnb-wrap").addClass("sub-top");

			if($.cookie("EXanadu") != null || $.cookie("Benefit") == "2314"){
				$("#perform-top").css("top","0px");
				$("#pf-gnb-wrap").css("top","0px"); 
				$("#consice").hide();
			}
			else{
				$("#consice").removeClass("on");
				$("#consice").css("position","relative");
			}

			$("body").css("padding-top","0");
		}

		if(sctop<=34){
			$("#pf-gnb-wrap").removeClass("sub-top");
		}

		
		//위로 올라가는 버튼 나타나게
		if(sctop>0){
			$(".return-top").addClass("on");
		}else{
			$(".return-top").removeClass("on");
		}
	});

	/*footer 패밀리사이트 가짜 셀렉트박스*/
	$(".family-btn").on('click',function(e){
		var faheight = $(this).height();
		var falength = $(".family a").length;
		if($(this).is(".on")){
			e.preventDefault();
			$(this).removeClass("on");
			$(".family").stop().animate({
				height: "28px"
			 }, 500);	
		}else{
			e.preventDefault();
			$(this).addClass("on");
			$(".family").stop().animate({
				height: faheight+((falength-1)*24)+9+"px"
			 }, 500);	
		}			
	});

	//반응형 부분
	$( window ).resize(function() {
		/*헤더*/
		var wwidth = $(window).width();
		if(wwidth<1780){
			var pfc = 1780-wwidth;
			var pfcwidth = 580-pfc;
			if(pfcwidth>=230){
				$(".pf-center").css({"left":pfcwidth+"px","transform":"none"});
			}else{
				$(".pf-center").css({"left":"230px","transform":"none"});
			}			
		}else{
			$(".pf-center").css({"left":"50%","transform":"translate(-50%,0)"});
		}
		/*wing-list*/		
		$(".wing-box").removeAttr("style");
		$(".wing-list a").removeAttr("style");
	});

	//햄버거메뉴 슬라이드 라이브러리 사용
	$(".pf-gnb-box").mCustomScrollbar({
	});	


});


