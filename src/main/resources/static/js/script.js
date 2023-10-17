$('document').ready(function() {
	$('header, main, footer').wrapAll('<div class="body-container"></div>');
})

$(".menu").on('click', ()=>{
    $(".submenu").slideDown("slow")
    $(".submenu").css("display","flex")
    $('.account-area').slideUp("fast");
    $('.search-area').slideUp("fast");
    $('.overlay').addClass('active');
});

$(".close").on('click', (e)=>{
    e.stopPropagation();
    $(".submenu").slideUp("fast");
    $('.overlay').removeClass('active');
});

/* logo nav바 */
// 검색 영역 토글 이벤트
$('.searchBtn').on('click', function () {
  $('.search-area').slideToggle();
  $('#searchInput').focus();
  $('.account-area').slideUp("fast");
  $(".submenu").slideUp("fast");
});
// 회원 이벤트
$('.profileBtn').on('click', function () {
  $('.account-area').slideToggle("slow");
  $('.account-area').css("display","block");
  $('.search-area').slideUp("fast");
  $(".submenu").slideUp("fast");
});

$('.basketBtn').on('click', function () {
  location.href="/order/basket"
});

// 검색 유효성, submit이벤트
$('#searchForm').on('submit', function (e) {
  let input = $(this).children('#searchInput');
  let searchData = input.val().trim();
  if (searchData < 1) {
    e.preventDefault();
    input.css('border', '1px solid #CC0000');
    alert('1자 이상의 검색어를 입력하세요.');
  } else {
    input.css('border', '1px solid #000');
  }
});

// TODO 검색어 입력시 ajax 로 유사단어 출력