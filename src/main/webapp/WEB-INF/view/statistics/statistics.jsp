<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Load c3.css -->
<link href="<c:url value="/js/c3/c3.css" />" rel="stylesheet">

<script src="<c:url value="/js/jquery-3.2.1.min.js" />" ></script>
<!-- Load d3.js and c3.js -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="<c:url value="/js/c3/c3.min.js" />" ></script>
<script>
	$().ready(function(){
		
		var chart = c3.generate({
			bindto: '#chart',
			data: {
				columns: [${data}]
			},
			axis: {
				x: {
					type: 'category' ,
					categories: ${category}
				}
			}
		});
	
	});
</script>
</head>
<body>
	<div>
		<div id="chart"></div>
	</div>
	<hr/>
	<div>
		<table>
			<tr>
				<th>DataTime</th>
				<th>URI</th>
				<th>Method</th>
				<th>Request Count</th>
				<c:forEach items="${statisticsList}" var="st">
					<tr>
						<td>${st.dateTime}</td>
						<td>${st.uri}</td>
						<td>${st.method}</td>
						<td>${st.count}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>