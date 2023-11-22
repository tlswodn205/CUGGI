/**
 * 관리자 상품 수정 페이지 자바스크립트
 */

// 1차카테고리 변경시 2차카테고리 출력
const firstSelect = document.getElementById('first-category-id');
const secondSelect = document.getElementById('second-category-id');

firstSelect.addEventListener('change', function (e) {
	const fcId = e.target.value;
	fetch("/admin/product/category/first/" + fcId)
		.then((res) => res.json())
		.then((data) => {
			secondSelect.innerHTML = '';
			data.forEach((e) => {
				let scOption = document.createElement('option');
				scOption.value = e.id;
				scOption.textContent = e.secondCategoryName;
				secondSelect.append(scOption);
			});
		})
		.catch((err) => console.log(err));
});

// 이미지 삭제

// 이미지 삭제 동적으로 주기 큰영역에 줘야함
const tableImgTdInnerDiv = document.querySelectorAll('.tableImgTd');
for (const div of tableImgTdInnerDiv) {
	div.addEventListener('click', function (e) {
		const currentTarget = e.target; // 현재 클릭한 요소
		// 요소에 클래스값이 있다면
		if (currentTarget.classList.contains('fa-x') || currentTarget.classList.contains('deleteImg')) {
			const imgDiv = currentTarget.closest('.imgDiv') // 가장 가까운 imgDiv 클래스를 가진 요소
			const imgId = imgDiv.children[0].alt // imgDiv의 두번째자식의 alt 값
			if (imgId !== 'temp') { // 추가하기위해 임시로 생성한 div가 아니라면
				if (!confirm('삭제하시겠습니까?')) return;
				fetch('/admin/product/' + imgId, { method: 'DELETE' }) // method delete
					.then((response) => response.json())
					.then((data) => {
						if (data.result > 0) { // 삭제에 성공했다면 html도 삭제
							imgDiv.remove();
						}
					})
					.catch((err) => console.log(err));
			} else if (imgId === 'temp') { // 추가하기위해 임시로 생성한 div라면
				imgDiv.remove();
			}
		}

		// 사진 이미지 미리보기
		if (currentTarget.classList.contains('updateFile')) {
			currentTarget.addEventListener('change', function (e) {
				console.log(this.previousElementSibling);
				readURL(e.target);
			});
		}
	});
}

// 이미지 추가 함수(이미지타입, 추가할 장소)
let count = 0;
const makeImgDiv = (type, id) => {
	const maxSize = 5;
	const newImgDiv = document.createElement('div'); // 새로운 div 생성
	newImgDiv.classList.add('card', 'imgDiv'); // div의 클래스 추가
	const size = (type == 'thumb') ? 316 : 490; // 이미지타입이 썸네일이면 316, 아니면 490
	const areaSelector = type === 'thumb' ? '#thumbnailImgTd' : '#detailImglTd'; // type 체크해서 셀렉터 지정
	const area = document.querySelectorAll(`${areaSelector} > .imgDiv`); // 셀렉터의 .imgDiv 요소를 가져옴
	// 이미지 개수 각 최대 5개 제한
	if (area.length >= maxSize) {
		alert('이미지는 최대 허용개수는 각 5개입니다.');
		return;
	}

	newImgDiv.innerHTML = `<img src="https://via.placeholder.com/${size}" class="card-img-top" alt="temp" style="height: 233px; object-fit: contain;">
   <div class="card-body d-flex">
      <label for="${type}-${count}" class="custom-file-upload col-10">
         <span>파일 선택</span>
      </label>
      <input type="file" id="${type}-${count}" class="form-control updateFile" name="${type}-${count}" style="display: none;">
      <div class="btn deleteImg col-2"><i class="fa-solid fa-x" style="font-size: 26px; line-height: 26px;"></i></div>
   </div>`;
	const tdinnerDiv = document.querySelector(`#${id}`);
	tdinnerDiv.append(newImgDiv); // 위의 코드를 조합해서 붙이기
	count++; // 중복 name값을 피하기 위한 변수
}

// 이미지 추가버튼 이벤트 함수
const btnList = document.getElementsByClassName('btnAddImg');
for (const btn of btnList) {
	btn.addEventListener('click', function () {
		const td = btn.parentElement.nextElementSibling; // td 영역 찾기
		if (td.id == 'thumbnailImgTd') {
			makeImgDiv('thumb', td.id);
		} else if (td.id == 'detailImglTd') {
			makeImgDiv('detail', td.id);
		}
	});
}

// 이미지 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
		const reader = new FileReader();
		reader.onload = function (e) {
			input.parentElement.previousElementSibling.src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		input.previousElementSibling.src = "";
	}
}
