<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>WelCome Page</title>
</head>
<body>
			<h1>Welcome to User Login App</h1>
				<ul>
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-users">All Users</a></li>
				</ul>
<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div>
				<div >
				</div>
			</div>
		</c:when>
	<c:when test="${mode=='MODE_REGISTER' }">
			<div>
				<h3>New Registration</h3>
				<hr>
				<form method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div>
						<label>Username</label>
						<div>
							<input type="text" class="form-control" name="username"value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label>First Name</label>
						<div >
							<input type="text" name="firstname"value="${user.firstname }" />
						</div>
					</div>
					<div>
						<label>Last Name</label>
						<div>
							<input type="text"name="lastname"value="${user.lastname }" />
						</div>
					</div>
					<div>
						<label class=>Age </label>
						<div>
							<input type="text"name="age"value="${user.age }" />
						</div>
					</div>
					<div>
						<label>Password</label>
						<div >
							<input type="password"name="password"value="${user.password }" />
						</div>
					</div>
					<div>
						<input type="submit" value="Register" />
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_USERS' }">
			<div>
				<h3>All Users</h3>
				<hr>
				<div>
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Age</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.age}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
	<c:when test="${mode=='MODE_LOGIN' }">
			<div>
				<h3>User Login</h3>
				<hr>
				<form method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div>
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div>
						<label>Username</label>
						<div >
							<input type="text" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div >
						<label>Password</label>
						<div>
							<input type="password" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div>
						<input type="submit" value="Login" />
					</div>
					</form>
					</div>
					</c:when>
	</c:choose>
</body>
</html>