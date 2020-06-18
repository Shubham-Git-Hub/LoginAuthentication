<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Registration</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	function validate() {
		var uname = document.myForm.username.value;
		if (uname == "") {
			alert("Please Enter Username");
			document.myForm.username.focus();
			return false;

		}
		if ((uname.length < 5) || (uname.length > 15)) {
			alert("Enter Username under length of 5 to 15");
			document.myForm.username.focus();
			return false;
		}
		var password = document.myForm.password.value;

		if (password == "") {
			alert("Please Enter password");
			document.myForm.password.focus();
			return false;
		} else if ((password.length < 7) || (password.length > 15)) {
			alert("Password should be between 7 and 15 character");
			document.myForm.password.focus();
			return false;
		}

	}
</script>
</head>
<body>

	<!-- same css file used that is why classs name is login-box -->


	<form name="myForm"
		action="<%=request.getContextPath()%>/RegistrationController"
		method="post">

		<div class="login-box">
			<h1>Register</h1>
			<div class="textbox">
				<i class="fas fa-user"></i> <input type="text" id="username"
					placeholder="Username" name="username" required>
			</div>

			<div class="textbox">
				<i class="fas fa-lock"></i> <input type="password" id="password"
					placeholder="Password" name="password" required>
			</div>

			<input type="submit" class="btn" onclick="return validate();"
				value="REGISTER">

		</div>
		<div class="Info">
			<h4>The page will refresh if you enter  USERNAME which is already taken by some other user</h4>
		</div>
	</form>

</body>
</html>