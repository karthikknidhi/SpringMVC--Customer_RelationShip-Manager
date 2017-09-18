<%@ taglib uri= "http://java.sun.com/jsp/jstl/core"  prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List-Customers</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

<div id = "wrapper">
	<div id = "header">
	<h2> CRM-Customer Relationship Manager</h2>
	</div>
</div>

<div id = "container">
	<div id = "content">
	
	<input type = "button" value = "Add Customer" 
	onclick ="window.location.href= 'showForm';return false;" 
	class = "add-button"
	/>
	<table>
	<tr>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email</th>
	<th>Action</th>
	</tr>
	<!--  customers is the model attribute name -->
	<c:forEach var = "tempCustomer" items = "${customers}">
	<c:url var ="updateLink"  value = "/customer/showUpdate">
	<c:param name = "customerId" value = "${tempCustomer.id}"/>
	</c:url>
	<c:url var ="deleteLink"  value = "/customer/delete">
	<c:param name = "customerId" value = "${tempCustomer.id}"/>
	</c:url>
	<tr>
	<td>${tempCustomer.firstName}</td>
	<td>${tempCustomer.lastName}</td>
	<td>${tempCustomer.email}</td>
	<td>
	<a href = "${updateLink}">Update</a> 
	|
	<a href = "${deleteLink}" onclick = "if(!(confirm('Are you sure you want to delete?')))return false">Delete</a> 
	</td>
	</tr>
	</c:forEach>
	</table>
	</div>
</div>
</body>
</html>