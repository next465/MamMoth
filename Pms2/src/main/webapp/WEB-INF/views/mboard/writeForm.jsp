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
						<table border="1">
							<tr>
								<td>이름 :</td>
								<td>${writerInfo.employee_NAME}</td>
							</tr>
							<tr>
								<td>부서 :</td>
								<td>${writerInfo.department_NAME}</td>
							</tr>
							<tr>
								<td>직급 :</td>
								<td>${writerInfo.employee_GRADE}</td>
							</tr>
							<tr>
								<td>제목 :</td>
								<td><input type="text" name="미정01"/></td>
							</tr>
							<tr>
								<td>날짜 :</td>
								<td>${cdate.today}</td>
							</tr>
						</table>
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
						<table border="1">
							<tr>
							<td>프로젝트</td>
							<td>아직.......넣어야합니다</td>
							</tr>
							<tr>
							<td>PM</td>
							<td>AJAX...</td>
							</tr>
							<tr>
							<td>업무내용</td>
							<td><input type="text" name="미정02" value="미정"/></td>
							</tr>
							<tr>
							<td>결과산출물</td>
							<td><input type="text" name="미정03" value="미정"/></td>
							</tr>
							<tr>
							<td>비고</td>
							<td><input type="text" name="미정04" value="미정"/></td>
							</tr>
						
						
						</table>
						
						
						</div>
					</div>
					<!-- /.box-body -->
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
		</div>
		<div align="center">
			<table>
				<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
				</tr>
			</table>
		</div>
	</section>
	<%@include file="../include/footer.jsp"%>
</body>
</html>