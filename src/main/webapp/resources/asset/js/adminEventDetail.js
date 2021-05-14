;(function(win, $) {
    'use strict';
	
    if('undefined' === typeof win.asb) {
        /**
         * @global
         */
        win.asb = {};
    }

    var STATIC = {};

    win.asb.AdminEventDetailView = (function(){
        var defParams = {
            form : {
                formEle : 'form.js-submit-form',
                inputCate1 : '#mainCategory',
                inputCate2 : '#subCategory',
				cate2Tpl : "#subCGListTemplate",
                toListBtn : '.js-btn-list',
				inputDatetime : '.js-input-datetime',
                eventName : 'input[name=evt_name]',
                eventCompany : 'input[name=evt_company]',
                eventPrice : 'input[name=evt_price]',
                eventDiscount : 'input[name=evt_discount]',
                eventDetail : 'input[name=evt_detail]',
                eventAmount : 'input[name=evt_amount]',
                eventBuy : 'input[name=evt_buy]',
				eventOpenTs : 'input[name=evt_open_ts]',
				eventCloseTs : 'input[name=evt_close_ts]',
				eventThum : 'input[name=file1]',
                submitBtn : 'button.js-btn-submit'
            }

        };

		var ckeditor_config = {
				resize_enabled : false, //사이즈변경
				toolbarCanCollapse : true,  //툴바 클릭시 접히는 여부
				removePlugins : "elementspath",  //dom 출력하지 않음
				// 파일 업로드 기능 추가
				// CKEditor를 이용해 업로드 사용 시 해당 주소에 업로드 됨
				filebrowserUploadUrl: '/admin/event/imgUpload'
		};
		
        return {
            def : function(org, src) {
                for (var prop in src) {
                    if (!hasOwnProperty.call(src, prop)) continue;
                    if ('object' === $.type(org[prop])) {
                        org[prop] = (this.isArray(org[prop]) ? src[prop].slice(0) : this.def(org[prop], src[prop]));
                    } else {
                        org[prop] = src[prop];
                    }
                }
                return org;
            },
            init : function(container, args){
				if (!(this.container = container).length) return;
				
                this.opts = this.def(defParams, (args || {}));
				// console.log(this.opts.mode);
				this.opts.modeStr = this.opts.mode == 'i' ? '등록' : '수정'
				
				this.assigneElements();
                this.bindEvents();
                // console.log(this.submitBtn);
            },
            assigneElements : function(){
				this.$ckeditor = this.opts.ckeditor;
				ckeditor_config.enterMode = this.$ckeditor.ENTER_BR;
				ckeditor_config.shiftEnterMode = this.$ckeditor.ENTER_P;
				
				/* ckEditor 작업 */
				// config.js를 사용하지 않고 개별 설정하는 부분
				this.$ckeditor.replace("evt_detail", ckeditor_config);
				this.$ckeditor_inst = this.$ckeditor.instances['evt_detail'];
				
				// config.js의 설정을 사용하려면, 다음과 같이 사용
				// CKEDITOR.replace("desc", "");
				
				this.$cate2Tpl = this.container.find(this.opts.form.cate2Tpl);
				
                this.$form = this.container.find(this.opts.form.formEle);
				this.$inputDatetime = this.$form.find(this.opts.form.inputDatetime)
                this.$inputCate1 = this.$form.find(this.opts.form.inputCate1);
                this.$inputCate2 = this.$form.find(this.opts.form.inputCate2);
                this.$toListBtn = this.$form.find(this.opts.form.toListBtn);				

				this.$eventName = this.$form.find(this.opts.form.eventName);
				this.$eventCompany = this.$form.find(this.opts.form.eventCompany);
				this.$eventPrice = this.$form.find(this.opts.form.eventPrice);
				this.$eventDiscount = this.$form.find(this.opts.form.eventDiscount);
				this.$eventDetail = this.$form.find(this.opts.form.eventDetail);
				this.$eventAmount = this.$form.find(this.opts.form.eventAmount);
				this.$eventBuy = this.$form.find(this.opts.form.eventBuy);
				this.$eventOpenTs = this.$form.find(this.opts.form.eventOpenTs);
				this.$eventCloseTs = this.$form.find(this.opts.form.eventCloseTs);
				this.$eventThum = this.$form.find(this.opts.form.eventThum);

                this.$userPassEle = this.$form.find(this.opts.form.userPassEle);
                this.$userPassConfirmEle = this.$form.find(this.opts.form.userPassConfirmEle);



                this.$submitBtn = this.$form.find(this.opts.form.submitBtn);
            },
            bindEvents : function(){
				var _this = this;
				
				this.$inputDatetime.datetimepicker({
			        language:  'ko',
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
			        showMeridian: 1
			    });

				/* 1차 카테고리에 따른 2차 카테고리 작업 */ 
				this.$inputCate1.on("change", function(){
					var mainCGCode= $(this).val(); // 선택한 1차카테고리 코드
					var url = "/admin/event/subCGList/" + mainCGCode;   // url매핑주소를 경로형태로 사용 @PathVarialbe
					
					// REST 방식으로 전송
					$.getJSON(url, function(data){		// data : 2차카테고리 데이터정보
						// 받은 데이터로 subCategory에 템플릿 적용
						_this.subCGList(data, _this.$inputCate2 ,_this.$cate2Tpl)
						
					});
			
				});
				
				/* 상품 목록 버튼 클릭 시 */ 
				this.$toListBtn.on("click", function(){
					var result = confirm("내용을 저장하지 않고, 목록으로 돌아가시겠습니까?");
					
					if(result){
						location.href="/admin/event/eventList${pm.makeSearch(pm.cri.page)}";
					} else {}
				});
				
                this.$submitBtn.on('click', $.proxy(this.onClickSubmit, this));

            },
            subCGList : function(subCGStr, target, templateObject){
                var template = Handlebars.compile(templateObject.html());
				var newOtions = template(subCGStr); // 템플릿에 2차카테고리 데이터가 바인딩된 소스
			
				// 기존 option 제거(누적방지)
				var trgOptions = target.find('option');
				trgOptions.remove();
				
				target.append(newOtions);
            },
            onClickSubmit : function(e){
                e.preventDefault();

				if(!confirm(this.opts.modeStr+"된 정보를 저장하시겠습니까?"))
					return;
					
				if(this.$inputCate1.val()==null || this.$inputCate1.val()=="default"){
					alert("1차 카테고리를 선택해주세요.");
					this.$inputCate1.focus();
					return;
					
				}
				
				if(this.$inputCate2.val()==null || this.$inputCate2.val()=="default"){
					alert("2차 카테고리를 선택해주세요.");
					this.$inputCate2.focus();
					return;
					
				}
				
				if(this.$eventName.val()==null || this.$eventName.val()==""){
					alert("공연명을 입력해주세요.");
					this.$eventName.focus();
					return;
					
				}
				
				if(this.$eventCompany.val()==null || this.$eventCompany.val()==""){
					alert("공연사를 입력해주세요.");
					this.$eventCompany.focus();
					return;
					
				}
				
				if(this.$eventPrice.val()==null || this.$eventPrice.val()==""){
					alert("가격을 입력해주세요.");
					this.$eventPrice.focus();
					return;
					
				}
				
				if(this.$eventDiscount.val()==null || this.$eventDiscount.val()==""){
					alert("할인 가격을 입력해주세요.");
					this.$eventDiscount.focus();
					return;
					
				}
				
				//this.$eventDetail
				if(this.$ckeditor_inst.getData()==null || this.$ckeditor_inst.getData()==""){
					alert("공연 상세 내용을 입력해주세요.");
					this.$ckeditor_inst.focus();	
					return;
					
				}
				if(this.opts.mode == 'i' && (this.$eventThum.val()==null || this.$eventThum.val()=="")){
					alert("썸네일 이미지를 업로드해주세요.");
					this.$eventThum.focus();
					return;
					
				}
				
				if(this.$eventAmount.val()==null || this.$eventAmount.val()==""){
					alert("공연표 수량을 입력해주세요.");
					this.$eventAmount.focus();
					return;
					
				}
				
				if(this.$eventOpenTs.val()==null || this.$eventOpenTs.val()==""){
					alert("시작일자를 입력해주세요.");
					this.$eventOpenTs.focus();
					return;
					
				}
				
				if(this.$eventCloseTs.val()==null || this.$eventCloseTs.val()==""){
					alert("종료일자를 입력해주세요.");
					this.$eventCloseTs.focus();
					return;
					
				}
				
				this.$form.submit();
            }
        };
    })();
})(window, jQuery);
/*
var CKEDITOR;
var submitForm = $(".js-submit-form");
var submitBtn = submitForm.find('button.js-btn-submit');

function init(){
	
}

// 등록 버튼 클릭 시 유효성 검사







// 2차 카테고리 템플릿 적용함수


// ckEditor랑 2차 카테고리 처리 이벤트
$(document).ready(function(){
	


	
	submitBtn.on("click", function(){
		var result = confirm("<c:out value=\"${vtype == 'u'?'상세':'등록'}\"/>된 정보를 저장하시겠습니까?");
		
		if(result){
			
			
			
			
		} else {}
		
	});
	
	init();
});
*/