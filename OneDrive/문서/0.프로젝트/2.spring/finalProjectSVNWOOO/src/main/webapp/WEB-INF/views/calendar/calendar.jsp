<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>




<%@include file="../includes/header.jsp" %>

<link href='/resources/css/calendar.css' rel='stylesheet' />
<script src='/resources/js/calendar.js'></script>
<script>

      /* document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      }); */
      
   
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..}) 

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			
			initialDate : '2021-09-01', // 초기 로딩 날짜. 
			navLinks : true, // can click day/week names to navigate views 
			selectable : true,
			selectMirror : true,
			// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용.. 
			/* select : function(arg) {
				console.log(arg);

				var title = prompt('입력할 일정:');
				// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						backgroundColor : "yellow",
						textColor : "blue"
					})
				}
				calendar.unselect()

			}, 
			
			eventClick : function(arg) {
				// 있는 일정 클릭시, 
				console.log("#등록된 일정 클릭#");
				console.log(arg.event);
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
			},*/
			
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events 
			
			events : function(info, successCallback, failureCallback) {
				
				$.ajax({
		            url: '<c:url value="/calendar/calendar"/>',
		            type: "POST",
		            data: {},
		            success: function(data){
		            	
		            	/* successCallback(data.calendarList);
		            	for (var i = 0; i < data.calendarList.length; i++) {
							if(data.calendarList[i].h_division == "업무"){
								backgroundcolor = "red";
							}else{
								backgroundcolor = "blue";
							}
						}     	 */
						
		            	
						successCallback(data.calendarList);
						
		            },
		            error: function(){
		                alert("에러 ㅎㅎ");
		            }
		        });
				
			}
		});

		calendar.render();
	});
</script>






<div id="calendar"></div>


                







<%@include file="../includes/footer.jsp" %>








