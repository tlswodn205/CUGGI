   /* 상품목록 스크립트 */
   
  $(() => {
    // 상품별 슬라이드 이벤트
    let isClickEnabled = true; // 중복실행을 막기위한 변수
    // 슬라이드 Next
    $('.btnNext').on('click', function (e) {
      e.stopPropagation();
      let curLeft = $(this).siblings('.slide').css('left');

      if (!isClickEnabled) {
        return; // 클릭 이벤트가 비활성화된 경우 함수를 빠져나감
      }

      let pIndex = curLeft.indexOf('p');
      let calLeft = curLeft.substring(0, pIndex);

      if (calLeft == '-1520') {
        $(this).siblings('.slide').css('left', '0');
      } else {
        calLeft = Number(calLeft) - 380;
        $(this)
          .siblings('.slide')
          .css('left', calLeft + 'px');
      }

      isClickEnabled = false;
      setTimeout(function () {
        isClickEnabled = true;
      }, 500);
    });
    // 슬라이드 Prev
    $('.btnPrev').on('click', function (e) {
      e.stopPropagation();
      // 함수의 현재 left 값 가져오기(String 이기 때문에 숫자로 변환해야함)
      let curLeft = $(this).siblings('.slide').css('left');
      let pIndex = curLeft.indexOf('p');
      let calLeft = curLeft.substring(0, pIndex);
      // 클릭 이벤트가 비활성화된 경우 함수를 빠져나감
      if (!isClickEnabled) {
        return;
      }

      // TODO 무한슬라이드
      if (calLeft == 0) {
        // 첫 이미지에서 이전 버튼을 누른 경우 마지막 장으로 이동
        $(this).siblings('.slide').css('left', '-1520px');

        // left 값에서 380만큼 이동
      } else {
        calLeft = Number(calLeft) + 380;
        $(this)
          .siblings('.slide')
          .css('left', calLeft + 'px');
      }

      // 중복 실행을 막기위한 변수
      isClickEnabled = false;
      // 이미지 동작 및 중복실행 막기
      setTimeout(function () {
        isClickEnabled = true;
      }, 500);
    });

    // 슬라이드 버튼 마우스 오버시 나타내기
    $('.product-one').click(function (e) {
      let productId = $(this).attr('id');
      location.href = `http://localhost:90/product/detail?productId=${productId}`;
    });
    $('.product-one').on('mouseover mouseout', function () {
      $(this).find('p').toggleClass('active');
    });
    // TODO
    $('.product-all-btn').on('click', function () {
      alert('모두 보기 ajax');
    });
  });
    