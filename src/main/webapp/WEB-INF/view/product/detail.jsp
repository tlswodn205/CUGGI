<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ include file="/WEB-INF/view/layout/header.jsp" %>
    
<!-- main -->
    <main id="product-detail">
      <div class="variable-width">
      	<c:forEach var="product" items="${productList}">
        <div class="slider">
          <img src="${product.image.startsWith('/') ? product.image : '/upload/' += product.image}" alt="" />
          
        </div>
        </c:forEach>
      </div>
      <div class="detail">
        <h4>${productList[0].productName}</h4>
        <div>&#8361; ${productList[0].price}</div>
        <p>재고보유</p>
        <p>1~3일 이내 발송 가능한 상품입니다.</p>
        <div class="add-cart" id="${productList[0].id}">쇼핑백에 담기</div>
      </div>
      <div class="detail-info">
        <div class="info-1">
          <div class="product-notice-info info-div">
            <div class="extend-info" data-target="slide1">
              <p class="info-title">상품 취급시 주의사항</p>
              <p><i class="fa-solid fa-plus"></i></p>
            </div>
            <div class="info-more" id="slide1">
              구찌는 제품 제작 시 소재 선택에 신중을 기울입니다. 제품의 수명을 연장하기 위해 취급에 주의하여 주시기 바랍니다.<br />
              <ul>
                <li>직사광선, 열 및 비에 노출되지 않도록 주의하십시오. 제품이 물에 젖은 경우 그 즉시 부드러운 천으로 닦아 주십시오.</li>
                <li>모양을 유지하고 습기를 흡수할 수 있도록 핸드백에 티슈페이퍼를 채워 넣고, 구입 시 제공된 플란넬 백 안에 보관하시기 바랍니다.</li>
                <li>가방 형태에 영향을 줄 수 있는 무거운 물건을 휴대하지 마십시오.</li>
                <li>부드러운 재질의 마른 천으로 제품을 닦아 주십시오.</li>
              </ul>
            </div>
          </div>
          <div class="delivery-info info-div">
            <div class="extend-info" data-target="slide2">
              <p class="info-title">배송/교환 및 반품 정보</p>
              <p><i class="fa-solid fa-plus"></i></p>
            </div>
            <div class="info-more" id="slide2">
              구찌는 제품 제작 시 소재 선택에 신중을 기울입니다. 제품의 수명을 연장하기 위해 취급에 주의하여 주시기 바랍니다.<br />
              <ul>
                <li>구찌 공식 온라인 스토어를 통하여 판매되는 모든 상품은 구찌코리아의 지정 택배사인 일양로지스를 통해 고객님께 배송됩니다.<br />
                배송사 정보 : 일양로지스 (02-3277-9500, www.ilyanglogis.com)</li>
                <li>
                  예약 주문 및 주문 제작(Made to Order) 아이템은 상품 상세 페이지에 안내된 예상 날짜에 배송됩니다.<br />
                  맞춤서비스 (이니셜 서비스/DIY)상품의 배송일은 안내된 일정보다 최대 2일 정도(영업일 기준) 지연될 수 있습니다.
                </li>
                <li>
                  공식 온라인 스토어에서 주문한 상품은 수령한 날로부터 14일 이내에 무료 교환 또는 반품 서비스가 제공됩니다. 단, 다음의 경우에는 교환/반품이 제한될 수 있습니다.<br />
                
                (1) 고객님에게 책임 있는 사유로 상품이 훼손되었거나 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 감소한 경우<br />
                (2) 뷰티 상품의 경우, 이미 개봉 하였거나 배송당시 부착되었던 셀로판 포장이 제거된 경우<br />
                (3) 상품에 부착된 시큐리티 택을 제거하거나 RFID가 훼손된 경우<br />
                (4) 주문 제작 상품 또는 맞춤 서비스 상품 (이니셜 서비스 또는DIY) 의 경우
                </li>
                <li>구찌코리아의 지정 택배사인 일양로지스 이외의 타택배를 이용하여 발생된 입고 지연 및 분실에 대하여 구찌코리아는 책임을 지지 않습니다.</li>
                <li>자세한 사항은 상품 구매 시 발행된 디지털 인보이스를 참조해 주시기 바라며 원활한 서비스를 위하여 해당 인보이스를 보관하실 것을 권장합니다.</li>
                <li>
                  구찌 공식 온라인스토어에서 구매하신 상품은 지정된 매장에서 수령 및 반품하실 수 있습니다. 매장 수령 및 반품 서비스를 희망하시는 경우 클라이언트 서비스센터
                  02.3452.1921로 문의해 주시기 바랍니다
                </li>
              </ul>
              자세한 내용은 FAQ 에서 확인하실 수 있습니다.
            </div>
          </div>
          <div class="payment-info info-div">
            <div class="extend-info" data-target="slide3">
              <p class="info-title">결제 정보</p>
              <p><i class="fa-solid fa-plus"></i></p>
            </div>
            <div class="info-more" id="slide3">구찌 온라인 스토어에서는 카카오페이, 신용카드, 체크카드 및 계좌이체로 결제 가능합니다.</div>
          </div>
        </div>
        <div class="info-2">
          <div class="product-info">
            <img src="${productImage.image.startsWith('/') ? productImage.image : '/upload/' += productImage.image}" alt="상품사진" />
            <p>상품정보</p>
            <p>${productList[0].productFeature}</p>
            <ul>
              <li>제조자: 구찌</li>
              <li>제조국: 이태리</li>
              <li>수입자: 구찌코리아</li>
              <li>
                품질보증기준: A/S 보증기간 2년<br />
                (상품 이상 시 무상수선, 고객의 부주의로 판단되는 경우 유상수선)
              </li>
              <li>AS 유선접수: 클라이언트서비스 00-0000-0000 / cservice@cuggi.com</li>
            </ul>
          </div>
        </div>
      </div>
    </main>
	<script src="/js/product/detail.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>

