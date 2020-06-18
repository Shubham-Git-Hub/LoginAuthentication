<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	function validate() {
		var uname = document.myForm.username.value;
		if (uname == "") {
			alert("Please Enter Username");
			document.myForm.username.focus();
			return false;

		}

		var password = document.myForm.password.value;
		if (password == "") {
			alert("Please Enter password");
			document.myForm.password.focus();
			return false;
		}

		
	}
</script>
</head>
<body>
	<form name="myForm" action="<%=request.getContextPath()%>/login"
		method="post">
		<div class="login-box">
			<h1>Login</h1>


			<div class="textbox">
				<i class="fas fa-user"></i> <input type="text" id="username"
					placeholder="Username" name="username" required>
			</div>

			<div class="textbox">
				<i class="fas fa-lock"></i> <input type="password" id="password"
					placeholder="Password" name="password" required>
			</div>


			<input type="submit" class="btn" onclick="return validate();"
				value="Sign in"> <a
				href="<%=request.getContextPath()%>/Register.jsp"><input
				type="button" class="btn" value="REGISTER HERE"></a>
		</div>
		<div class="Info">
			<h4>The page will refresh if you enter wrong USERNAME OR
				PASSWORD</h4>
		</div>
	</form>

</body>
</html>
