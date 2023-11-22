<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</main>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

<script>
	//$('.list-table-form').eq(0).width($('.list-table').eq(0).outerWidth());
</script>
<script type="text/javascript">
	//delete 확인 자바스크립트
	function isDelete(form){
		const response = confirm("정말 삭제하시겠습니까?");
		if(response){
			form.submit();
		}
	}

	function search(){
		let type=$("#type").val();
		let keyword=$("#keyword").val();
		let status=$("#status").val();

//	if(status){
//		location.href="?page=1&type="+type+"&keyword="+keyword+"&status="+status;
//	}else{
		location.href="?page=1&type="+type+"&keyword="+keyword;
//	}
	}
</script>
</html>