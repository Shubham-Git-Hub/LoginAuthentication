<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<form action="<%=request.getContextPath()%>/login" method="post">
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

			<input type="submit" class="btn" value="Sign in"> <input
				type="button" class="btn" value="REGISTER HERE">
		</div>
	</form>

</body>
</html>
