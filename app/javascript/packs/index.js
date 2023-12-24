$(document).ready(function(){
	$('#myModal').on('hidden.bs.modal', function () {
			$(this).removeData('bs.modal');
	});

	$('.modal_link').click(function(event){
		event.preventDefault();
		$('#myModal').removeData("modal");
		$('#myModal').load($(this).attr('href')+'?no_layout=true',function(){
			$('#myModal').modal();
		});
	});

	var cookie_login_id=getCookie('login_id');

	if(cookie_login_id) {
		$("#shit_login_id").val(cookie_login_id);
		$("#remember_me").prop('checked',true);
	}

	$("#sl_login_form").submit(function(){
		var loginID=$.trim($("#shit_login_id").val());
		var password=$.trim($("#shit_password").val());
		var token=$(this).find('input[name="authenticity_token"]').val();

		if(loginID=='') {
			display_message($("#message_no_email").val());
			return false;
		}

		if(password=='') {
			display_message($("#message_no_password").val());
			return false;
		}

		if($("#remember_me").is(":checked")) {
			setCookie('login_id',loginID);
		} else {
			if(getCookie('login_id'))
				deleteCookie('login_id')
		}
	});

	var cookie_barcode=getCookie('barcode');

	if(cookie_barcode) {
		$("#barcode").val(cookie_barcode);
		$("#remember_barcode").prop('checked',true);
	}

	$("#check_id_form").submit(function(){
		var barcode=$.trim($("#barcode").val());

		if($("#remember_barcode").is(":checked")) {
			setCookie('barcode',barcode);
		} else {
			if(getCookie('barcode'))
				deleteCookie('barcode')
		}
	});

	var cookie_geropic_id=getCookie('geropic_id');

	if(cookie_geropic_id) {
		$("#geropic_id").val(cookie_geropic_id);
		$("#remember_geropic_id").prop('checked',true);
	}

	$("#geropic_check_id_form").submit(function(){
		var geropic_id=$.trim($("#geropic_id").val());

		if($("#remember_geropic_id").is(":checked")) {
			setCookie('geropic_id',geropic_id);
		} else {
			if(getCookie('geropic_id'))
				deleteCookie('geropic_id')
		}
	});

	email_check=false;

	$('<div>').addClass('menu_back').appendTo('header');
	$(".sl-dropdown-menu").slideUp();

	if($( document ).width()>996) {
	$("header .nav > li > a").mouseover(function(){
		if($(this).parent().hasClass('sl-dropdown')) {
			if(!$("header .menu_back").is(":visible")) {
				$(".sl-dropdown-menu").slideDown();
				$('header .menu_back').slideDown(function(){
					$("header .menu_back").show();
				});
			}
		}
	});

	$("#main,.sub-main").mouseover(function(){
		if($("header .menu_back").is(":visible")) {
			$(".sl-dropdown-menu").slideUp();
			$('header .menu_back').slideUp(function(){
				$("header .menu_back").hide();
			});
		}
	});
} else {
	$('.sl-dropdown-menu').addClass('dropdown-menu').removeClass('sl-dropdown-menu');

	$('.sl-dropdown>a').click(function(){
		if($(this).parent().find('ul').is(":visible")) {
			$('.sl-dropdown ul').hide();
		} else {
			$('.sl-dropdown ul').hide();
			$(this).parent().find('ul').show();
		}
		return false;
	});
}




	$("#faqCategoryList a.title").click(getList);
	$("#faqList dt a.title").click(getContent);

	function getList() {
		var tt=$(this);

		$.getJSON($(this).attr('href')+'.json',function(data){
			$("#faqList").empty();
			if(data.faqs.length) {
				$.each(data.faqs,function(index,value){
					if(value.title === null) {
						return true;
					}

					var a=$('<a class="title" href="/faqs/'+value.id+'">'+value.title+'<span><i class="material-icons">add</i></span></a>').click(getContent);
					$('<dt>').appendTo("#faqList").append(a);
				});
			} else {
				$('<dt>글이 없습니다.</dt>').appendTo("#faqList");
			}

			$("#faqCategoryList li a").removeClass('active');
			tt.addClass('active');
		});
		return false;
	}

	function getContent(){
		var parent=$(this).parent();
		$.getJSON($(this).attr('href')+'.json',function(value){
			if(parent.next().get(0)) {
				if(parent.next().get(0).tagName!='DD') {
					parent.after('<dd>');
				}
			} else {
				parent.after('<dd>');
			}
			$("#faqList dt").removeClass('active').find('i').text('add');
			$("#faqList dd").hide();
			parent.addClass('on').find('i').text('remove');
			parent.next().effect('highlight').html('<p>'+nl2br(value.content)+'</p>').slideDown();
			if (history && history.pushState) {
				history.pushState('','faq_'+value.id,'/faqs/'+value.id);
			}
		});

		return false;
	}

	function nl2br (str, is_xhtml) {
		var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
		return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
	}

});




 function display_message(message,alert_type) {
 	if(!alert_type)
 		alert_type='danger';

 	$("#sl_message").addClass('alert-'+alert_type).show();
 	$("#sl_message p").empty();
 	$("#sl_message p").text(message);
 }


 /**
  * 쿠키값 추출
  * @param cookieName 쿠키명
  */
 function getCookie( cookieName )
 {
  var search = cookieName + "=";
  var cookie = document.cookie;

  // 현재 쿠키가 존재할 경우
  if( cookie.length > 0 )
  {
   // 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
   startIndex = cookie.indexOf( cookieName );
   // 만약 존재한다면
   if( startIndex != -1 )
   {
    // 값을 얻어내기 위해 시작 인덱스 조절
    startIndex += cookieName.length;

    // 값을 얻어내기 위해 종료 인덱스 추출
    endIndex = cookie.indexOf( ";", startIndex );

    // 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
    if( endIndex == -1) endIndex = cookie.length;

    // 쿠키값을 추출하여 리턴
    return cookie.substring( startIndex + 1, endIndex ) ;
   }
   else
   {
    // 쿠키 내에 해당 쿠키가 존재하지 않을 경우
    return false;
   }
  }
  else
  {
   // 쿠키 자체가 없을 경우
   return false;
  }
 }


 /**
  * 쿠키 설정
  * @param cookieName 쿠키명
  * @param cookieValue 쿠키값
  * @param expireDay 쿠키 유효날짜
  */
 function setCookie( cookieName, cookieValue, expireDate )
 {
  var today = new Date();
  today.setDate( today.getDate() + parseInt( expireDate ) );
  document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString() + ";";
 }


 /**
  * 쿠키 삭제
  * @param cookieName 삭제할 쿠키명
 */
 function deleteCookie( cookieName )
 {
  var expireDate = new Date();

  //어제 날짜를 쿠키 소멸 날짜로 설정한다.
  expireDate.setDate( expireDate.getDate() - 1 );
  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
 }
