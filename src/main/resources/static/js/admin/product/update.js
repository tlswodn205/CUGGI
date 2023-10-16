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
const imgDiv = document.getElementsByClassName('imgDiv');
for(const div of imgDiv){
	div.addEventListener('click', function(e){
	  const clickClass = e.target.className;
	  if(clickClass == 'fa-solid fa-x' || clickClass == 'deleteImg'){
	  	if(confirm('삭제하시겠습니까?')){
	    	const imgId = this.children[1].alt;
	    	fetch('/admin/product/'+imgId,{ method: 'DELETE'})
	    		.then((response)=> response.json())
	    		.then((data)=>{
	    			if(data.result > 0){
	    				this.remove();
	    			}
	    		})
	    		.catch((err) => console.log(err));
	  	}
	  }
	});	
}

// 이미지 추가
let count = 0;
const makeImgDiv = (type, id) => {
	const newImgDiv = document.createElement('div');
	newImgDiv.classList.add('imgDiv');
	newImgDiv.innerHTML = 
	`<div class="deleteImg"><i class="fa-solid fa-x"></i></div>
		<img src="" alt="" >
	<input type="file" name="${type}${count}">
	`;
	const tdinnerDiv = document.querySelector(`#${id} > div`);
	tdinnerDiv.append(newImgDiv);
	//count++;	
}

const btnList = document.getElementsByClassName('btnAddImg');
for(const btn of btnList){
	btn.addEventListener('click', function(){
		const td = btn.parentElement.nextElementSibling;
		if(td.id == 'thumbnailImgTd'){
			makeImgDiv('thumb', 'thumbnailImgTd');
		}else if(td.id == 'detailImglTd'){
			makeImgDiv('detail', 'detailImglTd');
		}	
	});
}
	










