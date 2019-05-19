<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/Le-Frog/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
jQuery.fn.serializeObject = function() { var obj = null; try { if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { var arr = this.serializeArray(); if(arr){ obj = {}; jQuery.each(arr, function() { obj[this.name] = this.value; }); } } }catch(e) { alert(e.message); }finally {} return obj; }
	$(function() {
		$("#sDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		
		$("#eDate").datepicker({
			dateFormat : "yy-mm-dd"
		});

		$("#fuck").on('change', function(){
			sList();
		});
	});
	
	// 검색 ajax(검색한 list를 리턴받음)
	function sList() {
// 		console.log($("#obTest").serializeObject());
		var param = $("#obTest").serializeObject();
		var jparam=JSON.stringify(param);
		
		$.ajax({
			url:"./sList.do",
			dataType: "json",
			data : jparam,
			type : "post",
			success:function(data){
				console.log(data);
				console.log(data[0].department_NAME);
				test123(data);
			}
		});
	}
	
	// 상세 페이지 이동 function
	function test(te){
		location.href="../mboard/monthBoardView.do?employee_id=CJSHRM001&month_Board_INDEX="+te
	}
	
	// ajax 결과값 받아서 지우고 다시 그리기
	function test123 (data) {
// 		console.log(data);
// 		var ht = '';
		
// 		for (var i in data) {
// 			ht += '<tr>';
// 			ht += '<td>'+data[i].department_NAME+'</td>';
// 			ht +='</tr>';
// 		}
		
// 		$(".box-body").empty();
// 		$(".box-body").append(ht);
		// 셀렉트 옵션 동적생성
		$("select[id=suck] option").remove();

		for (var i in data) {
			var option = $("<option>"+data[i].department_NAME+"</option>");
            $('#suck').append(option);
		}
		
	}
	
	function move () {
		location.href="../mboard/writeForm.do";
	}
</script>
<!-- Main content -->
<section class="content">
		
	<div class="row">
		<!-- left column -->

	
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">문서 검색</h3>
				</div>

			
				<div class='box-body'>
					<form id="obTest" action="" method="get">
						
						<table>
							<tr>
								<td width="100">날짜</td>
								<td><input type="text" name="month_Board_Posting_DATE" id="sDate" /></td>
								<td width="50"><b><cent>~</b></td>
								<td><input type="text" name="month_Board_Repost_DATE" id="eDate" /></td>

							</tr>

						</table>
						<input type="button" id="test" onclick="sList();" />
						<select id="fuck">
							<option value=''>암것도 없어 새꺄</option>
							<option value="h">거긴.. 안돼..</option>
						</select>
						
						<select id="suck">
						</select>
					</form>
				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">월간 업무보고</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 148px">NO</th>
							<th style="width: 148px">이름</th>
							<th style="width: 148px">부서</th>
							<th style="width: 148px">제목</th>
							<th style="width: 148px">작성일</th>
							<th style="width: 150px">최근수정</th>

						</tr>

						<c:forEach var="row" items="${list}">
							<tr>
								<td>${row.month_Board_INDEX}</td>
								<td>${row.employee_NAME}</td>
								<td>${row.department_NAME}</td>
								<td><a
									href="#" onclick="test(${row.month_Board_INDEX});">${row.month_Board_TITLE}</a></td>
								<td>${row.month_Board_Posting_DATE}</td>
								<td>${row.month_Board_Repost_DATE}</td>
							</tr>
						</c:forEach>

					</table>
				</div>
				<div align="right">
					<input type="button"  value="작성" onclick="move();"/>
				
				</div>
				<!-- /.box-body -->


				<div class="box-footer"></div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

<%@include file="../include/footer.jsp"%>
