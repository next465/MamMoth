<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header2.jsp"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<!-- Main content -->
<div>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">일일업무보고서 작성 ${login}</h3>
				</div>
				<!-- /.box-header -->

<form id='registerForm' role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="InputEmployeeName">이름</label> <input type="text"
				name='day_Board_Employee_ID' class="form-control" value ="${login.uname}" readonly>
		</div>
		<div class="form-group">
			<label for="InputDepartmentName">부서</label> <input type="text"
				name='department' class="form-control" value ="${login.uid}" readonly>
		</div>
		<div class="form-group">
			<label for="InputEmployeeGrade">직급</label> <input type="text"
				name='grade' class="form-control" value ="${login.upoint}" readonly>
		</div>
		<div class="form-group">
			<label for="InputDayBoardTitle">제목</label> <input type="text"
				name='day_Board_TITLE' class="form-control" placeholder="yyyy년 mm월 dd일 일일 업무보고서">
		</div>
				
		<div class="form-group">
			<label for="InputDayBoardPostingDATE">작성일</label> 
			<input type="text" name="day_Board_Posting_DATE" class="form-control" value="${sysdate}" readonly>
		</div>

		<div class="form-group">
			<label for="InputDayBoardPostingDATE">야간근무</label> <br> 
			<input type="radio" name="day_Board_Extra_WORK" value="1"> 해당
			<input type="radio" name="day_Board_Extra_WORK" value="0"> 해당없음
		</div>
		
		<div class="form-group">
			<label for="InputDayBoardPostingDATE">주말출근</label> <br> 
			<input type="radio" name="day_Board_Weekend_WORK" value="1"> 해당 
			<input type="radio" name="day_Board_Weekend_WORK" value="0"> 해당없음
		</div>
	</div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<div class="box-body">
	
		<button name="addStaff" class="btn btn-primary">+</button>
	    	
	    <div>
			<div class="form-group">
				<label for="InputEmployeeName">프로젝트
				<select name="selectBox" onChange="viewMemo(this.form)">
						<option value="0">--프로젝트선택--</option>
						<option value="P1">중간프로젝트</option>
            	        <option value="P2">최종프로젝트</option>
            	        <option value="P3">연습프로젝트</option>
				</select>
				</label> 
				<input type="text" name='day_Project_Project_Id' class="form-control" id="myproject"  readonly>
			</div>
			
			<div class="form-group">
				<label for="InputDepartmentName">PM</label> <input type="text"
					name='department' class="form-control" value ="${login.uid}" readonly>
			</div>
			
			<div class="form-group">
				<label for="InputEmployeeGrade">업무내용</label> <input type="text"
					name='day_Project_Work_Contents' class="form-control" value ="">
			</div>
			<div class="form-group">
				<label for="InputDayBoardTitle">이슈사항</label> <input type="text"
					name='day_Project_Work_Issue' class="form-control" value="">
			</div>
					
		</div>
	</div>
	

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>

		<button type="submit" class="btn btn-primary">작성</button>

	</div>
</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    

<script>
function viewMemo(frm)
{
	if( frm.selectBox.options[0].selected ){
        frm.myproject.value = "";
    }
    if( frm.selectBox.options[1].selected ){
        frm.myproject.value = "중간프로젝트";
    }
    if( frm.selectBox.options[2].selected ){
        frm.myproject.value = "최종프로젝트";
    }
    if( frm.selectBox.options[3].selected ){
        frm.myproject.value = "연습프로젝트";
    }

}
</script>

<script>

function goLogin(){
	self.location ="/user/login";
}


var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});







$(".uploadedList").on("click",  ".delbtn" ,function(event){

  event.preventDefault();
	
  var that = $(this);
  
  //alert("DELETE FILE");

  $.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   console.log("RESULT: " + result);
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
  });
});


</script>
<script>
    //추가 버튼
    $(document).on("click","button[name=addStaff]",function(){
         
        var addStaffText =  '<tr name="trStaff">'+
            '   <td class="active col-md-1"><strong>정산담당자</strong></td>'+
            '   <td class="col-md-11">'+
            '       <input type="text" class="form-control" name="staff_name" placeholder="성명">'+
            '       <input type="text" class="form-control" name="staff_contact" placeholder="연락처1">'+
            '       <input type="text" class="form-control" name="staff_contact2" placeholder="연락처2">'+
            '       <input type="text" class="form-control" name="staff_email" placeholder="이메일">'+
            '       <select class="form-control statusYn" name="staff_use_yn">'+
            '           <option value="Y">사용</option>'+
            '           <option value="N">미사용</option>'+
            '       </select>'+
            '       <button class="btn btn-default" name="delStaff">삭제</button>'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
         
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
         
    });
     
    //삭제 버튼
    $(document).on("click","button[name=delStaff]",function(){
         
        var trHtml = $(this).parent().parent();
         
        trHtml.remove(); //tr 테그 삭제
         
    });
</script>
 

<%@include file="../include/footer.jsp"%>
