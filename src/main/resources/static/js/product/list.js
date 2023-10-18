/* 상품목록 스크립트 */
 var numberOfProduct = 20;
 
  // 무한슬라이드를 위한 이미지태그 복사(31231순으로 만들어주기위해)
  $('.slide').each(function () {
    let firstImg = $(this).find('img:first').clone(); // 처음 이미지 복사
    let lastImg = $(this).find('img:last').clone(); // 마지막 이미지 복사
    $(this).append(firstImg); // 처음 이미지 마지막 뒤에 붙이기
    $(this).prepend(lastImg); // 마지막 이미지 처음 앞에 붙이기
    $(this).css('transition', 'none'); // 새로고침시 움직임 없애기
    $(this).css('left', '-380px'); // 보여줄 이미지 위치 변경
  });

  // 상품별 슬라이드 이벤트
  // 슬라이드 Next
  $(document).on('click', '.btnNext', function (e) {
    e.stopPropagation(); // 이벤트 위임 금지
    let classNames = $(this).attr('class'); // 클래스 이름 변수
    slideImg($(this), classNames); // 함수 실행
  });
  // 슬라이드 Prev
  $(document).on('click', '.btnPrev', function (e) {
    e.stopPropagation(); // 이벤트 위임 금지
    let classNames = $(this).attr('class'); // 클래스 이름 변수
    slideImg($(this), classNames); // 함수 실행
  });
  
  // 슬라이드 버튼 마우스 오버시 나타내기
  $(document).on('mouseover mouseout', '.product-one', function () {
    $(this).find('p').toggleClass('active');
    $(this).find('.product-hover').toggleClass('active');
  });
  
  // 상품 detail 이동 이벤트
  $(document).on('click','.product-one',function (e) {
    let productId = $(this).attr('id');
    location.href = `/product/detail?productId=${productId}`;
  });
  
  // 필터 마우스 오버시 나타내기
  $(document).on('mouseover', '.detail-filter-current', function () {
    $('.detail-filter-option').addClass('active');
  });
  $(document).on('mouseover', '.detail-filter-option', function () {
    $('.detail-filter-option').addClass('active');
  });
  $(document).on('mouseout', '.detail-filter-current', function () {
    $('.detail-filter-option').removeClass('active');
  });
  $(document).on('mouseout', '.detail-filter-option', function () {
    $('.detail-filter-option').removeClass('active');
  });
  
  // 필터 클릭시 정렬
  $(document).on('click', '.option-list',function () {
    let href = $(this).children('a').attr('href');
    location.href = href;
  });

  // TODO
  $('.product-all-btn').on('click', function () {
	let secondCategoryId = $('#second-category-id').val();
    let URL = "/product/reloadList?secondCategoryId="+secondCategoryId+"&startNum="+numberOfProduct;
    console.log($('.product-all-btn').eq(0));
    console.log($('#second-category-id').val());
           $.ajax(URL, {
               type: "get",
               headers: {
                   "Content-Type": "application/json"
               }
           }).done((res) => {
			   for(key in res){
				   	 let price = res[key][0].price.toLocaleString('ko-KR');
				   
				     let html = ' <div class="product-one" id="'+key+'">';
				               html += '<div class="slide">';
				               res[key].forEach((item)=>{
				               		html += '<img src="'+item.image+'" alt="" />';
							   })
					            html += '</div>';
								html += '<div class="product-hover">';
			          			html += '<div>'+res[key][0].productName+'</div>';
	            				html += '<div>&#8361;'+res[key][0].price.toLocaleString('ko-KR')+'</div>';
				                html += '</div>';
				                html += '<p class="btnPrev"><i class="fa-solid fa-less-than"></i></p>';
				                html += '<p class="btnNext"><i class="fa-solid fa-greater-than"></i></p>';
				                html += '</div>';
				               
				                $('.detail-main').eq(0).append(html);
				               
				                let lastOfProduct = $('.detail-main .slide').last();
							    let firstImg = $(lastOfProduct).find('img:first').clone(); // 처음 이미지 복사
							    let lastImg = $(lastOfProduct).find('img:last').clone(); // 마지막 이미지 복사
							    
							    $(lastOfProduct).append(firstImg); // 처음 이미지 마지막 뒤에 붙이기
							    $(lastOfProduct).prepend(lastImg); // 마지막 이미지 처음 앞에 붙이기
							    $(lastOfProduct).css('transition', 'none'); // 새로고침시 움직임 없애기
							    $(lastOfProduct).css('left', '-380px'); // 보여줄 이미지 위치 변경
			   }
               numberOfProduct += 20;
           });
		$(this).remove();
  });

//
//
//  함수 영역
/* 무한슬라이드 함수 */
/*
  이미지 ABC 있다고 가정할때, 무한슬라이드 하기위해서 CABCA 이런식으로 배치해준다.
  4번째 C에서 A로 이미지가 넘어갔을때 현재 나타내는 위치를 2번째 A로 바꿔준다.
  그 후 다시 B-C 로 넘어가게 만들어준다.
*/

let isClickEnabled = true; // 중복방지 변수
// tag : 슬라이드 이미지를 감싸고 있는 태그 넣기
function slideImg(tag, classNames) {
  if (!isClickEnabled) return; // 클릭 이벤트가 비활성화된 경우 함수를 빠져나감

  const slide = $(tag).siblings('.slide'); // slide 변수화
  const curLeft = parseInt(slide.css('left')); // left 값
  const slideWidth = slide.width(); // 슬라이드 총 길이
  const imgCount = slide.children('img').length; // 이미지 개수
  const imgOneWidth = slideWidth / imgCount; // 이미지 하나의 총 길이(마진을 포함한) 380
  const maxLength = -(imgOneWidth * (imgCount - 2)); // 한 슬라이드의 총 길이(복사한 이미지를 제외한)
  const startImgVal = 0; // 첫 이미지의 left 값

  // 슬라이드 일반 동작(Next)
  const transitionSlide = (newleft) => {
    slide.css('transition', 'left 0.5s ease-out'); // 슬라이드 애니메이션 효과
    slide.css('left', newleft + 'px'); // css 변경으로 이동
  };

  // 무한 슬라이드 동작시
  const resetSilde = (newleft, imgPostion) => {
    slide.css({ transition: 'none', left: imgPostion }); // 마지막 이미지(복사) 도착시 첫 이미지(원본)로 돌아가고 표시하지 않기위해 애니메이션 삭제
    requestAnimationFrame(() => {
      transitionSlide(newleft); // 애니메이션 프레임 확보를 위한?
    });
  };

  // 슬라이드 Next
  if (classNames.includes('btnNext')) {
    if (curLeft != maxLength) {
      transitionSlide(curLeft - imgOneWidth); // 현재 값에서 다음에 올 이미지 길이만큼 뺀 값(이동할 거리)
    } else {
      resetSilde(startImgVal - imgOneWidth, startImgVal); // 첫이미지에서 다음 이미지로 이동할 left 값, 첫 이미지 left 값
    }
  }
  // 슬라이드 Prev
  if (classNames.includes('btnPrev')) {
    if (curLeft != startImgVal) {
      transitionSlide(curLeft + imgOneWidth); // 현재 값에서 다음에 올 이미지 길이만큼 더한 값(이동할 거리)
    } else {
      resetSilde(maxLength + imgOneWidth, maxLength); // 마지막 이미지에서 이전 이미지로 이동할 left값, 마지막 이미지 left 값
    }
  }

  isClickEnabled = false; // 중복 방지 변수
  setTimeout(function () {
    // 일정시간후 변수 바꾸기
    isClickEnabled = true;
  }, 500);
}