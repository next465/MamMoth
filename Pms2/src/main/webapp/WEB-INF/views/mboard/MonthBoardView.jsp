<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">월간 업무보고</h3>
					</div>
					<div class="box-body">
	이름 : ${mbView.employee_NAME}<br>
	부서 : ${mbView.department_NAME}<br>
	직급 : ${mbView.employee_GRADE}<br>
	제목 : ${mbView.month_Board_TITLE}<br>
	작성일 : ${mbView.month_Board_Posting_DATE}<br>
				</div>
				</div>
				<!-- /.box-body -->
				<!-- /.box -->
			</div>
			<!--/.col (left) -->

		</div>
	<!-- /.row -->
			<div class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">프로젝트</h3>
						</div>
						<div class="box-body">
	프로젝트 명 : ${mbView.project_NAME}<br>
	PM : ${mbView.pm}<br>
	프로젝트 업무 내용 : ${mbView.month_Project_CONTENTS}<br>
	결과산출물 : ${mbView.month_Project_FILE}<br>
	비고 : ${mbView.month_Project_ETC}<br>
						</div>
					</div>
					<!-- /.box-body -->
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
		</div>
	</section>	
<%@include file="../include/footer.jsp"%>	
</body>
</html>